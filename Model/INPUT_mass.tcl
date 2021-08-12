
# MASS ASSIGNMENT -----------------------------------------------------------------------------------------
# Core Wall mass
for {set i 1} {$i <= $nStory} {incr i} {

	if {$i == 11} {
		set thickness [expr 12.*$in]
	} else {
		set thickness [expr 8.*$in]
	}
	
	if {$i > 3} {
		set w_DL [expr 20.*$psf]
	} else {
		set w_DL [expr 10.*$psf]
	}
	
	set w_SL [expr $thickness*150.*$pcf]
	set w_SDL [expr $w_DL + $w_SL]
	
	# wallP is the self weight of the wall
	if {$i == 36} {
		set wallP [expr 9.75*$ft*75.*$ft*$ft*150.*$pcf*0.5]
	} elseif {$i > 31} {
		set wallP [expr 9.75*$ft*75.*$ft*$ft*150.*$pcf]
	} elseif {$i == 31} {
		set wallP [expr 9.75*$ft*82.5*$ft*$ft*150.*$pcf]
	} elseif {$i > 21} {
		set wallP [expr 9.75*$ft*90.*$ft*$ft*150.*$pcf]
	} elseif {$i == 21} {
		set wallP [expr 9.75*$ft*97.5*$ft*$ft*150.*$pcf]
	} elseif {$i > 16} {
		set wallP [expr 9.75*$ft*105.*$ft*$ft*150.*$pcf]
	} elseif {$i == 16} {
		set wallP [expr 9.75*$ft*112.5*$ft*$ft*150.*$pcf]
	} elseif {$i > 12} {
		set wallP [expr 9.75*$ft*120.*$ft*$ft*150.*$pcf]
	} elseif {$i == 12} {
		set wallP [expr 11.125*$ft*120.*$ft*$ft*150.*$pcf]
	} elseif {$i == 11} {
		set wallP [expr 12.5*$ft*127.5*$ft*$ft*150.*$pcf]
	} elseif {$i > 6} {
		set wallP [expr 12.5*$ft*135.*$ft*$ft*150.*$pcf]
	} elseif {$i == 6} {
		set wallP [expr 14.25*$ft*135.*$ft*$ft*150.*$pcf]
	} elseif {$i > 3} {
		set wallP [expr 16.0*$ft*135.*$ft*$ft*150.*$pcf]
	} elseif {$i == 3} {
		set wallP [expr 13.25*$ft*135.*$ft*$ft*150.*$pcf]
	} else {
		set wallP [expr 10.5*$ft*135.*$ft*$ft*150.*$pcf]
	}
	
	mass [expr 1000*$i + 100 + $nEleFloor] [expr ($wallP + $w_SDL*$ft*$ft*912.)/$g] 					[expr ($wallP + $w_SDL*$ft*$ft*912.)/$g] 					0. 0. 0. 0.
	mass [expr 1000*$i + 200 + $nEleFloor] [expr ($wallP + $w_SDL*($ft*$ft*912. + 51614.*$in2))/$g] 	[expr ($wallP + $w_SDL*($ft*$ft*912. + 51614.*$in2))/$g]	0. 0. 0. 0.
	mass [expr 1000*$i + 300 + $nEleFloor] [expr ($wallP + $w_SDL*$ft*$ft*912.)/$g] 					[expr ($wallP + $w_SDL*$ft*$ft*912.)/$g] 0. 0. 0. 0.
	mass [expr 1000*$i + 400 + $nEleFloor] [expr ($wallP + $w_SDL*($ft*$ft*912. + 51614.*$in2))/$g] 	[expr ($wallP + $w_SDL*($ft*$ft*912. + 51614.*$in2))/$g]	0. 0. 0. 0.
		
}

# Rectangular Wall mass
for {set i 1} {$i <= 11} {incr i} {

	if {$i == 11} {
		set thickness [expr 12.*$in]
	} else {
		set thickness [expr 8.*$in]
	}
	
	if {$i > 3} {
		set w_DL [expr 20.*$psf]
	} else {
		set w_DL [expr 10.*$psf]
	}
	
	set w_SL [expr $thickness*150.*$pcf]
	set w_SDL [expr $w_DL + $w_SL]
	
	if {$i == 11} {
		set wallP [expr 12.5*$ft*6240.*$in2*150.*$pcf*0.5]
	} elseif {$i > 6} {
		set wallP [expr 12.5*$ft*6240.*$in2*150.*$pcf]
	} elseif {$i == 6} {
		set wallP [expr 14.25*$ft*6240.*$in2*150.*$pcf]
	} elseif {$i > 3} {
		set wallP [expr 16.0*$ft*6240.*$in2*150.*$pcf]
	} elseif {$i == 3} {
		set wallP [expr 13.25*$ft*6240.*$in2*150.*$pcf]
	} else {
		set wallP [expr 10.5*$ft*6240.*$in2*150.*$pcf]
	}
	
	if {$i == 11} {
	
		mass [expr 1000*$i + 500 + $nEleFloor] [expr ($wallP + $w_SDL*$ft*$ft*864.)/$g]		[expr ($wallP + $w_SDL*$ft*$ft*864.)/$g]	0. 0. 0. 0.
		mass [expr 1000*$i + 600 + $nEleFloor] [expr ($wallP + $w_SDL*$ft*$ft*864.)/$g]		[expr ($wallP + $w_SDL*$ft*$ft*864.)/$g]	0. 0. 0. 0.
		mass [expr 1000*$i + 700 + $nEleFloor] [expr ($wallP + $w_SDL*$ft*$ft*1152.)/$g]	[expr ($wallP + $w_SDL*$ft*$ft*1152.)/$g]	0. 0. 0. 0.
		
	} else {
	
		mass [expr 1000*$i + 500 + $nEleFloor] [expr ($wallP + $w_SDL*$ft*$ft*624.)/$g]	[expr ($wallP + $w_SDL*$ft*$ft*624.)/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 600 + $nEleFloor] [expr ($wallP + $w_SDL*$ft*$ft*624.)/$g] [expr ($wallP + $w_SDL*$ft*$ft*624.)/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 700 + $nEleFloor] [expr ($wallP + $w_SDL*$ft*$ft*912.)/$g] [expr ($wallP + $w_SDL*$ft*$ft*912.)/$g] 0. 0. 0. 0.
		
	}
}

