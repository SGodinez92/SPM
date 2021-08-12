/* ****************************************************************** **
**    OpenSees - Open System for Earthquake Engineering Simulation    **
**          Pacific Earthquake Engineering Research Center            **
**                                                                    **
**                                                                    **
** (C) Copyright 1999, The Regents of the University of California    **
** All Rights Reserved.                                               **
**                                                                    **
** Commercial use of this program without express permission of the   **
** University of California, Berkeley, is strictly prohibited.  See   **
** file 'COPYRIGHT'  in main directory for information on usage and   **
** redistribution,  and for a DISCLAIMER OF ALL WARRANTIES.           **
**                                                                    **
** Developed by:                                                      **
**   Frank McKenna (fmckenna@ce.berkeley.edu)                         **
**   Gregory L. Fenves (fenves@ce.berkeley.edu)                       **
**   Filip C. Filippou (filippou@ce.berkeley.edu)                     **
**                                                                    **
** ****************************************************************** */

// $Revision: 1.09 $
// $Date: 07/06/2021 $

// Description:	This file contains the implementation for the StringPanel class.
//				It contains both the formulations of the panel (a linear-elastic
//				shear panel with a quadrilateral shape) and the stringers (which
//				are similar to a truss member). Both panel and stringer act as 
//				one element and do not consider any geometric nonlinearity.
//
// Ref: Hoogenboom, P. C., & Blaauwendraad, J. (2000). 
//      Quadrilateral shear panel.
//		Engineering structures, 22(12), 1690-1698.
//
// Ref: Hoogenboom, P. C. (1998). 
//		Discrete elements and nonlinearity in design of structural concrete walls.
//		Dissertation, Delft University of Technology. ISBN 90-9011843-8
//
// Ref: Blaauwendraad, J., & Hoogenboom, P. C. (1996).
//		Stringer panel model for structural concrete design.
//		ACI Structural Journal, 93(3), 295-305


/*********************************************************************** *
*             $lNode                             $kNode                 *
*                 __________________________________                     *
*                |          $strSecTag3             |                    *
*                |                                  |                    *
*                |                                  |                    *
*                |                                  |                    *
*                |                                  |                    *
*                |                                  |                    *
*                |$strSecTag4            $strSecTag2|                    *
*                |                                  |                    *
*                |                                  |                    *
*                |                                  |                    *
*                |                                  |                    *
*                |                                  |                    *
*                |___________$strSecTag1____________|                    *
*             $iNode                              $jNode                 *
*                                                                        *
* ********************************************************************** *
*/

#include <stdio.h> 
#include <stdlib.h> 
#include <string.h>
#include <math.h> 

#include <StringPanelLin.h>
#include <ID.h>
#include <Element.h>
#include <Node.h>
#include <Domain.h>
#include <Renderer.h>
#include <ErrorHandler.h>
#include <ElementResponse.h>
#include <R3vectors.h>
#include <SectionForceDeformation.h>
#include <ElementalLoad.h>
#include <Vector.h>
#include <Matrix.h>

#include <Channel.h>
#include <FEM_ObjectBroker.h>
#include <elementAPI.h>

// initialize the class wide variables
Matrix StringPanelLin::stiff8(8, 8);
Matrix StringPanelLin::stiff12(12, 12);
Matrix StringPanelLin::stiff24(24, 24);

Vector StringPanelLin::resid8(8);
Vector StringPanelLin::resid12(12);
Vector StringPanelLin::resid24(24);

void* OPS_StringPanelLin(void)
{
	Element* theElement = 0;

	int ndm = OPS_GetNDM();

	if (ndm < 2) {
		opserr << "WARNING -- model dimensions are not compatible with StringPanel element";
		return 0;
	}

	int numArgs = OPS_GetNumRemainingInputArgs();

	if (numArgs < 12) {
		opserr << "WARNING, insufficient arguments.\n";
		opserr << "Want: element StringPanelLin $tag $iNode $jNode $kNode $lNode ";
		opserr << "$strSecTag1 $strSecTag2 $strSecTag3 $strSecTag4 $Ep $nu $t <-rho $rho> \n";
		return 0;
	}

	int iData[9];		// $tag $iNode $jNode $kNode $lNode $strSecTag1 $strSecTag2 $strSecTag3 $strSecTag4
	int numData = 9;
	if (OPS_GetInt(&numData, iData) != 0) {
		opserr << "WARNING: invalid integer (tag, Nodes, SecTags) in element StringPanelLin " << iData[0] << "\n";
		return 0;
	}

	double data[3];		// $E_p $nu $t
	numData = 3;

	if (OPS_GetDoubleInput(&numData, data) != 0) {
		opserr << "WARNING: invalid double arguments (Ep, nu, t) in element StringPanelLin " << iData[0] << "\n";
		return 0;
	}

	// options
	double dens = 0.0;
	numData = 1;
	if (OPS_GetNumRemainingInputArgs() > 0) {
		const char* type = OPS_GetString();
		if (strcmp(type, "-rho") == 0) {
			if (OPS_GetNumRemainingInputArgs() > 0) {
				if (OPS_GetDoubleInput(&numData, &dens) < 0) {
					opserr << "WARNING: invalid rho in element StringPanelLin " << iData[0] << "\n";
					return 0;
				}
			}
		}
		else {
			opserr << "WARNING: Invalid option " << type << " in element StringPanelLin " << iData[0] << "\n";
			return 0;
		}
	}

	SectionForceDeformation* theSection1_1 = OPS_getSectionForceDeformation(iData[5]);
	SectionForceDeformation* theSection1_2 = OPS_getSectionForceDeformation(iData[5]);
	SectionForceDeformation* theSection2_1 = OPS_getSectionForceDeformation(iData[6]);
	SectionForceDeformation* theSection2_2 = OPS_getSectionForceDeformation(iData[6]);
	SectionForceDeformation* theSection3_1 = OPS_getSectionForceDeformation(iData[7]);
	SectionForceDeformation* theSection3_2 = OPS_getSectionForceDeformation(iData[7]);
	SectionForceDeformation* theSection4_1 = OPS_getSectionForceDeformation(iData[8]);
	SectionForceDeformation* theSection4_2 = OPS_getSectionForceDeformation(iData[8]);

	if (theSection1_1 == 0) {
		opserr << "ERROR:  element StringPanelLin " << iData[0] << " section " << iData[5] << " for stringer 1 not found\n";
		return 0;
	}

	if (theSection2_1 == 0) {
		opserr << "ERROR:  element StringPanelLin " << iData[0] << " section " << iData[6] << " for stringer 2 not found\n";
		return 0;
	}

	if (theSection3_1 == 0) {
		opserr << "ERROR:  element StringPanelLin " << iData[0] << " section " << iData[7] << " for stringer 3 not found\n";
		return 0;
	}

	if (theSection4_1 == 0) {
		opserr << "ERROR:  element StringPanelLin " << iData[0] << " section " << iData[8] << " for stringer 4 not found\n";
		return 0;
	}

	// Create Stringer Panel element
	theElement = new StringPanelLin(iData[0], ndm, iData[1], iData[2], iData[3], iData[4],
		*theSection1_1, *theSection1_2, *theSection2_1, *theSection2_2,
		*theSection3_1, *theSection3_2, *theSection4_1, *theSection4_2,
		data[0], data[1], data[2], dens);

	return theElement;
}

// Full constructor
StringPanelLin::StringPanelLin(int tag, int dim,
	int Nd1, int Nd2, int Nd3, int Nd4,
	SectionForceDeformation& theSect1_1,
	SectionForceDeformation& theSect1_2,
	SectionForceDeformation& theSect2_1,
	SectionForceDeformation& theSect2_2,
	SectionForceDeformation& theSect3_1,
	SectionForceDeformation& theSect3_2,
	SectionForceDeformation& theSect4_1,
	SectionForceDeformation& theSect4_2,
	double Ep, double poisson, double t, double r)
	:Element(tag, ELE_TAG_StringPanelLin), dimension(dim),
	connectedExternalNodes(4), numDOF(0), theLoad(0), theMatrix(0), theVector(0),
	E_p(Ep), nu(poisson), thickness(t), rho(r),
	theSection1_1(0), theSection1_2(0), theSection2_1(0), theSection2_2(0),
	theSection3_1(0), theSection3_2(0), theSection4_1(0), theSection4_2(0),
	initialDisp(0)
{

	// get a copy of the material and check we obtained a valid copy
	// First stringer
	theSection1_1 = theSect1_1.getCopy();
	if (theSection1_1 == 0) {
		opserr << "FATAL StringPanelLin::StringPanelLin - failed to get a copy of material for first stringer " <<
			theSect1_1.getTag() << endln;
		exit(-1);
	}

	int order1 = theSection1_1->getOrder();
	const ID& code1 = theSection1_1->getType();

	int j;
	for (j = 0; j < order1; j++)
		if (code1(j) == SECTION_RESPONSE_P)
			break;

	if (j == order1)
		opserr << "StringPanelLin::StringPanelLin - section of first stringer does not provide axial response\n";

	theSection1_2 = theSect1_2.getCopy();

	// Second stringer
	theSection2_1 = theSect2_1.getCopy();
	if (theSection2_1 == 0) {
		opserr << "FATAL StringPanelLin::StringPanelLin - failed to get a copy of material for second stringer " <<
			theSect2_1.getTag() << endln;
		exit(-1);
	}

	int order2 = theSection2_1->getOrder();
	const ID& code2 = theSection2_1->getType();

	for (j = 0; j < order2; j++)
		if (code1(j) == SECTION_RESPONSE_P)
			break;

	if (j == order2)
		opserr << "StringPanelLin::StringPanelLin - section of second stringer does not provide axial response\n";

	theSection2_2 = theSect2_2.getCopy();

	// Third stringer
	theSection3_1 = theSect3_1.getCopy();
	if (theSection3_1 == 0) {
		opserr << "FATAL StringPanelLin::StringPanelLin - failed to get a copy of material for third stringer " <<
			theSect3_1.getTag() << endln;
		exit(-1);
	}

	int order3 = theSection3_1->getOrder();
	const ID& code3 = theSection3_1->getType();

	for (j = 0; j < order3; j++)
		if (code3(j) == SECTION_RESPONSE_P)
			break;

	if (j == order3)
		opserr << "StringPanelLin::StringPanelLin - section of third stringer does not provide axial response\n";

	theSection3_2 = theSect3_2.getCopy();

	// Fourth stringer
	theSection4_1 = theSect4_1.getCopy();
	if (theSection4_1 == 0) {
		opserr << "FATAL StringPanelLin::StringPanelLin - failed to get a copy of material for fourth stringer " <<
			theSect4_1.getTag() << endln;
		exit(-1);
	}

	int order4 = theSection4_1->getOrder();
	const ID& code4 = theSection4_1->getType();

	for (j = 0; j < order4; j++)
		if (code4(j) == SECTION_RESPONSE_P)
			break;

	if (j == order4)
		opserr << "StringPanelLin::StringPanelLin - section of fourth stringer does not provide axial response\n";

	theSection4_2 = theSect4_2.getCopy();

	connectedExternalNodes(0) = Nd1;
	connectedExternalNodes(1) = Nd2;
	connectedExternalNodes(2) = Nd3;
	connectedExternalNodes(3) = Nd4;

	for (int i = 0; i < 4; i++) {
		theNodes[i] = 0;
		dx[i] = 0.0;
		dy[i] = 0.0;
		dz[i] = 0.0;
		L[i] = 0.0;
	}

	flagInitial = 0;		// initialize flag for midpoint calculation purposess
}

// Null constructor
StringPanelLin::StringPanelLin()
	:Element(0, ELE_TAG_StringPanelLin), dimension(0),
	connectedExternalNodes(4), numDOF(0), theLoad(0), theMatrix(0), theVector(0),
	E_p(0.0), nu(0.0), thickness(0.0), rho (0.0),
	theSection1_1(0), theSection1_2(0), theSection2_1(0), theSection2_2(0),
	theSection3_1(0), theSection3_2(0), theSection4_1(0), theSection4_2(0),
	initialDisp(0)
{
	// ensure the connectedExternalNode ID is of correct size 
	if (connectedExternalNodes.Size() != 4) {
		opserr << "FATAL StringPanelLin::StringPanelLin - failed to create an ID of correct size\n";
		exit(-1);
	}

	for (int i = 0; i < 4; i++)
		theNodes[i] = 0;
}

// Destructor
StringPanelLin::~StringPanelLin()
{
	if (theSection1_1 != 0)
		delete theSection1_1;
	if (theSection1_2 != 0)
		delete theSection1_2;

	if (theSection2_1 != 0)
		delete theSection2_1;
	if (theSection2_2 != 0)
		delete theSection2_2;

	if (theSection3_1 != 0)
		delete theSection3_1;
	if (theSection3_2 != 0)
		delete theSection3_2;

	if (theSection4_1 != 0)
		delete theSection4_1;
	if (theSection4_2 != 0)
		delete theSection4_2;

	if (theLoad != 0)
		delete theLoad;
	if (initialDisp != 0)
		delete[] initialDisp;
}

int StringPanelLin::getNumExternalNodes(void) const
{
	return 4;
}

const ID& StringPanelLin::getExternalNodes(void)
{
	return connectedExternalNodes;
}

Node **
StringPanelLin::getNodePtrs(void)
{
	return theNodes;
}

int StringPanelLin::getNumDOF(void)
{
	return numDOF;
}

