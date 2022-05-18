
# All columns nodes

set z 0.; # Current node height

# Basements
for {set i 0} {$i <= $nBaseStory} {incr i 1} {

	if {$i == 0} {
	} else {
		set H [lindex $storyH $i]; # H = storyH(i)
		set z [expr $z + $H]; # z = z + H
	}
	
	set nodeTag [expr 1000*$i + 800]
	
	node [expr $nodeTag + 1] 0.0 0.0 $z
	node [expr $nodeTag + 2] [expr 24.*$ft] 0.0 $z
	node [expr $nodeTag + 3] [expr 48.*$ft] 0.0 $z
	node [expr $nodeTag + 4] [expr 72.*$ft] 0.0 $z
	node [expr $nodeTag + 5] [expr 96.*$ft] 0.0 $z
	node [expr $nodeTag + 6] [expr 120.*$ft] 0.0 $z
	node [expr $nodeTag + 7] [expr 144.*$ft] 0.0 $z
	node [expr $nodeTag + 8] [expr 172.*$ft] 0.0 $z
	node [expr $nodeTag + 9] [expr 196.*$ft] 0.0 $z
	node [expr $nodeTag + 10] [expr 220.*$ft] 0.0 $z
	node [expr $nodeTag + 11] [expr 244.*$ft] 0.0 $z
	node [expr $nodeTag + 12] [expr 268.*$ft] 0.0 $z
	node [expr $nodeTag + 13] [expr 292.*$ft] 0.0 $z
	
	node [expr $nodeTag + 14] 0.0 [expr 24.*$ft] $z
	node [expr $nodeTag + 15] [expr 24.*$ft] [expr 24.*$ft] $z
	node [expr $nodeTag + 16] [expr 48.*$ft] [expr 24.*$ft] $z
	node [expr $nodeTag + 17] [expr 72.*$ft] [expr 24.*$ft] $z
	node [expr $nodeTag + 18] [expr 96.*$ft] [expr 24.*$ft] $z
	node [expr $nodeTag + 19] [expr 120.*$ft] [expr 24.*$ft] $z
	node [expr $nodeTag + 20] [expr 144.*$ft] [expr 24.*$ft] $z
	node [expr $nodeTag + 21] [expr 172.*$ft] [expr 24.*$ft] $z
	node [expr $nodeTag + 22] [expr 196.*$ft] [expr 24.*$ft] $z
	node [expr $nodeTag + 23] [expr 268.*$ft] [expr 24.*$ft] $z
	node [expr $nodeTag + 24] [expr 292.*$ft] [expr 24.*$ft] $z
	
	node [expr $nodeTag + 25] 0.0 [expr 48.*$ft] $z
	node [expr $nodeTag + 26] [expr 24.*$ft] [expr 48.*$ft] $z
	node [expr $nodeTag + 27] [expr 48.*$ft] [expr 48.*$ft] $z
	node [expr $nodeTag + 28] [expr 72.*$ft] [expr 48.*$ft] $z
	node [expr $nodeTag + 29] [expr 96.*$ft] [expr 48.*$ft] $z
	node [expr $nodeTag + 30] [expr 120.*$ft] [expr 48.*$ft] $z
	node [expr $nodeTag + 31] [expr 144.*$ft] [expr 48.*$ft] $z
	node [expr $nodeTag + 32] [expr 172.*$ft] [expr 48.*$ft] $z
	node [expr $nodeTag + 33] [expr 196.*$ft] [expr 48.*$ft] $z
	node [expr $nodeTag + 34] [expr 220.*$ft] [expr 48.*$ft] $z
	node [expr $nodeTag + 35] [expr 244.*$ft] [expr 48.*$ft] $z
	node [expr $nodeTag + 36] [expr 268.*$ft] [expr 48.*$ft] $z
	node [expr $nodeTag + 37] [expr 292.*$ft] [expr 48.*$ft] $z
	
	node [expr $nodeTag + 38] 0.0 [expr 72.*$ft] $z
	node [expr $nodeTag + 39] [expr 24.*$ft] [expr 72.*$ft] $z
	node [expr $nodeTag + 40] [expr 48.*$ft] [expr 72.*$ft] $z
	node [expr $nodeTag + 41] [expr 72.*$ft] [expr 72.*$ft] $z
	node [expr $nodeTag + 42] [expr 96.*$ft] [expr 72.*$ft] $z
	node [expr $nodeTag + 43] [expr 120.*$ft] [expr 72.*$ft] $z
	node [expr $nodeTag + 44] [expr 144.*$ft] [expr 72.*$ft] $z
	node [expr $nodeTag + 45] [expr 172.*$ft] [expr 72.*$ft] $z
	node [expr $nodeTag + 46] [expr 196.*$ft] [expr 72.*$ft] $z
	node [expr $nodeTag + 47] [expr 220.*$ft] [expr 72.*$ft] $z
	node [expr $nodeTag + 48] [expr 244.*$ft] [expr 72.*$ft] $z
	node [expr $nodeTag + 49] [expr 268.*$ft] [expr 72.*$ft] $z
	node [expr $nodeTag + 50] [expr 292.*$ft] [expr 72.*$ft] $z
	
	node [expr $nodeTag + 51] 0.0 [expr 96.*$ft] $z
	node [expr $nodeTag + 52] [expr 24.*$ft] [expr 96.*$ft] $z
	node [expr $nodeTag + 53] [expr 48.*$ft] [expr 96.*$ft] $z
	node [expr $nodeTag + 54] [expr 72.*$ft] [expr 96.*$ft] $z
	node [expr $nodeTag + 55] [expr 96.*$ft] [expr 96.*$ft] $z
	node [expr $nodeTag + 56] [expr 120.*$ft] [expr 96.*$ft] $z
	node [expr $nodeTag + 57] [expr 144.*$ft] [expr 96.*$ft] $z
	node [expr $nodeTag + 58] [expr 172.*$ft] [expr 96.*$ft] $z
	node [expr $nodeTag + 59] [expr 196.*$ft] [expr 96.*$ft] $z
	node [expr $nodeTag + 60] [expr 220.*$ft] [expr 96.*$ft] $z
	node [expr $nodeTag + 61] [expr 244.*$ft] [expr 96.*$ft] $z
	node [expr $nodeTag + 62] [expr 268.*$ft] [expr 96.*$ft] $z
	node [expr $nodeTag + 63] [expr 292.*$ft] [expr 96.*$ft] $z
	
	node [expr $nodeTag + 64] 0.0 [expr 120.*$ft] $z
	node [expr $nodeTag + 65] [expr 24.*$ft] [expr 120.*$ft] $z
	node [expr $nodeTag + 66] [expr 72.*$ft] [expr 120.*$ft] $z
	node [expr $nodeTag + 67] [expr 96.*$ft] [expr 120.*$ft] $z
	node [expr $nodeTag + 68] [expr 120.*$ft] [expr 120.*$ft] $z
	node [expr $nodeTag + 69] [expr 196.*$ft] [expr 120.*$ft] $z
	node [expr $nodeTag + 70] [expr 220.*$ft] [expr 120.*$ft] $z
	node [expr $nodeTag + 71] [expr 244.*$ft] [expr 120.*$ft] $z
	node [expr $nodeTag + 72] [expr 292.*$ft] [expr 120.*$ft] $z
	
	node [expr $nodeTag + 73] 0.0 [expr 144.*$ft] $z
	node [expr $nodeTag + 74] [expr 24.*$ft] [expr 144.*$ft] $z
	node [expr $nodeTag + 75] [expr 72.*$ft] [expr 144.*$ft] $z
	node [expr $nodeTag + 76] [expr 96.*$ft] [expr 144.*$ft] $z
	node [expr $nodeTag + 77] [expr 120.*$ft] [expr 144.*$ft] $z
	node [expr $nodeTag + 78] [expr 196.*$ft] [expr 144.*$ft] $z
	node [expr $nodeTag + 79] [expr 220.*$ft] [expr 144.*$ft] $z
	node [expr $nodeTag + 80] [expr 244.*$ft] [expr 144.*$ft] $z
	node [expr $nodeTag + 81] [expr 292.*$ft] [expr 144.*$ft] $z
	
	node [expr $nodeTag + 82] 0.0 [expr 168.*$ft] $z
	node [expr $nodeTag + 83] [expr 24.*$ft] [expr 168.*$ft] $z
	node [expr $nodeTag + 84] [expr 48.*$ft] [expr 168.*$ft] $z
	node [expr $nodeTag + 85] [expr 72.*$ft] [expr 168.*$ft] $z
	node [expr $nodeTag + 86] [expr 96.*$ft] [expr 168.*$ft] $z
	node [expr $nodeTag + 87] [expr 120.*$ft] [expr 168.*$ft] $z
	node [expr $nodeTag + 88] [expr 144.*$ft] [expr 168.*$ft] $z
	node [expr $nodeTag + 89] [expr 172.*$ft] [expr 168.*$ft] $z
	node [expr $nodeTag + 90] [expr 196.*$ft] [expr 168.*$ft] $z
	node [expr $nodeTag + 91] [expr 220.*$ft] [expr 168.*$ft] $z
	node [expr $nodeTag + 92] [expr 244.*$ft] [expr 168.*$ft] $z
	node [expr $nodeTag + 93] [expr 268.*$ft] [expr 168.*$ft] $z
	node [expr $nodeTag + 94] [expr 292.*$ft] [expr 168.*$ft] $z
	
	puts $ModelFile "node [expr $nodeTag + 1] 0.0 0.0 $z"
	puts $ModelFile "node [expr $nodeTag + 2] [expr 24.*$ft] 0.0 $z"
	puts $ModelFile "node [expr $nodeTag + 3] [expr 48.*$ft] 0.0 $z"
	puts $ModelFile "node [expr $nodeTag + 4] [expr 72.*$ft] 0.0 $z"
	puts $ModelFile "node [expr $nodeTag + 5] [expr 96.*$ft] 0.0 $z"
	puts $ModelFile "node [expr $nodeTag + 6] [expr 120.*$ft] 0.0 $z"
	puts $ModelFile "node [expr $nodeTag + 7] [expr 144.*$ft] 0.0 $z"
	puts $ModelFile "node [expr $nodeTag + 8] [expr 172.*$ft] 0.0 $z"
	puts $ModelFile "node [expr $nodeTag + 9] [expr 196.*$ft] 0.0 $z"
	puts $ModelFile "node [expr $nodeTag + 10] [expr 220.*$ft] 0.0 $z"
	puts $ModelFile "node [expr $nodeTag + 11] [expr 244.*$ft] 0.0 $z"
	puts $ModelFile "node [expr $nodeTag + 12] [expr 268.*$ft] 0.0 $z"
	puts $ModelFile "node [expr $nodeTag + 13] [expr 292.*$ft] 0.0 $z"
	puts $ModelFile "node [expr $nodeTag + 14] 0.0 [expr 24.*$ft] $z"
	puts $ModelFile "node [expr $nodeTag + 15] [expr 24.*$ft] [expr 24.*$ft] $z"
	puts $ModelFile "node [expr $nodeTag + 16] [expr 48.*$ft] [expr 24.*$ft] $z"
	puts $ModelFile "node [expr $nodeTag + 17] [expr 72.*$ft] [expr 24.*$ft] $z"
	puts $ModelFile "node [expr $nodeTag + 18] [expr 96.*$ft] [expr 24.*$ft] $z"
	puts $ModelFile "node [expr $nodeTag + 19] [expr 120.*$ft] [expr 24.*$ft] $z"
	puts $ModelFile "node [expr $nodeTag + 20] [expr 144.*$ft] [expr 24.*$ft] $z"
	puts $ModelFile "node [expr $nodeTag + 21] [expr 172.*$ft] [expr 24.*$ft] $z"
	puts $ModelFile "node [expr $nodeTag + 22] [expr 196.*$ft] [expr 24.*$ft] $z"
	puts $ModelFile "node [expr $nodeTag + 23] [expr 268.*$ft] [expr 24.*$ft] $z"
	puts $ModelFile "node [expr $nodeTag + 24] [expr 292.*$ft] [expr 24.*$ft] $z"
	puts $ModelFile "node [expr $nodeTag + 25] 0.0 [expr 48.*$ft] $z"
	puts $ModelFile "node [expr $nodeTag + 26] [expr 24.*$ft] [expr 48.*$ft] $z"
	puts $ModelFile "node [expr $nodeTag + 27] [expr 48.*$ft] [expr 48.*$ft] $z"
	puts $ModelFile "node [expr $nodeTag + 28] [expr 72.*$ft] [expr 48.*$ft] $z"
	puts $ModelFile "node [expr $nodeTag + 29] [expr 96.*$ft] [expr 48.*$ft] $z"
	puts $ModelFile "node [expr $nodeTag + 30] [expr 120.*$ft] [expr 48.*$ft] $z"
	puts $ModelFile "node [expr $nodeTag + 31] [expr 144.*$ft] [expr 48.*$ft] $z"
	puts $ModelFile "node [expr $nodeTag + 32] [expr 172.*$ft] [expr 48.*$ft] $z"
	puts $ModelFile "node [expr $nodeTag + 33] [expr 196.*$ft] [expr 48.*$ft] $z"
	puts $ModelFile "node [expr $nodeTag + 34] [expr 220.*$ft] [expr 48.*$ft] $z"
	puts $ModelFile "node [expr $nodeTag + 35] [expr 244.*$ft] [expr 48.*$ft] $z"
	puts $ModelFile "node [expr $nodeTag + 36] [expr 268.*$ft] [expr 48.*$ft] $z"
	puts $ModelFile "node [expr $nodeTag + 37] [expr 292.*$ft] [expr 48.*$ft] $z"
	puts $ModelFile "node [expr $nodeTag + 38] 0.0 [expr 72.*$ft] $z"
	puts $ModelFile "node [expr $nodeTag + 39] [expr 24.*$ft] [expr 72.*$ft] $z"
	puts $ModelFile "node [expr $nodeTag + 40] [expr 48.*$ft] [expr 72.*$ft] $z"
	puts $ModelFile "node [expr $nodeTag + 41] [expr 72.*$ft] [expr 72.*$ft] $z"
	puts $ModelFile "node [expr $nodeTag + 42] [expr 96.*$ft] [expr 72.*$ft] $z"
	puts $ModelFile "node [expr $nodeTag + 43] [expr 120.*$ft] [expr 72.*$ft] $z"
	puts $ModelFile "node [expr $nodeTag + 44] [expr 144.*$ft] [expr 72.*$ft] $z"
	puts $ModelFile "node [expr $nodeTag + 45] [expr 172.*$ft] [expr 72.*$ft] $z"
	puts $ModelFile "node [expr $nodeTag + 46] [expr 196.*$ft] [expr 72.*$ft] $z"
	puts $ModelFile "node [expr $nodeTag + 47] [expr 220.*$ft] [expr 72.*$ft] $z"
	puts $ModelFile "node [expr $nodeTag + 48] [expr 244.*$ft] [expr 72.*$ft] $z"
	puts $ModelFile "node [expr $nodeTag + 49] [expr 268.*$ft] [expr 72.*$ft] $z"
	puts $ModelFile "node [expr $nodeTag + 50] [expr 292.*$ft] [expr 72.*$ft] $z"
	puts $ModelFile "node [expr $nodeTag + 51] 0.0 [expr 96.*$ft] $z"
	puts $ModelFile "node [expr $nodeTag + 52] [expr 24.*$ft] [expr 96.*$ft] $z"
	puts $ModelFile "node [expr $nodeTag + 53] [expr 48.*$ft] [expr 96.*$ft] $z"
	puts $ModelFile "node [expr $nodeTag + 54] [expr 72.*$ft] [expr 96.*$ft] $z"
	puts $ModelFile "node [expr $nodeTag + 55] [expr 96.*$ft] [expr 96.*$ft] $z"
	puts $ModelFile "node [expr $nodeTag + 56] [expr 120.*$ft] [expr 96.*$ft] $z"
	puts $ModelFile "node [expr $nodeTag + 57] [expr 144.*$ft] [expr 96.*$ft] $z"
	puts $ModelFile "node [expr $nodeTag + 58] [expr 172.*$ft] [expr 96.*$ft] $z"
	puts $ModelFile "node [expr $nodeTag + 59] [expr 196.*$ft] [expr 96.*$ft] $z"
	puts $ModelFile "node [expr $nodeTag + 60] [expr 220.*$ft] [expr 96.*$ft] $z"
	puts $ModelFile "node [expr $nodeTag + 61] [expr 244.*$ft] [expr 96.*$ft] $z"
	puts $ModelFile "node [expr $nodeTag + 62] [expr 268.*$ft] [expr 96.*$ft] $z"
	puts $ModelFile "node [expr $nodeTag + 63] [expr 292.*$ft] [expr 96.*$ft] $z"
	puts $ModelFile "node [expr $nodeTag + 64] 0.0 [expr 120.*$ft] $z           "
	puts $ModelFile "node [expr $nodeTag + 65] [expr 24.*$ft] [expr 120.*$ft] $z"
	puts $ModelFile "node [expr $nodeTag + 66] [expr 72.*$ft] [expr 120.*$ft] $z"
	puts $ModelFile "node [expr $nodeTag + 67] [expr 96.*$ft] [expr 120.*$ft] $z"
	puts $ModelFile "node [expr $nodeTag + 68] [expr 120.*$ft] [expr 120.*$ft] $z"
	puts $ModelFile "node [expr $nodeTag + 69] [expr 196.*$ft] [expr 120.*$ft] $z"
	puts $ModelFile "node [expr $nodeTag + 70] [expr 220.*$ft] [expr 120.*$ft] $z"
	puts $ModelFile "node [expr $nodeTag + 71] [expr 244.*$ft] [expr 120.*$ft] $z"
	puts $ModelFile "node [expr $nodeTag + 72] [expr 292.*$ft] [expr 120.*$ft] $z"
	puts $ModelFile "node [expr $nodeTag + 73] 0.0 [expr 144.*$ft] $z"
	puts $ModelFile "node [expr $nodeTag + 74] [expr 24.*$ft] [expr 144.*$ft] $z"
	puts $ModelFile "node [expr $nodeTag + 75] [expr 72.*$ft] [expr 144.*$ft] $z"
	puts $ModelFile "node [expr $nodeTag + 76] [expr 96.*$ft] [expr 144.*$ft] $z"
	puts $ModelFile "node [expr $nodeTag + 77] [expr 120.*$ft] [expr 144.*$ft] $z"
	puts $ModelFile "node [expr $nodeTag + 78] [expr 196.*$ft] [expr 144.*$ft] $z"
	puts $ModelFile "node [expr $nodeTag + 79] [expr 220.*$ft] [expr 144.*$ft] $z"
	puts $ModelFile "node [expr $nodeTag + 80] [expr 244.*$ft] [expr 144.*$ft] $z"
	puts $ModelFile "node [expr $nodeTag + 81] [expr 292.*$ft] [expr 144.*$ft] $z"
	puts $ModelFile "node [expr $nodeTag + 82] 0.0 [expr 168.*$ft] $z"
	puts $ModelFile "node [expr $nodeTag + 83] [expr 24.*$ft] [expr 168.*$ft] $z"
	puts $ModelFile "node [expr $nodeTag + 84] [expr 48.*$ft] [expr 168.*$ft] $z"
	puts $ModelFile "node [expr $nodeTag + 85] [expr 72.*$ft] [expr 168.*$ft] $z"
	puts $ModelFile "node [expr $nodeTag + 86] [expr 96.*$ft] [expr 168.*$ft] $z"
	puts $ModelFile "node [expr $nodeTag + 87] [expr 120.*$ft] [expr 168.*$ft] $z"
	puts $ModelFile "node [expr $nodeTag + 88] [expr 144.*$ft] [expr 168.*$ft] $z"
	puts $ModelFile "node [expr $nodeTag + 89] [expr 172.*$ft] [expr 168.*$ft] $z"
	puts $ModelFile "node [expr $nodeTag + 90] [expr 196.*$ft] [expr 168.*$ft] $z"
	puts $ModelFile "node [expr $nodeTag + 91] [expr 220.*$ft] [expr 168.*$ft] $z"
	puts $ModelFile "node [expr $nodeTag + 92] [expr 244.*$ft] [expr 168.*$ft] $z"
	puts $ModelFile "node [expr $nodeTag + 93] [expr 268.*$ft] [expr 168.*$ft] $z"
	puts $ModelFile "node [expr $nodeTag + 94] [expr 292.*$ft] [expr 168.*$ft] $z"
	
	
	for {set j 1} {$j <= 94} {incr j 1} {
		if {$i == 0} {
			fix [expr $nodeTag + $j] 1 1 1 0 0 1
			lappend Nodes [expr $nodeTag + $j]
		} else {
			lappend Nodes [expr $nodeTag + $j]
		}
	}
	
}