# Column mass
for {set i 1} {$i < $nStory} {incr i} {
	
	if {$i >= 31} {
	
		#12x12 cols
		mass [expr 1000*$i + 800 + 38] [expr 12.*$in*12.*$in*9.75*$ft*150.*$pcf/$g] [expr 12.*$in*12.*$in*9.75*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 48] [expr 12.*$in*12.*$in*9.75*$ft*150.*$pcf/$g] [expr 12.*$in*12.*$in*9.75*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 80] [expr 12.*$in*12.*$in*9.75*$ft*150.*$pcf/$g] [expr 12.*$in*12.*$in*9.75*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 90] [expr 12.*$in*12.*$in*9.75*$ft*150.*$pcf/$g] [expr 12.*$in*12.*$in*9.75*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 39] [expr 12.*$in*12.*$in*9.75*$ft*150.*$pcf/$g] [expr 12.*$in*12.*$in*9.75*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 40] [expr 12.*$in*12.*$in*9.75*$ft*150.*$pcf/$g] [expr 12.*$in*12.*$in*9.75*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 41] [expr 12.*$in*12.*$in*9.75*$ft*150.*$pcf/$g] [expr 12.*$in*12.*$in*9.75*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 42] [expr 12.*$in*12.*$in*9.75*$ft*150.*$pcf/$g] [expr 12.*$in*12.*$in*9.75*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 43] [expr 12.*$in*12.*$in*9.75*$ft*150.*$pcf/$g] [expr 12.*$in*12.*$in*9.75*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 44] [expr 12.*$in*12.*$in*9.75*$ft*150.*$pcf/$g] [expr 12.*$in*12.*$in*9.75*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 45] [expr 12.*$in*12.*$in*9.75*$ft*150.*$pcf/$g] [expr 12.*$in*12.*$in*9.75*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 46] [expr 12.*$in*12.*$in*9.75*$ft*150.*$pcf/$g] [expr 12.*$in*12.*$in*9.75*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 47] [expr 12.*$in*12.*$in*9.75*$ft*150.*$pcf/$g] [expr 12.*$in*12.*$in*9.75*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 51] [expr 12.*$in*12.*$in*9.75*$ft*150.*$pcf/$g] [expr 12.*$in*12.*$in*9.75*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 61] [expr 12.*$in*12.*$in*9.75*$ft*150.*$pcf/$g] [expr 12.*$in*12.*$in*9.75*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 64] [expr 12.*$in*12.*$in*9.75*$ft*150.*$pcf/$g] [expr 12.*$in*12.*$in*9.75*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 70] [expr 12.*$in*12.*$in*9.75*$ft*150.*$pcf/$g] [expr 12.*$in*12.*$in*9.75*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 71] [expr 12.*$in*12.*$in*9.75*$ft*150.*$pcf/$g] [expr 12.*$in*12.*$in*9.75*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 77] [expr 12.*$in*12.*$in*9.75*$ft*150.*$pcf/$g] [expr 12.*$in*12.*$in*9.75*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 81] [expr 12.*$in*12.*$in*9.75*$ft*150.*$pcf/$g] [expr 12.*$in*12.*$in*9.75*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 82] [expr 12.*$in*12.*$in*9.75*$ft*150.*$pcf/$g] [expr 12.*$in*12.*$in*9.75*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 83] [expr 12.*$in*12.*$in*9.75*$ft*150.*$pcf/$g] [expr 12.*$in*12.*$in*9.75*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 84] [expr 12.*$in*12.*$in*9.75*$ft*150.*$pcf/$g] [expr 12.*$in*12.*$in*9.75*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 85] [expr 12.*$in*12.*$in*9.75*$ft*150.*$pcf/$g] [expr 12.*$in*12.*$in*9.75*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 86] [expr 12.*$in*12.*$in*9.75*$ft*150.*$pcf/$g] [expr 12.*$in*12.*$in*9.75*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 87] [expr 12.*$in*12.*$in*9.75*$ft*150.*$pcf/$g] [expr 12.*$in*12.*$in*9.75*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 88] [expr 12.*$in*12.*$in*9.75*$ft*150.*$pcf/$g] [expr 12.*$in*12.*$in*9.75*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 89] [expr 12.*$in*12.*$in*9.75*$ft*150.*$pcf/$g] [expr 12.*$in*12.*$in*9.75*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		
		#16x16
		mass [expr 1000*$i + 800 + 66] [expr 16.*$in*16.*$in*9.75*$ft*150.*$pcf/$g] [expr 16.*$in*16.*$in*9.75*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 67] [expr 16.*$in*16.*$in*9.75*$ft*150.*$pcf/$g] [expr 16.*$in*16.*$in*9.75*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 73] [expr 16.*$in*16.*$in*9.75*$ft*150.*$pcf/$g] [expr 16.*$in*16.*$in*9.75*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 74] [expr 16.*$in*16.*$in*9.75*$ft*150.*$pcf/$g] [expr 16.*$in*16.*$in*9.75*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		
		#20x20
		mass [expr 1000*$i + 800 + 65] [expr 20.*$in*20.*$in*9.75*$ft*150.*$pcf/$g] [expr 20.*$in*20.*$in*9.75*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 68] [expr 20.*$in*20.*$in*9.75*$ft*150.*$pcf/$g] [expr 20.*$in*20.*$in*9.75*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 69] [expr 20.*$in*20.*$in*9.75*$ft*150.*$pcf/$g] [expr 20.*$in*20.*$in*9.75*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 72] [expr 20.*$in*20.*$in*9.75*$ft*150.*$pcf/$g] [expr 20.*$in*20.*$in*9.75*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 75] [expr 20.*$in*20.*$in*9.75*$ft*150.*$pcf/$g] [expr 20.*$in*20.*$in*9.75*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 76] [expr 20.*$in*20.*$in*9.75*$ft*150.*$pcf/$g] [expr 20.*$in*20.*$in*9.75*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 52] [expr 20.*$in*20.*$in*9.75*$ft*150.*$pcf/$g] [expr 20.*$in*20.*$in*9.75*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 53] [expr 20.*$in*20.*$in*9.75*$ft*150.*$pcf/$g] [expr 20.*$in*20.*$in*9.75*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 54] [expr 20.*$in*20.*$in*9.75*$ft*150.*$pcf/$g] [expr 20.*$in*20.*$in*9.75*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 55] [expr 20.*$in*20.*$in*9.75*$ft*150.*$pcf/$g] [expr 20.*$in*20.*$in*9.75*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 56] [expr 20.*$in*20.*$in*9.75*$ft*150.*$pcf/$g] [expr 20.*$in*20.*$in*9.75*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 57] [expr 20.*$in*20.*$in*9.75*$ft*150.*$pcf/$g] [expr 20.*$in*20.*$in*9.75*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 58] [expr 20.*$in*20.*$in*9.75*$ft*150.*$pcf/$g] [expr 20.*$in*20.*$in*9.75*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 59] [expr 20.*$in*20.*$in*9.75*$ft*150.*$pcf/$g] [expr 20.*$in*20.*$in*9.75*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 60] [expr 20.*$in*20.*$in*9.75*$ft*150.*$pcf/$g] [expr 20.*$in*20.*$in*9.75*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		
	} elseif {$i >= 26} {
		
		#12x12
		mass [expr 1000*$i + 800 + 38] [expr 12.*$in*12.*$in*9.75*$ft*150.*$pcf/$g] [expr 12.*$in*12.*$in*9.75*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 48] [expr 12.*$in*12.*$in*9.75*$ft*150.*$pcf/$g] [expr 12.*$in*12.*$in*9.75*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 80] [expr 12.*$in*12.*$in*9.75*$ft*150.*$pcf/$g] [expr 12.*$in*12.*$in*9.75*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 90] [expr 12.*$in*12.*$in*9.75*$ft*150.*$pcf/$g] [expr 12.*$in*12.*$in*9.75*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		
		#16x16
		mass [expr 1000*$i + 800 + 39] [expr 16.*$in*16.*$in*9.75*$ft*150.*$pcf/$g] [expr 16.*$in*16.*$in*9.75*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 40] [expr 16.*$in*16.*$in*9.75*$ft*150.*$pcf/$g] [expr 16.*$in*16.*$in*9.75*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 41] [expr 16.*$in*16.*$in*9.75*$ft*150.*$pcf/$g] [expr 16.*$in*16.*$in*9.75*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 42] [expr 16.*$in*16.*$in*9.75*$ft*150.*$pcf/$g] [expr 16.*$in*16.*$in*9.75*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 43] [expr 16.*$in*16.*$in*9.75*$ft*150.*$pcf/$g] [expr 16.*$in*16.*$in*9.75*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 44] [expr 16.*$in*16.*$in*9.75*$ft*150.*$pcf/$g] [expr 16.*$in*16.*$in*9.75*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 45] [expr 16.*$in*16.*$in*9.75*$ft*150.*$pcf/$g] [expr 16.*$in*16.*$in*9.75*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 46] [expr 16.*$in*16.*$in*9.75*$ft*150.*$pcf/$g] [expr 16.*$in*16.*$in*9.75*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 47] [expr 16.*$in*16.*$in*9.75*$ft*150.*$pcf/$g] [expr 16.*$in*16.*$in*9.75*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 51] [expr 16.*$in*16.*$in*9.75*$ft*150.*$pcf/$g] [expr 16.*$in*16.*$in*9.75*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 61] [expr 16.*$in*16.*$in*9.75*$ft*150.*$pcf/$g] [expr 16.*$in*16.*$in*9.75*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 64] [expr 16.*$in*16.*$in*9.75*$ft*150.*$pcf/$g] [expr 16.*$in*16.*$in*9.75*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 70] [expr 16.*$in*16.*$in*9.75*$ft*150.*$pcf/$g] [expr 16.*$in*16.*$in*9.75*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 71] [expr 16.*$in*16.*$in*9.75*$ft*150.*$pcf/$g] [expr 16.*$in*16.*$in*9.75*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 77] [expr 16.*$in*16.*$in*9.75*$ft*150.*$pcf/$g] [expr 16.*$in*16.*$in*9.75*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 81] [expr 16.*$in*16.*$in*9.75*$ft*150.*$pcf/$g] [expr 16.*$in*16.*$in*9.75*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 82] [expr 16.*$in*16.*$in*9.75*$ft*150.*$pcf/$g] [expr 16.*$in*16.*$in*9.75*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 83] [expr 16.*$in*16.*$in*9.75*$ft*150.*$pcf/$g] [expr 16.*$in*16.*$in*9.75*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 84] [expr 16.*$in*16.*$in*9.75*$ft*150.*$pcf/$g] [expr 16.*$in*16.*$in*9.75*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 85] [expr 16.*$in*16.*$in*9.75*$ft*150.*$pcf/$g] [expr 16.*$in*16.*$in*9.75*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 86] [expr 16.*$in*16.*$in*9.75*$ft*150.*$pcf/$g] [expr 16.*$in*16.*$in*9.75*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 87] [expr 16.*$in*16.*$in*9.75*$ft*150.*$pcf/$g] [expr 16.*$in*16.*$in*9.75*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 88] [expr 16.*$in*16.*$in*9.75*$ft*150.*$pcf/$g] [expr 16.*$in*16.*$in*9.75*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 89] [expr 16.*$in*16.*$in*9.75*$ft*150.*$pcf/$g] [expr 16.*$in*16.*$in*9.75*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		
		#20x20
		mass [expr 1000*$i + 800 + 66] [expr 20.*$in*20.*$in*9.75*$ft*150.*$pcf/$g] [expr 20.*$in*20.*$in*9.75*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 67] [expr 20.*$in*20.*$in*9.75*$ft*150.*$pcf/$g] [expr 20.*$in*20.*$in*9.75*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 73] [expr 20.*$in*20.*$in*9.75*$ft*150.*$pcf/$g] [expr 20.*$in*20.*$in*9.75*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 74] [expr 20.*$in*20.*$in*9.75*$ft*150.*$pcf/$g] [expr 20.*$in*20.*$in*9.75*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		
		#24x24
		mass [expr 1000*$i + 800 + 65] [expr 24.*$in*24.*$in*9.75*$ft*150.*$pcf/$g] [expr 24.*$in*24.*$in*9.75*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 68] [expr 24.*$in*24.*$in*9.75*$ft*150.*$pcf/$g] [expr 24.*$in*24.*$in*9.75*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 69] [expr 24.*$in*24.*$in*9.75*$ft*150.*$pcf/$g] [expr 24.*$in*24.*$in*9.75*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 72] [expr 24.*$in*24.*$in*9.75*$ft*150.*$pcf/$g] [expr 24.*$in*24.*$in*9.75*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 75] [expr 24.*$in*24.*$in*9.75*$ft*150.*$pcf/$g] [expr 24.*$in*24.*$in*9.75*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 76] [expr 24.*$in*24.*$in*9.75*$ft*150.*$pcf/$g] [expr 24.*$in*24.*$in*9.75*$ft*150.*$pcf/$g] 0. 0. 0. 0.

		#28x28                                                                       
		mass [expr 1000*$i + 800 + 52] [expr 28.*$in*28.*$in*9.75*$ft*150.*$pcf/$g] [expr 28.*$in*28.*$in*9.75*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 53] [expr 28.*$in*28.*$in*9.75*$ft*150.*$pcf/$g] [expr 28.*$in*28.*$in*9.75*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 54] [expr 28.*$in*28.*$in*9.75*$ft*150.*$pcf/$g] [expr 28.*$in*28.*$in*9.75*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 55] [expr 28.*$in*28.*$in*9.75*$ft*150.*$pcf/$g] [expr 28.*$in*28.*$in*9.75*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 56] [expr 28.*$in*28.*$in*9.75*$ft*150.*$pcf/$g] [expr 28.*$in*28.*$in*9.75*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 57] [expr 28.*$in*28.*$in*9.75*$ft*150.*$pcf/$g] [expr 28.*$in*28.*$in*9.75*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 58] [expr 28.*$in*28.*$in*9.75*$ft*150.*$pcf/$g] [expr 28.*$in*28.*$in*9.75*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 59] [expr 28.*$in*28.*$in*9.75*$ft*150.*$pcf/$g] [expr 28.*$in*28.*$in*9.75*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 60] [expr 28.*$in*28.*$in*9.75*$ft*150.*$pcf/$g] [expr 28.*$in*28.*$in*9.75*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		
	} elseif {$i >= 21} {
		
		#12x12
		mass [expr 1000*$i + 800 + 38] [expr 12.*$in*12.*$in*9.75*$ft*150.*$pcf/$g] [expr 12.*$in*12.*$in*9.75*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 48] [expr 12.*$in*12.*$in*9.75*$ft*150.*$pcf/$g] [expr 12.*$in*12.*$in*9.75*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 80] [expr 12.*$in*12.*$in*9.75*$ft*150.*$pcf/$g] [expr 12.*$in*12.*$in*9.75*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 90] [expr 12.*$in*12.*$in*9.75*$ft*150.*$pcf/$g] [expr 12.*$in*12.*$in*9.75*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		
		#20x20
		mass [expr 1000*$i + 800 + 39] [expr 20.*$in*20.*$in*9.75*$ft*150.*$pcf/$g] [expr 20.*$in*20.*$in*9.75*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 40] [expr 20.*$in*20.*$in*9.75*$ft*150.*$pcf/$g] [expr 20.*$in*20.*$in*9.75*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 41] [expr 20.*$in*20.*$in*9.75*$ft*150.*$pcf/$g] [expr 20.*$in*20.*$in*9.75*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 42] [expr 20.*$in*20.*$in*9.75*$ft*150.*$pcf/$g] [expr 20.*$in*20.*$in*9.75*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 43] [expr 20.*$in*20.*$in*9.75*$ft*150.*$pcf/$g] [expr 20.*$in*20.*$in*9.75*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 44] [expr 20.*$in*20.*$in*9.75*$ft*150.*$pcf/$g] [expr 20.*$in*20.*$in*9.75*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 45] [expr 20.*$in*20.*$in*9.75*$ft*150.*$pcf/$g] [expr 20.*$in*20.*$in*9.75*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 46] [expr 20.*$in*20.*$in*9.75*$ft*150.*$pcf/$g] [expr 20.*$in*20.*$in*9.75*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 47] [expr 20.*$in*20.*$in*9.75*$ft*150.*$pcf/$g] [expr 20.*$in*20.*$in*9.75*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 51] [expr 20.*$in*20.*$in*9.75*$ft*150.*$pcf/$g] [expr 20.*$in*20.*$in*9.75*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 61] [expr 20.*$in*20.*$in*9.75*$ft*150.*$pcf/$g] [expr 20.*$in*20.*$in*9.75*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 64] [expr 20.*$in*20.*$in*9.75*$ft*150.*$pcf/$g] [expr 20.*$in*20.*$in*9.75*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 70] [expr 20.*$in*20.*$in*9.75*$ft*150.*$pcf/$g] [expr 20.*$in*20.*$in*9.75*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 71] [expr 20.*$in*20.*$in*9.75*$ft*150.*$pcf/$g] [expr 20.*$in*20.*$in*9.75*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 77] [expr 20.*$in*20.*$in*9.75*$ft*150.*$pcf/$g] [expr 20.*$in*20.*$in*9.75*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 81] [expr 20.*$in*20.*$in*9.75*$ft*150.*$pcf/$g] [expr 20.*$in*20.*$in*9.75*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 82] [expr 20.*$in*20.*$in*9.75*$ft*150.*$pcf/$g] [expr 20.*$in*20.*$in*9.75*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 83] [expr 20.*$in*20.*$in*9.75*$ft*150.*$pcf/$g] [expr 20.*$in*20.*$in*9.75*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 84] [expr 20.*$in*20.*$in*9.75*$ft*150.*$pcf/$g] [expr 20.*$in*20.*$in*9.75*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 85] [expr 20.*$in*20.*$in*9.75*$ft*150.*$pcf/$g] [expr 20.*$in*20.*$in*9.75*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 86] [expr 20.*$in*20.*$in*9.75*$ft*150.*$pcf/$g] [expr 20.*$in*20.*$in*9.75*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 87] [expr 20.*$in*20.*$in*9.75*$ft*150.*$pcf/$g] [expr 20.*$in*20.*$in*9.75*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 88] [expr 20.*$in*20.*$in*9.75*$ft*150.*$pcf/$g] [expr 20.*$in*20.*$in*9.75*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 89] [expr 20.*$in*20.*$in*9.75*$ft*150.*$pcf/$g] [expr 20.*$in*20.*$in*9.75*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		
		#24x24
		mass [expr 1000*$i + 800 + 66] [expr 24.*$in*24.*$in*9.75*$ft*150.*$pcf/$g] [expr 24.*$in*24.*$in*9.75*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 67] [expr 24.*$in*24.*$in*9.75*$ft*150.*$pcf/$g] [expr 24.*$in*24.*$in*9.75*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 73] [expr 24.*$in*24.*$in*9.75*$ft*150.*$pcf/$g] [expr 24.*$in*24.*$in*9.75*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 74] [expr 24.*$in*24.*$in*9.75*$ft*150.*$pcf/$g] [expr 24.*$in*24.*$in*9.75*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		
		#32x32
		mass [expr 1000*$i + 800 + 52] [expr 32.*$in*32.*$in*9.75*$ft*150.*$pcf/$g] [expr 32.*$in*32.*$in*9.75*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 53] [expr 32.*$in*32.*$in*9.75*$ft*150.*$pcf/$g] [expr 32.*$in*32.*$in*9.75*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 54] [expr 32.*$in*32.*$in*9.75*$ft*150.*$pcf/$g] [expr 32.*$in*32.*$in*9.75*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 55] [expr 32.*$in*32.*$in*9.75*$ft*150.*$pcf/$g] [expr 32.*$in*32.*$in*9.75*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 56] [expr 32.*$in*32.*$in*9.75*$ft*150.*$pcf/$g] [expr 32.*$in*32.*$in*9.75*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 57] [expr 32.*$in*32.*$in*9.75*$ft*150.*$pcf/$g] [expr 32.*$in*32.*$in*9.75*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 58] [expr 32.*$in*32.*$in*9.75*$ft*150.*$pcf/$g] [expr 32.*$in*32.*$in*9.75*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 59] [expr 32.*$in*32.*$in*9.75*$ft*150.*$pcf/$g] [expr 32.*$in*32.*$in*9.75*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 60] [expr 32.*$in*32.*$in*9.75*$ft*150.*$pcf/$g] [expr 32.*$in*32.*$in*9.75*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 65] [expr 32.*$in*32.*$in*9.75*$ft*150.*$pcf/$g] [expr 32.*$in*32.*$in*9.75*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 68] [expr 32.*$in*32.*$in*9.75*$ft*150.*$pcf/$g] [expr 32.*$in*32.*$in*9.75*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 69] [expr 32.*$in*32.*$in*9.75*$ft*150.*$pcf/$g] [expr 32.*$in*32.*$in*9.75*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 72] [expr 32.*$in*32.*$in*9.75*$ft*150.*$pcf/$g] [expr 32.*$in*32.*$in*9.75*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 75] [expr 32.*$in*32.*$in*9.75*$ft*150.*$pcf/$g] [expr 32.*$in*32.*$in*9.75*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 76] [expr 32.*$in*32.*$in*9.75*$ft*150.*$pcf/$g] [expr 32.*$in*32.*$in*9.75*$ft*150.*$pcf/$g] 0. 0. 0. 0.
	
	} elseif {$i >= 16} {
	
		#16x16
		mass [expr 1000*$i + 800 + 38] [expr 16.*$in*16.*$in*9.75*$ft*150.*$pcf/$g] [expr 16.*$in*16.*$in*9.75*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 48] [expr 16.*$in*16.*$in*9.75*$ft*150.*$pcf/$g] [expr 16.*$in*16.*$in*9.75*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 80] [expr 16.*$in*16.*$in*9.75*$ft*150.*$pcf/$g] [expr 16.*$in*16.*$in*9.75*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 90] [expr 16.*$in*16.*$in*9.75*$ft*150.*$pcf/$g] [expr 16.*$in*16.*$in*9.75*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		
		#20x20
		mass [expr 1000*$i + 800 + 39] [expr 20.*$in*20.*$in*9.75*$ft*150.*$pcf/$g] [expr 20.*$in*20.*$in*9.75*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 40] [expr 20.*$in*20.*$in*9.75*$ft*150.*$pcf/$g] [expr 20.*$in*20.*$in*9.75*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 41] [expr 20.*$in*20.*$in*9.75*$ft*150.*$pcf/$g] [expr 20.*$in*20.*$in*9.75*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 42] [expr 20.*$in*20.*$in*9.75*$ft*150.*$pcf/$g] [expr 20.*$in*20.*$in*9.75*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 43] [expr 20.*$in*20.*$in*9.75*$ft*150.*$pcf/$g] [expr 20.*$in*20.*$in*9.75*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 44] [expr 20.*$in*20.*$in*9.75*$ft*150.*$pcf/$g] [expr 20.*$in*20.*$in*9.75*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 45] [expr 20.*$in*20.*$in*9.75*$ft*150.*$pcf/$g] [expr 20.*$in*20.*$in*9.75*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 46] [expr 20.*$in*20.*$in*9.75*$ft*150.*$pcf/$g] [expr 20.*$in*20.*$in*9.75*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 47] [expr 20.*$in*20.*$in*9.75*$ft*150.*$pcf/$g] [expr 20.*$in*20.*$in*9.75*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 51] [expr 20.*$in*20.*$in*9.75*$ft*150.*$pcf/$g] [expr 20.*$in*20.*$in*9.75*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 61] [expr 20.*$in*20.*$in*9.75*$ft*150.*$pcf/$g] [expr 20.*$in*20.*$in*9.75*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 64] [expr 20.*$in*20.*$in*9.75*$ft*150.*$pcf/$g] [expr 20.*$in*20.*$in*9.75*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 70] [expr 20.*$in*20.*$in*9.75*$ft*150.*$pcf/$g] [expr 20.*$in*20.*$in*9.75*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 71] [expr 20.*$in*20.*$in*9.75*$ft*150.*$pcf/$g] [expr 20.*$in*20.*$in*9.75*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 77] [expr 20.*$in*20.*$in*9.75*$ft*150.*$pcf/$g] [expr 20.*$in*20.*$in*9.75*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 81] [expr 20.*$in*20.*$in*9.75*$ft*150.*$pcf/$g] [expr 20.*$in*20.*$in*9.75*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 82] [expr 20.*$in*20.*$in*9.75*$ft*150.*$pcf/$g] [expr 20.*$in*20.*$in*9.75*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 83] [expr 20.*$in*20.*$in*9.75*$ft*150.*$pcf/$g] [expr 20.*$in*20.*$in*9.75*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 84] [expr 20.*$in*20.*$in*9.75*$ft*150.*$pcf/$g] [expr 20.*$in*20.*$in*9.75*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 85] [expr 20.*$in*20.*$in*9.75*$ft*150.*$pcf/$g] [expr 20.*$in*20.*$in*9.75*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 86] [expr 20.*$in*20.*$in*9.75*$ft*150.*$pcf/$g] [expr 20.*$in*20.*$in*9.75*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 87] [expr 20.*$in*20.*$in*9.75*$ft*150.*$pcf/$g] [expr 20.*$in*20.*$in*9.75*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 88] [expr 20.*$in*20.*$in*9.75*$ft*150.*$pcf/$g] [expr 20.*$in*20.*$in*9.75*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 89] [expr 20.*$in*20.*$in*9.75*$ft*150.*$pcf/$g] [expr 20.*$in*20.*$in*9.75*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		
		#28x28
		mass [expr 1000*$i + 800 + 66] [expr 28.*$in*28.*$in*9.75*$ft*150.*$pcf/$g] [expr 28.*$in*28.*$in*9.75*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 67] [expr 28.*$in*28.*$in*9.75*$ft*150.*$pcf/$g] [expr 28.*$in*28.*$in*9.75*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 73] [expr 28.*$in*28.*$in*9.75*$ft*150.*$pcf/$g] [expr 28.*$in*28.*$in*9.75*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 74] [expr 28.*$in*28.*$in*9.75*$ft*150.*$pcf/$g] [expr 28.*$in*28.*$in*9.75*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		
		#32x32
		mass [expr 1000*$i + 800 + 52] [expr 32.*$in*32.*$in*9.75*$ft*150.*$pcf/$g] [expr 32.*$in*32.*$in*9.75*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 53] [expr 32.*$in*32.*$in*9.75*$ft*150.*$pcf/$g] [expr 32.*$in*32.*$in*9.75*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 54] [expr 32.*$in*32.*$in*9.75*$ft*150.*$pcf/$g] [expr 32.*$in*32.*$in*9.75*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 55] [expr 32.*$in*32.*$in*9.75*$ft*150.*$pcf/$g] [expr 32.*$in*32.*$in*9.75*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 56] [expr 32.*$in*32.*$in*9.75*$ft*150.*$pcf/$g] [expr 32.*$in*32.*$in*9.75*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 57] [expr 32.*$in*32.*$in*9.75*$ft*150.*$pcf/$g] [expr 32.*$in*32.*$in*9.75*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 58] [expr 32.*$in*32.*$in*9.75*$ft*150.*$pcf/$g] [expr 32.*$in*32.*$in*9.75*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 59] [expr 32.*$in*32.*$in*9.75*$ft*150.*$pcf/$g] [expr 32.*$in*32.*$in*9.75*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 60] [expr 32.*$in*32.*$in*9.75*$ft*150.*$pcf/$g] [expr 32.*$in*32.*$in*9.75*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 65] [expr 32.*$in*32.*$in*9.75*$ft*150.*$pcf/$g] [expr 32.*$in*32.*$in*9.75*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 68] [expr 32.*$in*32.*$in*9.75*$ft*150.*$pcf/$g] [expr 32.*$in*32.*$in*9.75*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 69] [expr 32.*$in*32.*$in*9.75*$ft*150.*$pcf/$g] [expr 32.*$in*32.*$in*9.75*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 72] [expr 32.*$in*32.*$in*9.75*$ft*150.*$pcf/$g] [expr 32.*$in*32.*$in*9.75*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 75] [expr 32.*$in*32.*$in*9.75*$ft*150.*$pcf/$g] [expr 32.*$in*32.*$in*9.75*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 76] [expr 32.*$in*32.*$in*9.75*$ft*150.*$pcf/$g] [expr 32.*$in*32.*$in*9.75*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		
	} elseif {$i >= 12} {
	
		#16x16
		mass [expr 1000*$i + 800 + 38] [expr 16.*$in*16.*$in*9.75*$ft*150.*$pcf/$g] [expr 16.*$in*16.*$in*9.75*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 48] [expr 16.*$in*16.*$in*9.75*$ft*150.*$pcf/$g] [expr 16.*$in*16.*$in*9.75*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 80] [expr 16.*$in*16.*$in*9.75*$ft*150.*$pcf/$g] [expr 16.*$in*16.*$in*9.75*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 90] [expr 16.*$in*16.*$in*9.75*$ft*150.*$pcf/$g] [expr 16.*$in*16.*$in*9.75*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		
		#24x24
		mass [expr 1000*$i + 800 + 39] [expr 24.*$in*24.*$in*9.75*$ft*150.*$pcf/$g] [expr 24.*$in*24.*$in*9.75*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 40] [expr 24.*$in*24.*$in*9.75*$ft*150.*$pcf/$g] [expr 24.*$in*24.*$in*9.75*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 41] [expr 24.*$in*24.*$in*9.75*$ft*150.*$pcf/$g] [expr 24.*$in*24.*$in*9.75*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 42] [expr 24.*$in*24.*$in*9.75*$ft*150.*$pcf/$g] [expr 24.*$in*24.*$in*9.75*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 43] [expr 24.*$in*24.*$in*9.75*$ft*150.*$pcf/$g] [expr 24.*$in*24.*$in*9.75*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 44] [expr 24.*$in*24.*$in*9.75*$ft*150.*$pcf/$g] [expr 24.*$in*24.*$in*9.75*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 45] [expr 24.*$in*24.*$in*9.75*$ft*150.*$pcf/$g] [expr 24.*$in*24.*$in*9.75*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 46] [expr 24.*$in*24.*$in*9.75*$ft*150.*$pcf/$g] [expr 24.*$in*24.*$in*9.75*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 47] [expr 24.*$in*24.*$in*9.75*$ft*150.*$pcf/$g] [expr 24.*$in*24.*$in*9.75*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 51] [expr 24.*$in*24.*$in*9.75*$ft*150.*$pcf/$g] [expr 24.*$in*24.*$in*9.75*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 61] [expr 24.*$in*24.*$in*9.75*$ft*150.*$pcf/$g] [expr 24.*$in*24.*$in*9.75*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 64] [expr 24.*$in*24.*$in*9.75*$ft*150.*$pcf/$g] [expr 24.*$in*24.*$in*9.75*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 70] [expr 24.*$in*24.*$in*9.75*$ft*150.*$pcf/$g] [expr 24.*$in*24.*$in*9.75*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 71] [expr 24.*$in*24.*$in*9.75*$ft*150.*$pcf/$g] [expr 24.*$in*24.*$in*9.75*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 77] [expr 24.*$in*24.*$in*9.75*$ft*150.*$pcf/$g] [expr 24.*$in*24.*$in*9.75*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 81] [expr 24.*$in*24.*$in*9.75*$ft*150.*$pcf/$g] [expr 24.*$in*24.*$in*9.75*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 82] [expr 24.*$in*24.*$in*9.75*$ft*150.*$pcf/$g] [expr 24.*$in*24.*$in*9.75*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 83] [expr 24.*$in*24.*$in*9.75*$ft*150.*$pcf/$g] [expr 24.*$in*24.*$in*9.75*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 84] [expr 24.*$in*24.*$in*9.75*$ft*150.*$pcf/$g] [expr 24.*$in*24.*$in*9.75*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 85] [expr 24.*$in*24.*$in*9.75*$ft*150.*$pcf/$g] [expr 24.*$in*24.*$in*9.75*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 86] [expr 24.*$in*24.*$in*9.75*$ft*150.*$pcf/$g] [expr 24.*$in*24.*$in*9.75*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 87] [expr 24.*$in*24.*$in*9.75*$ft*150.*$pcf/$g] [expr 24.*$in*24.*$in*9.75*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 88] [expr 24.*$in*24.*$in*9.75*$ft*150.*$pcf/$g] [expr 24.*$in*24.*$in*9.75*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 89] [expr 24.*$in*24.*$in*9.75*$ft*150.*$pcf/$g] [expr 24.*$in*24.*$in*9.75*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		
		#32x32
		mass [expr 1000*$i + 800 + 66] [expr 32.*$in*32.*$in*9.75*$ft*150.*$pcf/$g] [expr 32.*$in*32.*$in*9.75*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 67] [expr 32.*$in*32.*$in*9.75*$ft*150.*$pcf/$g] [expr 32.*$in*32.*$in*9.75*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 73] [expr 32.*$in*32.*$in*9.75*$ft*150.*$pcf/$g] [expr 32.*$in*32.*$in*9.75*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 74] [expr 32.*$in*32.*$in*9.75*$ft*150.*$pcf/$g] [expr 32.*$in*32.*$in*9.75*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		
		#36x36
		mass [expr 1000*$i + 800 + 52] [expr 36.*$in*36.*$in*9.75*$ft*150.*$pcf/$g] [expr 36.*$in*36.*$in*9.75*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 53] [expr 36.*$in*36.*$in*9.75*$ft*150.*$pcf/$g] [expr 36.*$in*36.*$in*9.75*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 54] [expr 36.*$in*36.*$in*9.75*$ft*150.*$pcf/$g] [expr 36.*$in*36.*$in*9.75*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 55] [expr 36.*$in*36.*$in*9.75*$ft*150.*$pcf/$g] [expr 36.*$in*36.*$in*9.75*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 56] [expr 36.*$in*36.*$in*9.75*$ft*150.*$pcf/$g] [expr 36.*$in*36.*$in*9.75*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 57] [expr 36.*$in*36.*$in*9.75*$ft*150.*$pcf/$g] [expr 36.*$in*36.*$in*9.75*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 58] [expr 36.*$in*36.*$in*9.75*$ft*150.*$pcf/$g] [expr 36.*$in*36.*$in*9.75*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 59] [expr 36.*$in*36.*$in*9.75*$ft*150.*$pcf/$g] [expr 36.*$in*36.*$in*9.75*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 60] [expr 36.*$in*36.*$in*9.75*$ft*150.*$pcf/$g] [expr 36.*$in*36.*$in*9.75*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 65] [expr 36.*$in*36.*$in*9.75*$ft*150.*$pcf/$g] [expr 36.*$in*36.*$in*9.75*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 68] [expr 36.*$in*36.*$in*9.75*$ft*150.*$pcf/$g] [expr 36.*$in*36.*$in*9.75*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 69] [expr 36.*$in*36.*$in*9.75*$ft*150.*$pcf/$g] [expr 36.*$in*36.*$in*9.75*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 72] [expr 36.*$in*36.*$in*9.75*$ft*150.*$pcf/$g] [expr 36.*$in*36.*$in*9.75*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 75] [expr 36.*$in*36.*$in*9.75*$ft*150.*$pcf/$g] [expr 36.*$in*36.*$in*9.75*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 76] [expr 36.*$in*36.*$in*9.75*$ft*150.*$pcf/$g] [expr 36.*$in*36.*$in*9.75*$ft*150.*$pcf/$g] 0. 0. 0. 0.
	
	} elseif {$i == 11} {
	
		#16x16
		mass [expr 1000*$i + 800 + 38] [expr 16.*$in*16.*$in*12.5*$ft*150.*$pcf/$g] [expr 16.*$in*16.*$in*12.5*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 48] [expr 16.*$in*16.*$in*12.5*$ft*150.*$pcf/$g] [expr 16.*$in*16.*$in*12.5*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 80] [expr 16.*$in*16.*$in*12.5*$ft*150.*$pcf/$g] [expr 16.*$in*16.*$in*12.5*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 90] [expr 16.*$in*16.*$in*12.5*$ft*150.*$pcf/$g] [expr 16.*$in*16.*$in*12.5*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		
		#24x24
		mass [expr 1000*$i + 800 + 39] [expr 24.*$in*24.*$in*12.5*$ft*150.*$pcf/$g] [expr 24.*$in*24.*$in*12.5*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 40] [expr 24.*$in*24.*$in*12.5*$ft*150.*$pcf/$g] [expr 24.*$in*24.*$in*12.5*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 41] [expr 24.*$in*24.*$in*12.5*$ft*150.*$pcf/$g] [expr 24.*$in*24.*$in*12.5*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 42] [expr 24.*$in*24.*$in*12.5*$ft*150.*$pcf/$g] [expr 24.*$in*24.*$in*12.5*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 43] [expr 24.*$in*24.*$in*12.5*$ft*150.*$pcf/$g] [expr 24.*$in*24.*$in*12.5*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 44] [expr 24.*$in*24.*$in*12.5*$ft*150.*$pcf/$g] [expr 24.*$in*24.*$in*12.5*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 45] [expr 24.*$in*24.*$in*12.5*$ft*150.*$pcf/$g] [expr 24.*$in*24.*$in*12.5*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 46] [expr 24.*$in*24.*$in*12.5*$ft*150.*$pcf/$g] [expr 24.*$in*24.*$in*12.5*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 47] [expr 24.*$in*24.*$in*12.5*$ft*150.*$pcf/$g] [expr 24.*$in*24.*$in*12.5*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 51] [expr 24.*$in*24.*$in*12.5*$ft*150.*$pcf/$g] [expr 24.*$in*24.*$in*12.5*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 61] [expr 24.*$in*24.*$in*12.5*$ft*150.*$pcf/$g] [expr 24.*$in*24.*$in*12.5*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 64] [expr 24.*$in*24.*$in*12.5*$ft*150.*$pcf/$g] [expr 24.*$in*24.*$in*12.5*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 70] [expr 24.*$in*24.*$in*12.5*$ft*150.*$pcf/$g] [expr 24.*$in*24.*$in*12.5*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 71] [expr 24.*$in*24.*$in*12.5*$ft*150.*$pcf/$g] [expr 24.*$in*24.*$in*12.5*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 77] [expr 24.*$in*24.*$in*12.5*$ft*150.*$pcf/$g] [expr 24.*$in*24.*$in*12.5*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 81] [expr 24.*$in*24.*$in*12.5*$ft*150.*$pcf/$g] [expr 24.*$in*24.*$in*12.5*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 82] [expr 24.*$in*24.*$in*12.5*$ft*150.*$pcf/$g] [expr 24.*$in*24.*$in*12.5*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 83] [expr 24.*$in*24.*$in*12.5*$ft*150.*$pcf/$g] [expr 24.*$in*24.*$in*12.5*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 84] [expr 24.*$in*24.*$in*12.5*$ft*150.*$pcf/$g] [expr 24.*$in*24.*$in*12.5*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 85] [expr 24.*$in*24.*$in*12.5*$ft*150.*$pcf/$g] [expr 24.*$in*24.*$in*12.5*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 86] [expr 24.*$in*24.*$in*12.5*$ft*150.*$pcf/$g] [expr 24.*$in*24.*$in*12.5*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 87] [expr 24.*$in*24.*$in*12.5*$ft*150.*$pcf/$g] [expr 24.*$in*24.*$in*12.5*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 88] [expr 24.*$in*24.*$in*12.5*$ft*150.*$pcf/$g] [expr 24.*$in*24.*$in*12.5*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 89] [expr 24.*$in*24.*$in*12.5*$ft*150.*$pcf/$g] [expr 24.*$in*24.*$in*12.5*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		
		#32x32
		mass [expr 1000*$i + 800 + 66] [expr 32.*$in*32.*$in*12.5*$ft*150.*$pcf/$g] [expr 32.*$in*32.*$in*12.5*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 67] [expr 32.*$in*32.*$in*12.5*$ft*150.*$pcf/$g] [expr 32.*$in*32.*$in*12.5*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 73] [expr 32.*$in*32.*$in*12.5*$ft*150.*$pcf/$g] [expr 32.*$in*32.*$in*12.5*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 74] [expr 32.*$in*32.*$in*12.5*$ft*150.*$pcf/$g] [expr 32.*$in*32.*$in*12.5*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		
		#36x36
		mass [expr 1000*$i + 800 + 52] [expr 36.*$in*36.*$in*12.5*$ft*150.*$pcf/$g] [expr 36.*$in*36.*$in*12.5*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 53] [expr 36.*$in*36.*$in*12.5*$ft*150.*$pcf/$g] [expr 36.*$in*36.*$in*12.5*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 54] [expr 36.*$in*36.*$in*12.5*$ft*150.*$pcf/$g] [expr 36.*$in*36.*$in*12.5*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 55] [expr 36.*$in*36.*$in*12.5*$ft*150.*$pcf/$g] [expr 36.*$in*36.*$in*12.5*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 56] [expr 36.*$in*36.*$in*12.5*$ft*150.*$pcf/$g] [expr 36.*$in*36.*$in*12.5*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 57] [expr 36.*$in*36.*$in*12.5*$ft*150.*$pcf/$g] [expr 36.*$in*36.*$in*12.5*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 58] [expr 36.*$in*36.*$in*12.5*$ft*150.*$pcf/$g] [expr 36.*$in*36.*$in*12.5*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 59] [expr 36.*$in*36.*$in*12.5*$ft*150.*$pcf/$g] [expr 36.*$in*36.*$in*12.5*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 60] [expr 36.*$in*36.*$in*12.5*$ft*150.*$pcf/$g] [expr 36.*$in*36.*$in*12.5*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 65] [expr 36.*$in*36.*$in*12.5*$ft*150.*$pcf/$g] [expr 36.*$in*36.*$in*12.5*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 68] [expr 36.*$in*36.*$in*12.5*$ft*150.*$pcf/$g] [expr 36.*$in*36.*$in*12.5*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 69] [expr 36.*$in*36.*$in*12.5*$ft*150.*$pcf/$g] [expr 36.*$in*36.*$in*12.5*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 72] [expr 36.*$in*36.*$in*12.5*$ft*150.*$pcf/$g] [expr 36.*$in*36.*$in*12.5*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 75] [expr 36.*$in*36.*$in*12.5*$ft*150.*$pcf/$g] [expr 36.*$in*36.*$in*12.5*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 76] [expr 36.*$in*36.*$in*12.5*$ft*150.*$pcf/$g] [expr 36.*$in*36.*$in*12.5*$ft*150.*$pcf/$g] 0. 0. 0. 0.
	
	} elseif {$i >= 6} {
	
		#12x12
		mass [expr 1000*$i + 800 +  9] [expr 12.*$in*12.*$in*12.5*$ft*150.*$pcf/$g] [expr 12.*$in*12.*$in*12.5*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 10] [expr 12.*$in*12.*$in*12.5*$ft*150.*$pcf/$g] [expr 12.*$in*12.*$in*12.5*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 11] [expr 12.*$in*12.*$in*12.5*$ft*150.*$pcf/$g] [expr 12.*$in*12.*$in*12.5*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 12] [expr 12.*$in*12.*$in*12.5*$ft*150.*$pcf/$g] [expr 12.*$in*12.*$in*12.5*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 13] [expr 12.*$in*12.*$in*12.5*$ft*150.*$pcf/$g] [expr 12.*$in*12.*$in*12.5*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 22] [expr 12.*$in*12.*$in*12.5*$ft*150.*$pcf/$g] [expr 12.*$in*12.*$in*12.5*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 25] [expr 12.*$in*12.*$in*12.5*$ft*150.*$pcf/$g] [expr 12.*$in*12.*$in*12.5*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 26] [expr 12.*$in*12.*$in*12.5*$ft*150.*$pcf/$g] [expr 12.*$in*12.*$in*12.5*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 27] [expr 12.*$in*12.*$in*12.5*$ft*150.*$pcf/$g] [expr 12.*$in*12.*$in*12.5*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 28] [expr 12.*$in*12.*$in*12.5*$ft*150.*$pcf/$g] [expr 12.*$in*12.*$in*12.5*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 29] [expr 12.*$in*12.*$in*12.5*$ft*150.*$pcf/$g] [expr 12.*$in*12.*$in*12.5*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 30] [expr 12.*$in*12.*$in*12.5*$ft*150.*$pcf/$g] [expr 12.*$in*12.*$in*12.5*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 31] [expr 12.*$in*12.*$in*12.5*$ft*150.*$pcf/$g] [expr 12.*$in*12.*$in*12.5*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 32] [expr 12.*$in*12.*$in*12.5*$ft*150.*$pcf/$g] [expr 12.*$in*12.*$in*12.5*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 33] [expr 12.*$in*12.*$in*12.5*$ft*150.*$pcf/$g] [expr 12.*$in*12.*$in*12.5*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 34] [expr 12.*$in*12.*$in*12.5*$ft*150.*$pcf/$g] [expr 12.*$in*12.*$in*12.5*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 37] [expr 12.*$in*12.*$in*12.5*$ft*150.*$pcf/$g] [expr 12.*$in*12.*$in*12.5*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 49] [expr 12.*$in*12.*$in*12.5*$ft*150.*$pcf/$g] [expr 12.*$in*12.*$in*12.5*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 62] [expr 12.*$in*12.*$in*12.5*$ft*150.*$pcf/$g] [expr 12.*$in*12.*$in*12.5*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 78] [expr 12.*$in*12.*$in*12.5*$ft*150.*$pcf/$g] [expr 12.*$in*12.*$in*12.5*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 79] [expr 12.*$in*12.*$in*12.5*$ft*150.*$pcf/$g] [expr 12.*$in*12.*$in*12.5*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		
		#16x16
		mass [expr 1000*$i + 800 + 23] [expr 16.*$in*16.*$in*12.5*$ft*150.*$pcf/$g] [expr 16.*$in*16.*$in*12.5*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 24] [expr 16.*$in*16.*$in*12.5*$ft*150.*$pcf/$g] [expr 16.*$in*16.*$in*12.5*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 35] [expr 16.*$in*16.*$in*12.5*$ft*150.*$pcf/$g] [expr 16.*$in*16.*$in*12.5*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 36] [expr 16.*$in*16.*$in*12.5*$ft*150.*$pcf/$g] [expr 16.*$in*16.*$in*12.5*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 50] [expr 16.*$in*16.*$in*12.5*$ft*150.*$pcf/$g] [expr 16.*$in*16.*$in*12.5*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 63] [expr 16.*$in*16.*$in*12.5*$ft*150.*$pcf/$g] [expr 16.*$in*16.*$in*12.5*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 90] [expr 16.*$in*16.*$in*12.5*$ft*150.*$pcf/$g] [expr 16.*$in*16.*$in*12.5*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		
		#24x24
		mass [expr 1000*$i + 800 + 38] [expr 24.*$in*24.*$in*12.5*$ft*150.*$pcf/$g] [expr 24.*$in*24.*$in*12.5*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 48] [expr 24.*$in*24.*$in*12.5*$ft*150.*$pcf/$g] [expr 24.*$in*24.*$in*12.5*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 80] [expr 24.*$in*24.*$in*12.5*$ft*150.*$pcf/$g] [expr 24.*$in*24.*$in*12.5*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		
		#28x28
		mass [expr 1000*$i + 800 + 39] [expr 28.*$in*28.*$in*12.5*$ft*150.*$pcf/$g] [expr 28.*$in*28.*$in*12.5*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 40] [expr 28.*$in*28.*$in*12.5*$ft*150.*$pcf/$g] [expr 28.*$in*28.*$in*12.5*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 41] [expr 28.*$in*28.*$in*12.5*$ft*150.*$pcf/$g] [expr 28.*$in*28.*$in*12.5*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 42] [expr 28.*$in*28.*$in*12.5*$ft*150.*$pcf/$g] [expr 28.*$in*28.*$in*12.5*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 43] [expr 28.*$in*28.*$in*12.5*$ft*150.*$pcf/$g] [expr 28.*$in*28.*$in*12.5*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 44] [expr 28.*$in*28.*$in*12.5*$ft*150.*$pcf/$g] [expr 28.*$in*28.*$in*12.5*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 45] [expr 28.*$in*28.*$in*12.5*$ft*150.*$pcf/$g] [expr 28.*$in*28.*$in*12.5*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 46] [expr 28.*$in*28.*$in*12.5*$ft*150.*$pcf/$g] [expr 28.*$in*28.*$in*12.5*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 47] [expr 28.*$in*28.*$in*12.5*$ft*150.*$pcf/$g] [expr 28.*$in*28.*$in*12.5*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 51] [expr 28.*$in*28.*$in*12.5*$ft*150.*$pcf/$g] [expr 28.*$in*28.*$in*12.5*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 61] [expr 28.*$in*28.*$in*12.5*$ft*150.*$pcf/$g] [expr 28.*$in*28.*$in*12.5*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 64] [expr 28.*$in*28.*$in*12.5*$ft*150.*$pcf/$g] [expr 28.*$in*28.*$in*12.5*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 70] [expr 28.*$in*28.*$in*12.5*$ft*150.*$pcf/$g] [expr 28.*$in*28.*$in*12.5*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 71] [expr 28.*$in*28.*$in*12.5*$ft*150.*$pcf/$g] [expr 28.*$in*28.*$in*12.5*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 77] [expr 28.*$in*28.*$in*12.5*$ft*150.*$pcf/$g] [expr 28.*$in*28.*$in*12.5*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 81] [expr 28.*$in*28.*$in*12.5*$ft*150.*$pcf/$g] [expr 28.*$in*28.*$in*12.5*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 82] [expr 28.*$in*28.*$in*12.5*$ft*150.*$pcf/$g] [expr 28.*$in*28.*$in*12.5*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 83] [expr 28.*$in*28.*$in*12.5*$ft*150.*$pcf/$g] [expr 28.*$in*28.*$in*12.5*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 84] [expr 28.*$in*28.*$in*12.5*$ft*150.*$pcf/$g] [expr 28.*$in*28.*$in*12.5*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 85] [expr 28.*$in*28.*$in*12.5*$ft*150.*$pcf/$g] [expr 28.*$in*28.*$in*12.5*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 86] [expr 28.*$in*28.*$in*12.5*$ft*150.*$pcf/$g] [expr 28.*$in*28.*$in*12.5*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 87] [expr 28.*$in*28.*$in*12.5*$ft*150.*$pcf/$g] [expr 28.*$in*28.*$in*12.5*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 88] [expr 28.*$in*28.*$in*12.5*$ft*150.*$pcf/$g] [expr 28.*$in*28.*$in*12.5*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 89] [expr 28.*$in*28.*$in*12.5*$ft*150.*$pcf/$g] [expr 28.*$in*28.*$in*12.5*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		
		#32x32
		mass [expr 1000*$i + 800 + 66] [expr 32.*$in*32.*$in*12.5*$ft*150.*$pcf/$g] [expr 32.*$in*32.*$in*12.5*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 67] [expr 32.*$in*32.*$in*12.5*$ft*150.*$pcf/$g] [expr 32.*$in*32.*$in*12.5*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 73] [expr 32.*$in*32.*$in*12.5*$ft*150.*$pcf/$g] [expr 32.*$in*32.*$in*12.5*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 74] [expr 32.*$in*32.*$in*12.5*$ft*150.*$pcf/$g] [expr 32.*$in*32.*$in*12.5*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		
		#40x40
		mass [expr 1000*$i + 800 + 52] [expr 40.*$in*40.*$in*12.5*$ft*150.*$pcf/$g] [expr 40.*$in*40.*$in*12.5*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 53] [expr 40.*$in*40.*$in*12.5*$ft*150.*$pcf/$g] [expr 40.*$in*40.*$in*12.5*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 54] [expr 40.*$in*40.*$in*12.5*$ft*150.*$pcf/$g] [expr 40.*$in*40.*$in*12.5*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 55] [expr 40.*$in*40.*$in*12.5*$ft*150.*$pcf/$g] [expr 40.*$in*40.*$in*12.5*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 56] [expr 40.*$in*40.*$in*12.5*$ft*150.*$pcf/$g] [expr 40.*$in*40.*$in*12.5*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 57] [expr 40.*$in*40.*$in*12.5*$ft*150.*$pcf/$g] [expr 40.*$in*40.*$in*12.5*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 58] [expr 40.*$in*40.*$in*12.5*$ft*150.*$pcf/$g] [expr 40.*$in*40.*$in*12.5*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 59] [expr 40.*$in*40.*$in*12.5*$ft*150.*$pcf/$g] [expr 40.*$in*40.*$in*12.5*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 60] [expr 40.*$in*40.*$in*12.5*$ft*150.*$pcf/$g] [expr 40.*$in*40.*$in*12.5*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 65] [expr 40.*$in*40.*$in*12.5*$ft*150.*$pcf/$g] [expr 40.*$in*40.*$in*12.5*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 68] [expr 40.*$in*40.*$in*12.5*$ft*150.*$pcf/$g] [expr 40.*$in*40.*$in*12.5*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 69] [expr 40.*$in*40.*$in*12.5*$ft*150.*$pcf/$g] [expr 40.*$in*40.*$in*12.5*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 72] [expr 40.*$in*40.*$in*12.5*$ft*150.*$pcf/$g] [expr 40.*$in*40.*$in*12.5*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 75] [expr 40.*$in*40.*$in*12.5*$ft*150.*$pcf/$g] [expr 40.*$in*40.*$in*12.5*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 76] [expr 40.*$in*40.*$in*12.5*$ft*150.*$pcf/$g] [expr 40.*$in*40.*$in*12.5*$ft*150.*$pcf/$g] 0. 0. 0. 0.
	
	} else {
	
		#12x12
		mass [expr 1000*$i + 800 +  9] [expr 12.*$in*12.*$in*16.*$ft*150.*$pcf/$g] [expr 12.*$in*12.*$in*16.*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 10] [expr 12.*$in*12.*$in*16.*$ft*150.*$pcf/$g] [expr 12.*$in*12.*$in*16.*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 11] [expr 12.*$in*12.*$in*16.*$ft*150.*$pcf/$g] [expr 12.*$in*12.*$in*16.*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 12] [expr 12.*$in*12.*$in*16.*$ft*150.*$pcf/$g] [expr 12.*$in*12.*$in*16.*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 13] [expr 12.*$in*12.*$in*16.*$ft*150.*$pcf/$g] [expr 12.*$in*12.*$in*16.*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 22] [expr 12.*$in*12.*$in*16.*$ft*150.*$pcf/$g] [expr 12.*$in*12.*$in*16.*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 25] [expr 12.*$in*12.*$in*16.*$ft*150.*$pcf/$g] [expr 12.*$in*12.*$in*16.*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 26] [expr 12.*$in*12.*$in*16.*$ft*150.*$pcf/$g] [expr 12.*$in*12.*$in*16.*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 27] [expr 12.*$in*12.*$in*16.*$ft*150.*$pcf/$g] [expr 12.*$in*12.*$in*16.*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 28] [expr 12.*$in*12.*$in*16.*$ft*150.*$pcf/$g] [expr 12.*$in*12.*$in*16.*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 29] [expr 12.*$in*12.*$in*16.*$ft*150.*$pcf/$g] [expr 12.*$in*12.*$in*16.*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 30] [expr 12.*$in*12.*$in*16.*$ft*150.*$pcf/$g] [expr 12.*$in*12.*$in*16.*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 31] [expr 12.*$in*12.*$in*16.*$ft*150.*$pcf/$g] [expr 12.*$in*12.*$in*16.*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 32] [expr 12.*$in*12.*$in*16.*$ft*150.*$pcf/$g] [expr 12.*$in*12.*$in*16.*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 33] [expr 12.*$in*12.*$in*16.*$ft*150.*$pcf/$g] [expr 12.*$in*12.*$in*16.*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 37] [expr 12.*$in*12.*$in*16.*$ft*150.*$pcf/$g] [expr 12.*$in*12.*$in*16.*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 49] [expr 12.*$in*12.*$in*16.*$ft*150.*$pcf/$g] [expr 12.*$in*12.*$in*16.*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 62] [expr 12.*$in*12.*$in*16.*$ft*150.*$pcf/$g] [expr 12.*$in*12.*$in*16.*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 78] [expr 12.*$in*12.*$in*16.*$ft*150.*$pcf/$g] [expr 12.*$in*12.*$in*16.*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 79] [expr 12.*$in*12.*$in*16.*$ft*150.*$pcf/$g] [expr 12.*$in*12.*$in*16.*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		
		#20x20
		mass [expr 1000*$i + 800 + 23] [expr 20.*$in*20.*$in*16.*$ft*150.*$pcf/$g] [expr 20.*$in*20.*$in*16.*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 24] [expr 20.*$in*20.*$in*16.*$ft*150.*$pcf/$g] [expr 20.*$in*20.*$in*16.*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 34] [expr 20.*$in*20.*$in*16.*$ft*150.*$pcf/$g] [expr 20.*$in*20.*$in*16.*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 35] [expr 20.*$in*20.*$in*16.*$ft*150.*$pcf/$g] [expr 20.*$in*20.*$in*16.*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 36] [expr 20.*$in*20.*$in*16.*$ft*150.*$pcf/$g] [expr 20.*$in*20.*$in*16.*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 48] [expr 20.*$in*20.*$in*16.*$ft*150.*$pcf/$g] [expr 20.*$in*20.*$in*16.*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 50] [expr 20.*$in*20.*$in*16.*$ft*150.*$pcf/$g] [expr 20.*$in*20.*$in*16.*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 63] [expr 20.*$in*20.*$in*16.*$ft*150.*$pcf/$g] [expr 20.*$in*20.*$in*16.*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 80] [expr 20.*$in*20.*$in*16.*$ft*150.*$pcf/$g] [expr 20.*$in*20.*$in*16.*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 90] [expr 20.*$in*20.*$in*16.*$ft*150.*$pcf/$g] [expr 20.*$in*20.*$in*16.*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		
		#28x28
		mass [expr 1000*$i + 800 + 38] [expr 28.*$in*28.*$in*16.*$ft*150.*$pcf/$g] [expr 28.*$in*28.*$in*16.*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 61] [expr 28.*$in*28.*$in*16.*$ft*150.*$pcf/$g] [expr 28.*$in*28.*$in*16.*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 70] [expr 28.*$in*28.*$in*16.*$ft*150.*$pcf/$g] [expr 28.*$in*28.*$in*16.*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 77] [expr 28.*$in*28.*$in*16.*$ft*150.*$pcf/$g] [expr 28.*$in*28.*$in*16.*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 81] [expr 28.*$in*28.*$in*16.*$ft*150.*$pcf/$g] [expr 28.*$in*28.*$in*16.*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 82] [expr 28.*$in*28.*$in*16.*$ft*150.*$pcf/$g] [expr 28.*$in*28.*$in*16.*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 83] [expr 28.*$in*28.*$in*16.*$ft*150.*$pcf/$g] [expr 28.*$in*28.*$in*16.*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 84] [expr 28.*$in*28.*$in*16.*$ft*150.*$pcf/$g] [expr 28.*$in*28.*$in*16.*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 85] [expr 28.*$in*28.*$in*16.*$ft*150.*$pcf/$g] [expr 28.*$in*28.*$in*16.*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 86] [expr 28.*$in*28.*$in*16.*$ft*150.*$pcf/$g] [expr 28.*$in*28.*$in*16.*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 87] [expr 28.*$in*28.*$in*16.*$ft*150.*$pcf/$g] [expr 28.*$in*28.*$in*16.*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 88] [expr 28.*$in*28.*$in*16.*$ft*150.*$pcf/$g] [expr 28.*$in*28.*$in*16.*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 89] [expr 28.*$in*28.*$in*16.*$ft*150.*$pcf/$g] [expr 28.*$in*28.*$in*16.*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		
		#32x32
		mass [expr 1000*$i + 800 + 39] [expr 32.*$in*32.*$in*16.*$ft*150.*$pcf/$g] [expr 32.*$in*32.*$in*16.*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 40] [expr 32.*$in*32.*$in*16.*$ft*150.*$pcf/$g] [expr 32.*$in*32.*$in*16.*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 41] [expr 32.*$in*32.*$in*16.*$ft*150.*$pcf/$g] [expr 32.*$in*32.*$in*16.*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 42] [expr 32.*$in*32.*$in*16.*$ft*150.*$pcf/$g] [expr 32.*$in*32.*$in*16.*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 43] [expr 32.*$in*32.*$in*16.*$ft*150.*$pcf/$g] [expr 32.*$in*32.*$in*16.*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 44] [expr 32.*$in*32.*$in*16.*$ft*150.*$pcf/$g] [expr 32.*$in*32.*$in*16.*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 45] [expr 32.*$in*32.*$in*16.*$ft*150.*$pcf/$g] [expr 32.*$in*32.*$in*16.*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 46] [expr 32.*$in*32.*$in*16.*$ft*150.*$pcf/$g] [expr 32.*$in*32.*$in*16.*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 47] [expr 32.*$in*32.*$in*16.*$ft*150.*$pcf/$g] [expr 32.*$in*32.*$in*16.*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 51] [expr 32.*$in*32.*$in*16.*$ft*150.*$pcf/$g] [expr 32.*$in*32.*$in*16.*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 64] [expr 32.*$in*32.*$in*16.*$ft*150.*$pcf/$g] [expr 32.*$in*32.*$in*16.*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 71] [expr 32.*$in*32.*$in*16.*$ft*150.*$pcf/$g] [expr 32.*$in*32.*$in*16.*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		
		#36x36
		mass [expr 1000*$i + 800 + 66] [expr 36.*$in*36.*$in*16.*$ft*150.*$pcf/$g] [expr 36.*$in*36.*$in*16.*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 67] [expr 36.*$in*36.*$in*16.*$ft*150.*$pcf/$g] [expr 36.*$in*36.*$in*16.*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 73] [expr 36.*$in*36.*$in*16.*$ft*150.*$pcf/$g] [expr 36.*$in*36.*$in*16.*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 74] [expr 36.*$in*36.*$in*16.*$ft*150.*$pcf/$g] [expr 36.*$in*36.*$in*16.*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		
		#44x44
		mass [expr 1000*$i + 800 + 52] [expr 44.*$in*44.*$in*16.*$ft*150.*$pcf/$g] [expr 44.*$in*44.*$in*16.*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 53] [expr 44.*$in*44.*$in*16.*$ft*150.*$pcf/$g] [expr 44.*$in*44.*$in*16.*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 54] [expr 44.*$in*44.*$in*16.*$ft*150.*$pcf/$g] [expr 44.*$in*44.*$in*16.*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 55] [expr 44.*$in*44.*$in*16.*$ft*150.*$pcf/$g] [expr 44.*$in*44.*$in*16.*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 56] [expr 44.*$in*44.*$in*16.*$ft*150.*$pcf/$g] [expr 44.*$in*44.*$in*16.*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 57] [expr 44.*$in*44.*$in*16.*$ft*150.*$pcf/$g] [expr 44.*$in*44.*$in*16.*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 58] [expr 44.*$in*44.*$in*16.*$ft*150.*$pcf/$g] [expr 44.*$in*44.*$in*16.*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 59] [expr 44.*$in*44.*$in*16.*$ft*150.*$pcf/$g] [expr 44.*$in*44.*$in*16.*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 60] [expr 44.*$in*44.*$in*16.*$ft*150.*$pcf/$g] [expr 44.*$in*44.*$in*16.*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 65] [expr 44.*$in*44.*$in*16.*$ft*150.*$pcf/$g] [expr 44.*$in*44.*$in*16.*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 68] [expr 44.*$in*44.*$in*16.*$ft*150.*$pcf/$g] [expr 44.*$in*44.*$in*16.*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 69] [expr 44.*$in*44.*$in*16.*$ft*150.*$pcf/$g] [expr 44.*$in*44.*$in*16.*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 72] [expr 44.*$in*44.*$in*16.*$ft*150.*$pcf/$g] [expr 44.*$in*44.*$in*16.*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 75] [expr 44.*$in*44.*$in*16.*$ft*150.*$pcf/$g] [expr 44.*$in*44.*$in*16.*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		mass [expr 1000*$i + 800 + 76] [expr 44.*$in*44.*$in*16.*$ft*150.*$pcf/$g] [expr 44.*$in*44.*$in*16.*$ft*150.*$pcf/$g] 0. 0. 0. 0.
		
	}
}