void StringPanelLin::setDomain(Domain* theDomain)
{
	int Nd1 = connectedExternalNodes(0);
	int Nd2 = connectedExternalNodes(1);
	int Nd3 = connectedExternalNodes(2);
	int Nd4 = connectedExternalNodes(3);

	theNodes[0] = theDomain->getNode(Nd1);
	theNodes[1] = theDomain->getNode(Nd2);
	theNodes[2] = theDomain->getNode(Nd3);
	theNodes[3] = theDomain->getNode(Nd4);

	// If nodes can't be found, send a message
	if ((theNodes[0] == 0) || (theNodes[1] == 0) || (theNodes[2] == 0) || (theNodes[3] == 0)) {
		if (theNodes[0] == 0)
			opserr << "StringPanelLin::setDomain() - StringPanel" << this->getTag() << " node " <<
			Nd1 << "does not exist in the model\n";
		else if (theNodes[1] == 0)
			opserr << "StringPanelLin::setDomain() - StringPanel" << this->getTag() << " node " <<
			Nd2 << "does not exist in the model\n";
		else if (theNodes[2] == 0)
			opserr << "StringPanelLin::setDomain() - StringPanel" << this->getTag() << " node " <<
			Nd3 << "does not exist in the model\n";
		else
			opserr << "StringPanelLin::setDomain() - StringPanel" << this->getTag() << " node " <<
			Nd4 << "does not exist in the model\n";

		return;
	}

	// Get number of DOF and the dimension
	int dofNd1 = theNodes[0]->getNumberDOF();
	int dofNd2 = theNodes[1]->getNumberDOF();
	int dofNd3 = theNodes[2]->getNumberDOF();
	int dofNd4 = theNodes[3]->getNumberDOF();

	// If differing DOF at the nodes - print a warning message
	if ((dofNd1 != dofNd2) || (dofNd2 != dofNd3) || (dofNd3 != dofNd4))
		opserr << "WARNING StringPanelLin::setDomain(): nodes have differing DOF" << endln;

	// Call the base class method
	this->DomainComponent::setDomain(theDomain);

	// Set the number of dof for element and matrix and vector pointers
	if (dimension == 2 && dofNd1 == 2) {
		numDOF = 8;
		theMatrix = &stiff8;
		theVector = &resid8;
	}
	else if (dimension == 2 && dofNd1 == 3) {
		numDOF = 12;
		theMatrix = &stiff12;
		theVector = &resid12;
	}
	else if (dimension == 3 && dofNd1 == 6) {
		numDOF = 24;
		theMatrix = &stiff24;
		theVector = &resid24;
	}
	else {
		opserr << "WARNING StringPanelLin::setDomain cannot handle " << dofNd1 << " dofs at nodes in " <<
			dimension << " dimension problem\n";
		return;
	}

	// Get length of 4 edges and end displacements
	const Vector& end1Crd = theNodes[0]->getCrds();
	const Vector& end2Crd = theNodes[1]->getCrds();
	const Vector& end3Crd = theNodes[2]->getCrds();
	const Vector& end4Crd = theNodes[3]->getCrds();

	// Vertices (counterclockwise)
	const Vector& end1Disp = theNodes[0]->getDisp();
	const Vector& end2Disp = theNodes[1]->getDisp();
	const Vector& end3Disp = theNodes[2]->getDisp();
	const Vector& end4Disp = theNodes[3]->getDisp();

	// 2 dimension case
	if (dimension == 2) {

		dx[0] = end2Crd(0) - end1Crd(0);
		dx[1] = end3Crd(0) - end2Crd(0);
		dx[2] = end4Crd(0) - end3Crd(0);
		dx[3] = end1Crd(0) - end4Crd(0);

		dy[0] = end2Crd(1) - end1Crd(1);
		dy[1] = end3Crd(1) - end2Crd(1);
		dy[2] = end4Crd(1) - end3Crd(1);
		dy[3] = end1Crd(1) - end4Crd(1);

		dz[0] = 0.0;
		dz[1] = 0.0;
		dz[2] = 0.0;
		dz[3] = 0.0;

		for (int i = 0; i < 4; i++)
			L[i] = sqrt(dx[i] * dx[i] + dy[i] * dy[i]);

		if (initialDisp == 0) {
			double iDispX[4];
			double iDispY[4];

			iDispX[0] = end2Disp(0) - end1Disp(0);
			iDispX[1] = end3Disp(0) - end2Disp(0);
			iDispX[2] = end4Disp(0) - end3Disp(0);
			iDispX[3] = end1Disp(0) - end4Disp(0);

			iDispY[0] = end2Disp(1) - end1Disp(1);
			iDispY[1] = end3Disp(1) - end2Disp(1);
			iDispY[2] = end4Disp(1) - end3Disp(1);
			iDispY[3] = end1Disp(1) - end4Disp(1);

			for (int i = 0; i < 4; i++) {
				if (iDispX[i] != 0 || iDispY[i] != 0) {
					initialDisp = new double[8];
					for (int j = 0; j < 4; j++) {
						initialDisp[j * 2] = iDispX[j];
						initialDisp[j * 2 + 1] = iDispY[j];
					}
					break;
				}
			}
		}
	}

	// 3 dimension case
	if (dimension == 3) {

		dx[0] = end2Crd(0) - end1Crd(0);
		dx[1] = end3Crd(0) - end2Crd(0);
		dx[2] = end4Crd(0) - end3Crd(0);
		dx[3] = end1Crd(0) - end4Crd(0);

		dy[0] = end2Crd(1) - end1Crd(1);
		dy[1] = end3Crd(1) - end2Crd(1);
		dy[2] = end4Crd(1) - end3Crd(1);
		dy[3] = end1Crd(1) - end4Crd(1);

		dz[0] = end2Crd(2) - end1Crd(2);
		dz[1] = end3Crd(2) - end2Crd(2);
		dz[2] = end4Crd(2) - end3Crd(2);
		dz[3] = end1Crd(2) - end4Crd(2);

		for (int i = 0; i < 4; i++)
			L[i] = sqrt(dx[i] * dx[i] + dy[i] * dy[i] + dz[i] * dz[i]);

		if (initialDisp == 0) {
			double iDispX[8];
			double iDispY[8];
			double iDispZ[8];

			iDispX[0] = end2Disp(0) - end1Disp(0);
			iDispX[1] = end3Disp(0) - end2Disp(0);
			iDispX[2] = end4Disp(0) - end3Disp(0);
			iDispX[3] = end1Disp(0) - end4Disp(0);

			iDispY[0] = end2Disp(1) - end1Disp(1);
			iDispY[1] = end3Disp(1) - end2Disp(1);
			iDispY[2] = end4Disp(1) - end3Disp(1);
			iDispY[3] = end1Disp(1) - end4Disp(1);

			iDispZ[0] = end2Disp(2) - end1Disp(2);
			iDispZ[1] = end3Disp(2) - end2Disp(2);
			iDispZ[2] = end4Disp(2) - end3Disp(2);
			iDispZ[3] = end1Disp(2) - end4Disp(2);

			for (int i = 0; i < 4; i++) {
				if (iDispX[i] != 0 || iDispY[i] != 0 || iDispZ[i] != 0) {
					initialDisp = new double[12];
					for (int j = 0; j < 4; j++) {
						initialDisp[j * 3] = iDispX[j];
						initialDisp[j * 3 + 1] = iDispY[j];
						initialDisp[j * 3 + 2] = iDispZ[j];
					}
					break;
				}
			}
		}

		// Verify the nodes are coplanar
		static Vector AB(3);
		static Vector AD(3);
		static Vector AC(3);

		static Vector temp(3);
		
		AB = end2Crd;
		AB -= end1Crd;

		AD = end4Crd;
		AD -= end1Crd;

		AC = end3Crd;
		AC -= end1Crd;

		temp = LovelyCrossProduct(AB, AD);
		double val = LovelyInnerProduct(temp, AC);
		double temp2 = LovelyNorm(temp);

		if (fabs(val) > 0.0001*temp2) // Dealing with tolerances to allow for double issues
		{
			opserr << "WARNING StringPanelLin::setDomain() - StringerPanel " << this->getTag() << " is not coplanar\n";
			return;
		}
	}

	// Create the load vector -----
	if (theLoad == 0)
		theLoad = new Vector(numDOF);
	else if (theLoad->Size() != numDOF) {
		delete theLoad;
		theLoad = new Vector(numDOF);
	}

	if (theLoad == 0) {
		opserr << "StringPanelLin::setDomain - StringPanel " << this->getTag() <<
			" out of memory creating vector of size " << numDOF << endln;
		exit(-1);
		return;
	}

	this->update();

}

int StringPanelLin::commitState()
{
	int retVal = 0;
	if ((retVal = this->Element::commitState()) != 0)
		opserr << "StringPanelLin::commitState () - failed in base class";

	retVal += theSection1_1->commitState();
	retVal += theSection1_2->commitState();

	retVal += theSection2_1->commitState();
	retVal += theSection2_2->commitState();
	
	retVal += theSection3_1->commitState();
	retVal += theSection3_2->commitState();
	
	retVal += theSection4_1->commitState();
	retVal += theSection4_2->commitState();

	return retVal;
}

int StringPanelLin::revertToLastCommit()
{
	int retVal = 0;

	retVal += theSection1_1->revertToLastCommit();
	retVal += theSection1_2->revertToLastCommit();

	retVal += theSection2_1->revertToLastCommit();
	retVal += theSection2_2->revertToLastCommit();

	retVal += theSection3_1->revertToLastCommit();
	retVal += theSection3_2->revertToLastCommit();

	retVal += theSection4_1->revertToLastCommit();
	retVal += theSection4_2->revertToLastCommit();

	return retVal;
}

int StringPanelLin::revertToStart()
{
	int retVal = 0;

	retVal += theSection1_1->revertToStart();
	retVal += theSection1_2->revertToStart();

	retVal += theSection2_1->revertToStart();
	retVal += theSection2_2->revertToStart();

	retVal += theSection3_1->revertToStart();
	retVal += theSection3_2->revertToStart();

	retVal += theSection4_1->revertToStart();
	retVal += theSection4_2->revertToStart();

	return retVal;
}

int StringPanelLin::update()
{
	// determine the current strain given trial displacements at nodes
	// CURRENTLY HAS TWO INTEGRATION POINTS, EACH INTEGRATION POINT DEFINES THE
	// GENERALIZED STRAINS e1 AND e2 IN HOOGENBOOM'S FORMULATION AND DETERMINES
	// THE STIFFNESS MATRIX AND FORCES WITH THOSE TWO. THE GENERALIZED STRAINS
	// e1 AND e2 ARE COMPUTED CONSIDERING HALF THE LENGTH.
	
	Vector strain = this->computeCurrentStrain();

	// First stringer
	int order1 = theSection1_1->getOrder();
	const ID& code1 = theSection1_1->getType();

	Vector e1_1(order1);
	Vector e1_2(order1);

	for (int j = 0; j < order1; j++) {
		if (code1(j) == SECTION_RESPONSE_P) {
			e1_1(j) = strain(0);
			e1_2(j) = strain(1);
		}
	}

	theSection1_1->setTrialSectionDeformation(e1_1);
	theSection1_2->setTrialSectionDeformation(e1_2);

	// Second stringer
	int order2 = theSection2_1->getOrder();
	const ID& code2 = theSection2_1->getType();

	Vector e2_1(order2);
	Vector e2_2(order2);

	for (int j = 0; j < order2; j++) {
		if (code2(j) == SECTION_RESPONSE_P) {
			e2_1(j) = strain(2);
			e2_2(j) = strain(3);
		}
	}

	theSection2_1->setTrialSectionDeformation(e2_1);
	theSection2_2->setTrialSectionDeformation(e2_2);

	// Third stringer
	int order3 = theSection3_1->getOrder();
	const ID& code3 = theSection3_1->getType();

	Vector e3_1(order3);
	Vector e3_2(order3);

	for (int j = 0; j < order3; j++) {
		if (code3(j) == SECTION_RESPONSE_P) {
			e3_1(j) = strain(4);
			e3_2(j) = strain(5);
		}
	}

	theSection3_1->setTrialSectionDeformation(e3_1);
	theSection3_2->setTrialSectionDeformation(e3_2);

	// Fourth stringer
	int order4 = theSection4_1->getOrder();
	const ID& code4 = theSection4_1->getType();

	Vector e4_1(order4);
	Vector e4_2(order4);

	for (int j = 0; j < order4; j++) {
		if (code4(j) == SECTION_RESPONSE_P) {
			e4_1(j) = strain(6);
			e4_2(j) = strain(7);
		}
	}

	theSection4_1->setTrialSectionDeformation(e4_1);
	theSection4_2->setTrialSectionDeformation(e4_2);

	return 0;
}

