
 ############################# CW1 #######################################
 
for {set i 1} {$i <= $nStory} {incr i 1} {
	
	# Defining wall section based on story
	if {$i >= 31} {
		set secTagWall $secWall20_6
	} elseif {$i >= 21} {
		set secTagWall $secWall24_6
	} elseif {$i >= 16} {
		set secTagWall $secWall28_6
	} elseif {$i >= 12} {
		set secTagWall $secWall32_7
	} elseif {$i >= 6} {
		set secTagWall $secWall36_7
	} else {
		set secTagWall $secWall36_8
	}
	
	# Defining CB section based on story
	if {$i >= 31} {
		set secTagCB $CB20x30
	} elseif {$i >= 21} {
		set secTagCB $CB24x30
	} elseif {$i >= 16} {
		set secTagCB $CB28x30
	} elseif {$i >= 12} {
		set secTagCB $CB32x30
	} elseif {$i >= 6} {
		set secTagCB $CB36x42
	} elseif {$i >= 3} {
		set secTagCB $CB36x60
	} else {
		set secTagCB $CB36x36
	}
	
	if {$i == 1} {
		set iNode1 1100;
		set iNode2 1200;
	} else {
		set iNode1 $jNode1;
		set iNode2 $jNode2;
	}
	
	set jNode1 [expr 1000*$i + 100 + 1];
	set jNode2 [expr 1000*$i + 200 + 1];
	
	# First element of each floor ---------------------------------------------------------------------------------------------------------------------------
	if {$eleTypeWall == "dispBeamColumn"} {
		element dispBeamColumn [expr 1000*$i + 100 + 1] $iNode1 $jNode1 $numIntgrPts $secTagWall $transfTagVertLeft -integration Lobatto
		element dispBeamColumn [expr 1000*$i + 200 + 1] $iNode2 $jNode2 $numIntgrPts $secTagWall $transfTagVertRight -integration Lobatto
		
		#puts $ModelFile "element dispBeamColumn [expr 1000*$i + 100 + 1] $iNode1 $jNode1 $numIntgrPts $secTagWall $transfTagVertLeft -integration Lobatto"
		#puts $ModelFile "element dispBeamColumn [expr 1000*$i + 200 + 1] $iNode2 $jNode2 $numIntgrPts $secTagWall $transfTagVertRight -integration Lobatto"
		
	} elseif {$eleTypeWall == "forceBeamColumn"} {
		element forceBeamColumn [expr 1000*$i + 100 + 1] $iNode1 $jNode1 $numIntgrPts $secTagWall $transfTagVertLeft -integration Lobatto -iter $maxIters $fbtol
		element forceBeamColumn [expr 1000*$i + 200 + 1] $iNode2 $jNode2 $numIntgrPts $secTagWall $transfTagVertRight -integration Lobatto -iter $maxIters $fbtol
		
		#puts $ModelFile "element forceBeamColumn [expr 1000*$i + 100 + 1] $iNode1 $jNode1 $numIntgrPts $secTagWall $transfTagVertLeft -integration Lobatto -iter $maxIters $fbtol"
		#puts $ModelFile "element forceBeamColumn [expr 1000*$i + 200 + 1] $iNode2 $jNode2 $numIntgrPts $secTagWall $transfTagVertRight -integration Lobatto -iter $maxIters $fbtol"
		
	}
	# --------------------------------------------------------------------------------------------------------------------------------------------------------
	
	
	# Remaining elements of each floor -----------------------------------------------------------------------------------------------------------------------
	for {set j 1} {$j <= [expr $nEleFloor - 1]} {incr j 1} {
	
		set iNode1 $jNode1;
		set iNode2 $jNode2;
		
		set jNode1 [expr 1000*$i + 100 + ($j + 1)];
		set jNode2 [expr 1000*$i + 200 + ($j + 1)];
		
		if {$eleTypeWall == "dispBeamColumn"} {
		
			element dispBeamColumn [expr 1000*$i + 100 + ($j + 1)] $iNode1 $jNode1 $numIntgrPts $secTagWall $transfTagVertLeft -integration Lobatto
			element dispBeamColumn [expr 1000*$i + 200 + ($j + 1)] $iNode2 $jNode2 $numIntgrPts $secTagWall $transfTagVertRight -integration Lobatto
			
			#puts $ModelFile "element dispBeamColumn [expr 1000*$i + 100 + ($j + 1)] $iNode1 $jNode1 $numIntgrPts $secTagWall $transfTagVertLeft -integration Lobatto"
			#puts $ModelFile "element dispBeamColumn [expr 1000*$i + 200 + ($j + 1)] $iNode2 $jNode2 $numIntgrPts $secTagWall $transfTagVertRight -integration Lobatto"
		
		} elseif {$eleTypeWall == "forceBeamColumn"} {
		
			element forceBeamColumn [expr 1000*$i + 100 + ($j + 1)] $iNode1 $jNode1 $numIntgrPts $secTagWall $transfTagVertLeft -integration Lobatto -iter $maxIters $fbtol
			element forceBeamColumn [expr 1000*$i + 200 + ($j + 1)] $iNode2 $jNode2 $numIntgrPts $secTagWall $transfTagVertRight -integration Lobatto -iter $maxIters $fbtol
			
			#puts $ModelFile "element forceBeamColumn [expr 1000*$i + 100 + ($j + 1)] $iNode1 $jNode1 $numIntgrPts $secTagWall $transfTagVertLeft -integration Lobatto -iter $maxIters $fbtol"
			#puts $ModelFile "element forceBeamColumn [expr 1000*$i + 200 + ($j + 1)] $iNode2 $jNode2 $numIntgrPts $secTagWall $transfTagVertRight -integration Lobatto -iter $maxIters $fbtol"
		
		}
		
		
	}
	# -----------------------------------------------------------------------------------------------------------------------------------------------------

	
	# Rigid elements in each floor --------------------------------------------------------------------------------------------------------------------
	element elasticBeamColumn [expr 1000*$i + 100 + $nEleFloor + 1] [expr 1000*$i + 100 + $nEleFloor]		[expr 1000*$i + 100 + $nEleFloor + 1] $ARigid 1. 1. $JRigid $IyRigid $IzRigid $transfTagHorizRig
	element elasticBeamColumn [expr 1000*$i + 100 + $nEleFloor + 2] [expr 1000*$i + 100 + $nEleFloor]		[expr 1000*$i + 100 + $nEleFloor + 2] $ARigid 1. 1. $JRigid $IyRigid $IzRigid $transfTagHorizRig
	element elasticBeamColumn [expr 1000*$i + 100 + $nEleFloor + 3] [expr 1000*$i + 100 + $nEleFloor + 1]	[expr 1000*$i + 100 + $nEleFloor + 3] $ARigid 1. 1. $JRigid $IyRigid $IzRigid $transfTagHorizRig
	element elasticBeamColumn [expr 1000*$i + 100 + $nEleFloor + 4] [expr 1000*$i + 100 + $nEleFloor + 2]	[expr 1000*$i + 100 + $nEleFloor + 4] $ARigid 1. 1. $JRigid $IyRigid $IzRigid $transfTagHorizRig
	element elasticBeamColumn [expr 1000*$i + 100 + $nEleFloor + 5] [expr 1000*$i + 100 + $nEleFloor + 5]	[expr 1000*$i + 100 + $nEleFloor + 3] $ARigid 1. 1. $JRigid $IyRigid $IzRigid $transfTagVertRig
	element elasticBeamColumn [expr 1000*$i + 100 + $nEleFloor + 6] [expr 1000*$i + 100 + $nEleFloor + 6]	[expr 1000*$i + 100 + $nEleFloor + 4] $ARigid 1. 1. $JRigid $IyRigid $IzRigid $transfTagVertRig
	element elasticBeamColumn [expr 1000*$i + 100 + $nEleFloor + 7] [expr 1000*$i + 100 + $nEleFloor + 7]	[expr 1000*$i + 100 + $nEleFloor + 5] $ARigid 1. 1. $JRigid $IyRigid $IzRigid $transfTagVertRig
	element elasticBeamColumn [expr 1000*$i + 100 + $nEleFloor + 8] [expr 1000*$i + 100 + $nEleFloor + 8]	[expr 1000*$i + 100 + $nEleFloor + 6] $ARigid 1. 1. $JRigid $IyRigid $IzRigid $transfTagVertRig
	
	#puts $ModelFile "element elasticBeamColumn [expr 1000*$i + 100 + $nEleFloor + 1] [expr 1000*$i + 100 + $nEleFloor]		[expr 1000*$i + 100 + $nEleFloor + 1] $ARigid 1. 1. $JRigid $IyRigid $IzRigid $transfTagHorizRig"  
	#puts $ModelFile "element elasticBeamColumn [expr 1000*$i + 100 + $nEleFloor + 2] [expr 1000*$i + 100 + $nEleFloor]		[expr 1000*$i + 100 + $nEleFloor + 2] $ARigid 1. 1. $JRigid $IyRigid $IzRigid $transfTagHorizRig"  
	#puts $ModelFile "element elasticBeamColumn [expr 1000*$i + 100 + $nEleFloor + 3] [expr 1000*$i + 100 + $nEleFloor + 1]	[expr 1000*$i + 100 + $nEleFloor + 3] $ARigid 1. 1. $JRigid $IyRigid $IzRigid $transfTagHorizRig"  
	#puts $ModelFile "element elasticBeamColumn [expr 1000*$i + 100 + $nEleFloor + 4] [expr 1000*$i + 100 + $nEleFloor + 2]	[expr 1000*$i + 100 + $nEleFloor + 4] $ARigid 1. 1. $JRigid $IyRigid $IzRigid $transfTagHorizRig"  
	#puts $ModelFile "element elasticBeamColumn [expr 1000*$i + 100 + $nEleFloor + 5] [expr 1000*$i + 100 + $nEleFloor + 5]	[expr 1000*$i + 100 + $nEleFloor + 3] $ARigid 1. 1. $JRigid $IyRigid $IzRigid $transfTagVertRig" 
	#puts $ModelFile "element elasticBeamColumn [expr 1000*$i + 100 + $nEleFloor + 6] [expr 1000*$i + 100 + $nEleFloor + 6]	[expr 1000*$i + 100 + $nEleFloor + 4] $ARigid 1. 1. $JRigid $IyRigid $IzRigid $transfTagVertRig" 
	#puts $ModelFile "element elasticBeamColumn [expr 1000*$i + 100 + $nEleFloor + 7] [expr 1000*$i + 100 + $nEleFloor + 7]	[expr 1000*$i + 100 + $nEleFloor + 5] $ARigid 1. 1. $JRigid $IyRigid $IzRigid $transfTagVertRig" 
	#puts $ModelFile "element elasticBeamColumn [expr 1000*$i + 100 + $nEleFloor + 8] [expr 1000*$i + 100 + $nEleFloor + 8]	[expr 1000*$i + 100 + $nEleFloor + 6] $ARigid 1. 1. $JRigid $IyRigid $IzRigid $transfTagVertRig"
	
	element elasticBeamColumn [expr 1000*$i + 200 + $nEleFloor + 1] [expr 1000*$i + 200 + $nEleFloor]		[expr 1000*$i + 200 + $nEleFloor + 1] $ARigid 1. 1. $JRigid $IyRigid $IzRigid $transfTagHorizRig
	element elasticBeamColumn [expr 1000*$i + 200 + $nEleFloor + 2] [expr 1000*$i + 200 + $nEleFloor]		[expr 1000*$i + 200 + $nEleFloor + 2] $ARigid 1. 1. $JRigid $IyRigid $IzRigid $transfTagHorizRig
	element elasticBeamColumn [expr 1000*$i + 200 + $nEleFloor + 3] [expr 1000*$i + 200 + $nEleFloor + 1]	[expr 1000*$i + 200 + $nEleFloor + 3] $ARigid 1. 1. $JRigid $IyRigid $IzRigid $transfTagHorizRig
	element elasticBeamColumn [expr 1000*$i + 200 + $nEleFloor + 4] [expr 1000*$i + 200 + $nEleFloor + 2]	[expr 1000*$i + 200 + $nEleFloor + 4] $ARigid 1. 1. $JRigid $IyRigid $IzRigid $transfTagHorizRig
	element elasticBeamColumn [expr 1000*$i + 200 + $nEleFloor + 5] [expr 1000*$i + 200 + $nEleFloor + 5]	[expr 1000*$i + 200 + $nEleFloor + 3] $ARigid 1. 1. $JRigid $IyRigid $IzRigid $transfTagVertRig
	element elasticBeamColumn [expr 1000*$i + 200 + $nEleFloor + 6] [expr 1000*$i + 200 + $nEleFloor + 6]	[expr 1000*$i + 200 + $nEleFloor + 4] $ARigid 1. 1. $JRigid $IyRigid $IzRigid $transfTagVertRig
	element elasticBeamColumn [expr 1000*$i + 200 + $nEleFloor + 7] [expr 1000*$i + 200 + $nEleFloor + 7]	[expr 1000*$i + 200 + $nEleFloor + 5] $ARigid 1. 1. $JRigid $IyRigid $IzRigid $transfTagVertRig
	element elasticBeamColumn [expr 1000*$i + 200 + $nEleFloor + 8] [expr 1000*$i + 200 + $nEleFloor + 8]	[expr 1000*$i + 200 + $nEleFloor + 6] $ARigid 1. 1. $JRigid $IyRigid $IzRigid $transfTagVertRig
	
	#puts $ModelFile "element elasticBeamColumn [expr 1000*$i + 200 + $nEleFloor + 1] [expr 1000*$i + 200 + $nEleFloor]		[expr 1000*$i + 200 + $nEleFloor + 1] $ARigid 1. 1. $JRigid $IyRigid $IzRigid $transfTagHorizRig"  
	#puts $ModelFile "element elasticBeamColumn [expr 1000*$i + 200 + $nEleFloor + 2] [expr 1000*$i + 200 + $nEleFloor]		[expr 1000*$i + 200 + $nEleFloor + 2] $ARigid 1. 1. $JRigid $IyRigid $IzRigid $transfTagHorizRig" 
	#puts $ModelFile "element elasticBeamColumn [expr 1000*$i + 200 + $nEleFloor + 3] [expr 1000*$i + 200 + $nEleFloor + 1]	[expr 1000*$i + 200 + $nEleFloor + 3] $ARigid 1. 1. $JRigid $IyRigid $IzRigid $transfTagHorizRig"  
	#puts $ModelFile "element elasticBeamColumn [expr 1000*$i + 200 + $nEleFloor + 4] [expr 1000*$i + 200 + $nEleFloor + 2]	[expr 1000*$i + 200 + $nEleFloor + 4] $ARigid 1. 1. $JRigid $IyRigid $IzRigid $transfTagHorizRig"  
	#puts $ModelFile "element elasticBeamColumn [expr 1000*$i + 200 + $nEleFloor + 5] [expr 1000*$i + 200 + $nEleFloor + 5]	[expr 1000*$i + 200 + $nEleFloor + 3] $ARigid 1. 1. $JRigid $IyRigid $IzRigid $transfTagVertRig"  
	#puts $ModelFile "element elasticBeamColumn [expr 1000*$i + 200 + $nEleFloor + 6] [expr 1000*$i + 200 + $nEleFloor + 6]	[expr 1000*$i + 200 + $nEleFloor + 4] $ARigid 1. 1. $JRigid $IyRigid $IzRigid $transfTagVertRig"  
	#puts $ModelFile "element elasticBeamColumn [expr 1000*$i + 200 + $nEleFloor + 7] [expr 1000*$i + 200 + $nEleFloor + 7]	[expr 1000*$i + 200 + $nEleFloor + 5] $ARigid 1. 1. $JRigid $IyRigid $IzRigid $transfTagVertRig"  
	#puts $ModelFile "element elasticBeamColumn [expr 1000*$i + 200 + $nEleFloor + 8] [expr 1000*$i + 200 + $nEleFloor + 8]	[expr 1000*$i + 200 + $nEleFloor + 6] $ARigid 1. 1. $JRigid $IyRigid $IzRigid $transfTagVertRig"
	
	# Rigid element in the z-direction connecting both walls to avoid uncoupled deformation
	element elasticBeamColumn [expr 10000000*$i + 1] [expr 1000*$i + 100 + $nEleFloor] [expr 1000*$i + 200 + $nEleFloor] 0. 1. 1. 0. 0. $IzRigid $transfTagHorizRig

	#puts $ModelFile "element elasticBeamColumn [expr 100000*$i + 1] [expr 1000*$i + 100 + $nEleFloor] [expr 1000*$i + 200 + $nEleFloor] 0. 1. 1. 0. 0. $IzRigid $transfTagHorizRig"

	# Truss Elements for Coupling Beam ---------------------------------------------------------------------------------------------------------
	
    if {$gT == "Linear"} {
    
        element trussSection [expr 1000*$i + 100 + $nEleFloor +  9] [expr 1000*$i + 100 + $nEleFloor + 5] [expr 1000*$i + 200 + $nEleFloor + 7] $secTagCB
        element trussSection [expr 1000*$i + 100 + $nEleFloor + 10] [expr 1000*$i + 100 + $nEleFloor + 6] [expr 1000*$i + 200 + $nEleFloor + 8] $secTagCB
        element trussSection [expr 1000*$i + 100 + $nEleFloor + 11] [expr 1000*$i + 100 + $nEleFloor + 7] [expr 1000*$i + 200 + $nEleFloor + 5] $secTagCB
        element trussSection [expr 1000*$i + 100 + $nEleFloor + 12] [expr 1000*$i + 100 + $nEleFloor + 8] [expr 1000*$i + 200 + $nEleFloor + 6] $secTagCB
        
        #puts $ModelFile "element trussSection [expr 1000*$i + 100 + $nEleFloor +  9] [expr 1000*$i + 100 + $nEleFloor + 5] [expr 1000*$i + 200 + $nEleFloor + 7] $secTagCB"
        #puts $ModelFile "element trussSection [expr 1000*$i + 100 + $nEleFloor + 10] [expr 1000*$i + 100 + $nEleFloor + 6] [expr 1000*$i + 200 + $nEleFloor + 8] $secTagCB"
        #puts $ModelFile "element trussSection [expr 1000*$i + 100 + $nEleFloor + 11] [expr 1000*$i + 100 + $nEleFloor + 7] [expr 1000*$i + 200 + $nEleFloor + 5] $secTagCB"
        #puts $ModelFile "element trussSection [expr 1000*$i + 100 + $nEleFloor + 12] [expr 1000*$i + 100 + $nEleFloor + 8] [expr 1000*$i + 200 + $nEleFloor + 6] $secTagCB"
        
    } else {
        
        element corotTrussSection [expr 1000*$i + 100 + $nEleFloor +  9] [expr 1000*$i + 100 + $nEleFloor + 5] [expr 1000*$i + 200 + $nEleFloor + 7] $secTagCB
        element corotTrussSection [expr 1000*$i + 100 + $nEleFloor + 10] [expr 1000*$i + 100 + $nEleFloor + 6] [expr 1000*$i + 200 + $nEleFloor + 8] $secTagCB
        element corotTrussSection [expr 1000*$i + 100 + $nEleFloor + 11] [expr 1000*$i + 100 + $nEleFloor + 7] [expr 1000*$i + 200 + $nEleFloor + 5] $secTagCB
        element corotTrussSection [expr 1000*$i + 100 + $nEleFloor + 12] [expr 1000*$i + 100 + $nEleFloor + 8] [expr 1000*$i + 200 + $nEleFloor + 6] $secTagCB
        
        #puts $ModelFile "element corotTrussSection [expr 1000*$i + 100 + $nEleFloor +  9] [expr 1000*$i + 100 + $nEleFloor + 5] [expr 1000*$i + 200 + $nEleFloor + 7] $secTagCB"
        #puts $ModelFile "element corotTrussSection [expr 1000*$i + 100 + $nEleFloor + 10] [expr 1000*$i + 100 + $nEleFloor + 6] [expr 1000*$i + 200 + $nEleFloor + 8] $secTagCB"
        #puts $ModelFile "element corotTrussSection [expr 1000*$i + 100 + $nEleFloor + 11] [expr 1000*$i + 100 + $nEleFloor + 7] [expr 1000*$i + 200 + $nEleFloor + 5] $secTagCB"
        #puts $ModelFile "element corotTrussSection [expr 1000*$i + 100 + $nEleFloor + 12] [expr 1000*$i + 100 + $nEleFloor + 8] [expr 1000*$i + 200 + $nEleFloor + 6] $secTagCB"
        
    }

}


 ############################# CW2 #######################################
 
