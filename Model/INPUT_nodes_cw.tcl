

set storyH {StoryHeights $baseH};
for {set i 1} {$i < $nBaseStory} {incr i 1} {
	lappend storyH $baseH; 
}

for {set i 1} {$i <= $nPodiumStory} {incr i 1} {
	lappend storyH $podiumH; 
}

for {set i 1} {$i <= [expr $nPodiumStory2 + 1]} {incr i 1} {
	lappend storyH $offStoryH; 
}

for {set i 1} {$i <= [expr $nTypStory]} {incr i 1} {
	lappend storyH $typStoryH; 
}

set Nodes {}; # This will be used to store all nodeTags created. This is useful if displacement recorders for all nodes are to be set in order to plot deflected shapes.

# Base Nodes ------------
node 1100 [expr 72.*$ft + $Centr] [expr 132.*$ft] 0.; #Wall 1 CW1
node 1200 [expr 72.*$ft + $Centr + $C_dim5] [expr 132.*$ft] 0.; #Wall 2 CW1

node 1300 [expr 220.*$ft + $Centr] [expr 132.*$ft] 0.; #Wall 1 CW2
node 1400 [expr 220.*$ft + $Centr + $C_dim5] [expr 132.*$ft] 0.; #Wall 2 CW2

lappend Nodes 1100 1200 1300 1400;

puts $ModelFile "node 1100 [expr 72.*$ft + $Centr] [expr 132.*$ft] 0."
puts $ModelFile "node 1200 [expr 72.*$ft + $Centr + $C_dim5] [expr 132.*$ft] 0."
puts $ModelFile "node 1300 [expr 220.*$ft + $Centr] [expr 132.*$ft] 0."
puts $ModelFile "node 1400 [expr 220.*$ft + $Centr + $C_dim5] [expr 132.*$ft] 0."

# Boundary Conditions -------------
fix 1100 1 1 1 1 1 1;
fix 1200 1 1 1 1 1 1;
fix 1300 1 1 1 1 1 1;
fix 1400 1 1 1 1 1 1;

# All other nodes -----------------------------------