const Matrix& StringPanelLin::getInitialStiff(void) 
{
	Matrix& stiff = *theMatrix;

	// Stringers stiffness matrix
	static Matrix k1(3, 3);
	static Matrix k2(3, 3);
	static Matrix k3(3, 3);
	static Matrix k4(3, 3);

	k1(0, 0) =  4.0;
	k1(0, 1) = -6.0;
	k1(0, 2) =  2.0;
	k1(1, 0) = -6.0;
	k1(1, 1) = 12.0;
	k1(1, 2) = -6.0;
	k1(2, 0) =  2.0;
	k1(2, 1) = -6.0;
	k1(2, 2) =  4.0;

	k2 = k1;
	k3 = k1;
	k4 = k1;

	double AEoverL[4];

	// Currently the element only allows for a constant section in each stringer
	// The initial stiffness is computed based on one unique section of the stringer
	// regardles of having 2 integration points
	
	// Stringer 1
	AEoverL[0] = 0.0;
	int order1 = theSection1_1->getOrder();
	const ID& code1 = theSection1_1->getType();
	const Matrix& k_1 = theSection1_1->getInitialTangent();
	for (int j = 0; j < order1; j++) {
		if (code1(j) == SECTION_RESPONSE_P)
			AEoverL[0] += k_1(j, j);
	}
	AEoverL[0] /= L[0];

	// Stringer 2
	AEoverL[1] = 0.0;
	int order2 = theSection2_1->getOrder();
	const ID& code2 = theSection2_1->getType();
	const Matrix& k_2 = theSection2_1->getInitialTangent();
	for (int j = 0; j < order2; j++) {
		if (code2(j) == SECTION_RESPONSE_P)
			AEoverL[1] += k_2(j, j);
	}
	AEoverL[1] /= L[1];

	// Stringer 3
	AEoverL[2] = 0.0;
	int order3 = theSection3_1->getOrder();
	const ID& code3 = theSection3_1->getType();
	const Matrix& k_3 = theSection3_1->getInitialTangent();
	for (int j = 0; j < order3; j++) {
		if (code3(j) == SECTION_RESPONSE_P)
			AEoverL[2] += k_3(j, j);
	}
	AEoverL[2] /= L[2];

	// Stringer 4
	AEoverL[3] = 0.0;
	int order4 = theSection4_1->getOrder();
	const ID& code4 = theSection4_1->getType();
	const Matrix& k_4 = theSection4_1->getInitialTangent();
	for (int j = 0; j < order4; j++) {
		if (code4(j) == SECTION_RESPONSE_P)
			AEoverL[3] += k_4(j, j);
	}
	AEoverL[3] /= L[3];

	for (int i = 0; i < 3; i++) {
		for (int j = 0; j < 3; j++) {
			k1(i, j) *= AEoverL[0];
			k2(i, j) *= AEoverL[1];
			k3(i, j) *= AEoverL[2];
			k4(i, j) *= AEoverL[3];
		}
	}

	// Assemble stiffness matrix, panel contribution and transformation within function
	stiff = assembleK(k1, k2, k3, k4);

	flagInitial = 1;		// Change flag for computing the midpoint displacement purposes

	return *theMatrix;
}

const Matrix& StringPanelLin::getTangentStiff(void)
{
	Matrix& stiff = *theMatrix;

	// Stringers stiffness matrix
	static Matrix k1(3, 3);
	static Matrix k2(3, 3);
	static Matrix k3(3, 3);
	static Matrix k4(3, 3);

	k1.Zero();
	k2.Zero();
	k3.Zero();
	k4.Zero();

	//k1(0, 0) = 4.0;
	//k1(0, 1) = -6.0;
	//k1(0, 2) = 2.0;
	//k1(1, 0) = -6.0;
	//k1(1, 1) = 12.0;
	//k1(1, 2) = -6.0;
	//k1(2, 0) = 2.0;
	//k1(2, 1) = -6.0;
	//k1(2, 2) = 4.0;

	//k2 = k1;
	//k3 = k1;
	//k4 = k1;

	//double AEoverL[8];

	//// Stringer 1
	//AEoverL[0] = 0.0;
	//AEoverL[1] = 0.0;
	//int order1 = theSection1_1->getOrder();
	//const ID& code1 = theSection1_1->getType();
	//const Matrix& k1_1 = theSection1_1->getSectionTangent();
	//const Matrix& k1_2 = theSection1_2->getSectionTangent();
	//for (int j = 0; j < order1; j++) {
	//	if (code1(j) == SECTION_RESPONSE_P) {
	//		AEoverL[0] += k1_1(j, j);
	//		AEoverL[1] += k1_2(j, j);
	//	}
	//}
	//AEoverL[0] /= L[0];
	//AEoverL[1] /= L[0];

	//// Stringer 2
	//AEoverL[2] = 0.0;
	//AEoverL[3] = 0.0;
	//int order2 = theSection2_1->getOrder();
	//const ID& code2 = theSection2_1->getType();
	//const Matrix& k2_1 = theSection2_1->getSectionTangent();
	//const Matrix& k2_2 = theSection2_2->getSectionTangent();
	//for (int j = 0; j < order2; j++) {
	//	if (code2(j) == SECTION_RESPONSE_P) {
	//		AEoverL[2] += k2_1(j, j);
	//		AEoverL[3] += k2_2(j, j);
	//	}
	//}
	//AEoverL[2] /= L[1];
	//AEoverL[3] /= L[1];

	//// Stringer 3
	//AEoverL[4] = 0.0;
	//AEoverL[5] = 0.0;
	//int order3 = theSection3_1->getOrder();
	//const ID& code3 = theSection3_1->getType();
	//const Matrix& k3_1 = theSection3_1->getSectionTangent();
	//const Matrix& k3_2 = theSection3_2->getSectionTangent();
	//for (int j = 0; j < order3; j++) {
	//	if (code3(j) == SECTION_RESPONSE_P) {
	//		AEoverL[4] += k3_1(j, j);
	//		AEoverL[5] += k3_2(j, j);
	//	}
	//}
	//AEoverL[4] /= L[2];
	//AEoverL[5] /= L[2];

	//// Stringer 4
	//AEoverL[6] = 0.0;
	//AEoverL[7] = 0.0;
	//int order4 = theSection4_1->getOrder();
	//const ID& code4 = theSection4_1->getType();
	//const Matrix& k4_1 = theSection4_1->getSectionTangent();
	//const Matrix& k4_2 = theSection4_2->getSectionTangent();
	//for (int j = 0; j < order4; j++) {
	//	if (code4(j) == SECTION_RESPONSE_P) {
	//		AEoverL[6] += k4_1(j, j);
	//		AEoverL[7] += k4_2(j, j);
	//	}
	//}
	//AEoverL[6] /= L[3];
	//AEoverL[7] /= L[3];




	////// Get stiffness matrix considering contribution of both integration points
	//for (int i = 0; i < 3; i++) {
	//	for (int j = 0; j < 3; j++) {
	//		k1(i, j) *= (AEoverL[0] * 0.5 + AEoverL[1] * 0.5);
	//		k2(i, j) *= (AEoverL[2] * 0.5 + AEoverL[3] * 0.5);
	//		k3(i, j) *= (AEoverL[4] * 0.5 + AEoverL[5] * 0.5);
	//		k4(i, j) *= (AEoverL[6] * 0.5 + AEoverL[7] * 0.5);
	//	}
	//}

	// B matrix
	static Matrix B(2, 3);
	B.Zero();
	B(0, 0) = -1.;
	B(0, 1) = 1.;
	B(1, 1) = -1.;
	B(1, 2) = 1.;

	double EAflex[8];	// Array to save tangent flexibility values
	// Stringer 1
	EAflex[0] = 0.0;
	EAflex[1] = 0.0;
	int order1 = theSection1_1->getOrder();
	const ID& code1 = theSection1_1->getType();
	const Matrix& f1_1 = theSection1_1->getSectionTangent();
	const Matrix& f1_2 = theSection1_2->getSectionTangent();
	for (int j = 0; j < order1; j++) {
		if (code1(j) == SECTION_RESPONSE_P) {
			EAflex[0] += 1/f1_1(j, j);
			EAflex[1] += 1/f1_2(j, j);
		}
	}
	EAflex[0] *= L[0] / 6.;
	EAflex[1] *= L[0] / 6.;

	// Stringer 2
	EAflex[2] = 0.0;
	EAflex[3] = 0.0;
	int order2 = theSection2_1->getOrder();
	const ID& code2 = theSection2_1->getType();
	const Matrix& f2_1 = theSection2_1->getSectionTangent();
	const Matrix& f2_2 = theSection2_2->getSectionTangent();
	for (int j = 0; j < order2; j++) {
		if (code2(j) == SECTION_RESPONSE_P) {
			EAflex[2] += 1/f2_1(j, j);
			EAflex[3] += 1/f2_2(j, j);
		}
	}
	EAflex[2] *= L[1] / 6.;
	EAflex[3] *= L[1] / 6.;

	// Stringer 3
	EAflex[4] = 0.0;
	EAflex[5] = 0.0;
	int order3 = theSection3_1->getOrder();
	const ID& code3 = theSection3_1->getType();
	const Matrix& f3_1 = theSection3_1->getSectionTangent();
	const Matrix& f3_2 = theSection3_2->getSectionTangent();
	for (int j = 0; j < order3; j++) {
		if (code2(j) == SECTION_RESPONSE_P) {
			EAflex[4] += 1/f3_1(j, j);
			EAflex[5] += 1/f3_2(j, j);
		}
	}
	EAflex[4] *= L[2] / 6.;
	EAflex[5] *= L[2] / 6.;

	// Stringer 4
	EAflex[6] = 0.0;
	EAflex[7] = 0.0;
	int order4 = theSection4_1->getOrder();
	const ID& code4 = theSection4_1->getType();
	const Matrix& f4_1 = theSection4_1->getSectionTangent();
	const Matrix& f4_2 = theSection4_2->getSectionTangent();
	for (int j = 0; j < order4; j++) {
		if (code2(j) == SECTION_RESPONSE_P) {
			EAflex[6] += 1/f4_1(j, j);
			EAflex[7] += 1/f4_2(j, j);
		}
	}
	EAflex[6] *= L[3] / 6.;
	EAflex[7] *= L[3] / 6.;

	// Stringers flexibility matrix
	static Matrix f1(2, 2);
	static Matrix f2(2, 2);
	static Matrix f3(2, 2);
	static Matrix f4(2, 2);

	f1.Zero();
	f2.Zero();
	f3.Zero();
	f4.Zero();

	f1(0, 0) = 1.5 * EAflex[0] + 0.5 * EAflex[1];
	f1(0, 1) = 0.5 * EAflex[0] + 0.5 * EAflex[1];
	f1(1, 0) = 0.5 * EAflex[0] + 0.5 * EAflex[1];
	f1(1, 1) = 0.5 * EAflex[0] + 1.5 * EAflex[1];

	f2(0, 0) = 1.5 * EAflex[2] + 0.5 * EAflex[3];
	f2(0, 1) = 0.5 * EAflex[2] + 0.5 * EAflex[3];
	f2(1, 0) = 0.5 * EAflex[2] + 0.5 * EAflex[3];
	f2(1, 1) = 0.5 * EAflex[2] + 1.5 * EAflex[3];

	f3(0, 0) = 1.5 * EAflex[4] + 0.5 * EAflex[5];
	f3(0, 1) = 0.5 * EAflex[4] + 0.5 * EAflex[5];
	f3(1, 0) = 0.5 * EAflex[4] + 0.5 * EAflex[5];
	f3(1, 1) = 0.5 * EAflex[4] + 1.5 * EAflex[5];

	f4(0, 0) = 1.5 * EAflex[6] + 0.5 * EAflex[7];
	f4(0, 1) = 0.5 * EAflex[6] + 0.5 * EAflex[7];
	f4(1, 0) = 0.5 * EAflex[6] + 0.5 * EAflex[7];
	f4(1, 1) = 0.5 * EAflex[6] + 1.5 * EAflex[7];

	// Inverse of flexibility matrix
	static Matrix kf1(2, 2);
	static Matrix kf2(2, 2);
	static Matrix kf3(2, 2);
	static Matrix kf4(2, 2);

	f1.Invert(kf1);
	f2.Invert(kf2);
	f3.Invert(kf3);
	f4.Invert(kf4);

	// B'*D*B
	k1(0, 0) = kf1(0, 0);				k1(0, 1) = kf1(0, 1) - kf1(0, 0);							k1(0, 2) = -kf1(0, 1);
	k1(1, 0) = kf1(0, 1) - kf1(0, 0);	k1(1, 1) = kf1(0, 0) - kf1(1, 0) - kf1(0, 1) + kf1(1, 1);	k1(1, 2) = kf1(0, 1) - kf1(1, 1);
	k1(2, 0) = -kf1(1, 0);				k1(2, 1) = kf1(1, 0) - kf1(1, 1);							k1(2, 2) = kf1(1, 1);

	k2(0, 0) = kf2(0, 0);				k2(0, 1) = kf2(0, 1) - kf2(0, 0);							k2(0, 2) = -kf2(0, 1);
	k2(1, 0) = kf2(0, 1) - kf2(0, 0);	k2(1, 1) = kf2(0, 0) - kf2(1, 0) - kf2(0, 1) + kf2(1, 1);	k2(1, 2) = kf2(0, 1) - kf2(1, 1);
	k2(2, 0) = -kf2(1, 0);				k2(2, 1) = kf2(1, 0) - kf2(1, 1);							k2(2, 2) = kf2(1, 1);

	k3(0, 0) = kf3(0, 0);				k3(0, 1) = kf3(0, 1) - kf3(0, 0);							k3(0, 2) = -kf3(0, 1);
	k3(1, 0) = kf3(0, 1) - kf3(0, 0);	k3(1, 1) = kf3(0, 0) - kf3(1, 0) - kf3(0, 1) + kf3(1, 1);	k3(1, 2) = kf3(0, 1) - kf3(1, 1);
	k3(2, 0) = -kf3(1, 0);				k3(2, 1) = kf3(1, 0) - kf3(1, 1);							k3(2, 2) = kf3(1, 1);

	k4(0, 0) = kf4(0, 0);				k4(0, 1) = kf4(0, 1) - kf4(0, 0);							k4(0, 2) = -kf4(0, 1);
	k4(1, 0) = kf4(0, 1) - kf4(0, 0);	k4(1, 1) = kf4(0, 0) - kf4(1, 0) - kf4(0, 1) + kf4(1, 1);	k4(1, 2) = kf4(0, 1) - kf4(1, 1);
	k4(2, 0) = -kf4(1, 0);				k4(2, 1) = kf4(1, 0) - kf4(1, 1);							k4(2, 2) = kf4(1, 1);

	// Assemble stiffness matrix, panel contribution and transformation within function
	stiff = assembleK(k1, k2, k3, k4);

	return *theMatrix;
}

