
 ############################# Stringer-Panel #######################################
 
#set Ec5	[expr 33000.*pow(0.140 + 5./1000,1.5)*sqrt(5.)*$ksi];	# Young's Modulus of Concrete 5 ksi
#set Ec6	[expr 33000.*pow(0.140 + 6./1000,1.5)*sqrt(6.)*$ksi];	# Young's Modulus of Concrete 6 ksi

set Ec5	[expr 33000.*pow(0.140 + 6.5/1000,1.5)*sqrt(6.5)*$ksi];	# Young's Modulus of Concrete 5 ksi
set Ec6	[expr 33000.*pow(0.140 + 7.8/1000,1.5)*sqrt(7.8)*$ksi];	# Young's Modulus of Concrete 6 ksi

set nuc 0.2

for {set i 1} {$i <= $nStory} {incr i 1} {
	
	if {$i <= 13} {
		set Ec [expr 0.50*$Ec6]
		if {$i == 3 || $i == 11} {
			set thickness [expr 12.*$in]
			set stringTag $string10x12
			set stringTagCB $string10x12
		} else {
			set thickness [expr 8.*$in]
			set stringTag $string10x8_6
			set stringTagCB $string10x8_6
		}
	} else {
		set Ec [expr 0.55*$Ec5]
		set thickness [expr 8.*$in]
		set stringTag $string10x8
		set stringTagCB $string10x8
	}
	
	set w_DL [expr 20.*$psf]
	set w_tot [expr $w_DL + 150.*$pcf*$thickness]
	set rho [expr $w_tot/$g]
	
	set eleTag [expr 100000 + 1000*$i]
	set nodeTag [expr 1000*$i + 800]
	
	set coreWall1 [expr 1000*$i + 100 + $nEleFloor]
	set coreWall2 [expr 1000*$i + 200 + $nEleFloor]
	set coreWall3 [expr 1000*$i + 300 + $nEleFloor]
	set coreWall4 [expr 1000*$i + 400 + $nEleFloor]
	
	set recWallX1 [expr 1000*$i + 500 + $nEleFloor]
	set recWallX2 [expr 1000*$i + 600 + $nEleFloor]
	set recWallY  [expr 1000*$i + 700 + $nEleFloor]
	
	if {$i <= 3} {
	
		element StringPanelLin [expr $eleTag +   1] [expr $nodeTag +   1] [expr $nodeTag +   2] [expr $nodeTag +  15] [expr $nodeTag +  14]	$stringTag $stringTag $stringTag $stringTag $Ec $nuc $thickness -rho $rho
		element StringPanelLin [expr $eleTag +   2] [expr $nodeTag +   2] [expr $nodeTag +   3] [expr $nodeTag +  16] [expr $nodeTag +  15]	$stringTag $stringTag $stringTag $stringTag $Ec $nuc $thickness -rho $rho
		element StringPanelLin [expr $eleTag +   3] [expr $nodeTag +   3] [expr $nodeTag +   4] [expr $nodeTag +  17] [expr $nodeTag +  16]	$stringTag $stringTag $stringTag $stringTag $Ec $nuc $thickness -rho $rho
		element StringPanelLin [expr $eleTag +   4] [expr $nodeTag +   4] [expr $nodeTag +   5] [expr $nodeTag +  18] [expr $nodeTag +  17]	$stringTag $stringTag $stringTag $stringTag $Ec $nuc $thickness -rho $rho
		element StringPanelLin [expr $eleTag +   5] [expr $nodeTag +   5] [expr $nodeTag +   6] [expr $nodeTag +  19] [expr $nodeTag +  18]	$stringTag $stringTag $stringTag $stringTag $Ec $nuc $thickness -rho $rho
		element StringPanelLin [expr $eleTag +   6] [expr $nodeTag +   6] [expr $nodeTag +   7] [expr $nodeTag +  20] [expr $nodeTag +  19]	$stringTag $stringTag $stringTag $stringTag $Ec $nuc $thickness -rho $rho
		element StringPanelLin [expr $eleTag +   7] [expr $nodeTag +   7] [expr $nodeTag +   8] [expr $nodeTag +  21] [expr $nodeTag +  20]	$stringTag $stringTag $stringTag $stringTag $Ec $nuc $thickness -rho $rho
		element StringPanelLin [expr $eleTag +   8] [expr $nodeTag +   8] [expr $nodeTag +   9] [expr $nodeTag +  22] [expr $nodeTag +  21]	$stringTag $stringTag $stringTag $stringTag $Ec $nuc $thickness -rho $rho
		element StringPanelLin [expr $eleTag +   9] [expr $nodeTag +   9] [expr $nodeTag +  10] [expr $nodeTag +  23] [expr $nodeTag +  22]	$stringTag $stringTag $stringTag $stringTag $Ec $nuc $thickness -rho $rho
		element StringPanelLin [expr $eleTag +  10] [expr $nodeTag +  10] [expr $nodeTag +  11] [expr $nodeTag +  24] [expr $nodeTag +  23]	$stringTag $stringTag $stringTag $stringTag $Ec $nuc $thickness -rho $rho
		element StringPanelLin [expr $eleTag +  11] [expr $nodeTag +  11] [expr $nodeTag +  12] [expr $recWallY +  1] [expr $nodeTag +  24]	$stringTag $stringTag $stringTag $stringTag $Ec $nuc $thickness -rho $rho
		element StringPanelLin [expr $eleTag +  12] [expr $nodeTag +  12] [expr $nodeTag +  13] [expr $nodeTag +  25] [expr $recWallY +  1]	$stringTag $stringTag $stringTag $stringTag $Ec $nuc $thickness -rho $rho
		
		
		element StringPanelLin [expr $eleTag +  13] [expr $nodeTag +  14] [expr $nodeTag +  15] [expr $nodeTag +  27] [expr $nodeTag +  26]	$stringTag $stringTag $stringTag $stringTag $Ec $nuc $thickness -rho $rho
		element StringPanelLin [expr $eleTag +  14] [expr $nodeTag +  15] [expr $nodeTag +  16] [expr $nodeTag +  28] [expr $nodeTag +  27]	$stringTag $stringTag $stringTag $stringTag $Ec $nuc $thickness -rho $rho
		element StringPanelLin [expr $eleTag +  15] [expr $nodeTag +  16] [expr $nodeTag +  17] [expr $nodeTag +  29] [expr $nodeTag +  28]	$stringTag $stringTag $stringTag $stringTag $Ec $nuc $thickness -rho $rho
		element StringPanelLin [expr $eleTag +  16] [expr $nodeTag +  17] [expr $nodeTag +  18] [expr $nodeTag +  30] [expr $nodeTag +  29]	$stringTag $stringTag $stringTag $stringTag $Ec $nuc $thickness -rho $rho
		element StringPanelLin [expr $eleTag +  17] [expr $nodeTag +  18] [expr $nodeTag +  19] [expr $nodeTag +  31] [expr $nodeTag +  30]	$stringTag $stringTag $stringTag $stringTag $Ec $nuc $thickness -rho $rho
		element StringPanelLin [expr $eleTag +  18] [expr $nodeTag +  19] [expr $nodeTag +  20] [expr $nodeTag +  32] [expr $nodeTag +  31]	$stringTag $stringTag $stringTag $stringTag $Ec $nuc $thickness -rho $rho
		element StringPanelLin [expr $eleTag +  19] [expr $nodeTag +  20] [expr $nodeTag +  21] [expr $nodeTag +  33] [expr $nodeTag +  32]	$stringTag $stringTag $stringTag $stringTag $Ec $nuc $thickness -rho $rho
		element StringPanelLin [expr $eleTag +  20] [expr $nodeTag +  21] [expr $nodeTag +  22] [expr $nodeTag +  34] [expr $nodeTag +  33]	$stringTag $stringTag $stringTag $stringTag $Ec $nuc $thickness -rho $rho
		element StringPanelLin [expr $eleTag +  21] [expr $nodeTag +  22] [expr $nodeTag +  23] [expr $nodeTag +  35] [expr $nodeTag +  34]	$stringTag $stringTag $stringTag $stringTag $Ec $nuc $thickness -rho $rho
		element StringPanelLin [expr $eleTag +  22] [expr $nodeTag +  23] [expr $nodeTag +  24] [expr $nodeTag +  36] [expr $nodeTag +  35]	$stringTag $stringTag $stringTag $stringTag $Ec $nuc $thickness -rho $rho
		element StringPanelLin [expr $eleTag +  23] [expr $nodeTag +  24] [expr $recWallY +  1] [expr $recWallY +  2] [expr $nodeTag +  36]	$stringTag $stringTag $stringTag $stringTag $Ec $nuc $thickness -rho $rho
		element StringPanelLin [expr $eleTag +  24] [expr $recWallY +  1] [expr $nodeTag +  25] [expr $nodeTag +  37] [expr $recWallY +  2]	$stringTag $stringTag $stringTag $stringTag $Ec $nuc $thickness -rho $rho
		
		
		element StringPanelLin [expr $eleTag +  25] [expr $nodeTag +  26] [expr $nodeTag +  27] [expr $recWallX1 + 2] [expr $recWallX1 + 1]	$stringTag $stringTag $stringTag $stringTag $Ec $nuc $thickness -rho $rho
		element StringPanelLin [expr $eleTag +  26] [expr $nodeTag +  27] [expr $nodeTag +  28] [expr $nodeTag +  38] [expr $recWallX1 + 2]	$stringTag $stringTag $stringTag $stringTag $Ec $nuc $thickness -rho $rho
		element StringPanelLin [expr $eleTag +  27] [expr $nodeTag +  28] [expr $nodeTag +  29] [expr $nodeTag +  39] [expr $nodeTag +  38]	$stringTag $stringTag $stringTag $stringTag $Ec $nuc $thickness -rho $rho
		element StringPanelLin [expr $eleTag +  28] [expr $nodeTag +  29] [expr $nodeTag +  30] [expr $nodeTag +  40] [expr $nodeTag +  39]	$stringTag $stringTag $stringTag $stringTag $Ec $nuc $thickness -rho $rho
		element StringPanelLin [expr $eleTag +  29] [expr $nodeTag +  30] [expr $nodeTag +  31] [expr $nodeTag +  41] [expr $nodeTag +  40]	$stringTag $stringTag $stringTag $stringTag $Ec $nuc $thickness -rho $rho
		element StringPanelLin [expr $eleTag +  30] [expr $nodeTag +  31] [expr $nodeTag +  32] [expr $nodeTag +  42] [expr $nodeTag +  41]	$stringTag $stringTag $stringTag $stringTag $Ec $nuc $thickness -rho $rho
		element StringPanelLin [expr $eleTag +  31] [expr $nodeTag +  32] [expr $nodeTag +  33] [expr $nodeTag +  43] [expr $nodeTag +  42]	$stringTag $stringTag $stringTag $stringTag $Ec $nuc $thickness -rho $rho
		element StringPanelLin [expr $eleTag +  32] [expr $nodeTag +  33] [expr $nodeTag +  34] [expr $nodeTag +  44] [expr $nodeTag +  43]	$stringTag $stringTag $stringTag $stringTag $Ec $nuc $thickness -rho $rho
		element StringPanelLin [expr $eleTag +  33] [expr $nodeTag +  34] [expr $nodeTag +  35] [expr $nodeTag +  45] [expr $nodeTag +  44]	$stringTag $stringTag $stringTag $stringTag $Ec $nuc $thickness -rho $rho
		element StringPanelLin [expr $eleTag +  34] [expr $nodeTag +  35] [expr $nodeTag +  36] [expr $nodeTag +  46] [expr $nodeTag +  45]	$stringTag $stringTag $stringTag $stringTag $Ec $nuc $thickness -rho $rho
		element StringPanelLin [expr $eleTag +  35] [expr $nodeTag +  36] [expr $recWallY +  2] [expr $nodeTag +  47] [expr $nodeTag +  46]	$stringTag $stringTag $stringTag $stringTag $Ec $nuc $thickness -rho $rho
		element StringPanelLin [expr $eleTag +  36] [expr $recWallY +  2] [expr $nodeTag +  37] [expr $nodeTag +  48] [expr $nodeTag +  47]	$stringTag $stringTag $stringTag $stringTag $Ec $nuc $thickness -rho $rho
		
		
		element StringPanelLin [expr $eleTag +  37] [expr $recWallX1 + 1] [expr $recWallX1 + 2] [expr $nodeTag +  50] [expr $nodeTag +  49]	$stringTag $stringTag $stringTag $stringTag $Ec $nuc $thickness -rho $rho
		element StringPanelLin [expr $eleTag +  38] [expr $recWallX1 + 2] [expr $nodeTag +  38] [expr $nodeTag +  51] [expr $nodeTag +  50]	$stringTag $stringTag $stringTag $stringTag $Ec $nuc $thickness -rho $rho
		element StringPanelLin [expr $eleTag +  39] [expr $nodeTag +  38] [expr $nodeTag +  39] [expr $nodeTag +  52] [expr $nodeTag +  51]	$stringTag $stringTag $stringTag $stringTag $Ec $nuc $thickness -rho $rho
		element StringPanelLin [expr $eleTag +  40] [expr $nodeTag +  39] [expr $nodeTag +  40] [expr $nodeTag +  53] [expr $nodeTag +  52]	$stringTag $stringTag $stringTag $stringTag $Ec $nuc $thickness -rho $rho
		element StringPanelLin [expr $eleTag +  41] [expr $nodeTag +  40] [expr $nodeTag +  41] [expr $nodeTag +  54] [expr $nodeTag +  53]	$stringTag $stringTag $stringTag $stringTag $Ec $nuc $thickness -rho $rho
		element StringPanelLin [expr $eleTag +  42] [expr $nodeTag +  41] [expr $nodeTag +  42] [expr $nodeTag +  55] [expr $nodeTag +  54]	$stringTag $stringTag $stringTag $stringTag $Ec $nuc $thickness -rho $rho
		element StringPanelLin [expr $eleTag +  43] [expr $nodeTag +  42] [expr $nodeTag +  43] [expr $nodeTag +  56] [expr $nodeTag +  55]	$stringTag $stringTag $stringTag $stringTag $Ec $nuc $thickness -rho $rho
		element StringPanelLin [expr $eleTag +  44] [expr $nodeTag +  43] [expr $nodeTag +  44] [expr $nodeTag +  57] [expr $nodeTag +  56]	$stringTag $stringTag $stringTag $stringTag $Ec $nuc $thickness -rho $rho
		element StringPanelLin [expr $eleTag +  45] [expr $nodeTag +  44] [expr $nodeTag +  45] [expr $nodeTag +  58] [expr $nodeTag +  57]	$stringTag $stringTag $stringTag $stringTag $Ec $nuc $thickness -rho $rho
		element StringPanelLin [expr $eleTag +  46] [expr $nodeTag +  45] [expr $nodeTag +  46] [expr $nodeTag +  59] [expr $nodeTag +  58]	$stringTag $stringTag $stringTag $stringTag $Ec $nuc $thickness -rho $rho
		element StringPanelLin [expr $eleTag +  47] [expr $nodeTag +  46] [expr $nodeTag +  47] [expr $nodeTag +  60] [expr $nodeTag +  59]	$stringTag $stringTag $stringTag $stringTag $Ec $nuc $thickness -rho $rho
		element StringPanelLin [expr $eleTag +  48] [expr $nodeTag +  47] [expr $nodeTag +  48] [expr $nodeTag +  61] [expr $nodeTag +  60]	$stringTag $stringTag $stringTag $stringTag $Ec $nuc $thickness -rho $rho
		
		
		element StringPanelLin [expr $eleTag +  49] [expr $nodeTag +  49] [expr $nodeTag +  50] [expr $nodeTag +  63] [expr $nodeTag +  62]	$stringTag $stringTag $stringTag 	$stringTag $Ec $nuc $thickness -rho $rho
		element StringPanelLin [expr $eleTag +  50] [expr $nodeTag +  50] [expr $nodeTag +  51] [expr $nodeTag +  64] [expr $nodeTag +  63]	$stringTag $stringTag $stringTag 	$stringTag $Ec $nuc $thickness -rho $rho
		element StringPanelLin [expr $eleTag +  51] [expr $nodeTag +  51] [expr $nodeTag +  52] [expr $coreWall1 + 2] [expr $nodeTag +  64]	$stringTag $stringTag $stringTag 	$stringTag $Ec $nuc $thickness -rho $rho
		element StringPanelLin [expr $eleTag +  52] [expr $nodeTag +  52] [expr $nodeTag +  53] [expr $coreWall2 + 2] [expr $coreWall1 + 2]	$stringTag $stringTag $stringTagCB 	$stringTag $Ec $nuc $thickness -rho $rho
		element StringPanelLin [expr $eleTag +  53] [expr $nodeTag +  53] [expr $nodeTag +  54] [expr $nodeTag +  65] [expr $coreWall2 + 2]	$stringTag $stringTag $stringTag 	$stringTag $Ec $nuc $thickness -rho $rho
		element StringPanelLin [expr $eleTag +  54] [expr $nodeTag +  54] [expr $nodeTag +  55] [expr $nodeTag +  66] [expr $nodeTag +  65]	$stringTag $stringTag $stringTag 	$stringTag $Ec $nuc $thickness -rho $rho
		element StringPanelLin [expr $eleTag +  55] [expr $nodeTag +  55] [expr $nodeTag +  56] [expr $nodeTag +  67] [expr $nodeTag +  66]	$stringTag $stringTag $stringTag 	$stringTag $Ec $nuc $thickness -rho $rho
		element StringPanelLin [expr $eleTag +  56] [expr $nodeTag +  56] [expr $nodeTag +  57] [expr $nodeTag +  68] [expr $nodeTag +  67]	$stringTag $stringTag $stringTag 	$stringTag $Ec $nuc $thickness -rho $rho
		element StringPanelLin [expr $eleTag +  57] [expr $nodeTag +  57] [expr $nodeTag +  58] [expr $coreWall3 + 2] [expr $nodeTag +  68]	$stringTag $stringTag $stringTag 	$stringTag $Ec $nuc $thickness -rho $rho
		element StringPanelLin [expr $eleTag +  58] [expr $nodeTag +  58] [expr $nodeTag +  59] [expr $coreWall4 + 2] [expr $coreWall3 + 2]	$stringTag $stringTag $stringTagCB 	$stringTag $Ec $nuc $thickness -rho $rho
		element StringPanelLin [expr $eleTag +  59] [expr $nodeTag +  59] [expr $nodeTag +  60] [expr $nodeTag +  69] [expr $coreWall4 + 2]	$stringTag $stringTag $stringTag 	$stringTag $Ec $nuc $thickness -rho $rho
		element StringPanelLin [expr $eleTag +  60] [expr $nodeTag +  60] [expr $nodeTag +  61] [expr $nodeTag +  70] [expr $nodeTag +  69]	$stringTag $stringTag $stringTag 	$stringTag $Ec $nuc $thickness -rho $rho
		
		
		element StringPanelLin [expr $eleTag +  61] [expr $nodeTag +  62] [expr $nodeTag +  63] [expr $recWallX2 + 2] [expr $recWallX2 + 1]	$stringTag $stringTag $stringTag $stringTag $Ec $nuc $thickness -rho $rho
		element StringPanelLin [expr $eleTag +  62] [expr $nodeTag +  63] [expr $nodeTag +  64] [expr $nodeTag +  71] [expr $recWallX2 + 2]	$stringTag $stringTag $stringTag $stringTag $Ec $nuc $thickness -rho $rho
		element StringPanelLin [expr $eleTag +  63] [expr $nodeTag +  64] [expr $coreWall1 + 2] [expr $coreWall1 + 1] [expr $nodeTag +  71]	$stringTag $stringTag $stringTag $stringTag $Ec $nuc $thickness -rho $rho
		element StringPanelLin [expr $eleTag +  64] [expr $coreWall2 + 2] [expr $nodeTag +  65] [expr $nodeTag +  72] [expr $coreWall2 + 1]	$stringTag $stringTag $stringTag $stringTag $Ec $nuc $thickness -rho $rho
		element StringPanelLin [expr $eleTag +  65] [expr $nodeTag +  65] [expr $nodeTag +  66] [expr $nodeTag +  73] [expr $nodeTag +  72]	$stringTag $stringTag $stringTag $stringTag $Ec $nuc $thickness -rho $rho
		element StringPanelLin [expr $eleTag +  66] [expr $nodeTag +  66] [expr $nodeTag +  67] [expr $nodeTag +  74] [expr $nodeTag +  73]	$stringTag $stringTag $stringTag $stringTag $Ec $nuc $thickness -rho $rho
		element StringPanelLin [expr $eleTag +  67] [expr $nodeTag +  67] [expr $nodeTag +  68] [expr $nodeTag +  75] [expr $nodeTag +  74]	$stringTag $stringTag $stringTag $stringTag $Ec $nuc $thickness -rho $rho
		element StringPanelLin [expr $eleTag +  68] [expr $nodeTag +  68] [expr $coreWall3 + 2] [expr $coreWall3 + 1] [expr $nodeTag +  75]	$stringTag $stringTag $stringTag $stringTag $Ec $nuc $thickness -rho $rho
		element StringPanelLin [expr $eleTag +  69] [expr $coreWall4 + 2] [expr $nodeTag +  69] [expr $nodeTag +  76] [expr $coreWall4 + 1]	$stringTag $stringTag $stringTag $stringTag $Ec $nuc $thickness -rho $rho
		element StringPanelLin [expr $eleTag +  70] [expr $nodeTag +  69] [expr $nodeTag +  70] [expr $nodeTag +  77] [expr $nodeTag +  76]	$stringTag $stringTag $stringTag $stringTag $Ec $nuc $thickness -rho $rho
		
		
		element StringPanelLin [expr $eleTag +  71] [expr $recWallX2 + 1] [expr $recWallX2 + 2] [expr $nodeTag +  79] [expr $nodeTag +  78]	$stringTag 		$stringTag $stringTag $stringTag $Ec $nuc $thickness -rho $rho
		element StringPanelLin [expr $eleTag +  72] [expr $recWallX2 + 2] [expr $nodeTag +  71] [expr $nodeTag +  80] [expr $nodeTag +  79]	$stringTag 		$stringTag $stringTag $stringTag $Ec $nuc $thickness -rho $rho
		element StringPanelLin [expr $eleTag +  73] [expr $nodeTag +  71] [expr $coreWall1 + 1] [expr $nodeTag +  81] [expr $nodeTag +  80]	$stringTag 		$stringTag $stringTag $stringTag $Ec $nuc $thickness -rho $rho
		element StringPanelLin [expr $eleTag +  74] [expr $coreWall1 + 1] [expr $coreWall2 + 1] [expr $nodeTag +  82] [expr $nodeTag +  81]	$stringTagCB 	$stringTag $stringTag $stringTag $Ec $nuc $thickness -rho $rho
		element StringPanelLin [expr $eleTag +  75] [expr $coreWall2 + 1] [expr $nodeTag +  72] [expr $nodeTag +  83] [expr $nodeTag +  82]	$stringTag 		$stringTag $stringTag $stringTag $Ec $nuc $thickness -rho $rho
		element StringPanelLin [expr $eleTag +  76] [expr $nodeTag +  72] [expr $nodeTag +  73] [expr $nodeTag +  84] [expr $nodeTag +  83]	$stringTag 		$stringTag $stringTag $stringTag $Ec $nuc $thickness -rho $rho
		element StringPanelLin [expr $eleTag +  77] [expr $nodeTag +  73] [expr $nodeTag +  74] [expr $nodeTag +  85] [expr $nodeTag +  84]	$stringTag 		$stringTag $stringTag $stringTag $Ec $nuc $thickness -rho $rho
		element StringPanelLin [expr $eleTag +  78] [expr $nodeTag +  74] [expr $nodeTag +  75] [expr $nodeTag +  86] [expr $nodeTag +  85]	$stringTag 		$stringTag $stringTag $stringTag $Ec $nuc $thickness -rho $rho
		element StringPanelLin [expr $eleTag +  79] [expr $nodeTag +  75] [expr $coreWall3 + 1] [expr $nodeTag +  87] [expr $nodeTag +  86]	$stringTag 		$stringTag $stringTag $stringTag $Ec $nuc $thickness -rho $rho
		element StringPanelLin [expr $eleTag +  80] [expr $coreWall3 + 1] [expr $coreWall4 + 1] [expr $nodeTag +  88] [expr $nodeTag +  87]	$stringTagCB 	$stringTag $stringTag $stringTag $Ec $nuc $thickness -rho $rho
		element StringPanelLin [expr $eleTag +  81] [expr $coreWall4 + 1] [expr $nodeTag +  76] [expr $nodeTag +  89] [expr $nodeTag +  88]	$stringTag 		$stringTag $stringTag $stringTag $Ec $nuc $thickness -rho $rho
		element StringPanelLin [expr $eleTag +  82] [expr $nodeTag +  76] [expr $nodeTag +  77] [expr $nodeTag +  90] [expr $nodeTag +  89]	$stringTag 		$stringTag $stringTag $stringTag $Ec $nuc $thickness -rho $rho
	
	} elseif {$i <= 11} {
	
		element StringPanelLin [expr $eleTag +   1] [expr $nodeTag +   9] [expr $nodeTag +  10] [expr $nodeTag +  23] [expr $nodeTag +  22]	$stringTag $stringTag $stringTag $stringTag $Ec $nuc $thickness -rho $rho
		element StringPanelLin [expr $eleTag +   2] [expr $nodeTag +  10] [expr $nodeTag +  11] [expr $nodeTag +  24] [expr $nodeTag +  23]	$stringTag $stringTag $stringTag $stringTag $Ec $nuc $thickness -rho $rho
		element StringPanelLin [expr $eleTag +   3] [expr $nodeTag +  11] [expr $nodeTag +  12] [expr $recWallY +  1] [expr $nodeTag +  24]	$stringTag $stringTag $stringTag $stringTag $Ec $nuc $thickness -rho $rho
		element StringPanelLin [expr $eleTag +   4] [expr $nodeTag +  12] [expr $nodeTag +  13] [expr $nodeTag +  25] [expr $recWallY +  1]	$stringTag $stringTag $stringTag $stringTag $Ec $nuc $thickness -rho $rho		
		element StringPanelLin [expr $eleTag +   5] [expr $nodeTag +  22] [expr $nodeTag +  23] [expr $nodeTag +  35] [expr $nodeTag +  34]	$stringTag $stringTag $stringTag $stringTag $Ec $nuc $thickness -rho $rho
		element StringPanelLin [expr $eleTag +   6] [expr $nodeTag +  23] [expr $nodeTag +  24] [expr $nodeTag +  36] [expr $nodeTag +  35]	$stringTag $stringTag $stringTag $stringTag $Ec $nuc $thickness -rho $rho
		element StringPanelLin [expr $eleTag +   7] [expr $nodeTag +  24] [expr $recWallY +  1] [expr $recWallY +  2] [expr $nodeTag +  36]	$stringTag $stringTag $stringTag $stringTag $Ec $nuc $thickness -rho $rho
		element StringPanelLin [expr $eleTag +   8] [expr $recWallY +  1] [expr $nodeTag +  25] [expr $nodeTag +  37] [expr $recWallY +  2]	$stringTag $stringTag $stringTag $stringTag $Ec $nuc $thickness -rho $rho
		
		
		element StringPanelLin [expr $eleTag +   9] [expr $nodeTag +  26] [expr $nodeTag +  27] [expr $recWallX1 + 2] [expr $recWallX1 + 1]	$stringTag $stringTag $stringTag $stringTag $Ec $nuc $thickness -rho $rho
		element StringPanelLin [expr $eleTag +  10] [expr $nodeTag +  27] [expr $nodeTag +  28] [expr $nodeTag +  38] [expr $recWallX1 + 2]	$stringTag $stringTag $stringTag $stringTag $Ec $nuc $thickness -rho $rho
		element StringPanelLin [expr $eleTag +  11] [expr $nodeTag +  28] [expr $nodeTag +  29] [expr $nodeTag +  39] [expr $nodeTag +  38]	$stringTag $stringTag $stringTag $stringTag $Ec $nuc $thickness -rho $rho
		element StringPanelLin [expr $eleTag +  12] [expr $nodeTag +  29] [expr $nodeTag +  30] [expr $nodeTag +  40] [expr $nodeTag +  39]	$stringTag $stringTag $stringTag $stringTag $Ec $nuc $thickness -rho $rho
		element StringPanelLin [expr $eleTag +  13] [expr $nodeTag +  30] [expr $nodeTag +  31] [expr $nodeTag +  41] [expr $nodeTag +  40]	$stringTag $stringTag $stringTag $stringTag $Ec $nuc $thickness -rho $rho
		element StringPanelLin [expr $eleTag +  14] [expr $nodeTag +  31] [expr $nodeTag +  32] [expr $nodeTag +  42] [expr $nodeTag +  41]	$stringTag $stringTag $stringTag $stringTag $Ec $nuc $thickness -rho $rho
		element StringPanelLin [expr $eleTag +  15] [expr $nodeTag +  32] [expr $nodeTag +  33] [expr $nodeTag +  43] [expr $nodeTag +  42]	$stringTag $stringTag $stringTag $stringTag $Ec $nuc $thickness -rho $rho
		element StringPanelLin [expr $eleTag +  16] [expr $nodeTag +  33] [expr $nodeTag +  34] [expr $nodeTag +  44] [expr $nodeTag +  43]	$stringTag $stringTag $stringTag $stringTag $Ec $nuc $thickness -rho $rho
		element StringPanelLin [expr $eleTag +  17] [expr $nodeTag +  34] [expr $nodeTag +  35] [expr $nodeTag +  45] [expr $nodeTag +  44]	$stringTag $stringTag $stringTag $stringTag $Ec $nuc $thickness -rho $rho
		element StringPanelLin [expr $eleTag +  18] [expr $nodeTag +  35] [expr $nodeTag +  36] [expr $nodeTag +  46] [expr $nodeTag +  45]	$stringTag $stringTag $stringTag $stringTag $Ec $nuc $thickness -rho $rho
		element StringPanelLin [expr $eleTag +  19] [expr $nodeTag +  36] [expr $recWallY +  2] [expr $nodeTag +  47] [expr $nodeTag +  46]	$stringTag $stringTag $stringTag $stringTag $Ec $nuc $thickness -rho $rho
		element StringPanelLin [expr $eleTag +  20] [expr $recWallY +  2] [expr $nodeTag +  37] [expr $nodeTag +  48] [expr $nodeTag +  47]	$stringTag $stringTag $stringTag $stringTag $Ec $nuc $thickness -rho $rho
		
		
		element StringPanelLin [expr $eleTag +  21] [expr $recWallX1 + 1] [expr $recWallX1 + 2] [expr $nodeTag +  50] [expr $nodeTag +  49]	$stringTag $stringTag $stringTag $stringTag $Ec $nuc $thickness -rho $rho
		element StringPanelLin [expr $eleTag +  22] [expr $recWallX1 + 2] [expr $nodeTag +  38] [expr $nodeTag +  51] [expr $nodeTag +  50]	$stringTag $stringTag $stringTag $stringTag $Ec $nuc $thickness -rho $rho
		element StringPanelLin [expr $eleTag +  23] [expr $nodeTag +  38] [expr $nodeTag +  39] [expr $nodeTag +  52] [expr $nodeTag +  51]	$stringTag $stringTag $stringTag $stringTag $Ec $nuc $thickness -rho $rho
		element StringPanelLin [expr $eleTag +  24] [expr $nodeTag +  39] [expr $nodeTag +  40] [expr $nodeTag +  53] [expr $nodeTag +  52]	$stringTag $stringTag $stringTag $stringTag $Ec $nuc $thickness -rho $rho
		element StringPanelLin [expr $eleTag +  25] [expr $nodeTag +  40] [expr $nodeTag +  41] [expr $nodeTag +  54] [expr $nodeTag +  53]	$stringTag $stringTag $stringTag $stringTag $Ec $nuc $thickness -rho $rho
		element StringPanelLin [expr $eleTag +  26] [expr $nodeTag +  41] [expr $nodeTag +  42] [expr $nodeTag +  55] [expr $nodeTag +  54]	$stringTag $stringTag $stringTag $stringTag $Ec $nuc $thickness -rho $rho
		element StringPanelLin [expr $eleTag +  27] [expr $nodeTag +  42] [expr $nodeTag +  43] [expr $nodeTag +  56] [expr $nodeTag +  55]	$stringTag $stringTag $stringTag $stringTag $Ec $nuc $thickness -rho $rho
		element StringPanelLin [expr $eleTag +  28] [expr $nodeTag +  43] [expr $nodeTag +  44] [expr $nodeTag +  57] [expr $nodeTag +  56]	$stringTag $stringTag $stringTag $stringTag $Ec $nuc $thickness -rho $rho
		element StringPanelLin [expr $eleTag +  29] [expr $nodeTag +  44] [expr $nodeTag +  45] [expr $nodeTag +  58] [expr $nodeTag +  57]	$stringTag $stringTag $stringTag $stringTag $Ec $nuc $thickness -rho $rho
		element StringPanelLin [expr $eleTag +  30] [expr $nodeTag +  45] [expr $nodeTag +  46] [expr $nodeTag +  59] [expr $nodeTag +  58]	$stringTag $stringTag $stringTag $stringTag $Ec $nuc $thickness -rho $rho
		element StringPanelLin [expr $eleTag +  31] [expr $nodeTag +  46] [expr $nodeTag +  47] [expr $nodeTag +  60] [expr $nodeTag +  59]	$stringTag $stringTag $stringTag $stringTag $Ec $nuc $thickness -rho $rho
		element StringPanelLin [expr $eleTag +  32] [expr $nodeTag +  47] [expr $nodeTag +  48] [expr $nodeTag +  61] [expr $nodeTag +  60]	$stringTag $stringTag $stringTag $stringTag $Ec $nuc $thickness -rho $rho
		
		
		element StringPanelLin [expr $eleTag +  33] [expr $nodeTag +  49] [expr $nodeTag +  50] [expr $nodeTag +  63] [expr $nodeTag +  62]	$stringTag $stringTag $stringTag 	$stringTag $Ec $nuc $thickness -rho $rho
		element StringPanelLin [expr $eleTag +  34] [expr $nodeTag +  50] [expr $nodeTag +  51] [expr $nodeTag +  64] [expr $nodeTag +  63]	$stringTag $stringTag $stringTag 	$stringTag $Ec $nuc $thickness -rho $rho
		element StringPanelLin [expr $eleTag +  35] [expr $nodeTag +  51] [expr $nodeTag +  52] [expr $coreWall1 + 2] [expr $nodeTag +  64]	$stringTag $stringTag $stringTag 	$stringTag $Ec $nuc $thickness -rho $rho
		element StringPanelLin [expr $eleTag +  36] [expr $nodeTag +  52] [expr $nodeTag +  53] [expr $coreWall2 + 2] [expr $coreWall1 + 2]	$stringTag $stringTag $stringTagCB 	$stringTag $Ec $nuc $thickness -rho $rho
		element StringPanelLin [expr $eleTag +  37] [expr $nodeTag +  53] [expr $nodeTag +  54] [expr $nodeTag +  65] [expr $coreWall2 + 2]	$stringTag $stringTag $stringTag 	$stringTag $Ec $nuc $thickness -rho $rho
		element StringPanelLin [expr $eleTag +  38] [expr $nodeTag +  54] [expr $nodeTag +  55] [expr $nodeTag +  66] [expr $nodeTag +  65]	$stringTag $stringTag $stringTag 	$stringTag $Ec $nuc $thickness -rho $rho
		element StringPanelLin [expr $eleTag +  39] [expr $nodeTag +  55] [expr $nodeTag +  56] [expr $nodeTag +  67] [expr $nodeTag +  66]	$stringTag $stringTag $stringTag 	$stringTag $Ec $nuc $thickness -rho $rho
		element StringPanelLin [expr $eleTag +  40] [expr $nodeTag +  56] [expr $nodeTag +  57] [expr $nodeTag +  68] [expr $nodeTag +  67]	$stringTag $stringTag $stringTag 	$stringTag $Ec $nuc $thickness -rho $rho
		element StringPanelLin [expr $eleTag +  41] [expr $nodeTag +  57] [expr $nodeTag +  58] [expr $coreWall3 + 2] [expr $nodeTag +  68]	$stringTag $stringTag $stringTag 	$stringTag $Ec $nuc $thickness -rho $rho
		element StringPanelLin [expr $eleTag +  42] [expr $nodeTag +  58] [expr $nodeTag +  59] [expr $coreWall4 + 2] [expr $coreWall3 + 2]	$stringTag $stringTag $stringTagCB 	$stringTag $Ec $nuc $thickness -rho $rho
		element StringPanelLin [expr $eleTag +  43] [expr $nodeTag +  59] [expr $nodeTag +  60] [expr $nodeTag +  69] [expr $coreWall4 + 2]	$stringTag $stringTag $stringTag 	$stringTag $Ec $nuc $thickness -rho $rho
		element StringPanelLin [expr $eleTag +  44] [expr $nodeTag +  60] [expr $nodeTag +  61] [expr $nodeTag +  70] [expr $nodeTag +  69]	$stringTag $stringTag $stringTag 	$stringTag $Ec $nuc $thickness -rho $rho
		
		
		element StringPanelLin [expr $eleTag +  45] [expr $nodeTag +  62] [expr $nodeTag +  63] [expr $recWallX2 + 2] [expr $recWallX2 + 1]	$stringTag $stringTag $stringTag $stringTag $Ec $nuc $thickness -rho $rho
		element StringPanelLin [expr $eleTag +  46] [expr $nodeTag +  63] [expr $nodeTag +  64] [expr $nodeTag +  71] [expr $recWallX2 + 2]	$stringTag $stringTag $stringTag $stringTag $Ec $nuc $thickness -rho $rho
		element StringPanelLin [expr $eleTag +  47] [expr $nodeTag +  64] [expr $coreWall1 + 2] [expr $coreWall1 + 1] [expr $nodeTag +  71]	$stringTag $stringTag $stringTag $stringTag $Ec $nuc $thickness -rho $rho
		element StringPanelLin [expr $eleTag +  48] [expr $coreWall2 + 2] [expr $nodeTag +  65] [expr $nodeTag +  72] [expr $coreWall2 + 1]	$stringTag $stringTag $stringTag $stringTag $Ec $nuc $thickness -rho $rho
		element StringPanelLin [expr $eleTag +  49] [expr $nodeTag +  65] [expr $nodeTag +  66] [expr $nodeTag +  73] [expr $nodeTag +  72]	$stringTag $stringTag $stringTag $stringTag $Ec $nuc $thickness -rho $rho
		element StringPanelLin [expr $eleTag +  50] [expr $nodeTag +  67] [expr $nodeTag +  68] [expr $nodeTag +  75] [expr $nodeTag +  74]	$stringTag $stringTag $stringTag $stringTag $Ec $nuc $thickness -rho $rho
		element StringPanelLin [expr $eleTag +  51] [expr $nodeTag +  68] [expr $coreWall3 + 2] [expr $coreWall3 + 1] [expr $nodeTag +  75]	$stringTag $stringTag $stringTag $stringTag $Ec $nuc $thickness -rho $rho
		element StringPanelLin [expr $eleTag +  52] [expr $coreWall4 + 2] [expr $nodeTag +  69] [expr $nodeTag +  76] [expr $coreWall4 + 1]	$stringTag $stringTag $stringTag $stringTag $Ec $nuc $thickness -rho $rho
		element StringPanelLin [expr $eleTag +  53] [expr $nodeTag +  69] [expr $nodeTag +  70] [expr $nodeTag +  77] [expr $nodeTag +  76]	$stringTag $stringTag $stringTag $stringTag $Ec $nuc $thickness -rho $rho
		
		
		element StringPanelLin [expr $eleTag +  54] [expr $recWallX2 + 1] [expr $recWallX2 + 2] [expr $nodeTag +  79] [expr $nodeTag +  78]	$stringTag 		$stringTag $stringTag $stringTag $Ec $nuc $thickness -rho $rho
		element StringPanelLin [expr $eleTag +  55] [expr $recWallX2 + 2] [expr $nodeTag +  71] [expr $nodeTag +  80] [expr $nodeTag +  79]	$stringTag 		$stringTag $stringTag $stringTag $Ec $nuc $thickness -rho $rho
		element StringPanelLin [expr $eleTag +  56] [expr $nodeTag +  71] [expr $coreWall1 + 1] [expr $nodeTag +  81] [expr $nodeTag +  80]	$stringTag 		$stringTag $stringTag $stringTag $Ec $nuc $thickness -rho $rho
		element StringPanelLin [expr $eleTag +  57] [expr $coreWall1 + 1] [expr $coreWall2 + 1] [expr $nodeTag +  82] [expr $nodeTag +  81]	$stringTagCB 	$stringTag $stringTag $stringTag $Ec $nuc $thickness -rho $rho
		element StringPanelLin [expr $eleTag +  58] [expr $coreWall2 + 1] [expr $nodeTag +  72] [expr $nodeTag +  83] [expr $nodeTag +  82]	$stringTag 		$stringTag $stringTag $stringTag $Ec $nuc $thickness -rho $rho
		element StringPanelLin [expr $eleTag +  59] [expr $nodeTag +  72] [expr $nodeTag +  73] [expr $nodeTag +  84] [expr $nodeTag +  83]	$stringTag 		$stringTag $stringTag $stringTag $Ec $nuc $thickness -rho $rho
		element StringPanelLin [expr $eleTag +  60] [expr $nodeTag +  73] [expr $nodeTag +  74] [expr $nodeTag +  85] [expr $nodeTag +  84]	$stringTag 		$stringTag $stringTag $stringTag $Ec $nuc $thickness -rho $rho
		element StringPanelLin [expr $eleTag +  61] [expr $nodeTag +  74] [expr $nodeTag +  75] [expr $nodeTag +  86] [expr $nodeTag +  85]	$stringTag 		$stringTag $stringTag $stringTag $Ec $nuc $thickness -rho $rho
		element StringPanelLin [expr $eleTag +  62] [expr $nodeTag +  75] [expr $coreWall3 + 1] [expr $nodeTag +  87] [expr $nodeTag +  86]	$stringTag 		$stringTag $stringTag $stringTag $Ec $nuc $thickness -rho $rho
		element StringPanelLin [expr $eleTag +  63] [expr $coreWall3 + 1] [expr $coreWall4 + 1] [expr $nodeTag +  88] [expr $nodeTag +  87]	$stringTagCB 	$stringTag $stringTag $stringTag $Ec $nuc $thickness -rho $rho
		element StringPanelLin [expr $eleTag +  64] [expr $coreWall4 + 1] [expr $nodeTag +  76] [expr $nodeTag +  89] [expr $nodeTag +  88]	$stringTag 		$stringTag $stringTag $stringTag $Ec $nuc $thickness -rho $rho
		element StringPanelLin [expr $eleTag +  65] [expr $nodeTag +  76] [expr $nodeTag +  77] [expr $nodeTag +  90] [expr $nodeTag +  89]	$stringTag 		$stringTag $stringTag $stringTag $Ec $nuc $thickness -rho $rho
	
	
	} else {
	
		element StringPanelLin [expr $eleTag +  1] [expr $nodeTag +  38] [expr $nodeTag +  39] [expr $nodeTag +  52] [expr $nodeTag +  51]	$stringTag $stringTag $stringTag $stringTag $Ec $nuc $thickness -rho $rho
		element StringPanelLin [expr $eleTag +  2] [expr $nodeTag +  39] [expr $nodeTag +  40] [expr $nodeTag +  53] [expr $nodeTag +  52]	$stringTag $stringTag $stringTag $stringTag $Ec $nuc $thickness -rho $rho
		element StringPanelLin [expr $eleTag +  3] [expr $nodeTag +  40] [expr $nodeTag +  41] [expr $nodeTag +  54] [expr $nodeTag +  53]	$stringTag $stringTag $stringTag $stringTag $Ec $nuc $thickness -rho $rho
		element StringPanelLin [expr $eleTag +  4] [expr $nodeTag +  41] [expr $nodeTag +  42] [expr $nodeTag +  55] [expr $nodeTag +  54]	$stringTag $stringTag $stringTag $stringTag $Ec $nuc $thickness -rho $rho
		element StringPanelLin [expr $eleTag +  5] [expr $nodeTag +  42] [expr $nodeTag +  43] [expr $nodeTag +  56] [expr $nodeTag +  55]	$stringTag $stringTag $stringTag $stringTag $Ec $nuc $thickness -rho $rho
		element StringPanelLin [expr $eleTag +  6] [expr $nodeTag +  43] [expr $nodeTag +  44] [expr $nodeTag +  57] [expr $nodeTag +  56]	$stringTag $stringTag $stringTag $stringTag $Ec $nuc $thickness -rho $rho
		element StringPanelLin [expr $eleTag +  7] [expr $nodeTag +  44] [expr $nodeTag +  45] [expr $nodeTag +  58] [expr $nodeTag +  57]	$stringTag $stringTag $stringTag $stringTag $Ec $nuc $thickness -rho $rho
		element StringPanelLin [expr $eleTag +  8] [expr $nodeTag +  45] [expr $nodeTag +  46] [expr $nodeTag +  59] [expr $nodeTag +  58]	$stringTag $stringTag $stringTag $stringTag $Ec $nuc $thickness -rho $rho
		element StringPanelLin [expr $eleTag +  9] [expr $nodeTag +  46] [expr $nodeTag +  47] [expr $nodeTag +  60] [expr $nodeTag +  59]	$stringTag $stringTag $stringTag $stringTag $Ec $nuc $thickness -rho $rho
		element StringPanelLin [expr $eleTag + 10] [expr $nodeTag +  47] [expr $nodeTag +  48] [expr $nodeTag +  61] [expr $nodeTag +  60]	$stringTag $stringTag $stringTag $stringTag $Ec $nuc $thickness -rho $rho
		
		
		element StringPanelLin [expr $eleTag + 11] [expr $nodeTag +  51] [expr $nodeTag +  52] [expr $coreWall1 + 2] [expr $nodeTag +  64]	$stringTag $stringTag $stringTag 	$stringTag $Ec $nuc $thickness -rho $rho
		element StringPanelLin [expr $eleTag + 12] [expr $nodeTag +  52] [expr $nodeTag +  53] [expr $coreWall2 + 2] [expr $coreWall1 + 2]	$stringTag $stringTag $stringTagCB 	$stringTag $Ec $nuc $thickness -rho $rho
		element StringPanelLin [expr $eleTag + 13] [expr $nodeTag +  53] [expr $nodeTag +  54] [expr $nodeTag +  65] [expr $coreWall2 + 2]	$stringTag $stringTag $stringTag 	$stringTag $Ec $nuc $thickness -rho $rho
		element StringPanelLin [expr $eleTag + 14] [expr $nodeTag +  54] [expr $nodeTag +  55] [expr $nodeTag +  66] [expr $nodeTag +  65]	$stringTag $stringTag $stringTag 	$stringTag $Ec $nuc $thickness -rho $rho
		element StringPanelLin [expr $eleTag + 15] [expr $nodeTag +  55] [expr $nodeTag +  56] [expr $nodeTag +  67] [expr $nodeTag +  66]	$stringTag $stringTag $stringTag 	$stringTag $Ec $nuc $thickness -rho $rho
		element StringPanelLin [expr $eleTag + 16] [expr $nodeTag +  56] [expr $nodeTag +  57] [expr $nodeTag +  68] [expr $nodeTag +  67]	$stringTag $stringTag $stringTag 	$stringTag $Ec $nuc $thickness -rho $rho
		element StringPanelLin [expr $eleTag + 17] [expr $nodeTag +  57] [expr $nodeTag +  58] [expr $coreWall3 + 2] [expr $nodeTag +  68]	$stringTag $stringTag $stringTag 	$stringTag $Ec $nuc $thickness -rho $rho
		element StringPanelLin [expr $eleTag + 18] [expr $nodeTag +  58] [expr $nodeTag +  59] [expr $coreWall4 + 2] [expr $coreWall3 + 2]	$stringTag $stringTag $stringTagCB 	$stringTag $Ec $nuc $thickness -rho $rho
		element StringPanelLin [expr $eleTag + 19] [expr $nodeTag +  59] [expr $nodeTag +  60] [expr $nodeTag +  69] [expr $coreWall4 + 2]	$stringTag $stringTag $stringTag 	$stringTag $Ec $nuc $thickness -rho $rho
		element StringPanelLin [expr $eleTag + 20] [expr $nodeTag +  60] [expr $nodeTag +  61] [expr $nodeTag +  70] [expr $nodeTag +  69]	$stringTag $stringTag $stringTag 	$stringTag $Ec $nuc $thickness -rho $rho
		
		
		element StringPanelLin [expr $eleTag + 21] [expr $nodeTag +  64] [expr $coreWall1 + 2] [expr $coreWall1 + 1] [expr $nodeTag +  71]	$stringTag $stringTag $stringTag $stringTag $Ec $nuc $thickness -rho $rho
		element StringPanelLin [expr $eleTag + 22] [expr $coreWall2 + 2] [expr $nodeTag +  65] [expr $nodeTag +  72] [expr $coreWall2 + 1]	$stringTag $stringTag $stringTag $stringTag $Ec $nuc $thickness -rho $rho
		element StringPanelLin [expr $eleTag + 23] [expr $nodeTag +  65] [expr $nodeTag +  66] [expr $nodeTag +  73] [expr $nodeTag +  72]	$stringTag $stringTag $stringTag $stringTag $Ec $nuc $thickness -rho $rho
		element StringPanelLin [expr $eleTag + 24] [expr $nodeTag +  67] [expr $nodeTag +  68] [expr $nodeTag +  75] [expr $nodeTag +  74]	$stringTag $stringTag $stringTag $stringTag $Ec $nuc $thickness -rho $rho
		element StringPanelLin [expr $eleTag + 25] [expr $nodeTag +  68] [expr $coreWall3 + 2] [expr $coreWall3 + 1] [expr $nodeTag +  75]	$stringTag $stringTag $stringTag $stringTag $Ec $nuc $thickness -rho $rho
		element StringPanelLin [expr $eleTag + 26] [expr $coreWall4 + 2] [expr $nodeTag +  69] [expr $nodeTag +  76] [expr $coreWall4 + 1]	$stringTag $stringTag $stringTag $stringTag $Ec $nuc $thickness -rho $rho
		element StringPanelLin [expr $eleTag + 27] [expr $nodeTag +  69] [expr $nodeTag +  70] [expr $nodeTag +  77] [expr $nodeTag +  76]	$stringTag $stringTag $stringTag $stringTag $Ec $nuc $thickness -rho $rho
		
		
		element StringPanelLin [expr $eleTag + 28] [expr $nodeTag +  71] [expr $coreWall1 + 1] [expr $nodeTag +  81] [expr $nodeTag +  80]	$stringTag 		$stringTag $stringTag $stringTag $Ec $nuc $thickness -rho $rho
		element StringPanelLin [expr $eleTag + 29] [expr $coreWall1 + 1] [expr $coreWall2 + 1] [expr $nodeTag +  82] [expr $nodeTag +  81]	$stringTagCB 	$stringTag $stringTag $stringTag $Ec $nuc $thickness -rho $rho
		element StringPanelLin [expr $eleTag + 30] [expr $coreWall2 + 1] [expr $nodeTag +  72] [expr $nodeTag +  83] [expr $nodeTag +  82]	$stringTag 		$stringTag $stringTag $stringTag $Ec $nuc $thickness -rho $rho
		element StringPanelLin [expr $eleTag + 31] [expr $nodeTag +  72] [expr $nodeTag +  73] [expr $nodeTag +  84] [expr $nodeTag +  83]	$stringTag 		$stringTag $stringTag $stringTag $Ec $nuc $thickness -rho $rho
		element StringPanelLin [expr $eleTag + 32] [expr $nodeTag +  73] [expr $nodeTag +  74] [expr $nodeTag +  85] [expr $nodeTag +  84]	$stringTag 		$stringTag $stringTag $stringTag $Ec $nuc $thickness -rho $rho
		element StringPanelLin [expr $eleTag + 33] [expr $nodeTag +  74] [expr $nodeTag +  75] [expr $nodeTag +  86] [expr $nodeTag +  85]	$stringTag 		$stringTag $stringTag $stringTag $Ec $nuc $thickness -rho $rho
		element StringPanelLin [expr $eleTag + 34] [expr $nodeTag +  75] [expr $coreWall3 + 1] [expr $nodeTag +  87] [expr $nodeTag +  86]	$stringTag 		$stringTag $stringTag $stringTag $Ec $nuc $thickness -rho $rho
		element StringPanelLin [expr $eleTag + 35] [expr $coreWall3 + 1] [expr $coreWall4 + 1] [expr $nodeTag +  88] [expr $nodeTag +  87]	$stringTagCB 	$stringTag $stringTag $stringTag $Ec $nuc $thickness -rho $rho
		element StringPanelLin [expr $eleTag + 36] [expr $coreWall4 + 1] [expr $nodeTag +  76] [expr $nodeTag +  89] [expr $nodeTag +  88]	$stringTag 		$stringTag $stringTag $stringTag $Ec $nuc $thickness -rho $rho
		element StringPanelLin [expr $eleTag + 37] [expr $nodeTag +  76] [expr $nodeTag +  77] [expr $nodeTag +  90] [expr $nodeTag +  89]	$stringTag 		$stringTag $stringTag $stringTag $Ec $nuc $thickness -rho $rho
	
	}
}