set z 0.; # Current node height
for {set i 1} {$i <= $nStory} {incr i 1} {

	set H [lindex $storyH $i]; # H = storyH(i)
	
	# Wall nodes ------------------------------------------
	for {set j 1} {$j <= $nEleFloor} {incr j 1} {
		set z [expr $z + $H/$nEleFloor]; # z = z + H/nEleFloor
		
		node [expr 1000*$i + 100 + $j] [expr 72.*$ft + $Centr] [expr 132.*$ft] $z; 				#Wall 1 CW1
		node [expr 1000*$i + 200 + $j] [expr 72.*$ft + $Centr + $C_dim5] [expr 132.*$ft] $z; 	#Wall 2 CW1
		node [expr 1000*$i + 300 + $j] [expr 220.*$ft + $Centr] [expr 132.*$ft] $z; 			#Wall 1 CW2
		node [expr 1000*$i + 400 + $j] [expr 220.*$ft + $Centr + $C_dim5] [expr 132.*$ft] $z; 	#Wall 2 CW2
		
		lappend Nodes [expr 1000*$i + 100 + $j];
		lappend Nodes [expr 1000*$i + 200 + $j];
		lappend Nodes [expr 1000*$i + 300 + $j];
		lappend Nodes [expr 1000*$i + 400 + $j];
		
		puts $ModelFile "node [expr 1000*$i + 100 + $j] [expr 72.*$ft + $Centr] [expr 132.*$ft] $z"
		puts $ModelFile "node [expr 1000*$i + 200 + $j] [expr 72.*$ft + $Centr + $C_dim5] [expr 132.*$ft] $z"
		puts $ModelFile "node [expr 1000*$i + 300 + $j] [expr 220.*$ft + $Centr] [expr 132.*$ft] $z"
		puts $ModelFile "node [expr 1000*$i + 400 + $j] [expr 220.*$ft + $Centr + $C_dim5] [expr 132.*$ft] $z"
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
	# CW1 Wall 1
	node [expr 1000*$i + 100 + ($nEleFloor+1)] [expr 72.*$ft] [expr 132.*$ft + $C_dim1] $z
	node [expr 1000*$i + 100 + ($nEleFloor+2)] [expr 72.*$ft] [expr 132.*$ft - $C_dim1] $z
	node [expr 1000*$i + 100 + ($nEleFloor+3)] [expr 72.*$ft + $Centr + $C_dim2] [expr 132.*$ft + $C_dim1] $z 
	node [expr 1000*$i + 100 + ($nEleFloor+4)] [expr 72.*$ft + $Centr + $C_dim2] [expr 132.*$ft - $C_dim1] $z
	node [expr 1000*$i + 100 + ($nEleFloor+5)] [expr 72.*$ft + $Centr + $C_dim2] [expr 132.*$ft + $C_dim1] [expr $z - $C_dim3]
	node [expr 1000*$i + 100 + ($nEleFloor+6)] [expr 72.*$ft + $Centr + $C_dim2] [expr 132.*$ft - $C_dim1] [expr $z - $C_dim3]
	node [expr 1000*$i + 100 + ($nEleFloor+7)] [expr 72.*$ft + $Centr + $C_dim2] [expr 132.*$ft + $C_dim1] [expr $z - $C_dim3 - $C_dim4]
	node [expr 1000*$i + 100 + ($nEleFloor+8)] [expr 72.*$ft + $Centr + $C_dim2] [expr 132.*$ft - $C_dim1] [expr $z - $C_dim3 - $C_dim4]
	
	lappend Nodes [expr 1000*$i + 100 + ($nEleFloor+1)]
	lappend Nodes [expr 1000*$i + 100 + ($nEleFloor+2)]
	lappend Nodes [expr 1000*$i + 100 + ($nEleFloor+3)]
	lappend Nodes [expr 1000*$i + 100 + ($nEleFloor+4)]
	lappend Nodes [expr 1000*$i + 100 + ($nEleFloor+5)]
	lappend Nodes [expr 1000*$i + 100 + ($nEleFloor+6)]
	lappend Nodes [expr 1000*$i + 100 + ($nEleFloor+7)]
	lappend Nodes [expr 1000*$i + 100 + ($nEleFloor+8)]
	
	puts $ModelFile "node [expr 1000*$i + 100 + ($nEleFloor+1)] [expr 72.*$ft] [expr 132.*$ft + $C_dim1] $z"
	puts $ModelFile "node [expr 1000*$i + 100 + ($nEleFloor+2)] [expr 72.*$ft] [expr 132.*$ft - $C_dim1] $z"
	puts $ModelFile "node [expr 1000*$i + 100 + ($nEleFloor+3)] [expr 72.*$ft + $Centr + $C_dim2] [expr 132.*$ft + $C_dim1] $z" 
	puts $ModelFile "node [expr 1000*$i + 100 + ($nEleFloor+4)] [expr 72.*$ft + $Centr + $C_dim2] [expr 132.*$ft - $C_dim1] $z"
	puts $ModelFile "node [expr 1000*$i + 100 + ($nEleFloor+5)] [expr 72.*$ft + $Centr + $C_dim2] [expr 132.*$ft + $C_dim1] [expr $z - $C_dim3]"
	puts $ModelFile "node [expr 1000*$i + 100 + ($nEleFloor+6)] [expr 72.*$ft + $Centr + $C_dim2] [expr 132.*$ft - $C_dim1] [expr $z - $C_dim3]"
	puts $ModelFile "node [expr 1000*$i + 100 + ($nEleFloor+7)] [expr 72.*$ft + $Centr + $C_dim2] [expr 132.*$ft + $C_dim1] [expr $z - $C_dim3 - $C_dim4]"
	puts $ModelFile "node [expr 1000*$i + 100 + ($nEleFloor+8)] [expr 72.*$ft + $Centr + $C_dim2] [expr 132.*$ft - $C_dim1] [expr $z - $C_dim3 - $C_dim4]"
	
	# CW1 Wall 2
	node [expr 1000*$i + 200 + ($nEleFloor+1)] [expr 72.*$ft + $Centr + $C_dim5 + $Centr] [expr 132.*$ft + $C_dim1] $z
	node [expr 1000*$i + 200 + ($nEleFloor+2)] [expr 72.*$ft + $Centr + $C_dim5 + $Centr] [expr 132.*$ft - $C_dim1] $z
	node [expr 1000*$i + 200 + ($nEleFloor+3)] [expr 72.*$ft + $Centr + $C_dim5 - $C_dim2] [expr 132.*$ft + $C_dim1] $z 
	node [expr 1000*$i + 200 + ($nEleFloor+4)] [expr 72.*$ft + $Centr + $C_dim5 - $C_dim2] [expr 132.*$ft - $C_dim1] $z
	node [expr 1000*$i + 200 + ($nEleFloor+5)] [expr 72.*$ft + $Centr + $C_dim5 - $C_dim2] [expr 132.*$ft + $C_dim1] [expr $z - $C_dim3]
	node [expr 1000*$i + 200 + ($nEleFloor+6)] [expr 72.*$ft + $Centr + $C_dim5 - $C_dim2] [expr 132.*$ft - $C_dim1] [expr $z - $C_dim3]
	node [expr 1000*$i + 200 + ($nEleFloor+7)] [expr 72.*$ft + $Centr + $C_dim5 - $C_dim2] [expr 132.*$ft + $C_dim1] [expr $z - $C_dim3 - $C_dim4]
	node [expr 1000*$i + 200 + ($nEleFloor+8)] [expr 72.*$ft + $Centr + $C_dim5 - $C_dim2] [expr 132.*$ft - $C_dim1] [expr $z - $C_dim3 - $C_dim4]
	
	lappend Nodes [expr 1000*$i + 200 + ($nEleFloor+1)]
	lappend Nodes [expr 1000*$i + 200 + ($nEleFloor+2)]
	lappend Nodes [expr 1000*$i + 200 + ($nEleFloor+3)]
	lappend Nodes [expr 1000*$i + 200 + ($nEleFloor+4)]
	lappend Nodes [expr 1000*$i + 200 + ($nEleFloor+5)]
	lappend Nodes [expr 1000*$i + 200 + ($nEleFloor+6)]
	lappend Nodes [expr 1000*$i + 200 + ($nEleFloor+7)]
	lappend Nodes [expr 1000*$i + 200 + ($nEleFloor+8)]
	
	puts $ModelFile "node [expr 1000*$i + 200 + ($nEleFloor+1)] [expr 72.*$ft + $Centr + $C_dim5 + $Centr] [expr 132.*$ft + $C_dim1] $z"
	puts $ModelFile "node [expr 1000*$i + 200 + ($nEleFloor+2)] [expr 72.*$ft + $Centr + $C_dim5 + $Centr] [expr 132.*$ft - $C_dim1] $z"
	puts $ModelFile "node [expr 1000*$i + 200 + ($nEleFloor+3)] [expr 72.*$ft + $Centr + $C_dim5 - $C_dim2] [expr 132.*$ft + $C_dim1] $z" 
	puts $ModelFile "node [expr 1000*$i + 200 + ($nEleFloor+4)] [expr 72.*$ft + $Centr + $C_dim5 - $C_dim2] [expr 132.*$ft - $C_dim1] $z"
	puts $ModelFile "node [expr 1000*$i + 200 + ($nEleFloor+5)] [expr 72.*$ft + $Centr + $C_dim5 - $C_dim2] [expr 132.*$ft + $C_dim1] [expr $z - $C_dim3]"
	puts $ModelFile "node [expr 1000*$i + 200 + ($nEleFloor+6)] [expr 72.*$ft + $Centr + $C_dim5 - $C_dim2] [expr 132.*$ft - $C_dim1] [expr $z - $C_dim3]"
	puts $ModelFile "node [expr 1000*$i + 200 + ($nEleFloor+7)] [expr 72.*$ft + $Centr + $C_dim5 - $C_dim2] [expr 132.*$ft + $C_dim1] [expr $z - $C_dim3 - $C_dim4]"
	puts $ModelFile "node [expr 1000*$i + 200 + ($nEleFloor+8)] [expr 72.*$ft + $Centr + $C_dim5 - $C_dim2] [expr 132.*$ft - $C_dim1] [expr $z - $C_dim3 - $C_dim4]"
	
	# CW2 Wall 1
	node [expr 1000*$i + 300 + ($nEleFloor+1)] [expr 220.*$ft] [expr 132.*$ft + $C_dim1] $z
	node [expr 1000*$i + 300 + ($nEleFloor+2)] [expr 220.*$ft] [expr 132.*$ft - $C_dim1] $z
	node [expr 1000*$i + 300 + ($nEleFloor+3)] [expr 220.*$ft + $Centr + $C_dim2] [expr 132.*$ft + $C_dim1] $z 
	node [expr 1000*$i + 300 + ($nEleFloor+4)] [expr 220.*$ft + $Centr + $C_dim2] [expr 132.*$ft - $C_dim1] $z
	node [expr 1000*$i + 300 + ($nEleFloor+5)] [expr 220.*$ft + $Centr + $C_dim2] [expr 132.*$ft + $C_dim1] [expr $z - $C_dim3]
	node [expr 1000*$i + 300 + ($nEleFloor+6)] [expr 220.*$ft + $Centr + $C_dim2] [expr 132.*$ft - $C_dim1] [expr $z - $C_dim3]
	node [expr 1000*$i + 300 + ($nEleFloor+7)] [expr 220.*$ft + $Centr + $C_dim2] [expr 132.*$ft + $C_dim1] [expr $z - $C_dim3 - $C_dim4]
	node [expr 1000*$i + 300 + ($nEleFloor+8)] [expr 220.*$ft + $Centr + $C_dim2] [expr 132.*$ft - $C_dim1] [expr $z - $C_dim3 - $C_dim4]
	
	lappend Nodes [expr 1000*$i + 300 + ($nEleFloor+1)]
	lappend Nodes [expr 1000*$i + 300 + ($nEleFloor+2)]
	lappend Nodes [expr 1000*$i + 300 + ($nEleFloor+3)]
	lappend Nodes [expr 1000*$i + 300 + ($nEleFloor+4)]
	lappend Nodes [expr 1000*$i + 300 + ($nEleFloor+5)]
	lappend Nodes [expr 1000*$i + 300 + ($nEleFloor+6)]
	lappend Nodes [expr 1000*$i + 300 + ($nEleFloor+7)]
	lappend Nodes [expr 1000*$i + 300 + ($nEleFloor+8)]
	
	puts $ModelFile "node [expr 1000*$i + 300 + ($nEleFloor+1)] [expr 220.*$ft] [expr 132.*$ft + $C_dim1] $z"
	puts $ModelFile "node [expr 1000*$i + 300 + ($nEleFloor+2)] [expr 220.*$ft] [expr 132.*$ft - $C_dim1] $z"
	puts $ModelFile "node [expr 1000*$i + 300 + ($nEleFloor+3)] [expr 220.*$ft + $Centr + $C_dim2] [expr 132.*$ft + $C_dim1] $z" 
	puts $ModelFile "node [expr 1000*$i + 300 + ($nEleFloor+4)] [expr 220.*$ft + $Centr + $C_dim2] [expr 132.*$ft - $C_dim1] $z"
	puts $ModelFile "node [expr 1000*$i + 300 + ($nEleFloor+5)] [expr 220.*$ft + $Centr + $C_dim2] [expr 132.*$ft + $C_dim1] [expr $z - $C_dim3]"
	puts $ModelFile "node [expr 1000*$i + 300 + ($nEleFloor+6)] [expr 220.*$ft + $Centr + $C_dim2] [expr 132.*$ft - $C_dim1] [expr $z - $C_dim3]"
	puts $ModelFile "node [expr 1000*$i + 300 + ($nEleFloor+7)] [expr 220.*$ft + $Centr + $C_dim2] [expr 132.*$ft + $C_dim1] [expr $z - $C_dim3 - $C_dim4]"
	puts $ModelFile "node [expr 1000*$i + 300 + ($nEleFloor+8)] [expr 220.*$ft + $Centr + $C_dim2] [expr 132.*$ft - $C_dim1] [expr $z - $C_dim3 - $C_dim4]"
	
	# CW2 Wall 2
	node [expr 1000*$i + 400 + ($nEleFloor+1)] [expr 220.*$ft + $Centr + $C_dim5 + $Centr] [expr 132.*$ft + $C_dim1] $z
	node [expr 1000*$i + 400 + ($nEleFloor+2)] [expr 220.*$ft + $Centr + $C_dim5 + $Centr] [expr 132.*$ft - $C_dim1] $z
	node [expr 1000*$i + 400 + ($nEleFloor+3)] [expr 220.*$ft + $Centr + $C_dim5 - $C_dim2] [expr 132.*$ft + $C_dim1] $z 
	node [expr 1000*$i + 400 + ($nEleFloor+4)] [expr 220.*$ft + $Centr + $C_dim5 - $C_dim2] [expr 132.*$ft - $C_dim1] $z
	node [expr 1000*$i + 400 + ($nEleFloor+5)] [expr 220.*$ft + $Centr + $C_dim5 - $C_dim2] [expr 132.*$ft + $C_dim1] [expr $z - $C_dim3]
	node [expr 1000*$i + 400 + ($nEleFloor+6)] [expr 220.*$ft + $Centr + $C_dim5 - $C_dim2] [expr 132.*$ft - $C_dim1] [expr $z - $C_dim3]
	node [expr 1000*$i + 400 + ($nEleFloor+7)] [expr 220.*$ft + $Centr + $C_dim5 - $C_dim2] [expr 132.*$ft + $C_dim1] [expr $z - $C_dim3 - $C_dim4]
	node [expr 1000*$i + 400 + ($nEleFloor+8)] [expr 220.*$ft + $Centr + $C_dim5 - $C_dim2] [expr 132.*$ft - $C_dim1] [expr $z - $C_dim3 - $C_dim4]
	
	lappend Nodes [expr 1000*$i + 400 + ($nEleFloor+1)]
	lappend Nodes [expr 1000*$i + 400 + ($nEleFloor+2)]
	lappend Nodes [expr 1000*$i + 400 + ($nEleFloor+3)]
	lappend Nodes [expr 1000*$i + 400 + ($nEleFloor+4)]
	lappend Nodes [expr 1000*$i + 400 + ($nEleFloor+5)]
	lappend Nodes [expr 1000*$i + 400 + ($nEleFloor+6)]
	lappend Nodes [expr 1000*$i + 400 + ($nEleFloor+7)]
	lappend Nodes [expr 1000*$i + 400 + ($nEleFloor+8)]
	
	puts $ModelFile "node [expr 1000*$i + 400 + ($nEleFloor+1)] [expr 220.*$ft + $Centr + $C_dim5 + $Centr] [expr 132.*$ft + $C_dim1] $z"
	puts $ModelFile "node [expr 1000*$i + 400 + ($nEleFloor+2)] [expr 220.*$ft + $Centr + $C_dim5 + $Centr] [expr 132.*$ft - $C_dim1] $z"
	puts $ModelFile "node [expr 1000*$i + 400 + ($nEleFloor+3)] [expr 220.*$ft + $Centr + $C_dim5 - $C_dim2] [expr 132.*$ft + $C_dim1] $z" 
	puts $ModelFile "node [expr 1000*$i + 400 + ($nEleFloor+4)] [expr 220.*$ft + $Centr + $C_dim5 - $C_dim2] [expr 132.*$ft - $C_dim1] $z"
	puts $ModelFile "node [expr 1000*$i + 400 + ($nEleFloor+5)] [expr 220.*$ft + $Centr + $C_dim5 - $C_dim2] [expr 132.*$ft + $C_dim1] [expr $z - $C_dim3]"
	puts $ModelFile "node [expr 1000*$i + 400 + ($nEleFloor+6)] [expr 220.*$ft + $Centr + $C_dim5 - $C_dim2] [expr 132.*$ft - $C_dim1] [expr $z - $C_dim3]"
	puts $ModelFile "node [expr 1000*$i + 400 + ($nEleFloor+7)] [expr 220.*$ft + $Centr + $C_dim5 - $C_dim2] [expr 132.*$ft + $C_dim1] [expr $z - $C_dim3 - $C_dim4]"
	puts $ModelFile "node [expr 1000*$i + 400 + ($nEleFloor+8)] [expr 220.*$ft + $Centr + $C_dim5 - $C_dim2] [expr 132.*$ft - $C_dim1] [expr $z - $C_dim3 - $C_dim4]"
}