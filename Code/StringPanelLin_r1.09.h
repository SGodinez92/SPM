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
*                |$strSecTag4          $strSecTag2  |                    *
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

#ifndef StringPanelLin_h
#define StringPanelLin_h

#include <Element.h>
#include <Matrix.h>
#include <Vector.h>
#include <Node.h>
#include <Channel.h>
#include <ID.h>
#include <SectionForceDeformation.h>

class StringPanelLin : public Element
{
public: 
	// full constructor
	StringPanelLin(int tag, int dimension,
		int Nd1, int Nd2, int Nd3, int Nd4,
		SectionForceDeformation& theSect1_1,
		SectionForceDeformation& theSect1_2,
		SectionForceDeformation& theSect2_1,
		SectionForceDeformation& theSect2_2,
		SectionForceDeformation& theSect3_1,
		SectionForceDeformation& theSect3_2,
		SectionForceDeformation& theSect4_1,
		SectionForceDeformation& theSect4_2,
		double Ep, double poisson, double t,
		double rho = 0.0);

	// null constructor
	StringPanelLin();

	// destructor
	~StringPanelLin();

	// Get the number of external nodes, dof and connectivity
	int getNumExternalNodes(void) const;
	const ID &getExternalNodes(void);
	Node** getNodePtrs(void);
	int getNumDOF(void);
	void setDomain(Domain* theDomain);

	// public methods to set the state of the element
	int commitState(void);
	int revertToLastCommit(void);
	int revertToStart(void);
	int update(void);

	// public methods to obtain stiffness matrix
	const Matrix &getInitialStiff(void);
	const Matrix &getTangentStiff(void);

	// Lumped mass matrix
	const Matrix &getMass(void);

	// methods for applying loads
	void zeroLoad(void);
	int addLoad(ElementalLoad* theLoad, double loadFactor);
	int addInertiaLoadToUnbalance(const Vector &accel);

	// get residual force
	const Vector &getResistingForce(void);
	const Vector &getResistingForceIncInertia(void);

	// public methods for element output
	int sendSelf(int commitTag, Channel &theChannel);
	int recvSelf(int commitTag, Channel &theChannel, FEM_ObjectBroker &theBroker);
	int displaySelf(Renderer&, int mode, float fact, const char** displayModes = 0, int numModes = 0);
	void Print(OPS_Stream& s, int flag = 0);

	Response* setResponse(const char** argv, int argc, OPS_Stream &output);
	int getResponse(int responseID, Information &eleInfo);

private:
	// Compute strain at two integration points of each stringer
	Vector computeCurrentStrain();

	// Compute panel stiffness matrix in local coordinates
	const Matrix& getPanelStiff(void);

	// Transform StringPanel stiffness matrix into global coordinates and assemble
	const Matrix& assembleK(const Matrix& kStringer1,
		const Matrix& kStringer2, const Matrix& kStringer3, const Matrix& kStringer4);

	// Obtain coordinate transformation matrix
	const Matrix& transformMatrix(void);

	// Get local force vector for stringers
	const Vector& getLocalForce(void);

	// Get displacement at midpoints
	const Vector& getMidDisp(const Vector& Un);

	// Get panel area
	double getPanelArea(void);

	// Static data
	static Matrix stiff8; 
	static Matrix stiff12;
	static Matrix stiff24;

	static Vector resid8; 
	static Vector resid12;
	static Vector resid24;

	// Material properties and section input
	double E_p;			// Young's modulus of panel
	double nu;			// Poisson's ratio of panel
	double thickness;	// Thickness of panel
	double rho = 0.0;			// Mass per unit area (optional)

	// static Matrix mass;

	// Sections information, 4 section are asked as input, the _2 is a copy of _1. 
	SectionForceDeformation* theSection1_1;
	SectionForceDeformation* theSection1_2;
	SectionForceDeformation* theSection2_1;
	SectionForceDeformation* theSection2_2;
	SectionForceDeformation* theSection3_1; 
	SectionForceDeformation* theSection3_2; 
	SectionForceDeformation* theSection4_1; 
	SectionForceDeformation* theSection4_2; 

	// Node and dimension information
	ID connectedExternalNodes;
	Node* theNodes[4];
	double *initialDisp;

	// Geometry information
	double L[4] = { 0 };		// vector with stringers length
	double dx[4] = { 0 };	
	double dy[4] = { 0 };
	double dz[4] = { 0 };

	int dimension;				// Element can work in 2d and 3d domains
	int numDOF;					// Number of DOF at corners of panel

	int flagInitial;			// Auxiliary flag

	Vector* theLoad;
	Matrix* theMatrix;
	Vector* theVector;

};

#endif