// Lumped mass matrix
const Matrix& StringPanelLin::getMass() {

	// zero the matrix
	Matrix& mass = *theMatrix;
	mass.Zero();

	// check if no rho was specified for quick return
	if (rho == 0.0)
		return mass;

	// get lumped mass matrix
	double Area = getPanelArea();
	double m = 0.25 * rho * Area;
	int numDOF4 = numDOF / 4;

	for (int i = 0; i < dimension; i++) {
		mass(i, i) = m;
		mass(i + numDOF4, i + numDOF4) = m;
		mass(i + numDOF4 * 2, i + numDOF4 * 2) = m;
		mass(i + numDOF4 * 3, i + numDOF4 * 3) = m;
	}

	return mass;
}

void StringPanelLin::zeroLoad()
{
	theLoad->Zero();
}

// The element does not allow for applied loads to the stringers or panels, only nodal loads
int StringPanelLin::addLoad(ElementalLoad* theLoad, double loadFactor)
{
	opserr << "StringPanelLin::addLoad - load type unknown for StringPanelLin with tag: " << this->getTag() << endln;
	return -1;
}

int StringPanelLin::addInertiaLoadToUnbalance(const Vector &accel)
{
	// check for quick return
	if (rho == 0.0)
		return 0;

	// get R*accel from the nodes
	const Vector& Raccel1 = theNodes[0]->getRV(accel);
	const Vector& Raccel2 = theNodes[1]->getRV(accel);
	const Vector& Raccel3 = theNodes[2]->getRV(accel);
	const Vector& Raccel4 = theNodes[3]->getRV(accel);

	// get mass value at each node
	double Area = getPanelArea();
	double m = 0.25 * rho * Area;
	int numDOF4 = numDOF / 4;

	// get average acceleration at centroid of element
	double ave_accel[3] = { 0.0 };

	if (dimension == 2) {
		ave_accel[0] = (Raccel1(0) + Raccel2(0) + Raccel3(0) + Raccel4(0)) / 4.;
		ave_accel[1] = (Raccel1(1) + Raccel2(1) + Raccel3(1) + Raccel4(1)) / 4.;
	}
	else {
		ave_accel[0] = (Raccel1(0) + Raccel2(0) + Raccel3(0) + Raccel4(0)) / 4.;
		ave_accel[1] = (Raccel1(1) + Raccel2(1) + Raccel3(1) + Raccel4(1)) / 4.;
		ave_accel[2] = (Raccel1(2) + Raccel2(2) + Raccel3(2) + Raccel4(2)) / 4.;
	}

	// add inertial load
	for (int i = 0; i < dimension; i++) {
		(*theLoad)(i) -= m * ave_accel[i];
		(*theLoad)(i + numDOF4) -= m * ave_accel[i];
		(*theLoad)(i + numDOF4 * 2) -= m * ave_accel[i];
		(*theLoad)(i + numDOF4 * 3) -= m * ave_accel[i];
	}

	return 0;
}

const Vector& StringPanelLin::getResistingForce()
{
	static Vector fStringers(12);
	fStringers.Zero();

	fStringers = getLocalForce();

	static Vector fReduced(8);

	// Only the nodal forces
	fReduced(0) = fStringers(0);
	fReduced(1) = fStringers(2);
	fReduced(2) = fStringers(3);
	fReduced(3) = fStringers(5);
	fReduced(4) = fStringers(6);
	fReduced(5) = fStringers(8);
	fReduced(6) = fStringers(9);
	fReduced(7) = fStringers(11);

	// Transform into global coordinates
	static Matrix T(8, numDOF);
	static Vector fGlobal(numDOF);

	T = transformMatrix();
	fGlobal.addMatrixTransposeVector(0.0, T, fReduced, 1.0);

	*theVector = fGlobal;

	// subtract external load
	*theVector -= *theLoad;

	return *theVector;
}

const Vector& StringPanelLin::getResistingForceIncInertia()
{
	this->getResistingForce();

	// Include the mass portion
	if (rho != 0.0) {

		// add inertial forces from element mass
		const Vector& accel1 = theNodes[0]->getTrialAccel();
		const Vector& accel2 = theNodes[1]->getTrialAccel();
		const Vector& accel3 = theNodes[2]->getTrialAccel();
		const Vector& accel4 = theNodes[3]->getTrialAccel();

		// get mass value at each node
		double Area = getPanelArea();
		double m = 0.25 * rho * Area;
		int numDOF4 = numDOF / 4;

		// get average acceleration at centroid of element
		double ave_accel[3] = { 0.0 };

		if (dimension == 2) {
			ave_accel[0] = (accel1(0) + accel2(0) + accel3(0) + accel4(0)) / 4.;
			ave_accel[1] = (accel1(1) + accel2(1) + accel3(1) + accel4(1)) / 4.;
		}
		else {
			ave_accel[0] = (accel1(0) + accel2(0) + accel3(0) + accel4(0)) / 4.;
			ave_accel[1] = (accel1(1) + accel2(1) + accel3(1) + accel4(1)) / 4.;
			ave_accel[2] = (accel1(2) + accel2(2) + accel3(2) + accel4(2)) / 4.;
		}

		//// add inertial load (average acceleration)
		//for (int i = 0; i < dimension; i++) {
		//	(*theVector)(i) += m * ave_accel[i];
		//	(*theVector)(i + numDOF4) += m * ave_accel[i];
		//	(*theVector)(i + numDOF4 * 2) += m * ave_accel[i];
		//	(*theVector)(i + numDOF4 * 3) += m * ave_accel[i];
		//}

		// add inertial load (1/4 of the mass at each corner)
		for (int i = 0; i < dimension; i++) {
			(*theVector)(i) += m * accel1(i);
			(*theVector)(i + numDOF4) += m * accel2(i);
			(*theVector)(i + numDOF4 * 2) += m * accel3(i);
			(*theVector)(i + numDOF4 * 3) += m * accel4(i);
		}

		// add the damping forces if rayleigh damping
		if (alphaM != 0.0 || betaK != 0.0 || betaK0 != 0.0 || betaKc != 0.0)
			*theVector += this->getRayleighDampingForces();
	}

	return *theVector;
}

int StringPanelLin::sendSelf(int commitTag, Channel& theChannel)
{
	int res;

	// note: we don't check for dataTag == 0 for Element
	// objects as that is taken care of in a commit by the Domain
	// object - don't want to have to do the check if sending data
	int dataTag = this->getDbTag();

	// Get an ID for the sections
	static ID idSections(16);

	// Stringer 1_1
	int sectClassTag1_1 = theSection1_1->getClassTag();
	int sectDbTag1_1 = theSection1_1->getDbTag();
	if (sectDbTag1_1 == 0) {
		sectDbTag1_1 = theChannel.getDbTag();
		theSection1_1->setDbTag(sectDbTag1_1);
	}
	idSections(0) = sectClassTag1_1;
	idSections(1) = sectDbTag1_1;

	// Stringer 1_2
	int sectClassTag1_2 = theSection1_2->getClassTag();
	int sectDbTag1_2 = theSection1_2->getDbTag();
	if (sectDbTag1_2 == 0) {
		sectDbTag1_2 = theChannel.getDbTag();
		theSection1_2->setDbTag(sectDbTag1_2);
	}
	idSections(2) = sectClassTag1_2;
	idSections(3) = sectDbTag1_2;

	// Stringer 2_1
	int sectClassTag2_1 = theSection2_1->getClassTag();
	int sectDbTag2_1 = theSection2_1->getDbTag();
	if (sectDbTag2_1 == 0) {
		sectDbTag2_1 = theChannel.getDbTag();
		theSection2_1->setDbTag(sectDbTag2_1);
	}
	idSections(4) = sectClassTag2_1;
	idSections(5) = sectDbTag2_1;

	// Stringer 2_2
	int sectClassTag2_2 = theSection2_2->getClassTag();
	int sectDbTag2_2 = theSection2_2->getDbTag();
	if (sectDbTag2_2 == 0) {
		sectDbTag2_2 = theChannel.getDbTag();
		theSection2_2->setDbTag(sectDbTag2_2);
	}
	idSections(6) = sectClassTag2_2;
	idSections(7) = sectDbTag2_2;

	// Stringer 3_1
	int sectClassTag3_1 = theSection3_1->getClassTag();
	int sectDbTag3_1 = theSection3_1->getDbTag();
	if (sectDbTag3_1 == 0) {
		sectDbTag3_1 = theChannel.getDbTag();
		theSection3_1->setDbTag(sectDbTag3_1);
	}
	idSections(8) = sectClassTag3_1;
	idSections(9) = sectDbTag3_1;

	// Stringer 3_2
	int sectClassTag3_2 = theSection3_2->getClassTag();
	int sectDbTag3_2 = theSection3_2->getDbTag();
	if (sectDbTag3_2 == 0) {
		sectDbTag3_2 = theChannel.getDbTag();
		theSection3_2->setDbTag(sectDbTag3_2);
	}
	idSections(10) = sectClassTag3_2;
	idSections(11) = sectDbTag3_2;
	
	// Stringer 4_1
	int sectClassTag4_1 = theSection4_1->getClassTag();
	int sectDbTag4_1 = theSection4_1->getDbTag();
	if (sectDbTag4_1 == 0) {
		sectDbTag4_1 = theChannel.getDbTag();
		theSection4_1->setDbTag(sectDbTag4_1);
	}
	idSections(12) = sectClassTag4_1;
	idSections(13) = sectDbTag4_1;

	// Stringer 4_2
	int sectClassTag4_2 = theSection4_2->getClassTag();
	int sectDbTag4_2 = theSection4_2->getDbTag();
	if (sectDbTag4_2 == 0) {
		sectDbTag4_2 = theChannel.getDbTag();
		theSection4_2->setDbTag(sectDbTag4_2);
	}
	idSections(14) = sectClassTag4_2;
	idSections(15) = sectDbTag4_2;

	res = theChannel.sendID(dataTag, commitTag, idSections);
	if (res < 0) {
		opserr << "WARNING StringPanelLin::sendSelf() - " << this->getTag() << " failed to send idSections\n";
		return res;
	}

	// Data ID
	static ID idData(7);
	idData(0) = this->getTag();
	idData(1) = dimension;
	idData(2) = numDOF;
	
	for (int i = 0; i < 4; i++)
		idData(i + 3) = connectedExternalNodes(i);

	res += theChannel.sendID(dataTag, commitTag, idData);
	if (res < 0) {
		opserr << "WARNING StringPanelLin::sendSelf() - " << this->getTag() << " failed to send idData\n";
		return res;
	}

	// Initial displacement ID
	int temp = dimension * 4;
	static Vector initialDispID(temp);
	if (dimension == 2)
		for (int j = 0; j < 4; j++) {
			initialDispID(j * 2) = initialDisp[j * 2];
			initialDispID(j * 2 + 1) = initialDisp[j * 2 + 1];
		}
	else if (dimension == 3)
		for (int j = 0; j < 4; j++) {
			initialDispID(j * 2) = initialDisp[j * 2];
			initialDispID(j * 2 + 1) = initialDisp[j * 2 + 1];
			initialDispID(j * 2 + 2) = initialDisp[j * 2 + 2];
		}

	res += theChannel.sendVector(dataTag, commitTag, initialDispID);
	if (res < 0) {
		opserr << "WARNING StringPanelLin::sendSelf() - " << this->getTag() << " failed to send initialDispID\n";
		return res;
	}

	// Ask sections to send themselves

	res += theSection1_1->sendSelf(commitTag, theChannel);
	res += theSection1_2->sendSelf(commitTag, theChannel);
	res += theSection2_1->sendSelf(commitTag, theChannel);
	res += theSection2_2->sendSelf(commitTag, theChannel);
	res += theSection3_1->sendSelf(commitTag, theChannel);
	res += theSection3_2->sendSelf(commitTag, theChannel);
	res += theSection4_1->sendSelf(commitTag, theChannel);
	res += theSection4_2->sendSelf(commitTag, theChannel);

	if (res < 0) {
		opserr << "WARNING StringPanelLin::sendSelf() - " << this->getTag() << " failed to send its sections\n";
		return res;
	}


	return res;
}