for {set i 1} {$i <= $nStory} {incr i 1} {
	
	# Defining wall section based on story
	if {$i >= 31} {
		set secTagWall $secWall20_6
	} elseif {$i >= 21} {
		set secTagWall $secWall24_6
	} elseif {$i >= 16} {
		set secTagWall $secWall28_6
	} elseif {$i >= 11} {
		set secTagWall $secWall32_7
	} elseif {$i >= 6} {
		set secTagWall $secWall36_7
	} else {
		set secTagWall $secWall36_8
	}
	
	# Defining CB section based on story
	if {$i >= 31} {
		set secTagCB $CB20x30
	} elseif {$i >= 21} {
		set secTagCB $CB24x30
	} elseif {$i >= 16} {
		set secTagCB $CB28x30
	} elseif {$i >= 12} {
		set secTagCB $CB32x30
	} elseif {$i >= 6} {
		set secTagCB $CB36x42
	} elseif {$i >= 3} {
		set secTagCB $CB36x60
	} else {
		set secTagCB $CB36x36
	}
	
	if {$i == 1} {
		set iNode1 1300;
		set iNode2 1400;
	} else {
		set iNode1 $jNode1;
		set iNode2 $jNode2;
	}
	
	set jNode1 [expr 1000*$i + 300 + 1];
	set jNode2 [expr 1000*$i + 400 + 1];
	
	# First element of each floor ---------------------------------------------------------------------------------------------------------------------------
	if {$eleTypeWall == "dispBeamColumn"} {
		element dispBeamColumn [expr 1000*$i + 300 + 1] $iNode1 $jNode1 $numIntgrPts $secTagWall $transfTagVertLeft -integration Lobatto
		element dispBeamColumn [expr 1000*$i + 400 + 1] $iNode2 $jNode2 $numIntgrPts $secTagWall $transfTagVertRight -integration Lobatto
		
		#puts $ModelFile "element dispBeamColumn [expr 1000*$i + 300 + 1] $iNode1 $jNode1 $numIntgrPts $secTagWall $transfTagVertLeft -integration Lobatto"
		#puts $ModelFile "element dispBeamColumn [expr 1000*$i + 400 + 1] $iNode2 $jNode2 $numIntgrPts $secTagWall $transfTagVertRight -integration Lobatto"
		
	} elseif {$eleTypeWall == "forceBeamColumn"} {
		element forceBeamColumn [expr 1000*$i + 300 + 1] $iNode1 $jNode1 $numIntgrPts $secTagWall $transfTagVertLeft -integration Lobatto -iter $maxIters $fbtol
		element forceBeamColumn [expr 1000*$i + 400 + 1] $iNode2 $jNode2 $numIntgrPts $secTagWall $transfTagVertRight -integration Lobatto -iter $maxIters $fbtol
		
		#puts $ModelFile "element forceBeamColumn [expr 1000*$i + 300 + 1] $iNode1 $jNode1 $numIntgrPts $secTagWall $transfTagVertLeft -integration Lobatto -iter $maxIters $fbtol"
		#puts $ModelFile "element forceBeamColumn [expr 1000*$i + 400 + 1] $iNode2 $jNode2 $numIntgrPts $secTagWall $transfTagVertRight -integration Lobatto -iter $maxIters $fbtol"
		
	}
	# --------------------------------------------------------------------------------------------------------------------------------------------------------
	
	
	# Remaining elements of each floor -----------------------------------------------------------------------------------------------------------------------
	for {set j 1} {$j <= [expr $nEleFloor - 1]} {incr j 1} {
	
		set iNode1 $jNode1;
		set iNode2 $jNode2;
		
		set jNode1 [expr 1000*$i + 300 + ($j + 1)];
		set jNode2 [expr 1000*$i + 400 + ($j + 1)];
		
		if {$eleTypeWall == "dispBeamColumn"} {
		
			element dispBeamColumn [expr 1000*$i + 300 + ($j + 1)] $iNode1 $jNode1 $numIntgrPts $secTagWall $transfTagVertLeft -integration Lobatto
			element dispBeamColumn [expr 1000*$i + 400 + ($j + 1)] $iNode2 $jNode2 $numIntgrPts $secTagWall $transfTagVertRight -integration Lobatto
			
			#puts $ModelFile "element dispBeamColumn [expr 1000*$i + 300 + ($j + 1)] $iNode1 $jNode1 $numIntgrPts $secTagWall $transfTagVertLeft -integration Lobatto"
			#puts $ModelFile "element dispBeamColumn [expr 1000*$i + 400 + ($j + 1)] $iNode2 $jNode2 $numIntgrPts $secTagWall $transfTagVertRight -integration Lobatto"
		
		} elseif {$eleTypeWall == "forceBeamColumn"} {
		
			element forceBeamColumn [expr 1000*$i + 300 + ($j + 1)] $iNode1 $jNode1 $numIntgrPts $secTagWall $transfTagVertLeft -integration Lobatto -iter $maxIters $fbtol
			element forceBeamColumn [expr 1000*$i + 400 + ($j + 1)] $iNode2 $jNode2 $numIntgrPts $secTagWall $transfTagVertRight -integration Lobatto -iter $maxIters $fbtol
			
			#puts $ModelFile "element forceBeamColumn [expr 1000*$i + 300 + ($j + 1)] $iNode1 $jNode1 $numIntgrPts $secTagWall $transfTagVertLeft -integration Lobatto -iter $maxIters $fbtol"
			#puts $ModelFile "element forceBeamColumn [expr 1000*$i + 400 + ($j + 1)] $iNode2 $jNode2 $numIntgrPts $secTagWall $transfTagVertRight -integration Lobatto -iter $maxIters $fbtol"
		
		}
		
		
	}
	# -----------------------------------------------------------------------------------------------------------------------------------------------------

	
	# Rigid elements in each floor --------------------------------------------------------------------------------------------------------------------
	element elasticBeamColumn [expr 1000*$i + 300 + $nEleFloor + 1] [expr 1000*$i + 300 + $nEleFloor]		[expr 1000*$i + 300 + $nEleFloor + 1] $ARigid 1. 1. $JRigid $IyRigid $IzRigid $transfTagHorizRig
	element elasticBeamColumn [expr 1000*$i + 300 + $nEleFloor + 2] [expr 1000*$i + 300 + $nEleFloor]		[expr 1000*$i + 300 + $nEleFloor + 2] $ARigid 1. 1. $JRigid $IyRigid $IzRigid $transfTagHorizRig
	element elasticBeamColumn [expr 1000*$i + 300 + $nEleFloor + 3] [expr 1000*$i + 300 + $nEleFloor + 1]	[expr 1000*$i + 300 + $nEleFloor + 3] $ARigid 1. 1. $JRigid $IyRigid $IzRigid $transfTagHorizRig
	element elasticBeamColumn [expr 1000*$i + 300 + $nEleFloor + 4] [expr 1000*$i + 300 + $nEleFloor + 2]	[expr 1000*$i + 300 + $nEleFloor + 4] $ARigid 1. 1. $JRigid $IyRigid $IzRigid $transfTagHorizRig
	element elasticBeamColumn [expr 1000*$i + 300 + $nEleFloor + 5] [expr 1000*$i + 300 + $nEleFloor + 5]	[expr 1000*$i + 300 + $nEleFloor + 3] $ARigid 1. 1. $JRigid $IyRigid $IzRigid $transfTagVertRig
	element elasticBeamColumn [expr 1000*$i + 300 + $nEleFloor + 6] [expr 1000*$i + 300 + $nEleFloor + 6]	[expr 1000*$i + 300 + $nEleFloor + 4] $ARigid 1. 1. $JRigid $IyRigid $IzRigid $transfTagVertRig
	element elasticBeamColumn [expr 1000*$i + 300 + $nEleFloor + 7] [expr 1000*$i + 300 + $nEleFloor + 7]	[expr 1000*$i + 300 + $nEleFloor + 5] $ARigid 1. 1. $JRigid $IyRigid $IzRigid $transfTagVertRig
	element elasticBeamColumn [expr 1000*$i + 300 + $nEleFloor + 8] [expr 1000*$i + 300 + $nEleFloor + 8]	[expr 1000*$i + 300 + $nEleFloor + 6] $ARigid 1. 1. $JRigid $IyRigid $IzRigid $transfTagVertRig
	
	#puts $ModelFile "element elasticBeamColumn [expr 1000*$i + 300 + $nEleFloor + 1] [expr 1000*$i + 300 + $nEleFloor]		[expr 1000*$i + 300 + $nEleFloor + 1] $ARigid 1. 1. $JRigid $IyRigid $IzRigid $transfTagHorizRig"  
	#puts $ModelFile "element elasticBeamColumn [expr 1000*$i + 300 + $nEleFloor + 2] [expr 1000*$i + 300 + $nEleFloor]		[expr 1000*$i + 300 + $nEleFloor + 2] $ARigid 1. 1. $JRigid $IyRigid $IzRigid $transfTagHorizRig"  
	#puts $ModelFile "element elasticBeamColumn [expr 1000*$i + 300 + $nEleFloor + 3] [expr 1000*$i + 300 + $nEleFloor + 1]	[expr 1000*$i + 300 + $nEleFloor + 3] $ARigid 1. 1. $JRigid $IyRigid $IzRigid $transfTagHorizRig"  
	#puts $ModelFile "element elasticBeamColumn [expr 1000*$i + 300 + $nEleFloor + 4] [expr 1000*$i + 300 + $nEleFloor + 2]	[expr 1000*$i + 300 + $nEleFloor + 4] $ARigid 1. 1. $JRigid $IyRigid $IzRigid $transfTagHorizRig"  
	#puts $ModelFile "element elasticBeamColumn [expr 1000*$i + 300 + $nEleFloor + 5] [expr 1000*$i + 300 + $nEleFloor + 5]	[expr 1000*$i + 300 + $nEleFloor + 3] $ARigid 1. 1. $JRigid $IyRigid $IzRigid $transfTagVertRig" 
	#puts $ModelFile "element elasticBeamColumn [expr 1000*$i + 300 + $nEleFloor + 6] [expr 1000*$i + 300 + $nEleFloor + 6]	[expr 1000*$i + 300 + $nEleFloor + 4] $ARigid 1. 1. $JRigid $IyRigid $IzRigid $transfTagVertRig" 
	#puts $ModelFile "element elasticBeamColumn [expr 1000*$i + 300 + $nEleFloor + 7] [expr 1000*$i + 300 + $nEleFloor + 7]	[expr 1000*$i + 300 + $nEleFloor + 5] $ARigid 1. 1. $JRigid $IyRigid $IzRigid $transfTagVertRig" 
	#puts $ModelFile "element elasticBeamColumn [expr 1000*$i + 300 + $nEleFloor + 8] [expr 1000*$i + 300 + $nEleFloor + 8]	[expr 1000*$i + 300 + $nEleFloor + 6] $ARigid 1. 1. $JRigid $IyRigid $IzRigid $transfTagVertRig"
	
	element elasticBeamColumn [expr 1000*$i + 400 + $nEleFloor + 1] [expr 1000*$i + 400 + $nEleFloor]		[expr 1000*$i + 400 + $nEleFloor + 1] $ARigid 1. 1. $JRigid $IyRigid $IzRigid $transfTagHorizRig
	element elasticBeamColumn [expr 1000*$i + 400 + $nEleFloor + 2] [expr 1000*$i + 400 + $nEleFloor]		[expr 1000*$i + 400 + $nEleFloor + 2] $ARigid 1. 1. $JRigid $IyRigid $IzRigid $transfTagHorizRig
	element elasticBeamColumn [expr 1000*$i + 400 + $nEleFloor + 3] [expr 1000*$i + 400 + $nEleFloor + 1]	[expr 1000*$i + 400 + $nEleFloor + 3] $ARigid 1. 1. $JRigid $IyRigid $IzRigid $transfTagHorizRig
	element elasticBeamColumn [expr 1000*$i + 400 + $nEleFloor + 4] [expr 1000*$i + 400 + $nEleFloor + 2]	[expr 1000*$i + 400 + $nEleFloor + 4] $ARigid 1. 1. $JRigid $IyRigid $IzRigid $transfTagHorizRig
	element elasticBeamColumn [expr 1000*$i + 400 + $nEleFloor + 5] [expr 1000*$i + 400 + $nEleFloor + 5]	[expr 1000*$i + 400 + $nEleFloor + 3] $ARigid 1. 1. $JRigid $IyRigid $IzRigid $transfTagVertRig
	element elasticBeamColumn [expr 1000*$i + 400 + $nEleFloor + 6] [expr 1000*$i + 400 + $nEleFloor + 6]	[expr 1000*$i + 400 + $nEleFloor + 4] $ARigid 1. 1. $JRigid $IyRigid $IzRigid $transfTagVertRig
	element elasticBeamColumn [expr 1000*$i + 400 + $nEleFloor + 7] [expr 1000*$i + 400 + $nEleFloor + 7]	[expr 1000*$i + 400 + $nEleFloor + 5] $ARigid 1. 1. $JRigid $IyRigid $IzRigid $transfTagVertRig
	element elasticBeamColumn [expr 1000*$i + 400 + $nEleFloor + 8] [expr 1000*$i + 400 + $nEleFloor + 8]	[expr 1000*$i + 400 + $nEleFloor + 6] $ARigid 1. 1. $JRigid $IyRigid $IzRigid $transfTagVertRig
	
	#puts $ModelFile "element elasticBeamColumn [expr 1000*$i + 400 + $nEleFloor + 1] [expr 1000*$i + 400 + $nEleFloor]		[expr 1000*$i + 400 + $nEleFloor + 1] $ARigid 1. 1. $JRigid $IyRigid $IzRigid $transfTagHorizRig"  
	#puts $ModelFile "element elasticBeamColumn [expr 1000*$i + 400 + $nEleFloor + 2] [expr 1000*$i + 400 + $nEleFloor]		[expr 1000*$i + 400 + $nEleFloor + 2] $ARigid 1. 1. $JRigid $IyRigid $IzRigid $transfTagHorizRig" 
	#puts $ModelFile "element elasticBeamColumn [expr 1000*$i + 400 + $nEleFloor + 3] [expr 1000*$i + 400 + $nEleFloor + 1]	[expr 1000*$i + 400 + $nEleFloor + 3] $ARigid 1. 1. $JRigid $IyRigid $IzRigid $transfTagHorizRig"  
	#puts $ModelFile "element elasticBeamColumn [expr 1000*$i + 400 + $nEleFloor + 4] [expr 1000*$i + 400 + $nEleFloor + 2]	[expr 1000*$i + 400 + $nEleFloor + 4] $ARigid 1. 1. $JRigid $IyRigid $IzRigid $transfTagHorizRig"  
	#puts $ModelFile "element elasticBeamColumn [expr 1000*$i + 400 + $nEleFloor + 5] [expr 1000*$i + 400 + $nEleFloor + 5]	[expr 1000*$i + 400 + $nEleFloor + 3] $ARigid 1. 1. $JRigid $IyRigid $IzRigid $transfTagVertRig"  
	#puts $ModelFile "element elasticBeamColumn [expr 1000*$i + 400 + $nEleFloor + 6] [expr 1000*$i + 400 + $nEleFloor + 6]	[expr 1000*$i + 400 + $nEleFloor + 4] $ARigid 1. 1. $JRigid $IyRigid $IzRigid $transfTagVertRig"  
	#puts $ModelFile "element elasticBeamColumn [expr 1000*$i + 400 + $nEleFloor + 7] [expr 1000*$i + 400 + $nEleFloor + 7]	[expr 1000*$i + 400 + $nEleFloor + 5] $ARigid 1. 1. $JRigid $IyRigid $IzRigid $transfTagVertRig"  
	#puts $ModelFile "element elasticBeamColumn [expr 1000*$i + 400 + $nEleFloor + 8] [expr 1000*$i + 400 + $nEleFloor + 8]	[expr 1000*$i + 400 + $nEleFloor + 6] $ARigid 1. 1. $JRigid $IyRigid $IzRigid $transfTagVertRig"
	
	# Rigid element in the z-direction connecting both walls to avoid un-coupled deformation
	element elasticBeamColumn [expr 10000000*$i + 2] [expr 1000*$i + 300 + $nEleFloor] [expr 1000*$i + 400 + $nEleFloor] 0. 1. 1. 0. 0. $IzRigid $transfTagHorizRig

	#puts $ModelFile "element elasticBeamColumn [expr 100000*$i + 1] [expr 1000*$i + 300 + $nEleFloor] [expr 1000*$i + 400 + $nEleFloor] 0. 1. 1. 0. 0. $IzRigid $transfTagHorizRig"

	# Truss Elements for Coupling Beam ---------------------------------------------------------------------------------------------------------
	
    if {$gT == "Linear"} {
    
        element trussSection [expr 1000*$i + 300 + $nEleFloor +  9] [expr 1000*$i + 300 + $nEleFloor + 5] [expr 1000*$i + 400 + $nEleFloor + 7] $secTagCB
        element trussSection [expr 1000*$i + 300 + $nEleFloor + 10] [expr 1000*$i + 300 + $nEleFloor + 6] [expr 1000*$i + 400 + $nEleFloor + 8] $secTagCB
        element trussSection [expr 1000*$i + 300 + $nEleFloor + 11] [expr 1000*$i + 300 + $nEleFloor + 7] [expr 1000*$i + 400 + $nEleFloor + 5] $secTagCB
        element trussSection [expr 1000*$i + 300 + $nEleFloor + 12] [expr 1000*$i + 300 + $nEleFloor + 8] [expr 1000*$i + 400 + $nEleFloor + 6] $secTagCB
        
        #puts $ModelFile "element trussSection [expr 1000*$i + 300 + $nEleFloor +  9] [expr 1000*$i + 300 + $nEleFloor + 5] [expr 1000*$i + 400 + $nEleFloor + 7] $secTagCB"
        #puts $ModelFile "element trussSection [expr 1000*$i + 300 + $nEleFloor + 10] [expr 1000*$i + 300 + $nEleFloor + 6] [expr 1000*$i + 400 + $nEleFloor + 8] $secTagCB"
        #puts $ModelFile "element trussSection [expr 1000*$i + 300 + $nEleFloor + 11] [expr 1000*$i + 300 + $nEleFloor + 7] [expr 1000*$i + 400 + $nEleFloor + 5] $secTagCB"
        #puts $ModelFile "element trussSection [expr 1000*$i + 300 + $nEleFloor + 12] [expr 1000*$i + 300 + $nEleFloor + 8] [expr 1000*$i + 400 + $nEleFloor + 6] $secTagCB"
        
    } else {
        
        element corotTrussSection [expr 1000*$i + 300 + $nEleFloor +  9] [expr 1000*$i + 300 + $nEleFloor + 5] [expr 1000*$i + 400 + $nEleFloor + 7] $secTagCB
        element corotTrussSection [expr 1000*$i + 300 + $nEleFloor + 10] [expr 1000*$i + 300 + $nEleFloor + 6] [expr 1000*$i + 400 + $nEleFloor + 8] $secTagCB
        element corotTrussSection [expr 1000*$i + 300 + $nEleFloor + 11] [expr 1000*$i + 300 + $nEleFloor + 7] [expr 1000*$i + 400 + $nEleFloor + 5] $secTagCB
        element corotTrussSection [expr 1000*$i + 300 + $nEleFloor + 12] [expr 1000*$i + 300 + $nEleFloor + 8] [expr 1000*$i + 400 + $nEleFloor + 6] $secTagCB
        
        #puts $ModelFile "element corotTrussSection [expr 1000*$i + 300 + $nEleFloor +  9] [expr 1000*$i + 300 + $nEleFloor + 5] [expr 1000*$i + 400 + $nEleFloor + 7] $secTagCB"
        #puts $ModelFile "element corotTrussSection [expr 1000*$i + 300 + $nEleFloor + 10] [expr 1000*$i + 300 + $nEleFloor + 6] [expr 1000*$i + 400 + $nEleFloor + 8] $secTagCB"
        #puts $ModelFile "element corotTrussSection [expr 1000*$i + 300 + $nEleFloor + 11] [expr 1000*$i + 300 + $nEleFloor + 7] [expr 1000*$i + 400 + $nEleFloor + 5] $secTagCB"
        #puts $ModelFile "element corotTrussSection [expr 1000*$i + 300 + $nEleFloor + 12] [expr 1000*$i + 300 + $nEleFloor + 8] [expr 1000*$i + 400 + $nEleFloor + 6] $secTagCB"
        
    }

}