#Podiums and offices
for {set i 4} {$i <= 11} {incr i 1} {

	set H [lindex $storyH $i]; # H = storyH(i)
	set z [expr $z + $H]; # z = z + H
	
	set nodeTag [expr 1000*$i + 800]
	
	node [expr $nodeTag + 9] [expr 196.*$ft] 0.0 $z
	node [expr $nodeTag + 10] [expr 220.*$ft] 0.0 $z
	node [expr $nodeTag + 11] [expr 244.*$ft] 0.0 $z
	node [expr $nodeTag + 12] [expr 268.*$ft] 0.0 $z
	node [expr $nodeTag + 13] [expr 292.*$ft] 0.0 $z
	
	for {set j 9} {$j <= 13} {incr j 1} {
		lappend Nodes [expr $nodeTag + $j]
	}
	
	node [expr $nodeTag + 22] [expr 196.*$ft] [expr 24.*$ft] $z
	node [expr $nodeTag + 23] [expr 268.*$ft] [expr 24.*$ft] $z
	node [expr $nodeTag + 24] [expr 292.*$ft] [expr 24.*$ft] $z
	
	node [expr $nodeTag + 25] 0.0 [expr 48.*$ft] $z
	node [expr $nodeTag + 26] [expr 24.*$ft] [expr 48.*$ft] $z
	node [expr $nodeTag + 27] [expr 48.*$ft] [expr 48.*$ft] $z
	node [expr $nodeTag + 28] [expr 72.*$ft] [expr 48.*$ft] $z
	node [expr $nodeTag + 29] [expr 96.*$ft] [expr 48.*$ft] $z
	node [expr $nodeTag + 30] [expr 120.*$ft] [expr 48.*$ft] $z
	node [expr $nodeTag + 31] [expr 144.*$ft] [expr 48.*$ft] $z
	node [expr $nodeTag + 32] [expr 172.*$ft] [expr 48.*$ft] $z
	node [expr $nodeTag + 33] [expr 196.*$ft] [expr 48.*$ft] $z
	node [expr $nodeTag + 34] [expr 220.*$ft] [expr 48.*$ft] $z
	node [expr $nodeTag + 35] [expr 244.*$ft] [expr 48.*$ft] $z
	node [expr $nodeTag + 36] [expr 268.*$ft] [expr 48.*$ft] $z
	node [expr $nodeTag + 37] [expr 292.*$ft] [expr 48.*$ft] $z
	
	node [expr $nodeTag + 38] 0.0 [expr 72.*$ft] $z
	node [expr $nodeTag + 39] [expr 24.*$ft] [expr 72.*$ft] $z
	node [expr $nodeTag + 40] [expr 48.*$ft] [expr 72.*$ft] $z
	node [expr $nodeTag + 41] [expr 72.*$ft] [expr 72.*$ft] $z
	node [expr $nodeTag + 42] [expr 96.*$ft] [expr 72.*$ft] $z
	node [expr $nodeTag + 43] [expr 120.*$ft] [expr 72.*$ft] $z
	node [expr $nodeTag + 44] [expr 144.*$ft] [expr 72.*$ft] $z
	node [expr $nodeTag + 45] [expr 172.*$ft] [expr 72.*$ft] $z
	node [expr $nodeTag + 46] [expr 196.*$ft] [expr 72.*$ft] $z
	node [expr $nodeTag + 47] [expr 220.*$ft] [expr 72.*$ft] $z
	node [expr $nodeTag + 48] [expr 244.*$ft] [expr 72.*$ft] $z
	node [expr $nodeTag + 49] [expr 268.*$ft] [expr 72.*$ft] $z
	node [expr $nodeTag + 50] [expr 292.*$ft] [expr 72.*$ft] $z
	
	node [expr $nodeTag + 51] 0.0 [expr 96.*$ft] $z
	node [expr $nodeTag + 52] [expr 24.*$ft] [expr 96.*$ft] $z
	node [expr $nodeTag + 53] [expr 48.*$ft] [expr 96.*$ft] $z
	node [expr $nodeTag + 54] [expr 72.*$ft] [expr 96.*$ft] $z
	node [expr $nodeTag + 55] [expr 96.*$ft] [expr 96.*$ft] $z
	node [expr $nodeTag + 56] [expr 120.*$ft] [expr 96.*$ft] $z
	node [expr $nodeTag + 57] [expr 144.*$ft] [expr 96.*$ft] $z
	node [expr $nodeTag + 58] [expr 172.*$ft] [expr 96.*$ft] $z
	node [expr $nodeTag + 59] [expr 196.*$ft] [expr 96.*$ft] $z
	node [expr $nodeTag + 60] [expr 220.*$ft] [expr 96.*$ft] $z
	node [expr $nodeTag + 61] [expr 244.*$ft] [expr 96.*$ft] $z
	node [expr $nodeTag + 62] [expr 268.*$ft] [expr 96.*$ft] $z
	node [expr $nodeTag + 63] [expr 292.*$ft] [expr 96.*$ft] $z
	
	node [expr $nodeTag + 64] 0.0 [expr 120.*$ft] $z
	node [expr $nodeTag + 65] [expr 24.*$ft] [expr 120.*$ft] $z
	node [expr $nodeTag + 66] [expr 72.*$ft] [expr 120.*$ft] $z
	node [expr $nodeTag + 67] [expr 96.*$ft] [expr 120.*$ft] $z
	node [expr $nodeTag + 68] [expr 120.*$ft] [expr 120.*$ft] $z
	node [expr $nodeTag + 69] [expr 196.*$ft] [expr 120.*$ft] $z
	node [expr $nodeTag + 70] [expr 220.*$ft] [expr 120.*$ft] $z
	node [expr $nodeTag + 71] [expr 244.*$ft] [expr 120.*$ft] $z
	node [expr $nodeTag + 72] [expr 292.*$ft] [expr 120.*$ft] $z
	
	node [expr $nodeTag + 73] 0.0 [expr 144.*$ft] $z
	node [expr $nodeTag + 74] [expr 24.*$ft] [expr 144.*$ft] $z
	node [expr $nodeTag + 75] [expr 72.*$ft] [expr 144.*$ft] $z
	node [expr $nodeTag + 76] [expr 96.*$ft] [expr 144.*$ft] $z
	node [expr $nodeTag + 77] [expr 120.*$ft] [expr 144.*$ft] $z
	node [expr $nodeTag + 78] [expr 196.*$ft] [expr 144.*$ft] $z
	node [expr $nodeTag + 79] [expr 220.*$ft] [expr 144.*$ft] $z
	node [expr $nodeTag + 80] [expr 244.*$ft] [expr 144.*$ft] $z
	node [expr $nodeTag + 81] [expr 292.*$ft] [expr 144.*$ft] $z
	
	node [expr $nodeTag + 82] 0.0 [expr 168.*$ft] $z
	node [expr $nodeTag + 83] [expr 24.*$ft] [expr 168.*$ft] $z
	node [expr $nodeTag + 84] [expr 48.*$ft] [expr 168.*$ft] $z
	node [expr $nodeTag + 85] [expr 72.*$ft] [expr 168.*$ft] $z
	node [expr $nodeTag + 86] [expr 96.*$ft] [expr 168.*$ft] $z
	node [expr $nodeTag + 87] [expr 120.*$ft] [expr 168.*$ft] $z
	node [expr $nodeTag + 88] [expr 144.*$ft] [expr 168.*$ft] $z
	node [expr $nodeTag + 89] [expr 172.*$ft] [expr 168.*$ft] $z
	node [expr $nodeTag + 90] [expr 196.*$ft] [expr 168.*$ft] $z
	node [expr $nodeTag + 91] [expr 220.*$ft] [expr 168.*$ft] $z
	node [expr $nodeTag + 92] [expr 244.*$ft] [expr 168.*$ft] $z
	node [expr $nodeTag + 93] [expr 268.*$ft] [expr 168.*$ft] $z
	node [expr $nodeTag + 94] [expr 292.*$ft] [expr 168.*$ft] $z
	
	for {set j 22} {$j <= 94} {incr j 1} {
		lappend Nodes [expr $nodeTag + $j]
	}
	
	
	
	puts $ModelFile "node [expr $nodeTag + 9] [expr 196.*$ft] 0.0 $z"
	puts $ModelFile "node [expr $nodeTag + 10] [expr 220.*$ft] 0.0 $z"
	puts $ModelFile "node [expr $nodeTag + 11] [expr 244.*$ft] 0.0 $z"
	puts $ModelFile "node [expr $nodeTag + 12] [expr 268.*$ft] 0.0 $z"
	puts $ModelFile "node [expr $nodeTag + 13] [expr 292.*$ft] 0.0 $z"
	puts $ModelFile "node [expr $nodeTag + 22] [expr 196.*$ft] [expr 24.*$ft] $z"
	puts $ModelFile "node [expr $nodeTag + 23] [expr 268.*$ft] [expr 24.*$ft] $z"
	puts $ModelFile "node [expr $nodeTag + 24] [expr 292.*$ft] [expr 24.*$ft] $z"
	puts $ModelFile "node [expr $nodeTag + 25] 0.0 [expr 48.*$ft] $z"
	puts $ModelFile "node [expr $nodeTag + 26] [expr 24.*$ft] [expr 48.*$ft] $z"
	puts $ModelFile "node [expr $nodeTag + 27] [expr 48.*$ft] [expr 48.*$ft] $z"
	puts $ModelFile "node [expr $nodeTag + 28] [expr 72.*$ft] [expr 48.*$ft] $z"
	puts $ModelFile "node [expr $nodeTag + 29] [expr 96.*$ft] [expr 48.*$ft] $z"
	puts $ModelFile "node [expr $nodeTag + 30] [expr 120.*$ft] [expr 48.*$ft] $z"
	puts $ModelFile "node [expr $nodeTag + 31] [expr 144.*$ft] [expr 48.*$ft] $z"
	puts $ModelFile "node [expr $nodeTag + 32] [expr 172.*$ft] [expr 48.*$ft] $z"
	puts $ModelFile "node [expr $nodeTag + 33] [expr 196.*$ft] [expr 48.*$ft] $z"
	puts $ModelFile "node [expr $nodeTag + 34] [expr 220.*$ft] [expr 48.*$ft] $z"
	puts $ModelFile "node [expr $nodeTag + 35] [expr 244.*$ft] [expr 48.*$ft] $z"
	puts $ModelFile "node [expr $nodeTag + 36] [expr 268.*$ft] [expr 48.*$ft] $z"
	puts $ModelFile "node [expr $nodeTag + 37] [expr 292.*$ft] [expr 48.*$ft] $z"
	puts $ModelFile "node [expr $nodeTag + 38] 0.0 [expr 72.*$ft] $z"
	puts $ModelFile "node [expr $nodeTag + 39] [expr 24.*$ft] [expr 72.*$ft] $z"
	puts $ModelFile "node [expr $nodeTag + 40] [expr 48.*$ft] [expr 72.*$ft] $z"
	puts $ModelFile "node [expr $nodeTag + 41] [expr 72.*$ft] [expr 72.*$ft] $z"
	puts $ModelFile "node [expr $nodeTag + 42] [expr 96.*$ft] [expr 72.*$ft] $z"
	puts $ModelFile "node [expr $nodeTag + 43] [expr 120.*$ft] [expr 72.*$ft] $z"
	puts $ModelFile "node [expr $nodeTag + 44] [expr 144.*$ft] [expr 72.*$ft] $z"
	puts $ModelFile "node [expr $nodeTag + 45] [expr 172.*$ft] [expr 72.*$ft] $z"
	puts $ModelFile "node [expr $nodeTag + 46] [expr 196.*$ft] [expr 72.*$ft] $z"
	puts $ModelFile "node [expr $nodeTag + 47] [expr 220.*$ft] [expr 72.*$ft] $z"
	puts $ModelFile "node [expr $nodeTag + 48] [expr 244.*$ft] [expr 72.*$ft] $z"
	puts $ModelFile "node [expr $nodeTag + 49] [expr 268.*$ft] [expr 72.*$ft] $z"
	puts $ModelFile "node [expr $nodeTag + 50] [expr 292.*$ft] [expr 72.*$ft] $z"
	puts $ModelFile "node [expr $nodeTag + 51] 0.0 [expr 96.*$ft] $z"
	puts $ModelFile "node [expr $nodeTag + 52] [expr 24.*$ft] [expr 96.*$ft] $z"
	puts $ModelFile "node [expr $nodeTag + 53] [expr 48.*$ft] [expr 96.*$ft] $z"
	puts $ModelFile "node [expr $nodeTag + 54] [expr 72.*$ft] [expr 96.*$ft] $z"
	puts $ModelFile "node [expr $nodeTag + 55] [expr 96.*$ft] [expr 96.*$ft] $z"
	puts $ModelFile "node [expr $nodeTag + 56] [expr 120.*$ft] [expr 96.*$ft] $z"
	puts $ModelFile "node [expr $nodeTag + 57] [expr 144.*$ft] [expr 96.*$ft] $z"
	puts $ModelFile "node [expr $nodeTag + 58] [expr 172.*$ft] [expr 96.*$ft] $z"
	puts $ModelFile "node [expr $nodeTag + 59] [expr 196.*$ft] [expr 96.*$ft] $z"
	puts $ModelFile "node [expr $nodeTag + 60] [expr 220.*$ft] [expr 96.*$ft] $z"
	puts $ModelFile "node [expr $nodeTag + 61] [expr 244.*$ft] [expr 96.*$ft] $z"
	puts $ModelFile "node [expr $nodeTag + 62] [expr 268.*$ft] [expr 96.*$ft] $z"
	puts $ModelFile "node [expr $nodeTag + 63] [expr 292.*$ft] [expr 96.*$ft] $z"
	puts $ModelFile "node [expr $nodeTag + 64] 0.0 [expr 120.*$ft] $z"
	puts $ModelFile "node [expr $nodeTag + 65] [expr 24.*$ft] [expr 120.*$ft] $z"
	puts $ModelFile "node [expr $nodeTag + 66] [expr 72.*$ft] [expr 120.*$ft] $z"
	puts $ModelFile "node [expr $nodeTag + 67] [expr 96.*$ft] [expr 120.*$ft] $z"
	puts $ModelFile "node [expr $nodeTag + 68] [expr 120.*$ft] [expr 120.*$ft] $z"
	puts $ModelFile "node [expr $nodeTag + 69] [expr 196.*$ft] [expr 120.*$ft] $z"
	puts $ModelFile "node [expr $nodeTag + 70] [expr 220.*$ft] [expr 120.*$ft] $z"
	puts $ModelFile "node [expr $nodeTag + 71] [expr 244.*$ft] [expr 120.*$ft] $z"
	puts $ModelFile "node [expr $nodeTag + 72] [expr 292.*$ft] [expr 120.*$ft] $z"
	puts $ModelFile "node [expr $nodeTag + 73] 0.0 [expr 144.*$ft] $z"
	puts $ModelFile "node [expr $nodeTag + 74] [expr 24.*$ft] [expr 144.*$ft] $z"
	puts $ModelFile "node [expr $nodeTag + 75] [expr 72.*$ft] [expr 144.*$ft] $z"
	puts $ModelFile "node [expr $nodeTag + 76] [expr 96.*$ft] [expr 144.*$ft] $z"
	puts $ModelFile "node [expr $nodeTag + 77] [expr 120.*$ft] [expr 144.*$ft] $z"
	puts $ModelFile "node [expr $nodeTag + 78] [expr 196.*$ft] [expr 144.*$ft] $z"
	puts $ModelFile "node [expr $nodeTag + 79] [expr 220.*$ft] [expr 144.*$ft] $z"
	puts $ModelFile "node [expr $nodeTag + 80] [expr 244.*$ft] [expr 144.*$ft] $z"
	puts $ModelFile "node [expr $nodeTag + 81] [expr 292.*$ft] [expr 144.*$ft] $z"
	puts $ModelFile "node [expr $nodeTag + 82] 0.0 [expr 168.*$ft] $z"
	puts $ModelFile "node [expr $nodeTag + 83] [expr 24.*$ft] [expr 168.*$ft] $z"
	puts $ModelFile "node [expr $nodeTag + 84] [expr 48.*$ft] [expr 168.*$ft] $z"
	puts $ModelFile "node [expr $nodeTag + 85] [expr 72.*$ft] [expr 168.*$ft] $z"
	puts $ModelFile "node [expr $nodeTag + 86] [expr 96.*$ft] [expr 168.*$ft] $z"
	puts $ModelFile "node [expr $nodeTag + 87] [expr 120.*$ft] [expr 168.*$ft] $z"
	puts $ModelFile "node [expr $nodeTag + 88] [expr 144.*$ft] [expr 168.*$ft] $z"
	puts $ModelFile "node [expr $nodeTag + 89] [expr 172.*$ft] [expr 168.*$ft] $z"
	puts $ModelFile "node [expr $nodeTag + 90] [expr 196.*$ft] [expr 168.*$ft] $z"
	puts $ModelFile "node [expr $nodeTag + 91] [expr 220.*$ft] [expr 168.*$ft] $z"
	puts $ModelFile "node [expr $nodeTag + 92] [expr 244.*$ft] [expr 168.*$ft] $z"
	puts $ModelFile "node [expr $nodeTag + 93] [expr 268.*$ft] [expr 168.*$ft] $z"
	puts $ModelFile "node [expr $nodeTag + 94] [expr 292.*$ft] [expr 168.*$ft] $z"
	
}