int StringPanelLin::recvSelf(int commitTag, Channel& theChannel, FEM_ObjectBroker& theBroker)
{
	int res;
	int dataTag = this->getDbTag();

	static ID idSections(16);
	res = theChannel.recvID(dataTag, commitTag, idSections);
	if (res < 0) {
		opserr << "WARNING StringPanelLin::recvSelf() - " << this->getTag() << " failed to receive sections\n";
		return res;
	}

	// Section 1_1
	if (theSection1_1 == 0) {
		int sectClassTag1_1 = idSections(0);
		int sectDbTag1_1 = idSections(1);
		theSection1_1 = theBroker.getNewSection(sectClassTag1_1);
		if (theSection1_1 == 0) {
			opserr << "StringPanelLin::recvSelf() - Broker could not create a section of class type " << sectClassTag1_1 << endln;
			return -1;
		}
		theSection1_1->setDbTag(sectDbTag1_1);
		res += theSection1_1->recvSelf(commitTag, theChannel, theBroker);
	}
	else {
		int sectClassTag1_1 = idSections(0);
		int sectDbTag1_1 = idSections(1);
		if (theSection1_1->getClassTag() != sectClassTag1_1) {
			delete theSection1_1;
			theSection1_1 = theBroker.getNewSection(sectClassTag1_1);
			if (theSection1_1 == 0) {
				opserr << "StringPanelLin::recvSelf() - Broker could not create a section of class type " << sectClassTag1_1 << endln;
				return -1;
			}
		}
		theSection1_1->setDbTag(sectDbTag1_1);
		res += theSection1_1->recvSelf(commitTag, theChannel, theBroker);
	}

	// Section 1_2
	if (theSection1_2 == 0) {
		int sectClassTag1_2 = idSections(2);
		int sectDbTag1_2 = idSections(3);
		theSection1_2 = theBroker.getNewSection(sectClassTag1_2);
		if (theSection1_2 == 0) {
			opserr << "StringPanelLin::recvSelf() - Broker could not create a section of class type " << sectClassTag1_2 << endln;
			return -1;
		}
		theSection1_2->setDbTag(sectDbTag1_2);
		res += theSection1_2->recvSelf(commitTag, theChannel, theBroker);
	}
	else {
		int sectClassTag1_2 = idSections(2);
		int sectDbTag1_2 = idSections(3);
		if (theSection1_2->getClassTag() != sectClassTag1_2) {
			delete theSection1_2;
			theSection1_2 = theBroker.getNewSection(sectClassTag1_2);
			if (theSection1_2 == 0) {
				opserr << "StringPanelLin::recvSelf() - Broker could not create a section of class type " << sectClassTag1_2 << endln;
				return -1;
			}
		}
		theSection1_2->setDbTag(sectDbTag1_2);
		res += theSection1_2->recvSelf(commitTag, theChannel, theBroker);
	}

	// Section 2_1
	if (theSection2_1 == 0) {
		int sectClassTag2_1 = idSections(4);
		int sectDbTag2_1 = idSections(5);
		theSection2_1 = theBroker.getNewSection(sectClassTag2_1);
		if (theSection2_1 == 0) {
			opserr << "StringPanelLin::recvSelf() - Broker could not create a section of class type " << sectClassTag2_1 << endln;
			return -1;
		}
		theSection2_1->setDbTag(sectDbTag2_1);
		res += theSection2_1->recvSelf(commitTag, theChannel, theBroker);
	}
	else {
		int sectClassTag2_1 = idSections(4);
		int sectDbTag2_1 = idSections(5);
		if (theSection2_1->getClassTag() != sectClassTag2_1) {
			delete theSection2_1;
			theSection2_1 = theBroker.getNewSection(sectClassTag2_1);
			if (theSection2_1 == 0) {
				opserr << "StringPanelLin::recvSelf() - Broker could not create a section of class type " << sectClassTag2_1 << endln;
				return -1;
			}
		}
		theSection2_1->setDbTag(sectDbTag2_1);
		res += theSection2_1->recvSelf(commitTag, theChannel, theBroker);
	}

	// Section 2_2
	if (theSection2_2 == 0) {
		int sectClassTag2_2 = idSections(6);
		int sectDbTag2_2 = idSections(7);
		theSection2_2 = theBroker.getNewSection(sectClassTag2_2);
		if (theSection2_2 == 0) {
			opserr << "StringPanelLin::recvSelf() - Broker could not create a section of class type " << sectClassTag2_2 << endln;
			return -1;
		}
		theSection2_2->setDbTag(sectDbTag2_2);
		res += theSection2_2->recvSelf(commitTag, theChannel, theBroker);
	}
	else {
		int sectClassTag2_2 = idSections(6);
		int sectDbTag2_2 = idSections(7);
		if (theSection2_2->getClassTag() != sectClassTag2_2) {
			delete theSection2_2;
			theSection2_2 = theBroker.getNewSection(sectClassTag2_2);
			if (theSection2_2 == 0) {
				opserr << "StringPanelLin::recvSelf() - Broker could not create a section of class type " << sectClassTag2_2 << endln;
				return -1;
			}
		}
		theSection2_2->setDbTag(sectDbTag2_2);
		res += theSection2_2->recvSelf(commitTag, theChannel, theBroker);
	}

	// Section 3_1
	if (theSection3_1 == 0) {
		int sectClassTag3_1 = idSections(8);
		int sectDbTag3_1 = idSections(9);
		theSection3_1 = theBroker.getNewSection(sectClassTag3_1);
		if (theSection3_1 == 0) {
			opserr << "StringPanelLin::recvSelf() - Broker could not create a section of class type " << sectClassTag3_1 << endln;
			return -1;
		}
		theSection3_1->setDbTag(sectDbTag3_1);
		res += theSection3_1->recvSelf(commitTag, theChannel, theBroker);
	}
	else {
		int sectClassTag3_1 = idSections(8);
		int sectDbTag3_1 = idSections(9);
		if (theSection3_1->getClassTag() != sectClassTag3_1) {
			delete theSection3_1;
			theSection3_1 = theBroker.getNewSection(sectClassTag3_1);
			if (theSection3_1 == 0) {
				opserr << "StringPanelLin::recvSelf() - Broker could not create a section of class type " << sectClassTag3_1 << endln;
				return -1;
			}
		}
		theSection3_1->setDbTag(sectDbTag3_1);
		res += theSection3_1->recvSelf(commitTag, theChannel, theBroker);
	}

	// Section 3_2
	if (theSection3_2 == 0) {
		int sectClassTag3_2 = idSections(10);
		int sectDbTag3_2 = idSections(11);
		theSection3_2 = theBroker.getNewSection(sectClassTag3_2);
		if (theSection3_2 == 0) {
			opserr << "StringPanelLin::recvSelf() - Broker could not create a section of class type " << sectClassTag3_2 << endln;
			return -1;
		}
		theSection3_2->setDbTag(sectDbTag3_2);
		res += theSection3_2->recvSelf(commitTag, theChannel, theBroker);
	}
	else {
		int sectClassTag3_2 = idSections(10);
		int sectDbTag3_2 = idSections(11);
		if (theSection3_2->getClassTag() != sectClassTag3_2) {
			delete theSection3_2;
			theSection3_2 = theBroker.getNewSection(sectClassTag3_2);
			if (theSection3_2 == 0) {
				opserr << "StringPanelLin::recvSelf() - Broker could not create a section of class type " << sectClassTag3_2 << endln;
				return -1;
			}
		}
		theSection3_2->setDbTag(sectDbTag3_2);
		res += theSection3_2->recvSelf(commitTag, theChannel, theBroker);
	}

	// Section 4_1
	if (theSection4_1 == 0) {
		int sectClassTag4_1 = idSections(12);
		int sectDbTag4_1 = idSections(13);
		theSection4_1 = theBroker.getNewSection(sectClassTag4_1);
		if (theSection4_1 == 0) {
			opserr << "StringPanelLin::recvSelf() - Broker could not create a section of class type " << sectClassTag4_1 << endln;
			return -1;
		}
		theSection4_1->setDbTag(sectDbTag4_1);
		res += theSection4_1->recvSelf(commitTag, theChannel, theBroker);
	}
	else {
		int sectClassTag4_1 = idSections(12);
		int sectDbTag4_1 = idSections(13);
		if (theSection4_1->getClassTag() != sectClassTag4_1) {
			delete theSection4_1;
			theSection4_1 = theBroker.getNewSection(sectClassTag4_1);
			if (theSection4_1 == 0) {
				opserr << "StringPanelLin::recvSelf() - Broker could not create a section of class type " << sectClassTag4_1 << endln;
				return -1;
			}
		}
		theSection4_1->setDbTag(sectDbTag4_1);
		res += theSection4_1->recvSelf(commitTag, theChannel, theBroker);
	}

	// Section 4_2
	if (theSection4_2 == 0) {
		int sectClassTag4_2 = idSections(14);
		int sectDbTag4_2 = idSections(15);
		theSection4_2 = theBroker.getNewSection(sectClassTag4_2);
		if (theSection4_2 == 0) {
			opserr << "StringPanelLin::recvSelf() - Broker could not create a section of class type " << sectClassTag4_2 << endln;
			return -1;
		}
		theSection4_2->setDbTag(sectDbTag4_2);
		res += theSection4_2->recvSelf(commitTag, theChannel, theBroker);
	}
	else {
		int sectClassTag4_2 = idSections(14);
		int sectDbTag4_2 = idSections(15);
		if (theSection4_2->getClassTag() != sectClassTag4_2) {
			delete theSection4_2;
			theSection4_2 = theBroker.getNewSection(sectClassTag4_2);
			if (theSection4_2 == 0) {
				opserr << "StringPanelLin::recvSelf() - Broker could not create a section of class type " << sectClassTag4_2 << endln;
				return -1;
			}
		}
		theSection4_2->setDbTag(sectDbTag4_2);
		res += theSection4_2->recvSelf(commitTag, theChannel, theBroker);
	}

	// check
	if (res < 0) {
		opserr << "WARNING StringPanelLin::recvSelf() - a section failed to recv itself\n";
		return res;
	}

	// Data ID
	static ID idData(7);
	res += theChannel.recvID(dataTag, commitTag, idData);
	if (res < 0) {
		opserr << "WARNING StringPanelLin::recvSelf() - failed to receive idData\n";
		return res;
	}

	this->setTag((int)idData(0));
	dimension = (int)idData(1);
	numDOF = (int)idData(2);

	for (int i = 0; i < 4; i++)
		connectedExternalNodes(i) = (int)idData(i + 3);

	// Initial displacement ID
	int temp = dimension * 4;
	static Vector initialDispID(temp);
	res += theChannel.recvVector(dataTag, commitTag, initialDispID);
	if (res < 0) {
		opserr << "WARNING StringPanelLin::recvSelf() - failed to receive initialDispID\n";
		return res;
	}

	if (dimension == 2)
		for (int j = 0; j < 4; j++) {
			initialDisp[j * 2] = initialDispID(j * 2);
			initialDisp[j * 2 + 1] = initialDispID(j * 2 + 1);
		}
	else if (dimension == 3)
		for (int j = 0; j < 4; j++) {
			initialDisp[j * 2] = initialDispID(j * 2);
			initialDisp[j * 2 + 1] = initialDispID(j * 2 + 1);
			initialDisp[j * 2 + 2] = initialDispID(j * 2 + 2);
		}

	return res;
}

// Currently, no forces are printed out. Modify when everything is working.
void StringPanelLin::Print(OPS_Stream& s, int flag)
{
	if (flag == OPS_PRINT_CURRENTSTATE) {
		s << "\nStringPanelLin, element id:  " << this->getTag() << endln;
		s << "\tCorner node 1:  " << connectedExternalNodes(0);
		s << "\tCorner node 2:  " << connectedExternalNodes(1);
		s << "\tCorner node 3:  " << connectedExternalNodes(2);
		s << "\tCorner node 4:  " << connectedExternalNodes(3);
		s << "\tSection 1:  " << theSection1_1->getTag();
		s << "\tSection 2:  " << theSection2_1->getTag();
		s << "\tSection 3:  " << theSection3_1->getTag();
		s << "\tSection 4:  " << theSection4_1->getTag();
		// s << "\tmass density:  " << rho << endln;
	}

	if (flag == OPS_PRINT_PRINTMODEL_JSON) {
		s << "\t\t\t{";
		s << "\"name\": " << this->getTag() << ", ";
		s << "\"type\": \"StringPanelLin\", ";
		s << "\"nodes\": [" << connectedExternalNodes(0) << ", ";
		s << connectedExternalNodes(1) << ", ";
		s << connectedExternalNodes(2) << ", ";
		s << connectedExternalNodes(3) << "], ";
		s << "\"Sections \": " << theSection1_1->getTag() << ", ";
		s << theSection2_1->getTag() << ", ";
		s << theSection3_1->getTag() << ", ";
		s << theSection4_1->getTag() << "\"}";
		s << "\"massperarea\": " << rho << ". \n";
	}
}

// Currently, no display mode for forces
int StringPanelLin::displaySelf(Renderer& theViewer, int displayMode, float fact, const char** modes, int numMode)
{
	static Vector v1(3);
	static Vector v2(3);
	static Vector v3(3);
	static Vector v4(3);

	if (displayMode >= 0) {

		theNodes[0]->getDisplayCrds(v1, fact);
		theNodes[1]->getDisplayCrds(v2, fact);
		theNodes[2]->getDisplayCrds(v3, fact);
		theNodes[3]->getDisplayCrds(v4, fact);

	}
	else {

		theNodes[0]->getDisplayCrds(v1, 0.);
		theNodes[1]->getDisplayCrds(v2, 0.);
		theNodes[2]->getDisplayCrds(v3, 0.);
		theNodes[3]->getDisplayCrds(v4, 0.);

		// add eigenvector values
		int mode = displayMode * -1;
		const Matrix& eigen1 = theNodes[0]->getEigenvectors();
		const Matrix& eigen2 = theNodes[1]->getEigenvectors();
		const Matrix& eigen3 = theNodes[2]->getEigenvectors();
		const Matrix& eigen4 = theNodes[3]->getEigenvectors();

		if (eigen1.noCols() >= mode) {
			for (int i = 0; i < 3; i++) {
				v1(i) += eigen1(i, mode - 1) * fact;
				v2(i) += eigen2(i, mode - 1) * fact;
				v3(i) += eigen3(i, mode - 1) * fact;
				v4(i) += eigen4(i, mode - 1) * fact;
			}
		}
	}

	static Matrix coords(4, 3);
	static Vector values(4);

	for (int i = 0; i < 3; i++) {
		coords(0, i) = v1(i);
		coords(1, i) = v2(i);
		coords(2, i) = v3(i);
		coords(3, i) = v4(i);
	}

	for (int i = 0; i < 4; i++)
		values(i) = 0.0;

	int error = 0;

	error += theViewer.drawPolygon(coords, values);

	return error;
}

