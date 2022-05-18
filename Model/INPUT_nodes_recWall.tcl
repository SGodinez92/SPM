
# Rectangular wall nodes

# Base nodes
node 1300 [expr 220.*$ft + $RecW_X/2.] [expr 24.*$ft] 0.
node 1400 [expr 48.*$ft] [expr 120.*$ft + $RecW_Y1/2] 0.
node 1500 [expr 268.*$ft] [expr 120.*$ft + $RecW_Y2/2] 0.

lappend Nodes 1500 1600 1700

puts $ModelFile "node 1300 [expr 220.*$ft + $RecW_X/2.] [expr 24.*$ft] 0."
puts $ModelFile "node 1400 [expr 48.*$ft] [expr 120.*$ft + $RecW_Y1/2] 0."
puts $ModelFile "node 1500 [expr 268.*$ft] [expr 120.*$ft + $RecW_Y2/2] 0."

fix 1300 1 1 1 1 1 1
fix 1400 1 1 1 1 1 1
fix 1500 1 1 1 1 1 1

set z 0.; # Current node height
for {set i 1} {$i <= 11} {incr i 1} {

	set H [lindex $storyH $i]; # H = storyH(i)
	
	for {set j 1} {$j <= $nEleFloor} {incr j 1} {
		
		set z [expr $z + $H/$nEleFloor]; # z = z + H/nEleFloor
	
		node [expr 1000*$i + 300 + $j] [expr 220.*$ft + $RecW_X/2.] [expr 24.*$ft] $z;	#RecWallX
		node [expr 1000*$i + 400 + $j] [expr 48.*$ft] [expr 120.*$ft + $RecW_Y1/2] $z;	#RecWallY-1
		node [expr 1000*$i + 500 + $j] [expr 268.*$ft] [expr 120.*$ft + $RecW_Y2/2] $z;	#RecWallY-2
		
		lappend Nodes [expr 1000*$i + 300 + $j]
		lappend Nodes [expr 1000*$i + 400 + $j]
		lappend Nodes [expr 1000*$i + 500 + $j]
		
		puts $ModelFile "node [expr 1000*$i + 300 + $j] [expr 220.*$ft + $RecW_X/2.] [expr 24.*$ft] $z"
		puts $ModelFile "node [expr 1000*$i + 400 + $j] [expr 48.*$ft] [expr 120.*$ft + $RecW_Y1/2] $z"
		puts $ModelFile "node [expr 1000*$i + 500 + $j] [expr 268.*$ft] [expr 120.*$ft + $RecW_Y2/2] $z"
	}
	
	node [expr 1000*$i + 300 + $nEleFloor + 1] [expr 220.*$ft] [expr 24.*$ft] $z;
	node [expr 1000*$i + 300 + $nEleFloor + 2] [expr 220.*$ft + $RecW_X] [expr 24.*$ft] $z;
	
	node [expr 1000*$i + 400 + $nEleFloor + 1] [expr 48.*$ft] [expr 120.*$ft] $z;
	node [expr 1000*$i + 400 + $nEleFloor + 2] [expr 48.*$ft] [expr 120.*$ft + $RecW_Y1] $z;
	
	node [expr 1000*$i + 500 + $nEleFloor + 1] [expr 268.*$ft] [expr 120.*$ft] $z;
	node [expr 1000*$i + 500 + $nEleFloor + 2] [expr 268.*$ft] [expr 120.*$ft + $RecW_Y2] $z;
	
	lappend Nodes [expr 1000*$i + 300 + $nEleFloor + 1]
	lappend Nodes [expr 1000*$i + 300 + $nEleFloor + 2]
	lappend Nodes [expr 1000*$i + 400 + $nEleFloor + 1]
	lappend Nodes [expr 1000*$i + 400 + $nEleFloor + 2]
	lappend Nodes [expr 1000*$i + 500 + $nEleFloor + 1]
	lappend Nodes [expr 1000*$i + 500 + $nEleFloor + 2]
	
	puts $ModelFile "node [expr 1000*$i + 300 + $nEleFloor + 1] [expr 220.*$ft] [expr 24.*$ft] $z"
	puts $ModelFile "node [expr 1000*$i + 300 + $nEleFloor + 2] [expr 220.*$ft + $RecW_X] [expr 24.*$ft] $z"
	puts $ModelFile "node [expr 1000*$i + 400 + $nEleFloor + 1] [expr 48.*$ft] [expr 120.*$ft] $z"
	puts $ModelFile "node [expr 1000*$i + 400 + $nEleFloor + 2] [expr 48.*$ft] [expr 120.*$ft + $RecW_Y1] $z"
	puts $ModelFile "node [expr 1000*$i + 500 + $nEleFloor + 1] [expr 268.*$ft] [expr 120.*$ft] $z"
	puts $ModelFile "node [expr 1000*$i + 500 + $nEleFloor + 2] [expr 268.*$ft] [expr 120.*$ft + $RecW_Y2] $z"
}