#Typical stories
for {set i 12} {$i <= $nStory} {incr i 1} {

	set H [lindex $storyH $i]; # H = storyH(i)
	set z [expr $z + $H]; # z = z + H
	
	set nodeTag [expr 1000*$i + 800]
		
	node [expr $nodeTag + 43] [expr 120.*$ft] [expr 72.*$ft] $z
	node [expr $nodeTag + 44] [expr 144.*$ft] [expr 72.*$ft] $z
	node [expr $nodeTag + 45] [expr 172.*$ft] [expr 72.*$ft] $z
	node [expr $nodeTag + 46] [expr 196.*$ft] [expr 72.*$ft] $z
	
	for {set j 43} {$j <= 46} {incr j 1} {
		lappend Nodes [expr $nodeTag + $j]
	}
	
	node [expr $nodeTag + 55] [expr 96.*$ft] [expr 96.*$ft] $z
	node [expr $nodeTag + 56] [expr 120.*$ft] [expr 96.*$ft] $z
	node [expr $nodeTag + 57] [expr 144.*$ft] [expr 96.*$ft] $z
	node [expr $nodeTag + 58] [expr 172.*$ft] [expr 96.*$ft] $z
	node [expr $nodeTag + 59] [expr 196.*$ft] [expr 96.*$ft] $z
	node [expr $nodeTag + 60] [expr 220.*$ft] [expr 96.*$ft] $z
	node [expr $nodeTag + 61] [expr 244.*$ft] [expr 96.*$ft] $z
	
	for {set j 55} {$j <= 61} {incr j 1} {
		lappend Nodes [expr $nodeTag + $j]
	}

	node [expr $nodeTag + 67] [expr 96.*$ft] [expr 120.*$ft] $z
	node [expr $nodeTag + 68] [expr 120.*$ft] [expr 120.*$ft] $z
	node [expr $nodeTag + 69] [expr 196.*$ft] [expr 120.*$ft] $z
	node [expr $nodeTag + 70] [expr 220.*$ft] [expr 120.*$ft] $z
	node [expr $nodeTag + 71] [expr 244.*$ft] [expr 120.*$ft] $z
	
	for {set j 67} {$j <= 71} {incr j 1} {
		lappend Nodes [expr $nodeTag + $j]
	}
	
	node [expr $nodeTag + 76] [expr 96.*$ft] [expr 144.*$ft] $z
	node [expr $nodeTag + 77] [expr 120.*$ft] [expr 144.*$ft] $z
	node [expr $nodeTag + 78] [expr 196.*$ft] [expr 144.*$ft] $z
	node [expr $nodeTag + 79] [expr 220.*$ft] [expr 144.*$ft] $z
	node [expr $nodeTag + 80] [expr 244.*$ft] [expr 144.*$ft] $z
	
	for {set j 76} {$j <= 80} {incr j 1} {
		lappend Nodes [expr $nodeTag + $j]
	}
	
	node [expr $nodeTag + 86] [expr 96.*$ft] [expr 168.*$ft] $z
	node [expr $nodeTag + 87] [expr 120.*$ft] [expr 168.*$ft] $z
	node [expr $nodeTag + 88] [expr 144.*$ft] [expr 168.*$ft] $z
	node [expr $nodeTag + 89] [expr 172.*$ft] [expr 168.*$ft] $z
	node [expr $nodeTag + 90] [expr 196.*$ft] [expr 168.*$ft] $z
	node [expr $nodeTag + 91] [expr 220.*$ft] [expr 168.*$ft] $z
	node [expr $nodeTag + 92] [expr 244.*$ft] [expr 168.*$ft] $z
	
	for {set j 86} {$j <= 92} {incr j 1} {
		lappend Nodes [expr $nodeTag + $j]
	}
	
	puts $ModelFile "node [expr $nodeTag + 43] [expr 120.*$ft] [expr 72.*$ft] $z"
	puts $ModelFile "node [expr $nodeTag + 44] [expr 144.*$ft] [expr 72.*$ft] $z"
	puts $ModelFile "node [expr $nodeTag + 45] [expr 172.*$ft] [expr 72.*$ft] $z"
	puts $ModelFile "node [expr $nodeTag + 46] [expr 196.*$ft] [expr 72.*$ft] $z"
	puts $ModelFile "node [expr $nodeTag + 55] [expr 96.*$ft] [expr 96.*$ft] $z"
	puts $ModelFile "node [expr $nodeTag + 56] [expr 120.*$ft] [expr 96.*$ft] $z"
	puts $ModelFile "node [expr $nodeTag + 57] [expr 144.*$ft] [expr 96.*$ft] $z"
	puts $ModelFile "node [expr $nodeTag + 58] [expr 172.*$ft] [expr 96.*$ft] $z"
	puts $ModelFile "node [expr $nodeTag + 59] [expr 196.*$ft] [expr 96.*$ft] $z"
	puts $ModelFile "node [expr $nodeTag + 60] [expr 220.*$ft] [expr 96.*$ft] $z"
	puts $ModelFile "node [expr $nodeTag + 61] [expr 244.*$ft] [expr 96.*$ft] $z"
	puts $ModelFile "node [expr $nodeTag + 67] [expr 96.*$ft] [expr 120.*$ft] $z"
	puts $ModelFile "node [expr $nodeTag + 68] [expr 120.*$ft] [expr 120.*$ft] $z"
	puts $ModelFile "node [expr $nodeTag + 69] [expr 196.*$ft] [expr 120.*$ft] $z"
	puts $ModelFile "node [expr $nodeTag + 70] [expr 220.*$ft] [expr 120.*$ft] $z"
	puts $ModelFile "node [expr $nodeTag + 71] [expr 244.*$ft] [expr 120.*$ft] $z"
	puts $ModelFile "node [expr $nodeTag + 76] [expr 96.*$ft] [expr 144.*$ft] $z"
	puts $ModelFile "node [expr $nodeTag + 77] [expr 120.*$ft] [expr 144.*$ft] $z"
	puts $ModelFile "node [expr $nodeTag + 78] [expr 196.*$ft] [expr 144.*$ft] $z"
	puts $ModelFile "node [expr $nodeTag + 79] [expr 220.*$ft] [expr 144.*$ft] $z"
	puts $ModelFile "node [expr $nodeTag + 80] [expr 244.*$ft] [expr 144.*$ft] $z"
	puts $ModelFile "node [expr $nodeTag + 86] [expr 96.*$ft] [expr 168.*$ft] $z"
	puts $ModelFile "node [expr $nodeTag + 87] [expr 120.*$ft] [expr 168.*$ft] $z"
	puts $ModelFile "node [expr $nodeTag + 88] [expr 144.*$ft] [expr 168.*$ft] $z"
	puts $ModelFile "node [expr $nodeTag + 89] [expr 172.*$ft] [expr 168.*$ft] $z"
	puts $ModelFile "node [expr $nodeTag + 90] [expr 196.*$ft] [expr 168.*$ft] $z"
	puts $ModelFile "node [expr $nodeTag + 91] [expr 220.*$ft] [expr 168.*$ft] $z"
	puts $ModelFile "node [expr $nodeTag + 92] [expr 244.*$ft] [expr 168.*$ft] $z"

}