Response* StringPanelLin::setResponse(const char** argv, int argc, OPS_Stream& output)
{
	Response* theResponse = 0;

	output.tag("ElementOutput");
	output.attr("eleType", "StringPanelLin");
	output.attr("eleTag", this->getTag());
	output.attr("cornerNode1", connectedExternalNodes[0]);
	output.attr("cornerNode2", connectedExternalNodes[1]);
	output.attr("cornerNode3", connectedExternalNodes[2]);
	output.attr("cornerNode4", connectedExternalNodes[3]);

	// compare argv[0] for known response types

	// global force
	if ((strcmp(argv[0], "forces") == 0) || (strcmp(argv[0], "force") == 0) || (strcmp(argv[0], "globalForce") == 0) || (strcmp(argv[0], "globalForces") == 0)) {
		char outputData[10];
		int numDOFperNode = numDOF / 4;
		for (int i = 0; i < 4; i++) {
			for (int j = 0; j < numDOFperNode; j++)
			{
				sprintf(outputData, "P%d_%d", i + 1, j + 1);
				output.tag("ResponseType", outputData);
			}
		}
		theResponse = new ElementResponse(this, 1, Vector(numDOF));
	}
	// local force (axial forces in stringers) only
	else if ((strcmp(argv[0], "localForce") == 0) || (strcmp(argv[0], "localForces") == 0) || (strcmp(argv[0], "axialForce") == 0) || (strcmp(argv[0], "axialForces") == 0)) {
		theResponse = new ElementResponse(this, 2, Vector(12));
	}
	// shear flow
	else if (strcmp(argv[0], "shearFlow") == 0) {
		output.tag("ResponseType", "q");
		theResponse = new ElementResponse(this, 3, Vector(1));
	}
	// initial stiffness in local coordinates
	else if (strcmp(argv[0], "stiffness") == 0) {
		output.tag("ResponseType", "K");
		theResponse = new ElementResponse(this, 4, Matrix(12, 12));
	}
	// global force including inertial terms
	else if ((strcmp(argv[0], "inertialForce") == 0) || (strcmp(argv[0], "inertiaForce") == 0)) {
		char outputData[10];
		int numDOFperNode = numDOF / 4;
		for (int i = 0; i < 4; i++) {
			for (int j = 0; j < numDOFperNode; j++)
			{
				sprintf(outputData, "P%d_%d", i + 1, j + 1);
				output.tag("ResponseType", outputData);
			}
		}
		theResponse = new ElementResponse(this, 5, Vector(numDOF));
	}

	output.endTag();
	return theResponse;
}

int StringPanelLin::getResponse(int responseID, Information& eleInfo)
{

	switch (responseID) {
	case 1:	// global force
		return eleInfo.setVector(this->getResistingForce());

	case 2: // local force
	{	
		static Vector localF(12);

		// Getting the elastic forces in local coordinates only
		localF = getLocalForce();

		// Changing the sign to match general sign convention in output
		for (int i = 6; i < 12; i++)
			localF(i) *= -1.;

		return eleInfo.setVector(localF);
	}
	case 3: // shear flow
	{
		static Vector localForce(12);

		static Vector qFlow(1);	// Shear flow
		double pForces[4];		// Panel forces

		localForce = getLocalForce();

		pForces[0] = localForce(1);
		pForces[1] = localForce(4);
		pForces[2] = localForce(7);
		pForces[3] = localForce(10);

		qFlow(0) = -pForces[0] / L[0];
		qFlow(0) += pForces[1] / L[1];
		qFlow(0) += -pForces[2] / L[2];
		qFlow(0) += pForces[3] / L[3];
		qFlow(0) /= 4;

		qFlow(0) *= -1;

		return eleInfo.setVector(qFlow);
	}
	case 4: // Initial stiffness Matrix
	{
		static Matrix globalK(numDOF, numDOF);
		globalK.Zero();

		globalK = getInitialStiff();

		return eleInfo.setMatrix(globalK);
	}
	case 5: // global force including inertial terms
		return eleInfo.setVector(this->getResistingForceIncInertia());

	default:
		return -1;
	}
}

// Compute the strain at two integration points
Vector StringPanelLin::computeCurrentStrain()
{
	// CURRENTLY HAS TWO INTEGRATION POINTS, EACH INTEGRATION POINT DEFINES THE
	// GENERALIZED STRAINS e1 AND e2 IN HOOGENBOOM'S FORMULATION AND DETERMINES
	// THE STIFFNESS MATRIX AND FORCES WITH THOSE TWO. THE GENERALIZED STRAINS
	// e1 AND e2 ARE COMPUTED CONSIDERING HALF THE LENGTH.

	// determine the strain
	// Vertices (counterclockwise)
	const Vector& disp1 = theNodes[0]->getTrialDisp();
	const Vector& disp2 = theNodes[1]->getTrialDisp();
	const Vector& disp3 = theNodes[2]->getTrialDisp();
	const Vector& disp4 = theNodes[3]->getTrialDisp();

	static Vector dL_overL(8);

	// Assemble displacements and transform in local coordinates
	static Vector Un(numDOF);
	static Matrix T(8, numDOF);
	static Vector UnLocal(8);

	Un.Zero();

	if (numDOF == 8) {
		// dim = 2, dof = 2
		Un(0) = disp1(0);
		Un(1) = disp1(1);

		Un(2) = disp2(0);
		Un(3) = disp2(1);

		Un(4) = disp3(0);
		Un(5) = disp3(1);

		Un(6) = disp4(0);
		Un(7) = disp4(1);

		if (initialDisp != 0) {
			for (int i = 0; i < 4; i++) {
				Un(i * 2) -= initialDisp[i * 2];
				Un(i * 2 + 1) -= initialDisp[i * 2 + 1];
			}
		}
	}

	else if (numDOF == 12) {
		// dim = 2, dof = 3
		Un(0) = disp1(0);
		Un(1) = disp1(1);

		Un(3) = disp2(0);
		Un(4) = disp2(1);

		Un(6) = disp3(0);
		Un(7) = disp3(1);

		Un(9) = disp4(0);
		Un(10) = disp4(1);

		if (initialDisp != 0) {
			for (int i = 0; i < 4; i++) {
				Un(i * 3) -= initialDisp[i * 2];
				Un(i * 3 + 1) -= initialDisp[i * 2 + 1];
			}
		}
	}

	else {
		// dim = 3, dof = 6
		Un(0) = disp1(0);
		Un(1) = disp1(1);
		Un(2) = disp1(2);

		Un(6) = disp2(0);
		Un(7) = disp2(1);
		Un(8) = disp2(2);

		Un(12) = disp3(0);
		Un(13) = disp3(1);
		Un(14) = disp3(2);

		Un(18) = disp4(0);
		Un(19) = disp4(1);
		Un(20) = disp4(2);

		if (initialDisp != 0) {
			for (int i = 0; i < 4; i++) {
				Un(i * 6) -= initialDisp[i * 2];
				Un(i * 6 + 1) -= initialDisp[i * 2 + 1];
				Un(i * 6 + 2) -= initialDisp[i * 3 + 1];
			}
		}
	}

	// Transform into local coordinates
	T = transformMatrix();

	UnLocal.addMatrixVector(0.0, T, Un, 1.0);

	// Get midpoint displacements in local coordinates
	static Vector Uo(4);
	Uo = getMidDisp(UnLocal);

	for (int i = 0; i < 4; i++) {
		 //dL_overL(i * 2) = Uo(i) - UnLocal(i * 2);
		 //dL_overL(i * 2 + 1) = UnLocal(i * 2 + 1) - Uo(i);

		// Added for r1.07
		dL_overL(i * 2) = -4 * UnLocal(i * 2) + 6 * Uo(i) - 2 * UnLocal(i * 2 + 1);
		dL_overL(i * 2 + 1) = 2 * UnLocal(i * 2) - 6 * Uo(i) + 4 * UnLocal(i * 2 + 1);

		dL_overL(i * 2) /= L[i];
		dL_overL(i * 2 + 1) /= L[i];


		// VERIFY
		 //dL_overL(i * 2) /= (L[i] / 2);
		 //dL_overL(i * 2 + 1) /= (L[i] / 2);
		//dL_overL(i * 2) /= L[i];
		//dL_overL(i * 2 + 1) /= L[i];
	}

	return dL_overL;
}

// Get Panel stiffness matrix in local coordinates
const Matrix& StringPanelLin::getPanelStiff(void)
{
	double B[4];	// Panel B matrix

	// Get nodes coordinates
	const Vector& end1Crd = theNodes[0]->getCrds();
	const Vector& end2Crd = theNodes[1]->getCrds();
	const Vector& end3Crd = theNodes[2]->getCrds();
	const Vector& end4Crd = theNodes[3]->getCrds();

	double xl[4] = { 0 };
	double yl[4] = { 0 };

	static Matrix PanelK(4, 4);
	PanelK.Zero();

	// Define local coordinate reference plane, only necessary in 3d space
	if (dimension == 3) {

		double a[3];
		double b[3];
		double xp[3];
		double yp[3];
		double n = 0.0;
		double d = 0.0;
		double lambda = 0.0;
		double temp = 0.0;

		// Procedure from Hoogenboom thesis Appendix 4
		for (int i = 0; i < 3; i++) {
			a[i] = end2Crd(i) + end3Crd(i) - end1Crd(i) - end4Crd(i);
			b[i] = end3Crd(i) + end4Crd(i) - end1Crd(i) - end2Crd(i);
			a[i] *= 0.5;
			b[i] *= 0.5;
			n += a[i] * a[i] + b[i] * b[i];
			d += 2 * a[i] * b[i];
		}
		if (d < 0.0)
			temp = -1. * d;
		else temp = d;
		if (temp > n * 0.0000001) {
			double t = n / d;
			if (fabs(t) < 1.) {
				opserr << "StringPanelLin::getPanelStiff ERROR: Panel in StringPanel " << this->getTag() <<
					" reference system cannot be established\n";
				exit(-1);
				return PanelK;
			}
			else if (t > 1.)
				lambda = -1. * t + sqrt(t * t - 1.);
			else
				lambda = -1. * t - sqrt(t * t - 1.);
		}
		else
			lambda = 0.0;

		for (int i = 0; i < 3; i++) {
			xp[i] = a[i] + lambda * b[i];
			yp[i] = b[i] + lambda * a[i];
		}

		double lx = sqrt(xp[0] * xp[0] + xp[1] * xp[1] + xp[2] * xp[2]);
		double ly = sqrt(yp[0] * yp[0] + yp[1] * yp[1] + yp[2] * yp[2]);

		if (lx <= 0.0 || ly <= 0.0) {
			opserr << "StringPanelLin::getPanelStiff ERROR: Local x or y axis has no length in String Panel " <<
				this->getTag() << "\n";
			exit(-1);
			return PanelK;
		}

		// Transformation matrix
		static Matrix T(3, 3);
		for (int i = 0; i < 3; i++) {
			T(0, i) = xp[i] / lx;
			T(1, i) = yp[i] / ly;
			T(2, i) = 0.0;
		}

		// Vector of mid global coordinates
		double mid[3];
		for (int i = 0; i < 3; i++) {
			mid[i] = (end1Crd(i) + end2Crd(i) + end3Crd(i) + end4Crd(i)) / 4.;
		}

		// Local coordinate computation
		double zl[4];

		xl[0] = end1Crd(0) - mid[0];
		xl[1] = end2Crd(0) - mid[0];
		xl[2] = end3Crd(0) - mid[0];
		xl[3] = end4Crd(0) - mid[0];

		yl[0] = end1Crd(1) - mid[1];
		yl[1] = end2Crd(1) - mid[1];
		yl[2] = end3Crd(1) - mid[1];
		yl[3] = end4Crd(1) - mid[1];

		zl[0] = end1Crd(2) - mid[2];
		zl[1] = end2Crd(2) - mid[2];
		zl[2] = end3Crd(2) - mid[2];
		zl[3] = end4Crd(2) - mid[2];

		// Compute local coordinates using the transformation matrix T, zl are all 0's
		for (int j = 0; j < 4; j++) {
			xl[j] = T(0, 0) * xl[j] + T(0, 1) * yl[j] + T(0, 2) * zl[j];
			yl[j] = T(1, 0) * xl[j] + T(1, 1) * yl[j] + T(1, 2) * zl[j];
		}
	} else if (dimension == 2) {

		xl[0] = end1Crd(0);
		xl[1] = end2Crd(0);
		xl[2] = end3Crd(0);
		xl[3] = end4Crd(0);

		yl[0] = end1Crd(1);
		yl[1] = end2Crd(1);
		yl[2] = end3Crd(1);
		yl[3] = end4Crd(1);
	}

	////// B matrix computation
	// Create director cosines. Hoogenboom & Blaauwendraad 2000 (see Reference)
	double c[4];
	double s[4];
	double r[4];
	double l[4];		// Use for debugging purposes, come back and delete later
	double km[4];		// Vector with minors


	c[0] = xl[1] - xl[0];
	c[1] = xl[2] - xl[1];
	c[2] = xl[3] - xl[2];
	c[3] = xl[0] - xl[3];

	s[0] = yl[1] - yl[0];
	s[1] = yl[2] - yl[1];
	s[2] = yl[3] - yl[2];
	s[3] = yl[0] - yl[3];

	r[0] = xl[0] * yl[1] - xl[1] * yl[0];
	r[1] = xl[1] * yl[2] - xl[2] * yl[1];
	r[2] = xl[2] * yl[3] - xl[3] * yl[2];
	r[3] = xl[3] * yl[0] - xl[0] * yl[3];

	double A = 0.5 * (r[0] + r[1] + r[2] + r[3]);

	for (int i = 0; i < 4; i++) {
		l[i] = sqrt(c[i] * c[i] + s[i] * s[i]);	// For debugging purposes, come back and delete whole loop later
		if (l[i] != L[i]) {
			opserr << "StringPanelLin::getPanelStiff WARNING: length local " << l[i] << " in panel " <<
				this->getTag() << " is not the same as length L " << L[i] << " original\n";
			exit(-1);
			return PanelK;
		}
	}

	km[0] = c[1] * (s[2] * r[3] - s[3] * r[2]) - s[1] * (c[2] * r[3] - c[3] * r[2]) + r[1] * (c[2] * s[3] - c[3] * s[2]);
	km[1] = c[0] * (s[2] * r[3] - s[3] * r[2]) - s[0] * (c[2] * r[3] - c[3] * r[2]) + r[0] * (c[2] * s[3] - c[3] * s[2]);
	km[2] = c[0] * (s[1] * r[3] - s[3] * r[1]) - s[0] * (c[1] * r[3] - c[3] * r[1]) + r[0] * (c[1] * s[3] - c[3] * s[1]);
	km[3] = c[0] * (s[1] * r[2] - s[2] * r[1]) - s[0] * (c[1] * r[2] - c[2] * r[1]) + r[0] * (c[1] * s[2] - c[2] * s[1]);

	double ksum = km[0] + km[1] + km[2] + km[3];

	for (int i = 0; i < 4; i++)
		B[i] = 4.0 * km[i] * L[i] / ksum;
	B[0] *= -1.0;
	B[2] *= -1.0;

	////// Compute constitutive factor D
	double xi[4];		// Natural coordinates
	double eta[4];		// Natural coordinates
	double wi = 0.25;	// Integration point weights
	double J[4];		// Jacobian
	double Gs[4];
	double cot[4];

	double G = E_p / (2 * (1 + nu));

	xi[0] = 0.5;
	xi[1] = 1.0;
	xi[2] = 0.5;
	xi[3] = 0.0;

	eta[0] = 0.0;
	eta[1] = 0.5;
	eta[2] = 1.0;
	eta[3] = 0.5;

	for (int i = 0; i < 4; i++) {
		cot[i] = (eta[i] * c[2] + (eta[i] - 1) * c[0]) * (xi[i] * c[1] + (xi[i] - 1) * c[3]) + (eta[i] * s[2] + (eta[i] - 1) * s[0]) * (xi[i] * s[1] + (xi[i] - 1) * s[3]);
		cot[i] /= (eta[i] * s[2] + (eta[i] - 1) * s[0]) * (xi[i] * c[1] + (xi[i] - 1) * c[3]) - (eta[i] * c[2] + (eta[i] - 1) * c[0]) * (xi[i] * s[1] + (xi[i] - 1) * s[3]);
		J[i] = A + (0.5 - xi[i]) * (c[0] * s[2] - c[2] * s[0]) + (0.5 - eta[i]) * (c[1] * s[3] - c[3] * s[1]);
		Gs[i] = 1 / G + 4. * cot[i] * cot[i] / E_p;
		Gs[i] = 1 / Gs[i];
	}

	double e = 16 / (thickness * ksum * ksum);		// Generalized strain
	double e_sum = 0;


	for (int i = 0; i < 4; i++)
		e_sum += km[i] * km[i] * wi * J[i] / Gs[i];

	e *= e_sum;

	double D = 1. / e;

	for (int i = 0; i < 4; i++) {
		for (int j = 0; j < 4; j++) {
			PanelK(i, j) = B[i] * D * B[j];
		}
	}

	return PanelK;
}

