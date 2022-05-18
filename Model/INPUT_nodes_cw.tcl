
# Create nodes for CW

# Base Nodes ------------
node 1100 [expr 144.*$ft + $Centr] [expr 132.*$ft] 0.; #Wall 1 CW
node 1200 [expr 144.*$ft + $Centr + $C_dim5] [expr 132.*$ft] 0.; #Wall 2 CW

lappend Nodes 1100 1200 1300 1400;

puts $ModelFile "node 1100 [expr 144.*$ft + $Centr] [expr 132.*$ft] 0.; #Wall 1 CW"
puts $ModelFile "node 1200 [expr 144.*$ft + $Centr + $C_dim5] [expr 132.*$ft] 0.; #Wall 2 CW"

# Boundary Conditions -------------
fix 1100 1 1 1 1 1 1;
fix 1200 1 1 1 1 1 1;

# All other nodes -----------------------------------

set z 0.; # Current node height
for {set i 1} {$i <= $nStory} {incr i 1} {

	set H [lindex $storyH $i]; # H = storyH(i)
	
	# Wall nodes ------------------------------------------
	for {set j 1} {$j <= $nEleFloor} {incr j 1} {
		set z [expr $z + $H/$nEleFloor]; # z = z + H/nEleFloor
		
		node [expr 1000*$i + 100 + $j] [expr 144.*$ft + $Centr] [expr 132.*$ft] $z; 			#Wall 1 CW
		node [expr 1000*$i + 200 + $j] [expr 144.*$ft + $Centr + $C_dim5] [expr 132.*$ft] $z; 	#Wall 2 CW
		
		lappend Nodes [expr 1000*$i + 100 + $j];
		lappend Nodes [expr 1000*$i + 200 + $j];
		
		puts $ModelFile "node [expr 1000*$i + 100 + $j] [expr 144.*$ft + $Centr] [expr 132.*$ft] $z"
		puts $ModelFile "node [expr 1000*$i + 200 + $j] [expr 144.*$ft + $Centr + $C_dim5] [expr 132.*$ft] $z"
	}
	
	if {$i > [expr $nBaseStory + $nPodiumStory + $nPodiumStory2 + 1]} {
		set C_dim3 $C_dim3_t
		set C_dim4 $C_dim4_t
	} elseif {$i > [expr $nBaseStory + $nPodiumStory]} {
		set C_dim3 $C_dim3_o
		set C_dim4 $C_dim4_o
	} elseif {$i > $nBaseStory} {
		set C_dim3 $C_dim3_p
		set C_dim4 $C_dim4_p
	} else {
		set C_dim3 $C_dim3_b
		set C_dim4 $C_dim4_b
	}
	
	# Floor nodes ------------------------------------------
	# CW Wall 1
	node [expr 1000*$i + 100 + ($nEleFloor+1)] [expr 144.*$ft] [expr 132.*$ft + $C_dim1] $z
	node [expr 1000*$i + 100 + ($nEleFloor+2)] [expr 144.*$ft] [expr 132.*$ft - $C_dim1] $z
	node [expr 1000*$i + 100 + ($nEleFloor+3)] [expr 144.*$ft + $Centr + $C_dim2] [expr 132.*$ft + $C_dim1] $z 
	node [expr 1000*$i + 100 + ($nEleFloor+4)] [expr 144.*$ft + $Centr + $C_dim2] [expr 132.*$ft - $C_dim1] $z
	node [expr 1000*$i + 100 + ($nEleFloor+5)] [expr 144.*$ft + $Centr + $C_dim2] [expr 132.*$ft + $C_dim1] [expr $z - $C_dim3]
	node [expr 1000*$i + 100 + ($nEleFloor+6)] [expr 144.*$ft + $Centr + $C_dim2] [expr 132.*$ft - $C_dim1] [expr $z - $C_dim3]
	node [expr 1000*$i + 100 + ($nEleFloor+7)] [expr 144.*$ft + $Centr + $C_dim2] [expr 132.*$ft + $C_dim1] [expr $z - $C_dim3 - $C_dim4]
	node [expr 1000*$i + 100 + ($nEleFloor+8)] [expr 144.*$ft + $Centr + $C_dim2] [expr 132.*$ft - $C_dim1] [expr $z - $C_dim3 - $C_dim4]
	
	lappend Nodes [expr 1000*$i + 100 + ($nEleFloor+1)]
	lappend Nodes [expr 1000*$i + 100 + ($nEleFloor+2)]
	lappend Nodes [expr 1000*$i + 100 + ($nEleFloor+3)]
	lappend Nodes [expr 1000*$i + 100 + ($nEleFloor+4)]
	lappend Nodes [expr 1000*$i + 100 + ($nEleFloor+5)]
	lappend Nodes [expr 1000*$i + 100 + ($nEleFloor+6)]
	lappend Nodes [expr 1000*$i + 100 + ($nEleFloor+7)]
	lappend Nodes [expr 1000*$i + 100 + ($nEleFloor+8)]
	
	puts $ModelFile "node [expr 1000*$i + 100 + ($nEleFloor+1)] [expr 144.*$ft] [expr 132.*$ft + $C_dim1] $z"
	puts $ModelFile "node [expr 1000*$i + 100 + ($nEleFloor+2)] [expr 144.*$ft] [expr 132.*$ft - $C_dim1] $z"
	puts $ModelFile "node [expr 1000*$i + 100 + ($nEleFloor+3)] [expr 144.*$ft + $Centr + $C_dim2] [expr 132.*$ft + $C_dim1] $z" 
	puts $ModelFile "node [expr 1000*$i + 100 + ($nEleFloor+4)] [expr 144.*$ft + $Centr + $C_dim2] [expr 132.*$ft - $C_dim1] $z"
	puts $ModelFile "node [expr 1000*$i + 100 + ($nEleFloor+5)] [expr 144.*$ft + $Centr + $C_dim2] [expr 132.*$ft + $C_dim1] [expr $z - $C_dim3]"
	puts $ModelFile "node [expr 1000*$i + 100 + ($nEleFloor+6)] [expr 144.*$ft + $Centr + $C_dim2] [expr 132.*$ft - $C_dim1] [expr $z - $C_dim3]"
	puts $ModelFile "node [expr 1000*$i + 100 + ($nEleFloor+7)] [expr 144.*$ft + $Centr + $C_dim2] [expr 132.*$ft + $C_dim1] [expr $z - $C_dim3 - $C_dim4]"
	puts $ModelFile "node [expr 1000*$i + 100 + ($nEleFloor+8)] [expr 144.*$ft + $Centr + $C_dim2] [expr 132.*$ft - $C_dim1] [expr $z - $C_dim3 - $C_dim4]"
	
	# CW Wall 2
	node [expr 1000*$i + 200 + ($nEleFloor+1)] [expr 144.*$ft + $Centr + $C_dim5 + $Centr] [expr 132.*$ft + $C_dim1] $z
	node [expr 1000*$i + 200 + ($nEleFloor+2)] [expr 144.*$ft + $Centr + $C_dim5 + $Centr] [expr 132.*$ft - $C_dim1] $z
	node [expr 1000*$i + 200 + ($nEleFloor+3)] [expr 144.*$ft + $Centr + $C_dim5 - $C_dim2] [expr 132.*$ft + $C_dim1] $z 
	node [expr 1000*$i + 200 + ($nEleFloor+4)] [expr 144.*$ft + $Centr + $C_dim5 - $C_dim2] [expr 132.*$ft - $C_dim1] $z
	node [expr 1000*$i + 200 + ($nEleFloor+5)] [expr 144.*$ft + $Centr + $C_dim5 - $C_dim2] [expr 132.*$ft + $C_dim1] [expr $z - $C_dim3]
	node [expr 1000*$i + 200 + ($nEleFloor+6)] [expr 144.*$ft + $Centr + $C_dim5 - $C_dim2] [expr 132.*$ft - $C_dim1] [expr $z - $C_dim3]
	node [expr 1000*$i + 200 + ($nEleFloor+7)] [expr 144.*$ft + $Centr + $C_dim5 - $C_dim2] [expr 132.*$ft + $C_dim1] [expr $z - $C_dim3 - $C_dim4]
	node [expr 1000*$i + 200 + ($nEleFloor+8)] [expr 144.*$ft + $Centr + $C_dim5 - $C_dim2] [expr 132.*$ft - $C_dim1] [expr $z - $C_dim3 - $C_dim4]
	
	lappend Nodes [expr 1000*$i + 200 + ($nEleFloor+1)]
	lappend Nodes [expr 1000*$i + 200 + ($nEleFloor+2)]
	lappend Nodes [expr 1000*$i + 200 + ($nEleFloor+3)]
	lappend Nodes [expr 1000*$i + 200 + ($nEleFloor+4)]
	lappend Nodes [expr 1000*$i + 200 + ($nEleFloor+5)]
	lappend Nodes [expr 1000*$i + 200 + ($nEleFloor+6)]
	lappend Nodes [expr 1000*$i + 200 + ($nEleFloor+7)]
	lappend Nodes [expr 1000*$i + 200 + ($nEleFloor+8)]
	
	puts $ModelFile "node [expr 1000*$i + 200 + ($nEleFloor+1)] [expr 144.*$ft + $Centr + $C_dim5 + $Centr] [expr 132.*$ft + $C_dim1] $z"
	puts $ModelFile "node [expr 1000*$i + 200 + ($nEleFloor+2)] [expr 144.*$ft + $Centr + $C_dim5 + $Centr] [expr 132.*$ft - $C_dim1] $z"
	puts $ModelFile "node [expr 1000*$i + 200 + ($nEleFloor+3)] [expr 144.*$ft + $Centr + $C_dim5 - $C_dim2] [expr 132.*$ft + $C_dim1] $z" 
	puts $ModelFile "node [expr 1000*$i + 200 + ($nEleFloor+4)] [expr 144.*$ft + $Centr + $C_dim5 - $C_dim2] [expr 132.*$ft - $C_dim1] $z"
	puts $ModelFile "node [expr 1000*$i + 200 + ($nEleFloor+5)] [expr 144.*$ft + $Centr + $C_dim5 - $C_dim2] [expr 132.*$ft + $C_dim1] [expr $z - $C_dim3]"
	puts $ModelFile "node [expr 1000*$i + 200 + ($nEleFloor+6)] [expr 144.*$ft + $Centr + $C_dim5 - $C_dim2] [expr 132.*$ft - $C_dim1] [expr $z - $C_dim3]"
	puts $ModelFile "node [expr 1000*$i + 200 + ($nEleFloor+7)] [expr 144.*$ft + $Centr + $C_dim5 - $C_dim2] [expr 132.*$ft + $C_dim1] [expr $z - $C_dim3 - $C_dim4]"
	puts $ModelFile "node [expr 1000*$i + 200 + ($nEleFloor+8)] [expr 144.*$ft + $Centr + $C_dim5 - $C_dim2] [expr 132.*$ft - $C_dim1] [expr $z - $C_dim3 - $C_dim4]"
	
}