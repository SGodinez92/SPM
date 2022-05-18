
 ############################# RecWallX-1, RecWallX-2, RexWallY #######################################
 
for {set i 1} {$i <= [expr $nBaseStory + $nPodiumStory + $nPodiumStory2]} {incr i 1} {
	
	# Defining wall section based on story
	if {$i > 6} {
		set secTagWall $recWall24_6_off
	} else {
		set secTagWall $recWall24_6_pod
	}
	
	
	if {$i == 1} {
		set iNode1 1300;
		set iNode2 1400;
		set iNode3 1500;
	} else {
		set iNode1 $jNode1;
		set iNode2 $jNode2;
		set iNode3 $jNode3;
	}
	
	set jNode1 [expr 1000*$i + 300 + $nEleFloor];
	set jNode2 [expr 1000*$i + 400 + $nEleFloor];
	set jNode3 [expr 1000*$i + 500 + $nEleFloor];
	
	# First element of each floor ---------------------------------------------------------------------------------------------------------------------------
	if {$eleTypeWall == "dispBeamColumn"} {
		element dispBeamColumn [expr 1000*$i + 300 + $nEleFloor] $iNode1 $jNode1 $numIntgrPts $secTagWall $transfTagVertRecX -integration Lobatto
		element dispBeamColumn [expr 1000*$i + 400 + $nEleFloor] $iNode2 $jNode2 $numIntgrPts $secTagWall $transfTagVertRecY -integration Lobatto
		element dispBeamColumn [expr 1000*$i + 500 + $nEleFloor] $iNode3 $jNode3 $numIntgrPts $secTagWall $transfTagVertRecY -integration Lobatto
		
		puts $ModelFile "element dispBeamColumn [expr 1000*$i + 300 + $nEleFloor] $iNode1 $jNode1 $numIntgrPts $secTagWall $transfTagVertRecX -integration Lobatto"
		puts $ModelFile "element dispBeamColumn [expr 1000*$i + 400 + $nEleFloor] $iNode2 $jNode2 $numIntgrPts $secTagWall $transfTagVertRecY -integration Lobatto"
		puts $ModelFile "element dispBeamColumn [expr 1000*$i + 500 + $nEleFloor] $iNode3 $jNode3 $numIntgrPts $secTagWall $transfTagVertRecY -integration Lobatto"
		
	} elseif {$eleTypeWall == "forceBeamColumn"} {
		element forceBeamColumn [expr 1000*$i + 300 + $nEleFloor] $iNode1 $jNode1 $numIntgrPts $secTagWall $transfTagVertRecX -integration Lobatto -iter $maxIters $fbtol
		element forceBeamColumn [expr 1000*$i + 400 + $nEleFloor] $iNode2 $jNode2 $numIntgrPts $secTagWall $transfTagVertRecY -integration Lobatto -iter $maxIters $fbtol
		element forceBeamColumn [expr 1000*$i + 500 + $nEleFloor] $iNode3 $jNode3 $numIntgrPts $secTagWall $transfTagVertRecY -integration Lobatto -iter $maxIters $fbtol
		
		puts $ModelFile "element forceBeamColumn [expr 1000*$i + 300 + $nEleFloor] $iNode1 $jNode1 $numIntgrPts $secTagWall $transfTagVertRecX -integration Lobatto -iter $maxIters $fbtol"
		puts $ModelFile "element forceBeamColumn [expr 1000*$i + 400 + $nEleFloor] $iNode2 $jNode2 $numIntgrPts $secTagWall $transfTagVertRecY -integration Lobatto -iter $maxIters $fbtol"
		puts $ModelFile "element forceBeamColumn [expr 1000*$i + 500 + $nEleFloor] $iNode3 $jNode3 $numIntgrPts $secTagWall $transfTagVertRecY -integration Lobatto -iter $maxIters $fbtol"
		
	}
	# --------------------------------------------------------------------------------------------------------------------------------------------------------
	
	
	# Remaining elements of each floor -----------------------------------------------------------------------------------------------------------------------
	for {set j 1} {$j <= [expr $nEleFloor - 1]} {incr j 1} {
	
		set iNode1 $jNode1;
		set iNode2 $jNode2;
		set iNode3 $jNode3;
		
		set jNode1 [expr 1000*$i + 300 + ($j + 1)];
		set jNode2 [expr 1000*$i + 400 + ($j + 1)];
		set jNode3 [expr 1000*$i + 500 + ($j + 1)];
		
		if {$eleTypeWall == "dispBeamColumn"} {
		
			element dispBeamColumn [expr 1000*$i + 300 + ($j + 1)] $iNode1 $jNode1 $numIntgrPts $secTagWall $transfTagVertRecX -integration Lobatto
			element dispBeamColumn [expr 1000*$i + 400 + ($j + 1)] $iNode2 $jNode2 $numIntgrPts $secTagWall $transfTagVertRecY -integration Lobatto
			element dispBeamColumn [expr 1000*$i + 500 + ($j + 1)] $iNode3 $jNode3 $numIntgrPts $secTagWall $transfTagVertRecY -integration Lobatto
			
			puts $ModelFile "element dispBeamColumn [expr 1000*$i + 300 + ($j + 1)] $iNode1 $jNode1 $numIntgrPts $secTagWall $transfTagVertRecX -integration Lobatto"
			puts $ModelFile "element dispBeamColumn [expr 1000*$i + 400 + ($j + 1)] $iNode2 $jNode2 $numIntgrPts $secTagWall $transfTagVertRecY -integration Lobatto"
			puts $ModelFile "element dispBeamColumn [expr 1000*$i + 500 + ($j + 1)] $iNode3 $jNode3 $numIntgrPts $secTagWall $transfTagVertRecY -integration Lobatto"
		
		} elseif {$eleTypeWall == "forceBeamColumn"} {
		
			element forceBeamColumn [expr 1000*$i + 300 + ($j + 1)] $iNode1 $jNode1 $numIntgrPts $secTagWall $transfTagVertRecX -integration Lobatto -iter $maxIters $fbtol
			element forceBeamColumn [expr 1000*$i + 400 + ($j + 1)] $iNode2 $jNode2 $numIntgrPts $secTagWall $transfTagVertRecY -integration Lobatto -iter $maxIters $fbtol
			element forceBeamColumn [expr 1000*$i + 500 + ($j + 1)] $iNode3 $jNode3 $numIntgrPts $secTagWall $transfTagVertRecY -integration Lobatto -iter $maxIters $fbtol
			
			puts $ModelFile "element forceBeamColumn [expr 1000*$i + 300 + ($j + 1)] $iNode1 $jNode1 $numIntgrPts $secTagWall $transfTagVertRecX -integration Lobatto -iter $maxIters $fbtol"
			puts $ModelFile "element forceBeamColumn [expr 1000*$i + 400 + ($j + 1)] $iNode2 $jNode2 $numIntgrPts $secTagWall $transfTagVertRecY -integration Lobatto -iter $maxIters $fbtol"
			puts $ModelFile "element forceBeamColumn [expr 1000*$i + 500 + ($j + 1)] $iNode3 $jNode3 $numIntgrPts $secTagWall $transfTagVertRecY -integration Lobatto -iter $maxIters $fbtol"
		
		}
		
		
	}
	# -----------------------------------------------------------------------------------------------------------------------------------------------------

	# Rigid elements in each floor --------------------------------------------------------------------------------------------------------------------
	#element elasticBeamColumn $eleTag $iNode $jNode $A $E $G $J $Iy $Iz $transfTag
	element elasticBeamColumn [expr 1000*$i + 300 + $nEleFloor + 1] [expr 1000*$i + 300 + $nEleFloor] [expr 1000*$i + 300 + $nEleFloor + 1] $ARigid 1. 1. $JRigid $IyRigid $IzRigid $transfTagHorizRig
	element elasticBeamColumn [expr 1000*$i + 300 + $nEleFloor + 2] [expr 1000*$i + 300 + $nEleFloor] [expr 1000*$i + 300 + $nEleFloor + 2] $ARigid 1. 1. $JRigid $IyRigid $IzRigid $transfTagHorizRig
	
	puts $ModelFile "element elasticBeamColumn [expr 1000*$i + 300 + $nEleFloor + 1] [expr 1000*$i + 300 + $nEleFloor] [expr 1000*$i + 300 + $nEleFloor + 1] $ARigid 1. 1. $JRigid $IyRigid $IzRigid $transfTagHorizRig"  
	puts $ModelFile "element elasticBeamColumn [expr 1000*$i + 300 + $nEleFloor + 2] [expr 1000*$i + 300 + $nEleFloor] [expr 1000*$i + 300 + $nEleFloor + 2] $ARigid 1. 1. $JRigid $IyRigid $IzRigid $transfTagHorizRig" 
	
	element elasticBeamColumn [expr 1000*$i + 400 + $nEleFloor + 1] [expr 1000*$i + 400 + $nEleFloor] [expr 1000*$i + 400 + $nEleFloor + 1] $ARigid 1. 1. $JRigid $IyRigid $IzRigid $transfTagHorizRig
	element elasticBeamColumn [expr 1000*$i + 400 + $nEleFloor + 2] [expr 1000*$i + 400 + $nEleFloor] [expr 1000*$i + 400 + $nEleFloor + 2] $ARigid 1. 1. $JRigid $IyRigid $IzRigid $transfTagHorizRig
	
	puts $ModelFile "element elasticBeamColumn [expr 1000*$i + 400 + $nEleFloor + 1] [expr 1000*$i + 400 + $nEleFloor] [expr 1000*$i + 400 + $nEleFloor + 1] $ARigid 1. 1. $JRigid $IyRigid $IzRigid $transfTagHorizRig"  
	puts $ModelFile "element elasticBeamColumn [expr 1000*$i + 400 + $nEleFloor + 2] [expr 1000*$i + 400 + $nEleFloor] [expr 1000*$i + 400 + $nEleFloor + 2] $ARigid 1. 1. $JRigid $IyRigid $IzRigid $transfTagHorizRig"  
	
	element elasticBeamColumn [expr 1000*$i + 500 + $nEleFloor + 1] [expr 1000*$i + 500 + $nEleFloor] [expr 1000*$i + 500 + $nEleFloor + 1] $ARigid 1. 1. $JRigid $IyRigid $IzRigid $transfTagHorizRig
	element elasticBeamColumn [expr 1000*$i + 500 + $nEleFloor + 2] [expr 1000*$i + 500 + $nEleFloor] [expr 1000*$i + 500 + $nEleFloor + 2] $ARigid 1. 1. $JRigid $IyRigid $IzRigid $transfTagHorizRig
	
	puts $ModelFile "element elasticBeamColumn [expr 1000*$i + 500 + $nEleFloor + 1] [expr 1000*$i + 500 + $nEleFloor] [expr 1000*$i + 500 + $nEleFloor + 1] $ARigid 1. 1. $JRigid $IyRigid $IzRigid $transfTagHorizRig"  
	puts $ModelFile "element elasticBeamColumn [expr 1000*$i + 500 + $nEleFloor + 2] [expr 1000*$i + 500 + $nEleFloor] [expr 1000*$i + 500 + $nEleFloor + 2] $ARigid 1. 1. $JRigid $IyRigid $IzRigid $transfTagHorizRig"  

}