// Transform StringPanel stiffness matrix into global coordinates and assemble
const Matrix& StringPanelLin::assembleK(const Matrix& kStringer1,
	const Matrix& kStringer2, const Matrix& kStringer3, const Matrix& kStringer4)
{
	// Inputs are the 4 stringers stiffness matrix counterclockwise

	static Matrix globalK(numDOF, numDOF);	// Stiffness matrix to return in global coordinates 
	static Matrix localK(8, 8);				// Stiffness matrix in local coordinates
	
	globalK.Zero();
	localK.Zero();

	// The midpoint of the stringer has a DOF, but only parallel to the end of the stringer.
	// We cannot enforce this condition or restraint in OpenSees internally, and if the user
	// is asked to model this node and input it in the element it would lead to instabilities 
	// since it had no out of plane stiffness. The user cannot restraint this as this node is
	// free to move in any direction.

	// Thus, we apply static condensation to get the contribution from the panel and reduce the
	// number of DOF. The assumption is that no force is applied externally at the midpoint.

	// | Fn | = | Knn Kno | | Un |
	// | 0  |   | Kon Koo | | Uo |

	// Panel stiffness matrix local
	static Matrix kStringPan(4, 4);

	kStringPan = getPanelStiff();

	// Static condensation matrices
	static Matrix knn(8, 8);
	static Matrix kno(8, 4);
	static Matrix kon(4, 8);
	static Matrix koo(4, 4);

	knn.Zero();
	kno.Zero();
	kon.Zero();
	koo.Zero();

	// Assemble sub-matrices
	knn(0, 0) += kStringer1(0, 0);	knn(1, 0) += kStringer1(2, 0);	knn(0, 1) += kStringer1(0, 2);	knn(1, 1) += kStringer1(2, 2);
	knn(2, 2) += kStringer2(0, 0);	knn(3, 2) += kStringer2(2, 0);	knn(2, 3) += kStringer2(0, 2);	knn(3, 3) += kStringer2(2, 2);
	knn(4, 4) += kStringer3(0, 0);	knn(5, 4) += kStringer3(2, 0);	knn(4, 5) += kStringer3(0, 2);	knn(5, 5) += kStringer3(2, 2);
	knn(6, 6) += kStringer4(0, 0);	knn(7, 6) += kStringer4(2, 0);	knn(6, 7) += kStringer4(0, 2);	knn(7, 7) += kStringer4(2, 2);

	kno(0, 0) += kStringer1(0, 1);	kno(1, 0) += kStringer1(2, 1);
	kno(2, 1) += kStringer2(0, 1);	kno(3, 1) += kStringer2(2, 1);
	kno(4, 2) += kStringer3(0, 1);	kno(5, 2) += kStringer3(2, 1);
	kno(6, 3) += kStringer4(0, 1);	kno(7, 3) += kStringer4(2, 1);

	koo.addMatrix(0.0, kStringPan, 1.0);

	koo(0, 0) += kStringer1(1, 1);
	koo(1, 1) += kStringer2(1, 1);
	koo(2, 2) += kStringer3(1, 1);
	koo(3, 3) += kStringer4(1, 1);

	kon(0, 0) += kStringer1(1, 0);	kon(0, 1) += kStringer1(1, 2);
	kon(1, 2) += kStringer2(1, 0);	kon(1, 3) += kStringer2(1, 2);
	kon(2, 4) += kStringer3(1, 0);	kon(2, 5) += kStringer3(1, 2);
	kon(3, 6) += kStringer4(1, 0);	kon(3, 7) += kStringer4(1, 2);

	// Compute local stiffness matrix
	static Matrix koo_inv(4, 4);
	static Matrix koo_kon(4, 8);
	static Matrix knokookon(8, 8);

	koo.Invert(koo_inv);
	koo_kon.addMatrixProduct(0.0, koo_inv, kon, 1.0);
	knokookon.addMatrixProduct(0.0, kno, koo_kon, 1.0);


	localK.addMatrix(1.0, knn, 1.0);
	localK.addMatrix(1.0, knokookon, -1.0);

	// Obtaining stiffness matrix in global coordinates depending on the dimension of the domain
	
	static Matrix T(8, numDOF);
	T = transformMatrix();

	globalK.addMatrixTripleProduct(0.0, T, localK, 1.0);

	return globalK;
}

// Get coordinate transformation matrix
const Matrix& StringPanelLin::transformMatrix(void) {
	// Transformation matrix
	static Matrix T(8, numDOF);
	T.Zero();

	if (numDOF == 8) {
		// dimension = 2, dof = 2;
		// Direction cosines
		double cosX[4];
		double cosY[4];

		for (int i = 0; i < 4; i++) {
			cosX[i] = dx[i] / L[i];
			cosY[i] = dy[i] / L[i];
		}

		T(0, 0) = cosX[0];		T(0, 1) = cosY[0];
		T(1, 2) = cosX[0];		T(1, 3) = cosY[0];

		T(2, 2) = cosX[1];		T(2, 3) = cosY[1];
		T(3, 4) = cosX[1];		T(3, 5) = cosY[1];

		T(4, 4) = cosX[2];		T(4, 5) = cosY[2];
		T(5, 6) = cosX[2];		T(5, 7) = cosY[2];

		T(6, 6) = cosX[3];		T(6, 7) = cosY[3];
		T(7, 0) = cosX[3];		T(7, 1) = cosY[3];
	}

	else if (numDOF == 12) {
		// dimension = 2, dof = 3;
		// Direction cosines
		double cosX[4];
		double cosY[4];

		for (int i = 0; i < 4; i++) {
			cosX[i] = dx[i] / L[i];
			cosY[i] = dy[i] / L[i];
		}

		T(0, 0) = cosX[0];		T(0, 1) = cosY[0];
		T(1, 3) = cosX[0];		T(1, 4) = cosY[0];

		T(2, 3) = cosX[1];		T(2, 4) = cosY[1];
		T(3, 6) = cosX[1];		T(3, 7) = cosY[1];

		T(4, 6) = cosX[2];		T(4, 7) = cosY[2];
		T(5, 9) = cosX[2];		T(5, 10) = cosY[2];

		T(6, 9) = cosX[3];		T(6, 10) = cosY[3];
		T(7, 0) = cosX[3];		T(7, 1) = cosY[3];
	}

	else {
		// numDOF = 24
		// dimension = 3, dof = 6;
		// Direction cosines
		double cosX[4];
		double cosY[4];
		double cosZ[4];

		for (int i = 0; i < 4; i++) {
			cosX[i] = dx[i] / L[i];
			cosY[i] = dy[i] / L[i];
			cosZ[i] = dz[i] / L[i];
		}

		T(0, 0) = cosX[0];		T(0, 1) = cosY[0];		T(0, 2) = cosZ[0];
		T(1, 6) = cosX[0];		T(1, 7) = cosY[0];		T(1, 8) = cosZ[0];

		T(2, 6) = cosX[1];		T(2, 7) = cosY[1];		T(2, 8) = cosZ[1];
		T(3, 12) = cosX[1];		T(3, 13) = cosY[1];		T(3, 14) = cosZ[1];

		T(4, 12) = cosX[2];		T(4, 13) = cosY[2];		T(4, 14) = cosZ[2];
		T(5, 18) = cosX[2];		T(5, 19) = cosY[2];		T(5, 20) = cosZ[2];

		T(6, 18) = cosX[3];		T(6, 19) = cosY[3];		T(6, 20) = cosZ[3];
		T(7, 0) = cosX[3];		T(7, 1) = cosY[3];		T(7, 2) = cosZ[3];
	}

	return T;
}

// Get force vector in local coordinates
const Vector& StringPanelLin::getLocalForce(void) {
	// Kinematic and equilibrium B matrix
	// B = [-1  1 0;
	//		 0 -1 1];
	// The stress resultants at each integration point will be N1 and N2 (see references)
	// When multiplying by the transpose of the B matrix we obtain the resultants at the DOF

	// Vectors of forces for each stringer in local coordinates
	static Vector f1(3);
	static Vector f2(3);
	static Vector f3(3);
	static Vector f4(3);
	f1.Zero();
	f2.Zero();
	f3.Zero();
	f4.Zero();

	// Obtain the total force from the stress resultant from each stringer
	double f[8];

	// Stringer 1
	f[0] = 0.0;
	f[1] = 0.0;
	int order1 = theSection1_1->getOrder();
	const ID& code1 = theSection1_1->getType();
	const Vector& s1_1 = theSection1_1->getStressResultant();
	const Vector& s1_2 = theSection1_2->getStressResultant();
	for (int j = 0; j < order1; j++) {
		if (code1(j) == SECTION_RESPONSE_P) {
			f[0] += s1_1(j);
			f[1] += s1_2(j);
		}
	}

	// Stringer 2
	f[2] = 0.0;
	f[3] = 0.0;
	int order2 = theSection2_1->getOrder();
	const ID& code2 = theSection2_1->getType();
	const Vector& s2_1 = theSection2_1->getStressResultant();
	const Vector& s2_2 = theSection2_2->getStressResultant();
	for (int j = 0; j < order2; j++) {
		if (code2(j) == SECTION_RESPONSE_P) {
			f[2] += s2_1(j);
			f[3] += s2_2(j);
		}
	}

	// Stringer 3
	f[4] = 0.0;
	f[5] = 0.0;
	int order3 = theSection3_1->getOrder();
	const ID& code3 = theSection3_1->getType();
	const Vector& s3_1 = theSection3_1->getStressResultant();
	const Vector& s3_2 = theSection3_2->getStressResultant();
	for (int j = 0; j < order3; j++) {
		if (code3(j) == SECTION_RESPONSE_P) {
			f[4] += s3_1(j);
			f[5] += s3_2(j);
		}
	}

	// Stringer 4
	f[6] = 0.0;
	f[7] = 0.0;
	int order4 = theSection4_1->getOrder();
	const ID& code4 = theSection4_1->getType();
	const Vector& s4_1 = theSection4_1->getStressResultant();
	const Vector& s4_2 = theSection4_2->getStressResultant();
	for (int j = 0; j < order4; j++) {
		if (code4(j) == SECTION_RESPONSE_P) {
			f[6] += s4_1(j);
			f[7] += s4_2(j);
		}
	}

	//for (int i = 0; i < 8; i++)
	//	opserr << "Force vector [" << i << "] = " << f[i] << "\n";

	//double aux[4];
	//for (int i = 0; i < 4; i++)
	//	aux[i] = f[i * 2] - f[i * 2 + 1];
	//	//aux[i] = 0;

	double N[8];
	//for (int i = 0; i < 4; i++) {
	//	N[i * 2] = f[i * 2] + aux[i];
	//	N[i * 2 + 1] = f[i * 2 + 1] - aux[i];
	//}

	// Added for r1.07
	for (int i = 0; i < 8; i++)
		N[i] = f[i];

	// Multiply transpose of B to get the force at DOF
	f1(0) = -N[0];			f2(0) = -N[2];			f3(0) = -N[4];			f4(0) = -N[6];
	f1(1) = N[0] - N[1];	f2(1) = N[2] - N[3];	f3(1) = N[4] - N[5];	f4(1) = N[6] - N[7];
	f1(2) = N[1];			f2(2) = N[3];			f3(2) = N[5];			f4(2) = N[7];

	static Vector fStringers(12);
	fStringers.Zero();

	for (int i = 0; i < 3; i++) {
		fStringers(i) = f1(i);
		fStringers(i + 3) = f2(i);
		fStringers(i + 6) = f3(i);
		fStringers(i + 9) = f4(i);
	}

	return fStringers;
}

