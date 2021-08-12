
# Rectangular wall nodes

# Base nodes
node 1500 [expr $RecW_X1/2.] [expr 72.*$ft] 0.
node 1600 [expr $RecW_X2/2.] [expr 144.*$ft] 0.
node 1700 [expr 272.*$ft] [expr 36.*$ft] 0.

lappend Nodes 1500 1600 1700

puts $ModelFile "node 1500 [expr $RecW_X1/2.] [expr 72.*$ft] 0."
puts $ModelFile "node 1600 [expr $RecW_X2/2.] [expr 144.*$ft] 0."
puts $ModelFile "node 1700 [expr 272.*$ft] [expr 36.*$ft] 0."

fix 1500 1 1 1 1 1 1
fix 1600 1 1 1 1 1 1
fix 1700 1 1 1 1 1 1

node [expr 500 + $nEleFloor + 1] 0.0 [expr 72.*$ft] 0. 
node [expr 600 + $nEleFloor + 1] 0.0 [expr 144.*$ft] 0.

lappend Nodes [expr 500 + $nEleFloor + 1]
lappend Nodes [expr 600 + $nEleFloor + 1]

puts $ModelFile "node [expr 500 + $nEleFloor + 1] 0.0 [expr 72.*$ft] 0."
puts $ModelFile "node [expr 600 + $nEleFloor + 1] 0.0 [expr 144.*$ft] 0."

fix [expr 500 + $nEleFloor + 1] 1 1 1 1 1 1
fix [expr 600 + $nEleFloor + 1] 1 1 1 1 1 1

set z 0.; # Current node height
for {set i 1} {$i <= 11} {incr i 1} {

	set H [lindex $storyH $i]; # H = storyH(i)
	
	for {set j 1} {$j <= $nEleFloor} {incr j 1} {
		
		set z [expr $z + $H/$nEleFloor]; # z = z + H/nEleFloor
	
		node [expr 1000*$i + 500 + $j] [expr $RecW_X1/2.] [expr 72.*$ft] $z;	#RecWallX-1
		node [expr 1000*$i + 600 + $j] [expr $RecW_X2/2.] [expr 144.*$ft] $z;	#RecWallX-2
		node [expr 1000*$i + 700 + $j] [expr 272.*$ft] [expr 36.*$ft] $z;	#RecWallY
		
		lappend Nodes [expr 1000*$i + 500 + $j]
		lappend Nodes [expr 1000*$i + 600 + $j]
		lappend Nodes [expr 1000*$i + 700 + $j]
		
		puts $ModelFile "node [expr 1000*$i + 500 + $j] [expr $RecW_X1/2.] [expr 72.*$ft] $z"
		puts $ModelFile "node [expr 1000*$i + 600 + $j] [expr $RecW_X2/2.] [expr 144.*$ft] $z"
		puts $ModelFile "node [expr 1000*$i + 700 + $j] [expr 272.*$ft] [expr 36.*$ft] $z"
	}
	
	node [expr 1000*$i + 500 + $nEleFloor + 1] 0.0 [expr 72.*$ft] $z;
	node [expr 1000*$i + 500 + $nEleFloor + 2] $RecW_X1 [expr 72.*$ft] $z;
	
	node [expr 1000*$i + 600 + $nEleFloor + 1] 0.0 [expr 144.*$ft] $z;
	node [expr 1000*$i + 600 + $nEleFloor + 2] $RecW_X2 [expr 144.*$ft] $z;
	
	node [expr 1000*$i + 700 + $nEleFloor + 1] [expr 272.*$ft] [expr 36.*$ft - $RecW_Y/2] $z;
	node [expr 1000*$i + 700 + $nEleFloor + 2] [expr 272.*$ft] [expr 36.*$ft + $RecW_Y/2] $z;
	
	lappend Nodes [expr 1000*$i + 500 + $nEleFloor + 1]
	lappend Nodes [expr 1000*$i + 500 + $nEleFloor + 2]
	lappend Nodes [expr 1000*$i + 600 + $nEleFloor + 1]
	lappend Nodes [expr 1000*$i + 600 + $nEleFloor + 2]
	lappend Nodes [expr 1000*$i + 700 + $nEleFloor + 1]
	lappend Nodes [expr 1000*$i + 700 + $nEleFloor + 2]
	
	puts $ModelFile "node [expr 1000*$i + 500 + $nEleFloor + 1] 0.0 [expr 72.*$ft] $z"
	puts $ModelFile "node [expr 1000*$i + 500 + $nEleFloor + 2] $RecW_X1 [expr 72.*$ft] $z"
	puts $ModelFile "node [expr 1000*$i + 600 + $nEleFloor + 1] 0.0 [expr 144.*$ft] $z"
	puts $ModelFile "node [expr 1000*$i + 600 + $nEleFloor + 2] $RecW_X2 [expr 144.*$ft] $z"
	puts $ModelFile "node [expr 1000*$i + 700 + $nEleFloor + 1] [expr 272.*$ft] [expr 36.*$ft - $RecW_Y/2] $z"
	puts $ModelFile "node [expr 1000*$i + 700 + $nEleFloor + 2] [expr 272.*$ft] [expr 36.*$ft + $RecW_Y/2] $z"
}