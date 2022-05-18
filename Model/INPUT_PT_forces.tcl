
# ################################################################################################################
# ############################################## P-T Forces ######################################################
# ################################################################################################################

# Columns loads
set patternTagPT $patternTagGravity

#pattern Plain $patternTag $tsTag <-fact $cFactor> {
#load...
#eleLoad...
#sp...
#...
#}

#load $nodeTag (ndf $LoadValues)

pattern Plain $patternTagPT "Linear" {
	for {set i 4} {$i <= $nStory} {incr i 1} {
		
		if {$i > 11} {
			
			# Perimeter
			load [expr 1000*$i + 800 + 43] [expr 300.*$kip] [expr 300.*$kip] 0. 0. 0. 0.
			load [expr 1000*$i + 800 + 55] [expr 300.*$kip] [expr 300.*$kip] 0. 0. 0. 0.
			
			load [expr 1000*$i + 800 + 56] 0. [expr 300.*$kip] 0. 0. 0. 0.
			load [expr 1000*$i + 800 + 44] 0. [expr 650.*$kip] 0. 0. 0. 0.
			load [expr 1000*$i + 800 + 45] 0. [expr 650.*$kip] 0. 0. 0. 0.
			load [expr 1000*$i + 800 + 59] 0. [expr 300.*$kip] 0. 0. 0. 0.
			load [expr 1000*$i + 800 + 60] 0. [expr 600.*$kip] 0. 0. 0. 0.
			
			load [expr 1000*$i + 800 + 46] [expr -300.*$kip] [expr 300.*$kip] 0. 0. 0. 0.
			load [expr 1000*$i + 800 + 61] [expr -300.*$kip] [expr 300.*$kip] 0. 0. 0. 0.
			
			load [expr 1000*$i + 800 + 67] [expr  600.*$kip] 0. 0. 0. 0. 0.
			load [expr 1000*$i + 800 + 71] [expr -600.*$kip] 0. 0. 0. 0. 0.
			load [expr 1000*$i + 800 + 76] [expr  600.*$kip] 0. 0. 0. 0. 0.
			load [expr 1000*$i + 800 + 80] [expr -600.*$kip] 0. 0. 0. 0. 0.
			
			load [expr 1000*$i + 800 + 86] [expr 300.*$kip] [expr -300.*$kip] 0. 0. 0. 0.
			
			load [expr 1000*$i + 800 + 87] 0. [expr -600.*$kip] 0. 0. 0. 0.
			load [expr 1000*$i + 800 + 88] 0. [expr -650.*$kip] 0. 0. 0. 0.
			load [expr 1000*$i + 800 + 89] 0. [expr -650.*$kip] 0. 0. 0. 0.
			load [expr 1000*$i + 800 + 90] 0. [expr -600.*$kip] 0. 0. 0. 0.
			load [expr 1000*$i + 800 + 91] 0. [expr -600.*$kip] 0. 0. 0. 0.
			
			load [expr 1000*$i + 800 + 92] [expr -300.*$kip] [expr -300.*$kip] 0. 0. 0. 0.
			
			# Core walls
			load [expr 1000*$i + 100 + $nEleFloor + 1] [expr -600.*$kip] [expr  650.*$kip] 0. 0. 0. 0.
			load [expr 1000*$i + 100 + $nEleFloor + 2] [expr -600.*$kip] [expr -650.*$kip] 0. 0. 0. 0.
			load [expr 1000*$i + 200 + $nEleFloor + 1] [expr  600.*$kip] [expr  650.*$kip] 0. 0. 0. 0.
			load [expr 1000*$i + 200 + $nEleFloor + 2] [expr  600.*$kip] [expr -650.*$kip] 0. 0. 0. 0.
			
		} elseif {$i == 11} {
		
			# Perimeter
			load [expr 1000*$i + 800 +  9] [expr 120.*$kip] [expr 120.*$kip] 0. 0. 0. 0.
			
			load [expr 1000*$i + 800 + 10] 0. [expr 240.*$kip] 0. 0. 0. 0.
			load [expr 1000*$i + 800 + 11] 0. [expr 240.*$kip] 0. 0. 0. 0.
			load [expr 1000*$i + 800 + 12] 0. [expr 240.*$kip] 0. 0. 0. 0.
			
			load [expr 1000*$i + 800 + 13] [expr -120.*$kip] [expr 120.*$kip] 0. 0. 0. 0.
			
			load [expr 1000*$i + 800 + 22] [expr  240.*$kip] 0. 0. 0. 0. 0.
			load [expr 1000*$i + 800 + 24] [expr -240.*$kip] 0. 0. 0. 0. 0.
			
			load [expr 1000*$i + 800 + 25] [expr 120.*$kip] [expr 120.*$kip] 0. 0. 0. 0.
			
			load [expr 1000*$i + 800 + 26] 0. [expr 240.*$kip] 0. 0. 0. 0.
			load [expr 1000*$i + 800 + 27] 0. [expr 240.*$kip] 0. 0. 0. 0.
			load [expr 1000*$i + 800 + 28] 0. [expr 240.*$kip] 0. 0. 0. 0.
			load [expr 1000*$i + 800 + 29] 0. [expr 240.*$kip] 0. 0. 0. 0.
			load [expr 1000*$i + 800 + 30] 0. [expr 240.*$kip] 0. 0. 0. 0.
			load [expr 1000*$i + 800 + 31] 0. [expr 260.*$kip] 0. 0. 0. 0.
			load [expr 1000*$i + 800 + 32] 0. [expr 260.*$kip] 0. 0. 0. 0.
			
			load [expr 1000*$i + 800 + 33] [expr 120.*$kip] [expr 120.*$kip] 0. 0. 0. 0.
			
			load [expr 1000*$i + 800 + 37] [expr -240.*$kip] 0. 0. 0. 0. 0.
			load [expr 1000*$i + 800 + 38] [expr  240.*$kip] 0. 0. 0. 0. 0.
			load [expr 1000*$i + 800 + 50] [expr -240.*$kip] 0. 0. 0. 0. 0.
			load [expr 1000*$i + 800 + 51] [expr  240.*$kip] 0. 0. 0. 0. 0.
			load [expr 1000*$i + 800 + 63] [expr -240.*$kip] 0. 0. 0. 0. 0.
			load [expr 1000*$i + 800 + 64] [expr  240.*$kip] 0. 0. 0. 0. 0.
			load [expr 1000*$i + 800 + 72] [expr -240.*$kip] 0. 0. 0. 0. 0.
			load [expr 1000*$i + 800 + 73] [expr  240.*$kip] 0. 0. 0. 0. 0.
			load [expr 1000*$i + 800 + 81] [expr -240.*$kip] 0. 0. 0. 0. 0.
			
			load [expr 1000*$i + 800 + 82] [expr 120.*$kip] [expr -120.*$kip] 0. 0. 0. 0.
			
			load [expr 1000*$i + 800 + 83] 0. [expr -240.*$kip] 0. 0. 0. 0.
			load [expr 1000*$i + 800 + 84] 0. [expr -240.*$kip] 0. 0. 0. 0.
			load [expr 1000*$i + 800 + 85] 0. [expr -240.*$kip] 0. 0. 0. 0.
			load [expr 1000*$i + 800 + 86] 0. [expr -240.*$kip] 0. 0. 0. 0.
			load [expr 1000*$i + 800 + 87] 0. [expr -240.*$kip] 0. 0. 0. 0.
			load [expr 1000*$i + 800 + 88] 0. [expr -260.*$kip] 0. 0. 0. 0.
			load [expr 1000*$i + 800 + 89] 0. [expr -260.*$kip] 0. 0. 0. 0.
			load [expr 1000*$i + 800 + 90] 0. [expr -240.*$kip] 0. 0. 0. 0.
			load [expr 1000*$i + 800 + 91] 0. [expr -240.*$kip] 0. 0. 0. 0.
			load [expr 1000*$i + 800 + 92] 0. [expr -240.*$kip] 0. 0. 0. 0.
			load [expr 1000*$i + 800 + 93] 0. [expr -240.*$kip] 0. 0. 0. 0.
			
			load [expr 1000*$i + 800 + 94] [expr -120.*$kip] [expr -120.*$kip] 0. 0. 0. 0.
			
			# Core Walls
			load [expr 1000*$i + 100 + $nEleFloor + 1] [expr -240.*$kip] [expr  240.*$kip] 0. 0. 0. 0.
			load [expr 1000*$i + 100 + $nEleFloor + 2] [expr -240.*$kip] [expr -240.*$kip] 0. 0. 0. 0.
			load [expr 1000*$i + 200 + $nEleFloor + 1] [expr  240.*$kip] [expr  240.*$kip] 0. 0. 0. 0.
			load [expr 1000*$i + 200 + $nEleFloor + 2] [expr  240.*$kip] [expr -240.*$kip] 0. 0. 0. 0.
			
			# Rec Walls
			load [expr 1000*$i + 300 + $nEleFloor + 1] [expr -240.*$kip] 0. 0. 0. 0. 0.
			load [expr 1000*$i + 300 + $nEleFloor + 2] [expr  240.*$kip] 0. 0. 0. 0. 0.
			
			load [expr 1000*$i + 400 + $nEleFloor + 1] 0. [expr -240.*$kip] 0. 0. 0. 0.
			load [expr 1000*$i + 400 + $nEleFloor + 2] 0. [expr  240.*$kip] 0. 0. 0. 0.
			
			load [expr 1000*$i + 500 + $nEleFloor + 1] 0. [expr -240.*$kip] 0. 0. 0. 0.
			load [expr 1000*$i + 500 + $nEleFloor + 2] 0. [expr  240.*$kip] 0. 0. 0. 0.
		
		} else {
		
			# Perimeter
			load [expr 1000*$i + 800 +  9] [expr 420.*$kip] [expr 420.*$kip] 0. 0. 0. 0.
			
			load [expr 1000*$i + 800 + 10] 0. [expr 840.*$kip] 0. 0. 0. 0.
			load [expr 1000*$i + 800 + 11] 0. [expr 840.*$kip] 0. 0. 0. 0.
			load [expr 1000*$i + 800 + 12] 0. [expr 840.*$kip] 0. 0. 0. 0.
			
			load [expr 1000*$i + 800 + 13] [expr -420.*$kip] [expr 420.*$kip] 0. 0. 0. 0.
			
			load [expr 1000*$i + 800 + 22] [expr  840.*$kip] 0. 0. 0. 0. 0.
			load [expr 1000*$i + 800 + 24] [expr -840.*$kip] 0. 0. 0. 0. 0.
			
			load [expr 1000*$i + 800 + 25] [expr 420.*$kip] [expr 420.*$kip] 0. 0. 0. 0.
			
			load [expr 1000*$i + 800 + 26] 0. [expr 840.*$kip] 0. 0. 0. 0.
			load [expr 1000*$i + 800 + 27] 0. [expr 840.*$kip] 0. 0. 0. 0.
			load [expr 1000*$i + 800 + 28] 0. [expr 840.*$kip] 0. 0. 0. 0.
			load [expr 1000*$i + 800 + 29] 0. [expr 840.*$kip] 0. 0. 0. 0.
			load [expr 1000*$i + 800 + 30] 0. [expr 840.*$kip] 0. 0. 0. 0.
			load [expr 1000*$i + 800 + 31] 0. [expr 910.*$kip] 0. 0. 0. 0.
			load [expr 1000*$i + 800 + 32] 0. [expr 910.*$kip] 0. 0. 0. 0.
			
			load [expr 1000*$i + 800 + 33] [expr 420.*$kip] [expr 420.*$kip] 0. 0. 0. 0.
			
			load [expr 1000*$i + 800 + 37] [expr -840.*$kip] 0. 0. 0. 0. 0.
			load [expr 1000*$i + 800 + 38] [expr  840.*$kip] 0. 0. 0. 0. 0.
			load [expr 1000*$i + 800 + 50] [expr -840.*$kip] 0. 0. 0. 0. 0.
			load [expr 1000*$i + 800 + 51] [expr  840.*$kip] 0. 0. 0. 0. 0.
			load [expr 1000*$i + 800 + 63] [expr -840.*$kip] 0. 0. 0. 0. 0.
			load [expr 1000*$i + 800 + 64] [expr  840.*$kip] 0. 0. 0. 0. 0.
			load [expr 1000*$i + 800 + 72] [expr -840.*$kip] 0. 0. 0. 0. 0.
			load [expr 1000*$i + 800 + 73] [expr  840.*$kip] 0. 0. 0. 0. 0.
			load [expr 1000*$i + 800 + 81] [expr -840.*$kip] 0. 0. 0. 0. 0.
			
			load [expr 1000*$i + 800 + 82] [expr 420.*$kip] [expr -420.*$kip] 0. 0. 0. 0.
			
			load [expr 1000*$i + 800 + 83] 0. [expr -840.*$kip] 0. 0. 0. 0.
			load [expr 1000*$i + 800 + 84] 0. [expr -840.*$kip] 0. 0. 0. 0.
			load [expr 1000*$i + 800 + 85] 0. [expr -840.*$kip] 0. 0. 0. 0.
			load [expr 1000*$i + 800 + 86] 0. [expr -840.*$kip] 0. 0. 0. 0.
			load [expr 1000*$i + 800 + 87] 0. [expr -840.*$kip] 0. 0. 0. 0.
			load [expr 1000*$i + 800 + 88] 0. [expr -910.*$kip] 0. 0. 0. 0.
			load [expr 1000*$i + 800 + 89] 0. [expr -910.*$kip] 0. 0. 0. 0.
			load [expr 1000*$i + 800 + 90] 0. [expr -840.*$kip] 0. 0. 0. 0.
			load [expr 1000*$i + 800 + 91] 0. [expr -840.*$kip] 0. 0. 0. 0.
			load [expr 1000*$i + 800 + 92] 0. [expr -840.*$kip] 0. 0. 0. 0.
			load [expr 1000*$i + 800 + 93] 0. [expr -840.*$kip] 0. 0. 0. 0.
			
			load [expr 1000*$i + 800 + 94] [expr -420.*$kip] [expr -420.*$kip] 0. 0. 0. 0.
			
			# Core Walls
			load [expr 1000*$i + 100 + $nEleFloor + 1] [expr -840.*$kip] [expr  910.*$kip] 0. 0. 0. 0.
			load [expr 1000*$i + 100 + $nEleFloor + 2] [expr -840.*$kip] [expr -910.*$kip] 0. 0. 0. 0.
			load [expr 1000*$i + 200 + $nEleFloor + 1] [expr  840.*$kip] [expr  910.*$kip] 0. 0. 0. 0.
			load [expr 1000*$i + 200 + $nEleFloor + 2] [expr  840.*$kip] [expr -910.*$kip] 0. 0. 0. 0.
			
			# Rec Walls
			load [expr 1000*$i + 300 + $nEleFloor + 1] [expr -840.*$kip] 0. 0. 0. 0. 0.
			load [expr 1000*$i + 300 + $nEleFloor + 2] [expr  840.*$kip] 0. 0. 0. 0. 0.
			
			load [expr 1000*$i + 400 + $nEleFloor + 1] 0. [expr -840.*$kip] 0. 0. 0. 0.
			load [expr 1000*$i + 400 + $nEleFloor + 2] 0. [expr  840.*$kip] 0. 0. 0. 0.
			
			load [expr 1000*$i + 500 + $nEleFloor + 1] 0. [expr -840.*$kip] 0. 0. 0. 0.
			load [expr 1000*$i + 500 + $nEleFloor + 2] 0. [expr  840.*$kip] 0. 0. 0. 0.
		} 
	}
}
incr patternTagGravity 1