// Get displacement at midpoints
const Vector& StringPanelLin::getMidDisp(const Vector& Un) {

	// Stringers stiffness matrix
	static Matrix k1(3, 3);
	static Matrix k2(3, 3);
	static Matrix k3(3, 3);
	static Matrix k4(3, 3);

	k1(0, 0) = 4.0;
	k1(0, 1) = -6.0;
	k1(0, 2) = 2.0;
	k1(1, 0) = -6.0;
	k1(1, 1) = 12.0;
	k1(1, 2) = -6.0;
	k1(2, 0) = 2.0;
	k1(2, 1) = -6.0;
	k1(2, 2) = 4.0;

	k2 = k1;
	k3 = k1;
	k4 = k1;

	if (flagInitial == 0) {

		double AEoverL[4];

		// Stringer 1
		AEoverL[0] = 0.0;
		int order1 = theSection1_1->getOrder();
		const ID& code1 = theSection1_1->getType();
		const Matrix& k_1 = theSection1_1->getInitialTangent();
		for (int j = 0; j < order1; j++) {
			if (code1(j) == SECTION_RESPONSE_P)
				AEoverL[0] += k_1(j, j);
		}
		AEoverL[0] /= L[0];

		// Stringer 2
		AEoverL[1] = 0.0;
		int order2 = theSection2_1->getOrder();
		const ID& code2 = theSection2_1->getType();
		const Matrix& k_2 = theSection2_1->getInitialTangent();
		for (int j = 0; j < order2; j++) {
			if (code2(j) == SECTION_RESPONSE_P)
				AEoverL[1] += k_2(j, j);
		}
		AEoverL[1] /= L[1];

		// Stringer 3
		AEoverL[2] = 0.0;
		int order3 = theSection3_1->getOrder();
		const ID& code3 = theSection3_1->getType();
		const Matrix& k_3 = theSection3_1->getInitialTangent();
		for (int j = 0; j < order3; j++) {
			if (code3(j) == SECTION_RESPONSE_P)
				AEoverL[2] += k_3(j, j);
		}
		AEoverL[2] /= L[2];

		// Stringer 4
		AEoverL[3] = 0.0;
		int order4 = theSection4_1->getOrder();
		const ID& code4 = theSection4_1->getType();
		const Matrix& k_4 = theSection4_1->getInitialTangent();
		for (int j = 0; j < order4; j++) {
			if (code4(j) == SECTION_RESPONSE_P)
				AEoverL[3] += k_4(j, j);
		}
		AEoverL[3] /= L[3];

		for (int i = 0; i < 3; i++) {
			for (int j = 0; j < 3; j++) {
				k1(i, j) *= AEoverL[0];
				k2(i, j) *= AEoverL[1];
				k3(i, j) *= AEoverL[2];
				k4(i, j) *= AEoverL[3];
			}
		}
	}

	else {

		double AEoverL[8];

		// Stringer 1
		AEoverL[0] = 0.0;
		AEoverL[1] = 0.0;
		int order1 = theSection1_1->getOrder();
		const ID& code1 = theSection1_1->getType();
		const Matrix& k1_1 = theSection1_1->getSectionTangent();
		const Matrix& k1_2 = theSection1_2->getSectionTangent();
		for (int j = 0; j < order1; j++) {
			if (code1(j) == SECTION_RESPONSE_P) {
				AEoverL[0] += k1_1(j, j);
				AEoverL[1] += k1_2(j, j);
			}
		}
		AEoverL[0] /= L[0];
		AEoverL[1] /= L[0];

		// Stringer 2
		AEoverL[2] = 0.0;
		AEoverL[3] = 0.0;
		int order2 = theSection2_1->getOrder();
		const ID& code2 = theSection2_1->getType();
		const Matrix& k2_1 = theSection2_1->getSectionTangent();
		const Matrix& k2_2 = theSection2_2->getSectionTangent();
		for (int j = 0; j < order2; j++) {
			if (code2(j) == SECTION_RESPONSE_P) {
				AEoverL[2] += k2_1(j, j);
				AEoverL[3] += k2_2(j, j);
			}
		}
		AEoverL[2] /= L[1];
		AEoverL[3] /= L[1];

		// Stringer 3
		AEoverL[4] = 0.0;
		AEoverL[5] = 0.0;
		int order3 = theSection3_1->getOrder();
		const ID& code3 = theSection3_1->getType();
		const Matrix& k3_1 = theSection3_1->getSectionTangent();
		const Matrix& k3_2 = theSection3_2->getSectionTangent();
		for (int j = 0; j < order3; j++) {
			if (code3(j) == SECTION_RESPONSE_P) {
				AEoverL[4] += k3_1(j, j);
				AEoverL[5] += k3_2(j, j);
			}
		}
		AEoverL[4] /= L[2];
		AEoverL[5] /= L[2];

		// Stringer 4
		AEoverL[6] = 0.0;
		AEoverL[7] = 0.0;
		int order4 = theSection4_1->getOrder();
		const ID& code4 = theSection4_1->getType();
		const Matrix& k4_1 = theSection4_1->getSectionTangent();
		const Matrix& k4_2 = theSection4_2->getSectionTangent();
		for (int j = 0; j < order4; j++) {
			if (code4(j) == SECTION_RESPONSE_P) {
				AEoverL[6] += k4_1(j, j);
				AEoverL[7] += k4_2(j, j);
			}
		}
		AEoverL[6] /= L[3];
		AEoverL[7] /= L[3];

		// Get stiffness matrix considering contribution of both integration points
		for (int i = 0; i < 3; i++) {
			for (int j = 0; j < 3; j++) {
				k1(i, j) *= (AEoverL[0] * 0.5 + AEoverL[1] * 0.5);
				k2(i, j) *= (AEoverL[2] * 0.5 + AEoverL[3] * 0.5);
				k3(i, j) *= (AEoverL[4] * 0.5 + AEoverL[5] * 0.5);
				k4(i, j) *= (AEoverL[6] * 0.5 + AEoverL[7] * 0.5);
			}
		}
	}

	// Panel stiffness matrix local
	static Matrix kStringPan(4, 4);

	kStringPan = getPanelStiff();

	// Static condensation matrices
	static Matrix knn(8, 8);
	static Matrix kno(8, 4);
	static Matrix kon(4, 8);
	static Matrix koo(4, 4);

	knn.Zero();
	kno.Zero();
	kon.Zero();
	koo.Zero();

	// Assemble sub-matrices
	koo.addMatrix(0.0, kStringPan, 1.0);

	koo(0, 0) += k1(1, 1);
	koo(1, 1) += k2(1, 1);
	koo(2, 2) += k3(1, 1);
	koo(3, 3) += k4(1, 1);

	kon(0, 0) += k1(1, 0);	kon(0, 1) += k1(1, 2);
	kon(1, 2) += k2(1, 0);	kon(1, 3) += k2(1, 2);
	kon(2, 4) += k3(1, 0);	kon(2, 5) += k3(1, 2);
	kon(3, 6) += k4(1, 0);	kon(3, 7) += k4(1, 2);

	static Matrix koo_inv(4, 4);
	static Matrix koo_kon(4, 8);

	koo.Invert(koo_inv);
	koo_kon.addMatrixProduct(0.0, koo_inv, kon, 1.0);

	// Compute midpoint displacements
	static Vector Uo(4);

	Uo.addMatrixVector(0.0, koo_kon, Un, -1.0);

	return Uo;
}

// Get Panel stiffness matrix in local coordinates
double StringPanelLin::getPanelArea(void)
{
	double A = 0.0;	// Panel area

	// Get nodes coordinates
	const Vector& end1Crd = theNodes[0]->getCrds();
	const Vector& end2Crd = theNodes[1]->getCrds();
	const Vector& end3Crd = theNodes[2]->getCrds();
	const Vector& end4Crd = theNodes[3]->getCrds();

	double xl[4] = { 0 };
	double yl[4] = { 0 };

	// Define local coordinate reference plane, only necessary in 3d space
	if (dimension == 3) {

		double a[3];
		double b[3];
		double xp[3];
		double yp[3];
		double n = 0.0;
		double d = 0.0;
		double lambda = 0.0;
		double temp = 0.0;

		// Procedure from Hoogenboom thesis Appendix 4
		for (int i = 0; i < 3; i++) {
			a[i] = end2Crd(i) + end3Crd(i) - end1Crd(i) - end4Crd(i);
			b[i] = end3Crd(i) + end4Crd(i) - end1Crd(i) - end2Crd(i);
			a[i] *= 0.5;
			b[i] *= 0.5;
			n += a[i] * a[i] + b[i] * b[i];
			d += 2 * a[i] * b[i];
		}
		if (d < 0.0)
			temp = -1. * d;
		else temp = d;
		if (temp > n * 0.0000001) {
			double t = n / d;
			if (fabs(t) < 1.) {
				opserr << "StringPanelLin::getPanelArea ERROR: Panel in StringPanel " << this->getTag() <<
					" reference system cannot be established\n";
				exit(-1);
				return 0.0;
			}
			else if (t > 1.)
				lambda = -1. * t + sqrt(t * t - 1.);
			else
				lambda = -1. * t - sqrt(t * t - 1.);
		}
		else
			lambda = 0.0;

		for (int i = 0; i < 3; i++) {
			xp[i] = a[i] + lambda * b[i];
			yp[i] = b[i] + lambda * a[i];
		}

		double lx = sqrt(xp[0] * xp[0] + xp[1] * xp[1] + xp[2] * xp[2]);
		double ly = sqrt(yp[0] * yp[0] + yp[1] * yp[1] + yp[2] * yp[2]);

		if (lx <= 0.0 || ly <= 0.0) {
			opserr << "StringPanelLin::getPanelArea ERROR: Local x or y axis has no length in String Panel " <<
				this->getTag() << "\n";
			exit(-1);
			return 0.0;
		}

		// Transformation matrix
		static Matrix T(3, 3);
		for (int i = 0; i < 3; i++) {
			T(0, i) = xp[i] / lx;
			T(1, i) = yp[i] / ly;
			T(2, i) = 0.0;
		}

		// Vector of mid global coordinates
		double mid[3];
		for (int i = 0; i < 3; i++) {
			mid[i] = (end1Crd(i) + end2Crd(i) + end3Crd(i) + end4Crd(i)) / 4.;
		}

		// Local coordinate computation
		double zl[4];

		xl[0] = end1Crd(0) - mid[0];
		xl[1] = end2Crd(0) - mid[0];
		xl[2] = end3Crd(0) - mid[0];
		xl[3] = end4Crd(0) - mid[0];

		yl[0] = end1Crd(1) - mid[1];
		yl[1] = end2Crd(1) - mid[1];
		yl[2] = end3Crd(1) - mid[1];
		yl[3] = end4Crd(1) - mid[1];

		zl[0] = end1Crd(2) - mid[2];
		zl[1] = end2Crd(2) - mid[2];
		zl[2] = end3Crd(2) - mid[2];
		zl[3] = end4Crd(2) - mid[2];

		// Compute local coordinates using the transformation matrix T, zl are all 0's
		for (int j = 0; j < 4; j++) {
			xl[j] = T(0, 0) * xl[j] + T(0, 1) * yl[j] + T(0, 2) * zl[j];
			yl[j] = T(1, 0) * xl[j] + T(1, 1) * yl[j] + T(1, 2) * zl[j];
		}
	}
	else if (dimension == 2) {

		xl[0] = end1Crd(0);
		xl[1] = end2Crd(0);
		xl[2] = end3Crd(0);
		xl[3] = end4Crd(0);

		yl[0] = end1Crd(1);
		yl[1] = end2Crd(1);
		yl[2] = end3Crd(1);
		yl[3] = end4Crd(1);
	}

	////// B matrix computation
	// Create director cosines. Hoogenboom & Blaauwendraad 2000 (see Reference)
	double r[4];

	r[0] = xl[0] * yl[1] - xl[1] * yl[0];
	r[1] = xl[1] * yl[2] - xl[2] * yl[1];
	r[2] = xl[2] * yl[3] - xl[3] * yl[2];
	r[3] = xl[3] * yl[0] - xl[0] * yl[3];

	A += 0.5 * (r[0] + r[1] + r[2] + r[3]);

	return A;
}