for {set i 1} {$i <= $nStory} {incr i 1} {
	
	if {$i <= 13} {
		set Ec [expr 0.50*$Ec6]
		if {$i == 3 || $i == 11} {
			set thickness [expr 12.*$in]
			set stringTag $string10x12
			set stringTagCB $string10x12
		} else {
			set thickness [expr 8.*$in]
			set stringTag $string10x8_6
			set stringTagCB $string10x8_6
		}
	} else {
		set Ec [expr 0.50*$Ec5]
		set thickness [expr 8.*$in]
		set stringTag $string10x8
		set stringTagCB $string10x8
	}
	
	set w_DL [expr 20.*$psf]
	set w_tot [expr $w_DL + 150.*$pcf*$thickness]
	set rho [expr $w_tot/$g]
	
	set eleTag [expr 100000 + 1000*$i]
	set nodeTag [expr 1000*$i + 800]
	
	set coreWall1 [expr 1000*$i + 100 + $nEleFloor]
	set coreWall2 [expr 1000*$i + 200 + $nEleFloor]
	set coreWall3 [expr 1000*$i + 300 + $nEleFloor]
	set coreWall4 [expr 1000*$i + 400 + $nEleFloor]
	
	set recWallX1 [expr 1000*$i + 500 + $nEleFloor]
	set recWallX2 [expr 1000*$i + 600 + $nEleFloor]
	set recWallY  [expr 1000*$i + 700 + $nEleFloor]
	
	if {$i <= 3} {
	
		puts $ModelFile "element StringPanelLin [expr $eleTag +   1] [expr $nodeTag +   1] [expr $nodeTag +   2] [expr $nodeTag +  15] [expr $nodeTag +  14]	$stringTag $stringTag $stringTag $stringTag $Ec $nuc $thickness -rho $rho    "
		puts $ModelFile "element StringPanelLin [expr $eleTag +   2] [expr $nodeTag +   2] [expr $nodeTag +   3] [expr $nodeTag +  16] [expr $nodeTag +  15]	$stringTag $stringTag $stringTag $stringTag $Ec $nuc $thickness -rho $rho    "
		puts $ModelFile "element StringPanelLin [expr $eleTag +   3] [expr $nodeTag +   3] [expr $nodeTag +   4] [expr $nodeTag +  17] [expr $nodeTag +  16]	$stringTag $stringTag $stringTag $stringTag $Ec $nuc $thickness -rho $rho    "
		puts $ModelFile "element StringPanelLin [expr $eleTag +   4] [expr $nodeTag +   4] [expr $nodeTag +   5] [expr $nodeTag +  18] [expr $nodeTag +  17]	$stringTag $stringTag $stringTag $stringTag $Ec $nuc $thickness -rho $rho    "
		puts $ModelFile "element StringPanelLin [expr $eleTag +   5] [expr $nodeTag +   5] [expr $nodeTag +   6] [expr $nodeTag +  19] [expr $nodeTag +  18]	$stringTag $stringTag $stringTag $stringTag $Ec $nuc $thickness -rho $rho    "
		puts $ModelFile "element StringPanelLin [expr $eleTag +   6] [expr $nodeTag +   6] [expr $nodeTag +   7] [expr $nodeTag +  20] [expr $nodeTag +  19]	$stringTag $stringTag $stringTag $stringTag $Ec $nuc $thickness -rho $rho    "
		puts $ModelFile "element StringPanelLin [expr $eleTag +   7] [expr $nodeTag +   7] [expr $nodeTag +   8] [expr $nodeTag +  21] [expr $nodeTag +  20]	$stringTag $stringTag $stringTag $stringTag $Ec $nuc $thickness -rho $rho    "
		puts $ModelFile "element StringPanelLin [expr $eleTag +   8] [expr $nodeTag +   8] [expr $nodeTag +   9] [expr $nodeTag +  22] [expr $nodeTag +  21]	$stringTag $stringTag $stringTag $stringTag $Ec $nuc $thickness -rho $rho    "
		puts $ModelFile "element StringPanelLin [expr $eleTag +   9] [expr $nodeTag +   9] [expr $nodeTag +  10] [expr $nodeTag +  23] [expr $nodeTag +  22]	$stringTag $stringTag $stringTag $stringTag $Ec $nuc $thickness -rho $rho    "
		puts $ModelFile "element StringPanelLin [expr $eleTag +  10] [expr $nodeTag +  10] [expr $nodeTag +  11] [expr $nodeTag +  24] [expr $nodeTag +  23]	$stringTag $stringTag $stringTag $stringTag $Ec $nuc $thickness -rho $rho    "
		puts $ModelFile "element StringPanelLin [expr $eleTag +  11] [expr $nodeTag +  11] [expr $nodeTag +  12] [expr $recWallY +  1] [expr $nodeTag +  24]	$stringTag $stringTag $stringTag $stringTag $Ec $nuc $thickness -rho $rho    "

		puts $ModelFile "element StringPanelLin [expr $eleTag +  12] [expr $nodeTag +  12] [expr $nodeTag +  13] [expr $nodeTag +  25] [expr $recWallY +  1]	$stringTag $stringTag $stringTag $stringTag $Ec $nuc $thickness -rho $rho		"
		puts $ModelFile "element StringPanelLin [expr $eleTag +  13] [expr $nodeTag +  14] [expr $nodeTag +  15] [expr $nodeTag +  27] [expr $nodeTag +  26]	$stringTag $stringTag $stringTag $stringTag $Ec $nuc $thickness -rho $rho     "
		puts $ModelFile "element StringPanelLin [expr $eleTag +  14] [expr $nodeTag +  15] [expr $nodeTag +  16] [expr $nodeTag +  28] [expr $nodeTag +  27]	$stringTag $stringTag $stringTag $stringTag $Ec $nuc $thickness -rho $rho     "
		puts $ModelFile "element StringPanelLin [expr $eleTag +  15] [expr $nodeTag +  16] [expr $nodeTag +  17] [expr $nodeTag +  29] [expr $nodeTag +  28]	$stringTag $stringTag $stringTag $stringTag $Ec $nuc $thickness -rho $rho     "
		puts $ModelFile "element StringPanelLin [expr $eleTag +  16] [expr $nodeTag +  17] [expr $nodeTag +  18] [expr $nodeTag +  30] [expr $nodeTag +  29]	$stringTag $stringTag $stringTag $stringTag $Ec $nuc $thickness -rho $rho     "
		puts $ModelFile "element StringPanelLin [expr $eleTag +  17] [expr $nodeTag +  18] [expr $nodeTag +  19] [expr $nodeTag +  31] [expr $nodeTag +  30]	$stringTag $stringTag $stringTag $stringTag $Ec $nuc $thickness -rho $rho     "
		puts $ModelFile "element StringPanelLin [expr $eleTag +  18] [expr $nodeTag +  19] [expr $nodeTag +  20] [expr $nodeTag +  32] [expr $nodeTag +  31]	$stringTag $stringTag $stringTag $stringTag $Ec $nuc $thickness -rho $rho     "
		puts $ModelFile "element StringPanelLin [expr $eleTag +  19] [expr $nodeTag +  20] [expr $nodeTag +  21] [expr $nodeTag +  33] [expr $nodeTag +  32]	$stringTag $stringTag $stringTag $stringTag $Ec $nuc $thickness -rho $rho     "
		puts $ModelFile "element StringPanelLin [expr $eleTag +  20] [expr $nodeTag +  21] [expr $nodeTag +  22] [expr $nodeTag +  34] [expr $nodeTag +  33]	$stringTag $stringTag $stringTag $stringTag $Ec $nuc $thickness -rho $rho     "
		puts $ModelFile "element StringPanelLin [expr $eleTag +  21] [expr $nodeTag +  22] [expr $nodeTag +  23] [expr $nodeTag +  35] [expr $nodeTag +  34]	$stringTag $stringTag $stringTag $stringTag $Ec $nuc $thickness -rho $rho     "
		puts $ModelFile "element StringPanelLin [expr $eleTag +  22] [expr $nodeTag +  23] [expr $nodeTag +  24] [expr $nodeTag +  36] [expr $nodeTag +  35]	$stringTag $stringTag $stringTag $stringTag $Ec $nuc $thickness -rho $rho     "
		puts $ModelFile "element StringPanelLin [expr $eleTag +  23] [expr $nodeTag +  24] [expr $recWallY +  1] [expr $recWallY +  2] [expr $nodeTag +  36]	$stringTag $stringTag $stringTag $stringTag $Ec $nuc $thickness -rho $rho     "
		puts $ModelFile "element StringPanelLin [expr $eleTag +  24] [expr $recWallY +  1] [expr $nodeTag +  25] [expr $nodeTag +  37] [expr $recWallY +  2]	$stringTag $stringTag $stringTag $stringTag $Ec $nuc $thickness -rho $rho     "

		puts $ModelFile "element StringPanelLin [expr $eleTag +  25] [expr $nodeTag +  26] [expr $nodeTag +  27] [expr $recWallX1 + 2] [expr $recWallX1 + 1]	$stringTag $stringTag $stringTag $stringTag $Ec $nuc $thickness -rho $rho     "
		puts $ModelFile "element StringPanelLin [expr $eleTag +  26] [expr $nodeTag +  27] [expr $nodeTag +  28] [expr $nodeTag +  38] [expr $recWallX1 + 2]	$stringTag $stringTag $stringTag $stringTag $Ec $nuc $thickness -rho $rho     "
		puts $ModelFile "element StringPanelLin [expr $eleTag +  27] [expr $nodeTag +  28] [expr $nodeTag +  29] [expr $nodeTag +  39] [expr $nodeTag +  38]	$stringTag $stringTag $stringTag $stringTag $Ec $nuc $thickness -rho $rho     "
		puts $ModelFile "element StringPanelLin [expr $eleTag +  28] [expr $nodeTag +  29] [expr $nodeTag +  30] [expr $nodeTag +  40] [expr $nodeTag +  39]	$stringTag $stringTag $stringTag $stringTag $Ec $nuc $thickness -rho $rho     "
		puts $ModelFile "element StringPanelLin [expr $eleTag +  29] [expr $nodeTag +  30] [expr $nodeTag +  31] [expr $nodeTag +  41] [expr $nodeTag +  40]	$stringTag $stringTag $stringTag $stringTag $Ec $nuc $thickness -rho $rho     "
		puts $ModelFile "element StringPanelLin [expr $eleTag +  30] [expr $nodeTag +  31] [expr $nodeTag +  32] [expr $nodeTag +  42] [expr $nodeTag +  41]	$stringTag $stringTag $stringTag $stringTag $Ec $nuc $thickness -rho $rho     "
		puts $ModelFile "element StringPanelLin [expr $eleTag +  31] [expr $nodeTag +  32] [expr $nodeTag +  33] [expr $nodeTag +  43] [expr $nodeTag +  42]	$stringTag $stringTag $stringTag $stringTag $Ec $nuc $thickness -rho $rho     "
		puts $ModelFile "element StringPanelLin [expr $eleTag +  32] [expr $nodeTag +  33] [expr $nodeTag +  34] [expr $nodeTag +  44] [expr $nodeTag +  43]	$stringTag $stringTag $stringTag $stringTag $Ec $nuc $thickness -rho $rho     "
		puts $ModelFile "element StringPanelLin [expr $eleTag +  33] [expr $nodeTag +  34] [expr $nodeTag +  35] [expr $nodeTag +  45] [expr $nodeTag +  44]	$stringTag $stringTag $stringTag $stringTag $Ec $nuc $thickness -rho $rho     "
		puts $ModelFile "element StringPanelLin [expr $eleTag +  34] [expr $nodeTag +  35] [expr $nodeTag +  36] [expr $nodeTag +  46] [expr $nodeTag +  45]	$stringTag $stringTag $stringTag $stringTag $Ec $nuc $thickness -rho $rho     "
		puts $ModelFile "element StringPanelLin [expr $eleTag +  35] [expr $nodeTag +  36] [expr $recWallY +  2] [expr $nodeTag +  47] [expr $nodeTag +  46]	$stringTag $stringTag $stringTag $stringTag $Ec $nuc $thickness -rho $rho     "
		puts $ModelFile "element StringPanelLin [expr $eleTag +  36] [expr $recWallY +  2] [expr $nodeTag +  37] [expr $nodeTag +  48] [expr $nodeTag +  47]	$stringTag $stringTag $stringTag $stringTag $Ec $nuc $thickness -rho $rho		"

		puts $ModelFile "element StringPanelLin [expr $eleTag +  37] [expr $recWallX1 + 1] [expr $recWallX1 + 2] [expr $nodeTag +  50] [expr $nodeTag +  49]	$stringTag $stringTag $stringTag $stringTag $Ec $nuc $thickness -rho $rho     "
		puts $ModelFile "element StringPanelLin [expr $eleTag +  38] [expr $recWallX1 + 2] [expr $nodeTag +  38] [expr $nodeTag +  51] [expr $nodeTag +  50]	$stringTag $stringTag $stringTag $stringTag $Ec $nuc $thickness -rho $rho     "
		puts $ModelFile "element StringPanelLin [expr $eleTag +  39] [expr $nodeTag +  38] [expr $nodeTag +  39] [expr $nodeTag +  52] [expr $nodeTag +  51]	$stringTag $stringTag $stringTag $stringTag $Ec $nuc $thickness -rho $rho     "
		puts $ModelFile "element StringPanelLin [expr $eleTag +  40] [expr $nodeTag +  39] [expr $nodeTag +  40] [expr $nodeTag +  53] [expr $nodeTag +  52]	$stringTag $stringTag $stringTag $stringTag $Ec $nuc $thickness -rho $rho     "
		puts $ModelFile "element StringPanelLin [expr $eleTag +  41] [expr $nodeTag +  40] [expr $nodeTag +  41] [expr $nodeTag +  54] [expr $nodeTag +  53]	$stringTag $stringTag $stringTag $stringTag $Ec $nuc $thickness -rho $rho     "
		puts $ModelFile "element StringPanelLin [expr $eleTag +  42] [expr $nodeTag +  41] [expr $nodeTag +  42] [expr $nodeTag +  55] [expr $nodeTag +  54]	$stringTag $stringTag $stringTag $stringTag $Ec $nuc $thickness -rho $rho     "
		puts $ModelFile "element StringPanelLin [expr $eleTag +  43] [expr $nodeTag +  42] [expr $nodeTag +  43] [expr $nodeTag +  56] [expr $nodeTag +  55]	$stringTag $stringTag $stringTag $stringTag $Ec $nuc $thickness -rho $rho     "
		puts $ModelFile "element StringPanelLin [expr $eleTag +  44] [expr $nodeTag +  43] [expr $nodeTag +  44] [expr $nodeTag +  57] [expr $nodeTag +  56]	$stringTag $stringTag $stringTag $stringTag $Ec $nuc $thickness -rho $rho     "
		puts $ModelFile "element StringPanelLin [expr $eleTag +  45] [expr $nodeTag +  44] [expr $nodeTag +  45] [expr $nodeTag +  58] [expr $nodeTag +  57]	$stringTag $stringTag $stringTag $stringTag $Ec $nuc $thickness -rho $rho     "
		puts $ModelFile "element StringPanelLin [expr $eleTag +  46] [expr $nodeTag +  45] [expr $nodeTag +  46] [expr $nodeTag +  59] [expr $nodeTag +  58]	$stringTag $stringTag $stringTag $stringTag $Ec $nuc $thickness -rho $rho     "
		puts $ModelFile "element StringPanelLin [expr $eleTag +  47] [expr $nodeTag +  46] [expr $nodeTag +  47] [expr $nodeTag +  60] [expr $nodeTag +  59]	$stringTag $stringTag $stringTag $stringTag $Ec $nuc $thickness -rho $rho     "
		puts $ModelFile "element StringPanelLin [expr $eleTag +  48] [expr $nodeTag +  47] [expr $nodeTag +  48] [expr $nodeTag +  61] [expr $nodeTag +  60]	$stringTag $stringTag $stringTag $stringTag $Ec $nuc $thickness -rho $rho     "
		
		puts $ModelFile "element StringPanelLin [expr $eleTag +  49] [expr $nodeTag +  49] [expr $nodeTag +  50] [expr $nodeTag +  63] [expr $nodeTag +  62]	$stringTag $stringTag $stringTag 	$stringTag $Ec $nuc $thickness -rho $rho  "
		puts $ModelFile "element StringPanelLin [expr $eleTag +  50] [expr $nodeTag +  50] [expr $nodeTag +  51] [expr $nodeTag +  64] [expr $nodeTag +  63]	$stringTag $stringTag $stringTag 	$stringTag $Ec $nuc $thickness -rho $rho  "
		puts $ModelFile "element StringPanelLin [expr $eleTag +  51] [expr $nodeTag +  51] [expr $nodeTag +  52] [expr $coreWall1 + 2] [expr $nodeTag +  64]	$stringTag $stringTag $stringTag 	$stringTag $Ec $nuc $thickness -rho $rho  "
		puts $ModelFile "element StringPanelLin [expr $eleTag +  52] [expr $nodeTag +  52] [expr $nodeTag +  53] [expr $coreWall2 + 2] [expr $coreWall1 + 2]	$stringTag $stringTag $stringTagCB 	$stringTag $Ec $nuc $thickness -rho $rho  "
		puts $ModelFile "element StringPanelLin [expr $eleTag +  53] [expr $nodeTag +  53] [expr $nodeTag +  54] [expr $nodeTag +  65] [expr $coreWall2 + 2]	$stringTag $stringTag $stringTag 	$stringTag $Ec $nuc $thickness -rho $rho  "
		puts $ModelFile "element StringPanelLin [expr $eleTag +  54] [expr $nodeTag +  54] [expr $nodeTag +  55] [expr $nodeTag +  66] [expr $nodeTag +  65]	$stringTag $stringTag $stringTag 	$stringTag $Ec $nuc $thickness -rho $rho  "
		puts $ModelFile "element StringPanelLin [expr $eleTag +  55] [expr $nodeTag +  55] [expr $nodeTag +  56] [expr $nodeTag +  67] [expr $nodeTag +  66]	$stringTag $stringTag $stringTag 	$stringTag $Ec $nuc $thickness -rho $rho  "
		puts $ModelFile "element StringPanelLin [expr $eleTag +  56] [expr $nodeTag +  56] [expr $nodeTag +  57] [expr $nodeTag +  68] [expr $nodeTag +  67]	$stringTag $stringTag $stringTag 	$stringTag $Ec $nuc $thickness -rho $rho  "
		puts $ModelFile "element StringPanelLin [expr $eleTag +  57] [expr $nodeTag +  57] [expr $nodeTag +  58] [expr $coreWall3 + 2] [expr $nodeTag +  68]	$stringTag $stringTag $stringTag 	$stringTag $Ec $nuc $thickness -rho $rho  "
		puts $ModelFile "element StringPanelLin [expr $eleTag +  58] [expr $nodeTag +  58] [expr $nodeTag +  59] [expr $coreWall4 + 2] [expr $coreWall3 + 2]	$stringTag $stringTag $stringTagCB 	$stringTag $Ec $nuc $thickness -rho $rho  "
		puts $ModelFile "element StringPanelLin [expr $eleTag +  59] [expr $nodeTag +  59] [expr $nodeTag +  60] [expr $nodeTag +  69] [expr $coreWall4 + 2]	$stringTag $stringTag $stringTag 	$stringTag $Ec $nuc $thickness -rho $rho  "

		puts $ModelFile "element StringPanelLin [expr $eleTag +  60] [expr $nodeTag +  60] [expr $nodeTag +  61] [expr $nodeTag +  70] [expr $nodeTag +  69]	$stringTag $stringTag $stringTag 	$stringTag $Ec $nuc $thickness -rho $rho  "
		puts $ModelFile "element StringPanelLin [expr $eleTag +  61] [expr $nodeTag +  62] [expr $nodeTag +  63] [expr $recWallX2 + 2] [expr $recWallX2 + 1]	$stringTag $stringTag $stringTag $stringTag $Ec $nuc $thickness -rho $rho     "
		puts $ModelFile "element StringPanelLin [expr $eleTag +  62] [expr $nodeTag +  63] [expr $nodeTag +  64] [expr $nodeTag +  71] [expr $recWallX2 + 2]	$stringTag $stringTag $stringTag $stringTag $Ec $nuc $thickness -rho $rho     "
		puts $ModelFile "element StringPanelLin [expr $eleTag +  63] [expr $nodeTag +  64] [expr $coreWall1 + 2] [expr $coreWall1 + 1] [expr $nodeTag +  71]	$stringTag $stringTag $stringTag $stringTag $Ec $nuc $thickness -rho $rho     "

		puts $ModelFile "element StringPanelLin [expr $eleTag +  64] [expr $coreWall2 + 2] [expr $nodeTag +  65] [expr $nodeTag +  72] [expr $coreWall2 + 1]	$stringTag $stringTag $stringTag $stringTag $Ec $nuc $thickness -rho $rho     "
		puts $ModelFile "element StringPanelLin [expr $eleTag +  65] [expr $nodeTag +  65] [expr $nodeTag +  66] [expr $nodeTag +  73] [expr $nodeTag +  72]	$stringTag $stringTag $stringTag $stringTag $Ec $nuc $thickness -rho $rho     "
		puts $ModelFile "element StringPanelLin [expr $eleTag +  66] [expr $nodeTag +  66] [expr $nodeTag +  67] [expr $nodeTag +  74] [expr $nodeTag +  73]	$stringTag $stringTag $stringTag $stringTag $Ec $nuc $thickness -rho $rho     "
		puts $ModelFile "element StringPanelLin [expr $eleTag +  67] [expr $nodeTag +  67] [expr $nodeTag +  68] [expr $nodeTag +  75] [expr $nodeTag +  74]	$stringTag $stringTag $stringTag $stringTag $Ec $nuc $thickness -rho $rho     "
		puts $ModelFile "element StringPanelLin [expr $eleTag +  68] [expr $nodeTag +  68] [expr $coreWall3 + 2] [expr $coreWall3 + 1] [expr $nodeTag +  75]	$stringTag $stringTag $stringTag $stringTag $Ec $nuc $thickness -rho $rho     "
		puts $ModelFile "element StringPanelLin [expr $eleTag +  69] [expr $coreWall4 + 2] [expr $nodeTag +  69] [expr $nodeTag +  76] [expr $coreWall4 + 1]	$stringTag $stringTag $stringTag $stringTag $Ec $nuc $thickness -rho $rho     "
		puts $ModelFile "element StringPanelLin [expr $eleTag +  70] [expr $nodeTag +  69] [expr $nodeTag +  70] [expr $nodeTag +  77] [expr $nodeTag +  76]	$stringTag $stringTag $stringTag $stringTag $Ec $nuc $thickness -rho $rho		"

		puts $ModelFile "element StringPanelLin [expr $eleTag +  71] [expr $recWallX2 + 1] [expr $recWallX2 + 2] [expr $nodeTag +  79] [expr $nodeTag +  78]	$stringTag 		$stringTag $stringTag $stringTag $Ec $nuc $thickness -rho $rho"
		puts $ModelFile "element StringPanelLin [expr $eleTag +  72] [expr $recWallX2 + 2] [expr $nodeTag +  71] [expr $nodeTag +  80] [expr $nodeTag +  79]	$stringTag 		$stringTag $stringTag $stringTag $Ec $nuc $thickness -rho $rho"
		puts $ModelFile "element StringPanelLin [expr $eleTag +  73] [expr $nodeTag +  71] [expr $coreWall1 + 1] [expr $nodeTag +  81] [expr $nodeTag +  80]	$stringTag 		$stringTag $stringTag $stringTag $Ec $nuc $thickness -rho $rho"
		puts $ModelFile "element StringPanelLin [expr $eleTag +  74] [expr $coreWall1 + 1] [expr $coreWall2 + 1] [expr $nodeTag +  82] [expr $nodeTag +  81]	$stringTagCB 	$stringTag $stringTag $stringTag $Ec $nuc $thickness -rho $rho"
		puts $ModelFile "element StringPanelLin [expr $eleTag +  75] [expr $coreWall2 + 1] [expr $nodeTag +  72] [expr $nodeTag +  83] [expr $nodeTag +  82]	$stringTag 		$stringTag $stringTag $stringTag $Ec $nuc $thickness -rho $rho"
		puts $ModelFile "element StringPanelLin [expr $eleTag +  76] [expr $nodeTag +  72] [expr $nodeTag +  73] [expr $nodeTag +  84] [expr $nodeTag +  83]	$stringTag 		$stringTag $stringTag $stringTag $Ec $nuc $thickness -rho $rho"
		puts $ModelFile "element StringPanelLin [expr $eleTag +  77] [expr $nodeTag +  73] [expr $nodeTag +  74] [expr $nodeTag +  85] [expr $nodeTag +  84]	$stringTag 		$stringTag $stringTag $stringTag $Ec $nuc $thickness -rho $rho"
		puts $ModelFile "element StringPanelLin [expr $eleTag +  78] [expr $nodeTag +  74] [expr $nodeTag +  75] [expr $nodeTag +  86] [expr $nodeTag +  85]	$stringTag 		$stringTag $stringTag $stringTag $Ec $nuc $thickness -rho $rho"
		puts $ModelFile "element StringPanelLin [expr $eleTag +  79] [expr $nodeTag +  75] [expr $coreWall3 + 1] [expr $nodeTag +  87] [expr $nodeTag +  86]	$stringTag 		$stringTag $stringTag $stringTag $Ec $nuc $thickness -rho $rho"
		puts $ModelFile "element StringPanelLin [expr $eleTag +  80] [expr $coreWall3 + 1] [expr $coreWall4 + 1] [expr $nodeTag +  88] [expr $nodeTag +  87]	$stringTagCB 	$stringTag $stringTag $stringTag $Ec $nuc $thickness -rho $rho"
		puts $ModelFile "element StringPanelLin [expr $eleTag +  81] [expr $coreWall4 + 1] [expr $nodeTag +  76] [expr $nodeTag +  89] [expr $nodeTag +  88]	$stringTag 		$stringTag $stringTag $stringTag $Ec $nuc $thickness -rho $rho"
		puts $ModelFile "element StringPanelLin [expr $eleTag +  82] [expr $nodeTag +  76] [expr $nodeTag +  77] [expr $nodeTag +  90] [expr $nodeTag +  89]	$stringTag 		$stringTag $stringTag $stringTag $Ec $nuc $thickness -rho $rho"
	
	} elseif {$i <= 11} {

		puts $ModelFile "element StringPanelLin [expr $eleTag +   1] [expr $nodeTag +   9] [expr $nodeTag +  10] [expr $nodeTag +  23] [expr $nodeTag +  22]	$stringTag $stringTag $stringTag $stringTag $Ec $nuc $thickness -rho $rho     "
		puts $ModelFile "element StringPanelLin [expr $eleTag +   2] [expr $nodeTag +  10] [expr $nodeTag +  11] [expr $nodeTag +  24] [expr $nodeTag +  23]	$stringTag $stringTag $stringTag $stringTag $Ec $nuc $thickness -rho $rho     "
		puts $ModelFile "element StringPanelLin [expr $eleTag +   3] [expr $nodeTag +  11] [expr $nodeTag +  12] [expr $recWallY +  1] [expr $nodeTag +  24]	$stringTag $stringTag $stringTag $stringTag $Ec $nuc $thickness -rho $rho     "
		puts $ModelFile "element StringPanelLin [expr $eleTag +   4] [expr $nodeTag +  12] [expr $nodeTag +  13] [expr $nodeTag +  25] [expr $recWallY +  1]	$stringTag $stringTag $stringTag $stringTag $Ec $nuc $thickness -rho $rho		"

		puts $ModelFile "element StringPanelLin [expr $eleTag +   5] [expr $nodeTag +  22] [expr $nodeTag +  23] [expr $nodeTag +  35] [expr $nodeTag +  34]	$stringTag $stringTag $stringTag $stringTag $Ec $nuc $thickness -rho $rho     "
		puts $ModelFile "element StringPanelLin [expr $eleTag +   6] [expr $nodeTag +  23] [expr $nodeTag +  24] [expr $nodeTag +  36] [expr $nodeTag +  35]	$stringTag $stringTag $stringTag $stringTag $Ec $nuc $thickness -rho $rho     "
		puts $ModelFile "element StringPanelLin [expr $eleTag +   7] [expr $nodeTag +  24] [expr $recWallY +  1] [expr $recWallY +  2] [expr $nodeTag +  36]	$stringTag $stringTag $stringTag $stringTag $Ec $nuc $thickness -rho $rho     "
		puts $ModelFile "element StringPanelLin [expr $eleTag +   8] [expr $recWallY +  1] [expr $nodeTag +  25] [expr $nodeTag +  37] [expr $recWallY +  2]	$stringTag $stringTag $stringTag $stringTag $Ec $nuc $thickness -rho $rho     "
		puts $ModelFile "element StringPanelLin [expr $eleTag +   9] [expr $nodeTag +  26] [expr $nodeTag +  27] [expr $recWallX1 + 2] [expr $recWallX1 + 1]	$stringTag $stringTag $stringTag $stringTag $Ec $nuc $thickness -rho $rho     "
		puts $ModelFile "element StringPanelLin [expr $eleTag +  10] [expr $nodeTag +  27] [expr $nodeTag +  28] [expr $nodeTag +  38] [expr $recWallX1 + 2]	$stringTag $stringTag $stringTag $stringTag $Ec $nuc $thickness -rho $rho     "
		puts $ModelFile "element StringPanelLin [expr $eleTag +  11] [expr $nodeTag +  28] [expr $nodeTag +  29] [expr $nodeTag +  39] [expr $nodeTag +  38]	$stringTag $stringTag $stringTag $stringTag $Ec $nuc $thickness -rho $rho     "
		puts $ModelFile "element StringPanelLin [expr $eleTag +  12] [expr $nodeTag +  29] [expr $nodeTag +  30] [expr $nodeTag +  40] [expr $nodeTag +  39]	$stringTag $stringTag $stringTag $stringTag $Ec $nuc $thickness -rho $rho     "
		puts $ModelFile "element StringPanelLin [expr $eleTag +  13] [expr $nodeTag +  30] [expr $nodeTag +  31] [expr $nodeTag +  41] [expr $nodeTag +  40]	$stringTag $stringTag $stringTag $stringTag $Ec $nuc $thickness -rho $rho     "
		puts $ModelFile "element StringPanelLin [expr $eleTag +  14] [expr $nodeTag +  31] [expr $nodeTag +  32] [expr $nodeTag +  42] [expr $nodeTag +  41]	$stringTag $stringTag $stringTag $stringTag $Ec $nuc $thickness -rho $rho     "
		puts $ModelFile "element StringPanelLin [expr $eleTag +  15] [expr $nodeTag +  32] [expr $nodeTag +  33] [expr $nodeTag +  43] [expr $nodeTag +  42]	$stringTag $stringTag $stringTag $stringTag $Ec $nuc $thickness -rho $rho     "
		puts $ModelFile "element StringPanelLin [expr $eleTag +  16] [expr $nodeTag +  33] [expr $nodeTag +  34] [expr $nodeTag +  44] [expr $nodeTag +  43]	$stringTag $stringTag $stringTag $stringTag $Ec $nuc $thickness -rho $rho     "
		puts $ModelFile "element StringPanelLin [expr $eleTag +  17] [expr $nodeTag +  34] [expr $nodeTag +  35] [expr $nodeTag +  45] [expr $nodeTag +  44]	$stringTag $stringTag $stringTag $stringTag $Ec $nuc $thickness -rho $rho     "
		puts $ModelFile "element StringPanelLin [expr $eleTag +  18] [expr $nodeTag +  35] [expr $nodeTag +  36] [expr $nodeTag +  46] [expr $nodeTag +  45]	$stringTag $stringTag $stringTag $stringTag $Ec $nuc $thickness -rho $rho     "
		puts $ModelFile "element StringPanelLin [expr $eleTag +  19] [expr $nodeTag +  36] [expr $recWallY +  2] [expr $nodeTag +  47] [expr $nodeTag +  46]	$stringTag $stringTag $stringTag $stringTag $Ec $nuc $thickness -rho $rho     "
		puts $ModelFile "element StringPanelLin [expr $eleTag +  20] [expr $recWallY +  2] [expr $nodeTag +  37] [expr $nodeTag +  48] [expr $nodeTag +  47]	$stringTag $stringTag $stringTag $stringTag $Ec $nuc $thickness -rho $rho     "

		puts $ModelFile "element StringPanelLin [expr $eleTag +  21] [expr $recWallX1 + 1] [expr $recWallX1 + 2] [expr $nodeTag +  50] [expr $nodeTag +  49]	$stringTag $stringTag $stringTag $stringTag $Ec $nuc $thickness -rho $rho     "
		puts $ModelFile "element StringPanelLin [expr $eleTag +  22] [expr $recWallX1 + 2] [expr $nodeTag +  38] [expr $nodeTag +  51] [expr $nodeTag +  50]	$stringTag $stringTag $stringTag $stringTag $Ec $nuc $thickness -rho $rho     "
		puts $ModelFile "element StringPanelLin [expr $eleTag +  23] [expr $nodeTag +  38] [expr $nodeTag +  39] [expr $nodeTag +  52] [expr $nodeTag +  51]	$stringTag $stringTag $stringTag $stringTag $Ec $nuc $thickness -rho $rho     "
		puts $ModelFile "element StringPanelLin [expr $eleTag +  24] [expr $nodeTag +  39] [expr $nodeTag +  40] [expr $nodeTag +  53] [expr $nodeTag +  52]	$stringTag $stringTag $stringTag $stringTag $Ec $nuc $thickness -rho $rho     "
		puts $ModelFile "element StringPanelLin [expr $eleTag +  25] [expr $nodeTag +  40] [expr $nodeTag +  41] [expr $nodeTag +  54] [expr $nodeTag +  53]	$stringTag $stringTag $stringTag $stringTag $Ec $nuc $thickness -rho $rho     "
		puts $ModelFile "element StringPanelLin [expr $eleTag +  26] [expr $nodeTag +  41] [expr $nodeTag +  42] [expr $nodeTag +  55] [expr $nodeTag +  54]	$stringTag $stringTag $stringTag $stringTag $Ec $nuc $thickness -rho $rho     "
		puts $ModelFile "element StringPanelLin [expr $eleTag +  27] [expr $nodeTag +  42] [expr $nodeTag +  43] [expr $nodeTag +  56] [expr $nodeTag +  55]	$stringTag $stringTag $stringTag $stringTag $Ec $nuc $thickness -rho $rho     "
		puts $ModelFile "element StringPanelLin [expr $eleTag +  28] [expr $nodeTag +  43] [expr $nodeTag +  44] [expr $nodeTag +  57] [expr $nodeTag +  56]	$stringTag $stringTag $stringTag $stringTag $Ec $nuc $thickness -rho $rho     "
		puts $ModelFile "element StringPanelLin [expr $eleTag +  29] [expr $nodeTag +  44] [expr $nodeTag +  45] [expr $nodeTag +  58] [expr $nodeTag +  57]	$stringTag $stringTag $stringTag $stringTag $Ec $nuc $thickness -rho $rho     "
		puts $ModelFile "element StringPanelLin [expr $eleTag +  30] [expr $nodeTag +  45] [expr $nodeTag +  46] [expr $nodeTag +  59] [expr $nodeTag +  58]	$stringTag $stringTag $stringTag $stringTag $Ec $nuc $thickness -rho $rho     "
		puts $ModelFile "element StringPanelLin [expr $eleTag +  31] [expr $nodeTag +  46] [expr $nodeTag +  47] [expr $nodeTag +  60] [expr $nodeTag +  59]	$stringTag $stringTag $stringTag $stringTag $Ec $nuc $thickness -rho $rho     "
		puts $ModelFile "element StringPanelLin [expr $eleTag +  32] [expr $nodeTag +  47] [expr $nodeTag +  48] [expr $nodeTag +  61] [expr $nodeTag +  60]	$stringTag $stringTag $stringTag $stringTag $Ec $nuc $thickness -rho $rho     "

		puts $ModelFile "element StringPanelLin [expr $eleTag +  33] [expr $nodeTag +  49] [expr $nodeTag +  50] [expr $nodeTag +  63] [expr $nodeTag +  62]	$stringTag $stringTag $stringTag 	$stringTag $Ec $nuc $thickness -rho $rho  "
		puts $ModelFile "element StringPanelLin [expr $eleTag +  34] [expr $nodeTag +  50] [expr $nodeTag +  51] [expr $nodeTag +  64] [expr $nodeTag +  63]	$stringTag $stringTag $stringTag 	$stringTag $Ec $nuc $thickness -rho $rho  "
		puts $ModelFile "element StringPanelLin [expr $eleTag +  35] [expr $nodeTag +  51] [expr $nodeTag +  52] [expr $coreWall1 + 2] [expr $nodeTag +  64]	$stringTag $stringTag $stringTag 	$stringTag $Ec $nuc $thickness -rho $rho  "
		puts $ModelFile "element StringPanelLin [expr $eleTag +  36] [expr $nodeTag +  52] [expr $nodeTag +  53] [expr $coreWall2 + 2] [expr $coreWall1 + 2]	$stringTag $stringTag $stringTagCB 	$stringTag $Ec $nuc $thickness -rho $rho  "
		puts $ModelFile "element StringPanelLin [expr $eleTag +  37] [expr $nodeTag +  53] [expr $nodeTag +  54] [expr $nodeTag +  65] [expr $coreWall2 + 2]	$stringTag $stringTag $stringTag 	$stringTag $Ec $nuc $thickness -rho $rho  "
		puts $ModelFile "element StringPanelLin [expr $eleTag +  38] [expr $nodeTag +  54] [expr $nodeTag +  55] [expr $nodeTag +  66] [expr $nodeTag +  65]	$stringTag $stringTag $stringTag 	$stringTag $Ec $nuc $thickness -rho $rho  "
		puts $ModelFile "element StringPanelLin [expr $eleTag +  39] [expr $nodeTag +  55] [expr $nodeTag +  56] [expr $nodeTag +  67] [expr $nodeTag +  66]	$stringTag $stringTag $stringTag 	$stringTag $Ec $nuc $thickness -rho $rho  "
		puts $ModelFile "element StringPanelLin [expr $eleTag +  40] [expr $nodeTag +  56] [expr $nodeTag +  57] [expr $nodeTag +  68] [expr $nodeTag +  67]	$stringTag $stringTag $stringTag 	$stringTag $Ec $nuc $thickness -rho $rho  "
		puts $ModelFile "element StringPanelLin [expr $eleTag +  41] [expr $nodeTag +  57] [expr $nodeTag +  58] [expr $coreWall3 + 2] [expr $nodeTag +  68]	$stringTag $stringTag $stringTag 	$stringTag $Ec $nuc $thickness -rho $rho  "
		puts $ModelFile "element StringPanelLin [expr $eleTag +  42] [expr $nodeTag +  58] [expr $nodeTag +  59] [expr $coreWall4 + 2] [expr $coreWall3 + 2]	$stringTag $stringTag $stringTagCB 	$stringTag $Ec $nuc $thickness -rho $rho  "
		puts $ModelFile "element StringPanelLin [expr $eleTag +  43] [expr $nodeTag +  59] [expr $nodeTag +  60] [expr $nodeTag +  69] [expr $coreWall4 + 2]	$stringTag $stringTag $stringTag 	$stringTag $Ec $nuc $thickness -rho $rho  "
		puts $ModelFile "element StringPanelLin [expr $eleTag +  44] [expr $nodeTag +  60] [expr $nodeTag +  61] [expr $nodeTag +  70] [expr $nodeTag +  69]	$stringTag $stringTag $stringTag 	$stringTag $Ec $nuc $thickness -rho $rho  "

		puts $ModelFile "element StringPanelLin [expr $eleTag +  45] [expr $nodeTag +  62] [expr $nodeTag +  63] [expr $recWallX2 + 2] [expr $recWallX2 + 1]	$stringTag $stringTag $stringTag $stringTag $Ec $nuc $thickness -rho $rho     "
		puts $ModelFile "element StringPanelLin [expr $eleTag +  46] [expr $nodeTag +  63] [expr $nodeTag +  64] [expr $nodeTag +  71] [expr $recWallX2 + 2]	$stringTag $stringTag $stringTag $stringTag $Ec $nuc $thickness -rho $rho     "
		puts $ModelFile "element StringPanelLin [expr $eleTag +  47] [expr $nodeTag +  64] [expr $coreWall1 + 2] [expr $coreWall1 + 1] [expr $nodeTag +  71]	$stringTag $stringTag $stringTag $stringTag $Ec $nuc $thickness -rho $rho     "

		puts $ModelFile "element StringPanelLin [expr $eleTag +  48] [expr $coreWall2 + 2] [expr $nodeTag +  65] [expr $nodeTag +  72] [expr $coreWall2 + 1]	$stringTag $stringTag $stringTag $stringTag $Ec $nuc $thickness -rho $rho     "
		puts $ModelFile "element StringPanelLin [expr $eleTag +  49] [expr $nodeTag +  65] [expr $nodeTag +  66] [expr $nodeTag +  73] [expr $nodeTag +  72]	$stringTag $stringTag $stringTag $stringTag $Ec $nuc $thickness -rho $rho     "

		puts $ModelFile "element StringPanelLin [expr $eleTag +  50] [expr $nodeTag +  67] [expr $nodeTag +  68] [expr $nodeTag +  75] [expr $nodeTag +  74]	$stringTag $stringTag $stringTag $stringTag $Ec $nuc $thickness -rho $rho     "
		puts $ModelFile "element StringPanelLin [expr $eleTag +  51] [expr $nodeTag +  68] [expr $coreWall3 + 2] [expr $coreWall3 + 1] [expr $nodeTag +  75]	$stringTag $stringTag $stringTag $stringTag $Ec $nuc $thickness -rho $rho     "
		puts $ModelFile "element StringPanelLin [expr $eleTag +  52] [expr $coreWall4 + 2] [expr $nodeTag +  69] [expr $nodeTag +  76] [expr $coreWall4 + 1]	$stringTag $stringTag $stringTag $stringTag $Ec $nuc $thickness -rho $rho     "
		puts $ModelFile "element StringPanelLin [expr $eleTag +  53] [expr $nodeTag +  69] [expr $nodeTag +  70] [expr $nodeTag +  77] [expr $nodeTag +  76]	$stringTag $stringTag $stringTag $stringTag $Ec $nuc $thickness -rho $rho     "

		puts $ModelFile "element StringPanelLin [expr $eleTag +  54] [expr $recWallX2 + 1] [expr $recWallX2 + 2] [expr $nodeTag +  79] [expr $nodeTag +  78]	$stringTag 		$stringTag $stringTag $stringTag $Ec $nuc $thickness -rho $rho"
		puts $ModelFile "element StringPanelLin [expr $eleTag +  55] [expr $recWallX2 + 2] [expr $nodeTag +  71] [expr $nodeTag +  80] [expr $nodeTag +  79]	$stringTag 		$stringTag $stringTag $stringTag $Ec $nuc $thickness -rho $rho"
		puts $ModelFile "element StringPanelLin [expr $eleTag +  56] [expr $nodeTag +  71] [expr $coreWall1 + 1] [expr $nodeTag +  81] [expr $nodeTag +  80]	$stringTag 		$stringTag $stringTag $stringTag $Ec $nuc $thickness -rho $rho"
		puts $ModelFile "element StringPanelLin [expr $eleTag +  57] [expr $coreWall1 + 1] [expr $coreWall2 + 1] [expr $nodeTag +  82] [expr $nodeTag +  81]	$stringTagCB 	$stringTag $stringTag $stringTag $Ec $nuc $thickness -rho $rho"
		puts $ModelFile "element StringPanelLin [expr $eleTag +  58] [expr $coreWall2 + 1] [expr $nodeTag +  72] [expr $nodeTag +  83] [expr $nodeTag +  82]	$stringTag 		$stringTag $stringTag $stringTag $Ec $nuc $thickness -rho $rho"
		puts $ModelFile "element StringPanelLin [expr $eleTag +  59] [expr $nodeTag +  72] [expr $nodeTag +  73] [expr $nodeTag +  84] [expr $nodeTag +  83]	$stringTag 		$stringTag $stringTag $stringTag $Ec $nuc $thickness -rho $rho"
		puts $ModelFile "element StringPanelLin [expr $eleTag +  60] [expr $nodeTag +  73] [expr $nodeTag +  74] [expr $nodeTag +  85] [expr $nodeTag +  84]	$stringTag 		$stringTag $stringTag $stringTag $Ec $nuc $thickness -rho $rho"
		puts $ModelFile "element StringPanelLin [expr $eleTag +  61] [expr $nodeTag +  74] [expr $nodeTag +  75] [expr $nodeTag +  86] [expr $nodeTag +  85]	$stringTag 		$stringTag $stringTag $stringTag $Ec $nuc $thickness -rho $rho"
		puts $ModelFile "element StringPanelLin [expr $eleTag +  62] [expr $nodeTag +  75] [expr $coreWall3 + 1] [expr $nodeTag +  87] [expr $nodeTag +  86]	$stringTag 		$stringTag $stringTag $stringTag $Ec $nuc $thickness -rho $rho"
		puts $ModelFile "element StringPanelLin [expr $eleTag +  63] [expr $coreWall3 + 1] [expr $coreWall4 + 1] [expr $nodeTag +  88] [expr $nodeTag +  87]	$stringTagCB 	$stringTag $stringTag $stringTag $Ec $nuc $thickness -rho $rho"
		puts $ModelFile "element StringPanelLin [expr $eleTag +  64] [expr $coreWall4 + 1] [expr $nodeTag +  76] [expr $nodeTag +  89] [expr $nodeTag +  88]	$stringTag 		$stringTag $stringTag $stringTag $Ec $nuc $thickness -rho $rho"
		puts $ModelFile "element StringPanelLin [expr $eleTag +  65] [expr $nodeTag +  76] [expr $nodeTag +  77] [expr $nodeTag +  90] [expr $nodeTag +  89]	$stringTag 		$stringTag $stringTag $stringTag $Ec $nuc $thickness -rho $rho"
	
	} else {
	
		puts $ModelFile "element StringPanelLin [expr $eleTag +  1] [expr $nodeTag +  38] [expr $nodeTag +  39] [expr $nodeTag +  52] [expr $nodeTag +  51]	$stringTag $stringTag $stringTag $stringTag $Ec $nuc $thickness -rho $rho     "
		puts $ModelFile "element StringPanelLin [expr $eleTag +  2] [expr $nodeTag +  39] [expr $nodeTag +  40] [expr $nodeTag +  53] [expr $nodeTag +  52]	$stringTag $stringTag $stringTag $stringTag $Ec $nuc $thickness -rho $rho     "
		puts $ModelFile "element StringPanelLin [expr $eleTag +  3] [expr $nodeTag +  40] [expr $nodeTag +  41] [expr $nodeTag +  54] [expr $nodeTag +  53]	$stringTag $stringTag $stringTag $stringTag $Ec $nuc $thickness -rho $rho     "
		puts $ModelFile "element StringPanelLin [expr $eleTag +  4] [expr $nodeTag +  41] [expr $nodeTag +  42] [expr $nodeTag +  55] [expr $nodeTag +  54]	$stringTag $stringTag $stringTag $stringTag $Ec $nuc $thickness -rho $rho     "
		puts $ModelFile "element StringPanelLin [expr $eleTag +  5] [expr $nodeTag +  42] [expr $nodeTag +  43] [expr $nodeTag +  56] [expr $nodeTag +  55]	$stringTag $stringTag $stringTag $stringTag $Ec $nuc $thickness -rho $rho     "
		puts $ModelFile "element StringPanelLin [expr $eleTag +  6] [expr $nodeTag +  43] [expr $nodeTag +  44] [expr $nodeTag +  57] [expr $nodeTag +  56]	$stringTag $stringTag $stringTag $stringTag $Ec $nuc $thickness -rho $rho     "
		puts $ModelFile "element StringPanelLin [expr $eleTag +  7] [expr $nodeTag +  44] [expr $nodeTag +  45] [expr $nodeTag +  58] [expr $nodeTag +  57]	$stringTag $stringTag $stringTag $stringTag $Ec $nuc $thickness -rho $rho     "
		puts $ModelFile "element StringPanelLin [expr $eleTag +  8] [expr $nodeTag +  45] [expr $nodeTag +  46] [expr $nodeTag +  59] [expr $nodeTag +  58]	$stringTag $stringTag $stringTag $stringTag $Ec $nuc $thickness -rho $rho     "
		puts $ModelFile "element StringPanelLin [expr $eleTag +  9] [expr $nodeTag +  46] [expr $nodeTag +  47] [expr $nodeTag +  60] [expr $nodeTag +  59]	$stringTag $stringTag $stringTag $stringTag $Ec $nuc $thickness -rho $rho     "
		puts $ModelFile "element StringPanelLin [expr $eleTag + 10] [expr $nodeTag +  47] [expr $nodeTag +  48] [expr $nodeTag +  61] [expr $nodeTag +  60]	$stringTag $stringTag $stringTag $stringTag $Ec $nuc $thickness -rho $rho     "
		puts $ModelFile "element StringPanelLin [expr $eleTag + 11] [expr $nodeTag +  51] [expr $nodeTag +  52] [expr $coreWall1 + 2] [expr $nodeTag +  64]	$stringTag $stringTag $stringTag 	$stringTag $Ec $nuc $thickness -rho $rho  "
		puts $ModelFile "element StringPanelLin [expr $eleTag + 12] [expr $nodeTag +  52] [expr $nodeTag +  53] [expr $coreWall2 + 2] [expr $coreWall1 + 2]	$stringTag $stringTag $stringTagCB 	$stringTag $Ec $nuc $thickness -rho $rho  "
		puts $ModelFile "element StringPanelLin [expr $eleTag + 13] [expr $nodeTag +  53] [expr $nodeTag +  54] [expr $nodeTag +  65] [expr $coreWall2 + 2]	$stringTag $stringTag $stringTag 	$stringTag $Ec $nuc $thickness -rho $rho  "
		puts $ModelFile "element StringPanelLin [expr $eleTag + 14] [expr $nodeTag +  54] [expr $nodeTag +  55] [expr $nodeTag +  66] [expr $nodeTag +  65]	$stringTag $stringTag $stringTag 	$stringTag $Ec $nuc $thickness -rho $rho  "
		puts $ModelFile "element StringPanelLin [expr $eleTag + 15] [expr $nodeTag +  55] [expr $nodeTag +  56] [expr $nodeTag +  67] [expr $nodeTag +  66]	$stringTag $stringTag $stringTag 	$stringTag $Ec $nuc $thickness -rho $rho  "
		puts $ModelFile "element StringPanelLin [expr $eleTag + 16] [expr $nodeTag +  56] [expr $nodeTag +  57] [expr $nodeTag +  68] [expr $nodeTag +  67]	$stringTag $stringTag $stringTag 	$stringTag $Ec $nuc $thickness -rho $rho  "
		puts $ModelFile "element StringPanelLin [expr $eleTag + 17] [expr $nodeTag +  57] [expr $nodeTag +  58] [expr $coreWall3 + 2] [expr $nodeTag +  68]	$stringTag $stringTag $stringTag 	$stringTag $Ec $nuc $thickness -rho $rho  "
		puts $ModelFile "element StringPanelLin [expr $eleTag + 18] [expr $nodeTag +  58] [expr $nodeTag +  59] [expr $coreWall4 + 2] [expr $coreWall3 + 2]	$stringTag $stringTag $stringTagCB 	$stringTag $Ec $nuc $thickness -rho $rho  "
		puts $ModelFile "element StringPanelLin [expr $eleTag + 19] [expr $nodeTag +  59] [expr $nodeTag +  60] [expr $nodeTag +  69] [expr $coreWall4 + 2]	$stringTag $stringTag $stringTag 	$stringTag $Ec $nuc $thickness -rho $rho  "
		puts $ModelFile "element StringPanelLin [expr $eleTag + 20] [expr $nodeTag +  60] [expr $nodeTag +  61] [expr $nodeTag +  70] [expr $nodeTag +  69]	$stringTag $stringTag $stringTag 	$stringTag $Ec $nuc $thickness -rho $rho  "
		puts $ModelFile "element StringPanelLin [expr $eleTag + 21] [expr $nodeTag +  64] [expr $coreWall1 + 2] [expr $coreWall1 + 1] [expr $nodeTag +  71]	$stringTag $stringTag $stringTag $stringTag $Ec $nuc $thickness -rho $rho     "
		puts $ModelFile "element StringPanelLin [expr $eleTag + 22] [expr $coreWall2 + 2] [expr $nodeTag +  65] [expr $nodeTag +  72] [expr $coreWall2 + 1]	$stringTag $stringTag $stringTag $stringTag $Ec $nuc $thickness -rho $rho     "
		puts $ModelFile "element StringPanelLin [expr $eleTag + 23] [expr $nodeTag +  65] [expr $nodeTag +  66] [expr $nodeTag +  73] [expr $nodeTag +  72]	$stringTag $stringTag $stringTag $stringTag $Ec $nuc $thickness -rho $rho     "
		puts $ModelFile "element StringPanelLin [expr $eleTag + 24] [expr $nodeTag +  67] [expr $nodeTag +  68] [expr $nodeTag +  75] [expr $nodeTag +  74]	$stringTag $stringTag $stringTag $stringTag $Ec $nuc $thickness -rho $rho     "
		puts $ModelFile "element StringPanelLin [expr $eleTag + 25] [expr $nodeTag +  68] [expr $coreWall3 + 2] [expr $coreWall3 + 1] [expr $nodeTag +  75]	$stringTag $stringTag $stringTag $stringTag $Ec $nuc $thickness -rho $rho     "
		puts $ModelFile "element StringPanelLin [expr $eleTag + 26] [expr $coreWall4 + 2] [expr $nodeTag +  69] [expr $nodeTag +  76] [expr $coreWall4 + 1]	$stringTag $stringTag $stringTag $stringTag $Ec $nuc $thickness -rho $rho     "
		puts $ModelFile "element StringPanelLin [expr $eleTag + 27] [expr $nodeTag +  69] [expr $nodeTag +  70] [expr $nodeTag +  77] [expr $nodeTag +  76]	$stringTag $stringTag $stringTag $stringTag $Ec $nuc $thickness -rho $rho     "
		puts $ModelFile "element StringPanelLin [expr $eleTag + 28] [expr $nodeTag +  71] [expr $coreWall1 + 1] [expr $nodeTag +  81] [expr $nodeTag +  80]	$stringTag 		$stringTag $stringTag $stringTag $Ec $nuc $thickness -rho $rho"
		puts $ModelFile "element StringPanelLin [expr $eleTag + 29] [expr $coreWall1 + 1] [expr $coreWall2 + 1] [expr $nodeTag +  82] [expr $nodeTag +  81]	$stringTagCB 	$stringTag $stringTag $stringTag $Ec $nuc $thickness -rho $rho"
		puts $ModelFile "element StringPanelLin [expr $eleTag + 30] [expr $coreWall2 + 1] [expr $nodeTag +  72] [expr $nodeTag +  83] [expr $nodeTag +  82]	$stringTag 		$stringTag $stringTag $stringTag $Ec $nuc $thickness -rho $rho"
		puts $ModelFile "element StringPanelLin [expr $eleTag + 31] [expr $nodeTag +  72] [expr $nodeTag +  73] [expr $nodeTag +  84] [expr $nodeTag +  83]	$stringTag 		$stringTag $stringTag $stringTag $Ec $nuc $thickness -rho $rho"
		puts $ModelFile "element StringPanelLin [expr $eleTag + 32] [expr $nodeTag +  73] [expr $nodeTag +  74] [expr $nodeTag +  85] [expr $nodeTag +  84]	$stringTag 		$stringTag $stringTag $stringTag $Ec $nuc $thickness -rho $rho"
		puts $ModelFile "element StringPanelLin [expr $eleTag + 33] [expr $nodeTag +  74] [expr $nodeTag +  75] [expr $nodeTag +  86] [expr $nodeTag +  85]	$stringTag 		$stringTag $stringTag $stringTag $Ec $nuc $thickness -rho $rho"
		puts $ModelFile "element StringPanelLin [expr $eleTag + 34] [expr $nodeTag +  75] [expr $coreWall3 + 1] [expr $nodeTag +  87] [expr $nodeTag +  86]	$stringTag 		$stringTag $stringTag $stringTag $Ec $nuc $thickness -rho $rho"
		puts $ModelFile "element StringPanelLin [expr $eleTag + 35] [expr $coreWall3 + 1] [expr $coreWall4 + 1] [expr $nodeTag +  88] [expr $nodeTag +  87]	$stringTagCB 	$stringTag $stringTag $stringTag $Ec $nuc $thickness -rho $rho"
		puts $ModelFile "element StringPanelLin [expr $eleTag + 36] [expr $coreWall4 + 1] [expr $nodeTag +  76] [expr $nodeTag +  89] [expr $nodeTag +  88]	$stringTag 		$stringTag $stringTag $stringTag $Ec $nuc $thickness -rho $rho"
		puts $ModelFile "element StringPanelLin [expr $eleTag + 37] [expr $nodeTag +  76] [expr $nodeTag +  77] [expr $nodeTag +  90] [expr $nodeTag +  89]	$stringTag 		$stringTag $stringTag $stringTag $Ec $nuc $thickness -rho $rho"
	}
}