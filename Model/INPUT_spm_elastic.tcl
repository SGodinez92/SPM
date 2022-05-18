
 ############################# Stringer-Panel #######################################
 
#set Ec5	[expr 33000.*pow(0.140 + 5./1000,1.5)*sqrt(5.)*$ksi];	# Young's Modulus of Concrete 5 ksi
#set Ec6	[expr 33000.*pow(0.140 + 6./1000,1.5)*sqrt(6.)*$ksi];	# Young's Modulus of Concrete 6 ksi

set Ec5	[expr 33000.*pow(0.140 + 6.5/1000,1.5)*sqrt(6.5)*$ksi];	# Young's Modulus of Concrete 5 ksi
set Ec6	[expr 33000.*pow(0.140 + 7.8/1000,1.5)*sqrt(7.8)*$ksi];	# Young's Modulus of Concrete 6 ksi

set nuc 0.2
set stiffFacPan 0.5


for {set i 1} {$i <= $nStory} {incr i 1} {
	
	if {$i > 11} {
		set Ec [expr $stiffFacPan*$Ec5]
		set thickness [expr 8.*$in]
		set stringTag12 $string12x8_elastic
		set stringTag14 $string14x8_elastic
		set stringTagCB $string12x8_CB_elastic
	} elseif {$i == 11 || $i == 3} {
		set Ec [expr $stiffFacPan*$Ec6]
		set thickness [expr 12.*$in]
		set stringTag12 $string12x12_elastic
		set stringTag14 $string14x12_elastic
		set stringTagCB $string12x12_CB_elastic
	} else {
		set Ec [expr $stiffFacPan*$Ec5]
		set thickness [expr 8.*$in]
		set stringTag12 $string12x8_elastic
		set stringTag14 $string14x8_elastic
		set stringTagCB $string12x8_CB_elastic
	}
	
	set w_DL [expr 20.*$psf]
	set w_tot [expr $w_DL + 150.*$pcf*$thickness]
	set rho [expr $w_tot/$g]

	
	set eleTag [expr 100000 + 1000*$i]
	set nodeTag [expr 1000*$i + 800]
	
	set coreWall1 [expr 1000*$i + 100 + $nEleFloor]
	set coreWall2 [expr 1000*$i + 200 + $nEleFloor]
	
	set recWallX  [expr 1000*$i + 300 + $nEleFloor]
	set recWallY1 [expr 1000*$i + 400 + $nEleFloor]
	set recWallY2 [expr 1000*$i + 500 + $nEleFloor]
	
	if {$i <= 3} {
		
		element StringPanelLin [expr $eleTag +   1] [expr $nodeTag +   1] [expr $nodeTag +   2] [expr $nodeTag +  15] [expr $nodeTag +  14]	$stringTag12 $stringTag12 $stringTag12 $stringTag12 $Ec $nuc $thickness -rho $rho
		element StringPanelLin [expr $eleTag +   2] [expr $nodeTag +   2] [expr $nodeTag +   3] [expr $nodeTag +  16] [expr $nodeTag +  15]	$stringTag12 $stringTag12 $stringTag12 $stringTag12 $Ec $nuc $thickness -rho $rho
		element StringPanelLin [expr $eleTag +   3] [expr $nodeTag +   3] [expr $nodeTag +   4] [expr $nodeTag +  17] [expr $nodeTag +  16]	$stringTag12 $stringTag12 $stringTag12 $stringTag12 $Ec $nuc $thickness -rho $rho
		element StringPanelLin [expr $eleTag +   4] [expr $nodeTag +   4] [expr $nodeTag +   5] [expr $nodeTag +  18] [expr $nodeTag +  17]	$stringTag12 $stringTag12 $stringTag12 $stringTag12 $Ec $nuc $thickness -rho $rho
		element StringPanelLin [expr $eleTag +   5] [expr $nodeTag +   5] [expr $nodeTag +   6] [expr $nodeTag +  19] [expr $nodeTag +  18]	$stringTag12 $stringTag12 $stringTag12 $stringTag12 $Ec $nuc $thickness -rho $rho
		element StringPanelLin [expr $eleTag +   6] [expr $nodeTag +   6] [expr $nodeTag +   7] [expr $nodeTag +  20] [expr $nodeTag +  19]	$stringTag12 $stringTag12 $stringTag12 $stringTag12 $Ec $nuc $thickness -rho $rho
		element StringPanelLin [expr $eleTag +   7] [expr $nodeTag +   7] [expr $nodeTag +   8] [expr $nodeTag +  21] [expr $nodeTag +  20]	$stringTag12 $stringTag14 $stringTag12 $stringTag14 $Ec $nuc $thickness -rho $rho
		element StringPanelLin [expr $eleTag +   8] [expr $nodeTag +   8] [expr $nodeTag +   9] [expr $nodeTag +  22] [expr $nodeTag +  21]	$stringTag12 $stringTag12 $stringTag12 $stringTag12 $Ec $nuc $thickness -rho $rho
		element StringPanelLin [expr $eleTag +   9] [expr $nodeTag +   9] [expr $nodeTag +  10] [expr $recWallX +  1] [expr $nodeTag +  22]	$stringTag12 $stringTag12 $stringTag12 $stringTag12 $Ec $nuc $thickness -rho $rho
		element StringPanelLin [expr $eleTag +  10] [expr $nodeTag +  10] [expr $nodeTag +  11] [expr $recWallX +  2] [expr $recWallX +  1]	$stringTag12 $stringTag12 $stringTag12 $stringTag12 $Ec $nuc $thickness -rho $rho
		element StringPanelLin [expr $eleTag +  11] [expr $nodeTag +  11] [expr $nodeTag +  12] [expr $nodeTag +  23] [expr $recWallX +  2]	$stringTag12 $stringTag12 $stringTag12 $stringTag12 $Ec $nuc $thickness -rho $rho
		element StringPanelLin [expr $eleTag +  12] [expr $nodeTag +  12] [expr $nodeTag +  13] [expr $nodeTag +  24] [expr $nodeTag +  23]	$stringTag12 $stringTag12 $stringTag12 $stringTag12 $Ec $nuc $thickness -rho $rho
		
		
		element StringPanelLin [expr $eleTag +  13] [expr $nodeTag +  14] [expr $nodeTag +  15] [expr $nodeTag +  26] [expr $nodeTag +  25]	$stringTag12 $stringTag12 $stringTag12 $stringTag12 $Ec $nuc $thickness -rho $rho
		element StringPanelLin [expr $eleTag +  14] [expr $nodeTag +  15] [expr $nodeTag +  16] [expr $nodeTag +  27] [expr $nodeTag +  26]	$stringTag12 $stringTag12 $stringTag12 $stringTag12 $Ec $nuc $thickness -rho $rho
		element StringPanelLin [expr $eleTag +  15] [expr $nodeTag +  16] [expr $nodeTag +  17] [expr $nodeTag +  28] [expr $nodeTag +  27]	$stringTag12 $stringTag12 $stringTag12 $stringTag12 $Ec $nuc $thickness -rho $rho
		element StringPanelLin [expr $eleTag +  16] [expr $nodeTag +  17] [expr $nodeTag +  18] [expr $nodeTag +  29] [expr $nodeTag +  28]	$stringTag12 $stringTag12 $stringTag12 $stringTag12 $Ec $nuc $thickness -rho $rho
		element StringPanelLin [expr $eleTag +  17] [expr $nodeTag +  18] [expr $nodeTag +  19] [expr $nodeTag +  30] [expr $nodeTag +  29]	$stringTag12 $stringTag12 $stringTag12 $stringTag12 $Ec $nuc $thickness -rho $rho
		element StringPanelLin [expr $eleTag +  18] [expr $nodeTag +  19] [expr $nodeTag +  20] [expr $nodeTag +  31] [expr $nodeTag +  30]	$stringTag12 $stringTag12 $stringTag12 $stringTag12 $Ec $nuc $thickness -rho $rho
		element StringPanelLin [expr $eleTag +  19] [expr $nodeTag +  20] [expr $nodeTag +  21] [expr $nodeTag +  32] [expr $nodeTag +  31]	$stringTag12 $stringTag14 $stringTag12 $stringTag14 $Ec $nuc $thickness -rho $rho
		element StringPanelLin [expr $eleTag +  20] [expr $nodeTag +  21] [expr $nodeTag +  22] [expr $nodeTag +  33] [expr $nodeTag +  32]	$stringTag12 $stringTag12 $stringTag12 $stringTag12 $Ec $nuc $thickness -rho $rho
		element StringPanelLin [expr $eleTag +  21] [expr $nodeTag +  22] [expr $recWallX +  1] [expr $nodeTag +  34] [expr $nodeTag +  33]	$stringTag12 $stringTag12 $stringTag12 $stringTag12 $Ec $nuc $thickness -rho $rho
		element StringPanelLin [expr $eleTag +  22] [expr $recWallX +  1] [expr $recWallX +  2] [expr $nodeTag +  35] [expr $nodeTag +  34]	$stringTag12 $stringTag12 $stringTag12 $stringTag12 $Ec $nuc $thickness -rho $rho
		element StringPanelLin [expr $eleTag +  23] [expr $recWallX +  2] [expr $nodeTag +  23] [expr $nodeTag +  36] [expr $nodeTag +  35]	$stringTag12 $stringTag12 $stringTag12 $stringTag12 $Ec $nuc $thickness -rho $rho
		element StringPanelLin [expr $eleTag +  24] [expr $nodeTag +  23] [expr $nodeTag +  24] [expr $nodeTag +  37] [expr $nodeTag +  36]	$stringTag12 $stringTag12 $stringTag12 $stringTag12 $Ec $nuc $thickness -rho $rho
		
		
		element StringPanelLin [expr $eleTag +  25] [expr $nodeTag +  25] [expr $nodeTag +  26] [expr $nodeTag +  39] [expr $nodeTag +  38]	$stringTag12 $stringTag12 $stringTag12 $stringTag12 $Ec $nuc $thickness -rho $rho
		element StringPanelLin [expr $eleTag +  26] [expr $nodeTag +  26] [expr $nodeTag +  27] [expr $nodeTag +  40] [expr $nodeTag +  39]	$stringTag12 $stringTag12 $stringTag12 $stringTag12 $Ec $nuc $thickness -rho $rho
		element StringPanelLin [expr $eleTag +  27] [expr $nodeTag +  27] [expr $nodeTag +  28] [expr $nodeTag +  41] [expr $nodeTag +  40]	$stringTag12 $stringTag12 $stringTag12 $stringTag12 $Ec $nuc $thickness -rho $rho
		element StringPanelLin [expr $eleTag +  28] [expr $nodeTag +  28] [expr $nodeTag +  29] [expr $nodeTag +  42] [expr $nodeTag +  41]	$stringTag12 $stringTag12 $stringTag12 $stringTag12 $Ec $nuc $thickness -rho $rho
		element StringPanelLin [expr $eleTag +  29] [expr $nodeTag +  29] [expr $nodeTag +  30] [expr $nodeTag +  43] [expr $nodeTag +  42]	$stringTag12 $stringTag12 $stringTag12 $stringTag12 $Ec $nuc $thickness -rho $rho
		element StringPanelLin [expr $eleTag +  30] [expr $nodeTag +  30] [expr $nodeTag +  31] [expr $nodeTag +  44] [expr $nodeTag +  43]	$stringTag12 $stringTag12 $stringTag12 $stringTag12 $Ec $nuc $thickness -rho $rho
		element StringPanelLin [expr $eleTag +  31] [expr $nodeTag +  31] [expr $nodeTag +  32] [expr $nodeTag +  45] [expr $nodeTag +  44]	$stringTag12 $stringTag14 $stringTag12 $stringTag14 $Ec $nuc $thickness -rho $rho
		element StringPanelLin [expr $eleTag +  32] [expr $nodeTag +  32] [expr $nodeTag +  33] [expr $nodeTag +  46] [expr $nodeTag +  45]	$stringTag12 $stringTag12 $stringTag12 $stringTag12 $Ec $nuc $thickness -rho $rho
		element StringPanelLin [expr $eleTag +  33] [expr $nodeTag +  33] [expr $nodeTag +  34] [expr $nodeTag +  47] [expr $nodeTag +  46]	$stringTag12 $stringTag12 $stringTag12 $stringTag12 $Ec $nuc $thickness -rho $rho
		element StringPanelLin [expr $eleTag +  34] [expr $nodeTag +  34] [expr $nodeTag +  35] [expr $nodeTag +  48] [expr $nodeTag +  47]	$stringTag12 $stringTag12 $stringTag12 $stringTag12 $Ec $nuc $thickness -rho $rho
		element StringPanelLin [expr $eleTag +  35] [expr $nodeTag +  35] [expr $nodeTag +  36] [expr $nodeTag +  49] [expr $nodeTag +  48]	$stringTag12 $stringTag12 $stringTag12 $stringTag12 $Ec $nuc $thickness -rho $rho
		element StringPanelLin [expr $eleTag +  36] [expr $nodeTag +  36] [expr $nodeTag +  37] [expr $nodeTag +  50] [expr $nodeTag +  49]	$stringTag12 $stringTag12 $stringTag12 $stringTag12 $Ec $nuc $thickness -rho $rho
		
		
		element StringPanelLin [expr $eleTag +  37] [expr $nodeTag +  38] [expr $nodeTag +  39] [expr $nodeTag +  52] [expr $nodeTag +  51]	$stringTag12 $stringTag12 $stringTag12 $stringTag12 $Ec $nuc $thickness -rho $rho
		element StringPanelLin [expr $eleTag +  38] [expr $nodeTag +  39] [expr $nodeTag +  40] [expr $nodeTag +  53] [expr $nodeTag +  52]	$stringTag12 $stringTag12 $stringTag12 $stringTag12 $Ec $nuc $thickness -rho $rho
		element StringPanelLin [expr $eleTag +  39] [expr $nodeTag +  40] [expr $nodeTag +  41] [expr $nodeTag +  54] [expr $nodeTag +  53]	$stringTag12 $stringTag12 $stringTag12 $stringTag12 $Ec $nuc $thickness -rho $rho
		element StringPanelLin [expr $eleTag +  40] [expr $nodeTag +  41] [expr $nodeTag +  42] [expr $nodeTag +  55] [expr $nodeTag +  54]	$stringTag12 $stringTag12 $stringTag12 $stringTag12 $Ec $nuc $thickness -rho $rho
		element StringPanelLin [expr $eleTag +  41] [expr $nodeTag +  42] [expr $nodeTag +  43] [expr $nodeTag +  56] [expr $nodeTag +  55]	$stringTag12 $stringTag12 $stringTag12 $stringTag12 $Ec $nuc $thickness -rho $rho
		element StringPanelLin [expr $eleTag +  42] [expr $nodeTag +  43] [expr $nodeTag +  44] [expr $nodeTag +  57] [expr $nodeTag +  56]	$stringTag12 $stringTag12 $stringTag12 $stringTag12 $Ec $nuc $thickness -rho $rho
		element StringPanelLin [expr $eleTag +  43] [expr $nodeTag +  44] [expr $nodeTag +  45] [expr $nodeTag +  58] [expr $nodeTag +  57]	$stringTag12 $stringTag14 $stringTag12 $stringTag14 $Ec $nuc $thickness -rho $rho
		element StringPanelLin [expr $eleTag +  44] [expr $nodeTag +  45] [expr $nodeTag +  46] [expr $nodeTag +  59] [expr $nodeTag +  58]	$stringTag12 $stringTag12 $stringTag12 $stringTag12 $Ec $nuc $thickness -rho $rho
		element StringPanelLin [expr $eleTag +  45] [expr $nodeTag +  46] [expr $nodeTag +  47] [expr $nodeTag +  60] [expr $nodeTag +  59]	$stringTag12 $stringTag12 $stringTag12 $stringTag12 $Ec $nuc $thickness -rho $rho
		element StringPanelLin [expr $eleTag +  46] [expr $nodeTag +  47] [expr $nodeTag +  48] [expr $nodeTag +  61] [expr $nodeTag +  60]	$stringTag12 $stringTag12 $stringTag12 $stringTag12 $Ec $nuc $thickness -rho $rho
		element StringPanelLin [expr $eleTag +  47] [expr $nodeTag +  48] [expr $nodeTag +  49] [expr $nodeTag +  62] [expr $nodeTag +  61]	$stringTag12 $stringTag12 $stringTag12 $stringTag12 $Ec $nuc $thickness -rho $rho
		element StringPanelLin [expr $eleTag +  48] [expr $nodeTag +  49] [expr $nodeTag +  50] [expr $nodeTag +  63] [expr $nodeTag +  62]	$stringTag12 $stringTag12 $stringTag12 $stringTag12 $Ec $nuc $thickness -rho $rho
		
		
		element StringPanelLin [expr $eleTag +  49] [expr $nodeTag +  51] [expr $nodeTag +  52] [expr $nodeTag +  65] [expr $nodeTag +  64]	$stringTag12 $stringTag12 $stringTag12 $stringTag12 $Ec $nuc $thickness -rho $rho
		element StringPanelLin [expr $eleTag +  50] [expr $nodeTag +  52] [expr $nodeTag +  53] [expr $recWallY1 + 1] [expr $nodeTag +  65]	$stringTag12 $stringTag12 $stringTag12 $stringTag12 $Ec $nuc $thickness -rho $rho
		element StringPanelLin [expr $eleTag +  51] [expr $nodeTag +  53] [expr $nodeTag +  54] [expr $nodeTag +  66] [expr $recWallY1 + 1]	$stringTag12 $stringTag12 $stringTag12 $stringTag12 $Ec $nuc $thickness -rho $rho
		element StringPanelLin [expr $eleTag +  52] [expr $nodeTag +  54] [expr $nodeTag +  55] [expr $nodeTag +  67] [expr $nodeTag +  66]	$stringTag12 $stringTag12 $stringTag12 $stringTag12 $Ec $nuc $thickness -rho $rho
		element StringPanelLin [expr $eleTag +  53] [expr $nodeTag +  55] [expr $nodeTag +  56] [expr $nodeTag +  68] [expr $nodeTag +  67]	$stringTag12 $stringTag12 $stringTag12 $stringTag12 $Ec $nuc $thickness -rho $rho
		element StringPanelLin [expr $eleTag +  54] [expr $nodeTag +  56] [expr $nodeTag +  57] [expr $coreWall1 + 2] [expr $nodeTag +  68]	$stringTag12 $stringTag12 $stringTag12 $stringTag12 $Ec $nuc $thickness -rho $rho
		element StringPanelLin [expr $eleTag +  55] [expr $nodeTag +  57] [expr $nodeTag +  58] [expr $coreWall2 + 2] [expr $coreWall1 + 2]	$stringTag12 $stringTag14 $stringTagCB $stringTag14 $Ec $nuc $thickness -rho $rho
		element StringPanelLin [expr $eleTag +  56] [expr $nodeTag +  58] [expr $nodeTag +  59] [expr $nodeTag +  69] [expr $coreWall2 + 2]	$stringTag12 $stringTag12 $stringTag12 $stringTag12 $Ec $nuc $thickness -rho $rho
		element StringPanelLin [expr $eleTag +  57] [expr $nodeTag +  59] [expr $nodeTag +  60] [expr $nodeTag +  70] [expr $nodeTag +  69]	$stringTag12 $stringTag12 $stringTag12 $stringTag12 $Ec $nuc $thickness -rho $rho
		element StringPanelLin [expr $eleTag +  58] [expr $nodeTag +  60] [expr $nodeTag +  61] [expr $nodeTag +  71] [expr $nodeTag +  70]	$stringTag12 $stringTag12 $stringTag12 $stringTag12 $Ec $nuc $thickness -rho $rho
		element StringPanelLin [expr $eleTag +  59] [expr $nodeTag +  61] [expr $nodeTag +  62] [expr $recWallY2 + 1] [expr $nodeTag +  71]	$stringTag12 $stringTag12 $stringTag12 $stringTag12 $Ec $nuc $thickness -rho $rho
		element StringPanelLin [expr $eleTag +  60] [expr $nodeTag +  62] [expr $nodeTag +  63] [expr $nodeTag +  72] [expr $recWallY2 + 1]	$stringTag12 $stringTag12 $stringTag12 $stringTag12 $Ec $nuc $thickness -rho $rho
		
		
		element StringPanelLin [expr $eleTag +  61] [expr $nodeTag +  64] [expr $nodeTag +  65] [expr $nodeTag +  74] [expr $nodeTag +  73]	$stringTag12 $stringTag12 $stringTag12 $stringTag12 $Ec $nuc $thickness -rho $rho
		element StringPanelLin [expr $eleTag +  62] [expr $nodeTag +  65] [expr $recWallY1 + 1] [expr $recWallY1 + 2] [expr $nodeTag +  74]	$stringTag12 $stringTag12 $stringTag12 $stringTag12 $Ec $nuc $thickness -rho $rho
		element StringPanelLin [expr $eleTag +  63] [expr $recWallY1 + 1] [expr $nodeTag +  66] [expr $nodeTag +  75] [expr $recWallY1 + 2]	$stringTag12 $stringTag12 $stringTag12 $stringTag12 $Ec $nuc $thickness -rho $rho
		element StringPanelLin [expr $eleTag +  64] [expr $nodeTag +  66] [expr $nodeTag +  67] [expr $nodeTag +  76] [expr $nodeTag +  75]	$stringTag12 $stringTag12 $stringTag12 $stringTag12 $Ec $nuc $thickness -rho $rho
		element StringPanelLin [expr $eleTag +  65] [expr $nodeTag +  67] [expr $nodeTag +  68] [expr $nodeTag +  77] [expr $nodeTag +  76]	$stringTag12 $stringTag12 $stringTag12 $stringTag12 $Ec $nuc $thickness -rho $rho
		element StringPanelLin [expr $eleTag +  66] [expr $nodeTag +  68] [expr $coreWall1 + 2] [expr $coreWall1 + 1] [expr $nodeTag +  77]	$stringTag12 $stringTag12 $stringTag12 $stringTag12 $Ec $nuc $thickness -rho $rho
		element StringPanelLin [expr $eleTag +  67] [expr $coreWall2 + 2] [expr $nodeTag +  69] [expr $nodeTag +  78] [expr $coreWall2 + 1]	$stringTag12 $stringTag12 $stringTag12 $stringTag12 $Ec $nuc $thickness -rho $rho
		element StringPanelLin [expr $eleTag +  68] [expr $nodeTag +  69] [expr $nodeTag +  70] [expr $nodeTag +  79] [expr $nodeTag +  78]	$stringTag12 $stringTag12 $stringTag12 $stringTag12 $Ec $nuc $thickness -rho $rho
		element StringPanelLin [expr $eleTag +  69] [expr $nodeTag +  70] [expr $nodeTag +  71] [expr $nodeTag +  80] [expr $nodeTag +  79]	$stringTag12 $stringTag12 $stringTag12 $stringTag12 $Ec $nuc $thickness -rho $rho
		element StringPanelLin [expr $eleTag +  70] [expr $nodeTag +  71] [expr $recWallY2 + 1] [expr $recWallY2 + 2] [expr $nodeTag +  80]	$stringTag12 $stringTag12 $stringTag12 $stringTag12 $Ec $nuc $thickness -rho $rho
		element StringPanelLin [expr $eleTag +  71] [expr $recWallY2 + 1] [expr $nodeTag +  72] [expr $nodeTag +  81] [expr $recWallY2 + 2]	$stringTag12 $stringTag12 $stringTag12 $stringTag12 $Ec $nuc $thickness -rho $rho
		
		
		element StringPanelLin [expr $eleTag +  72] [expr $nodeTag +  73] [expr $nodeTag +  74] [expr $nodeTag +  83] [expr $nodeTag +  82]	$stringTag12 $stringTag12 $stringTag12 $stringTag12 $Ec $nuc $thickness -rho $rho
		element StringPanelLin [expr $eleTag +  73] [expr $nodeTag +  74] [expr $recWallY1 + 2] [expr $nodeTag +  84] [expr $nodeTag +  83]	$stringTag12 $stringTag12 $stringTag12 $stringTag12 $Ec $nuc $thickness -rho $rho
		element StringPanelLin [expr $eleTag +  74] [expr $recWallY1 + 2] [expr $nodeTag +  75] [expr $nodeTag +  85] [expr $nodeTag +  84]	$stringTag12 $stringTag12 $stringTag12 $stringTag12 $Ec $nuc $thickness -rho $rho
		element StringPanelLin [expr $eleTag +  75] [expr $nodeTag +  75] [expr $nodeTag +  76] [expr $nodeTag +  86] [expr $nodeTag +  85]	$stringTag12 $stringTag12 $stringTag12 $stringTag12 $Ec $nuc $thickness -rho $rho
		element StringPanelLin [expr $eleTag +  76] [expr $nodeTag +  76] [expr $nodeTag +  77] [expr $nodeTag +  87] [expr $nodeTag +  86]	$stringTag12 $stringTag12 $stringTag12 $stringTag12 $Ec $nuc $thickness -rho $rho
		element StringPanelLin [expr $eleTag +  77] [expr $nodeTag +  77] [expr $coreWall1 + 1] [expr $nodeTag +  88] [expr $nodeTag +  87]	$stringTag12 $stringTag12 $stringTag12 $stringTag12 $Ec $nuc $thickness -rho $rho
		element StringPanelLin [expr $eleTag +  78] [expr $coreWall1 + 1] [expr $coreWall2 + 1] [expr $nodeTag +  89] [expr $nodeTag +  88]	$stringTagCB $stringTag14 $stringTag12 $stringTag14 $Ec $nuc $thickness -rho $rho
		element StringPanelLin [expr $eleTag +  79] [expr $coreWall2 + 1] [expr $nodeTag +  78] [expr $nodeTag +  90] [expr $nodeTag +  89]	$stringTag12 $stringTag12 $stringTag12 $stringTag12 $Ec $nuc $thickness -rho $rho
		element StringPanelLin [expr $eleTag +  80] [expr $nodeTag +  78] [expr $nodeTag +  79] [expr $nodeTag +  91] [expr $nodeTag +  90]	$stringTag12 $stringTag12 $stringTag12 $stringTag12 $Ec $nuc $thickness -rho $rho
		element StringPanelLin [expr $eleTag +  81] [expr $nodeTag +  79] [expr $nodeTag +  80] [expr $nodeTag +  92] [expr $nodeTag +  91]	$stringTag12 $stringTag12 $stringTag12 $stringTag12 $Ec $nuc $thickness -rho $rho
		element StringPanelLin [expr $eleTag +  82] [expr $nodeTag +  80] [expr $recWallY2 + 2] [expr $nodeTag +  93] [expr $nodeTag +  92]	$stringTag12 $stringTag12 $stringTag12 $stringTag12 $Ec $nuc $thickness -rho $rho
		element StringPanelLin [expr $eleTag +  83] [expr $recWallY2 + 2] [expr $nodeTag +  81] [expr $nodeTag +  94] [expr $nodeTag +  93]	$stringTag12 $stringTag12 $stringTag12 $stringTag12 $Ec $nuc $thickness -rho $rho
	
	} elseif {$i <= 11} {
	
		element StringPanelLin [expr $eleTag +   1] [expr $nodeTag +   9] [expr $nodeTag +  10] [expr $recWallX +  1] [expr $nodeTag +  22]	$stringTag12 $stringTag12 $stringTag12 $stringTag12 $Ec $nuc $thickness -rho $rho
		element StringPanelLin [expr $eleTag +   2] [expr $nodeTag +  10] [expr $nodeTag +  11] [expr $recWallX +  2] [expr $recWallX +  1]	$stringTag12 $stringTag12 $stringTag12 $stringTag12 $Ec $nuc $thickness -rho $rho
		element StringPanelLin [expr $eleTag +   3] [expr $nodeTag +  11] [expr $nodeTag +  12] [expr $nodeTag +  23] [expr $recWallX +  2]	$stringTag12 $stringTag12 $stringTag12 $stringTag12 $Ec $nuc $thickness -rho $rho
		element StringPanelLin [expr $eleTag +   4] [expr $nodeTag +  12] [expr $nodeTag +  13] [expr $nodeTag +  24] [expr $nodeTag +  23]	$stringTag12 $stringTag12 $stringTag12 $stringTag12 $Ec $nuc $thickness -rho $rho
		
		
		element StringPanelLin [expr $eleTag +   5] [expr $nodeTag +  22] [expr $recWallX +  1] [expr $nodeTag +  34] [expr $nodeTag +  33]	$stringTag12 $stringTag12 $stringTag12 $stringTag12 $Ec $nuc $thickness -rho $rho
		element StringPanelLin [expr $eleTag +   6] [expr $recWallX +  1] [expr $recWallX +  2] [expr $nodeTag +  35] [expr $nodeTag +  34]	$stringTag12 $stringTag12 $stringTag12 $stringTag12 $Ec $nuc $thickness -rho $rho
		element StringPanelLin [expr $eleTag +   7] [expr $recWallX +  2] [expr $nodeTag +  23] [expr $nodeTag +  36] [expr $nodeTag +  35]	$stringTag12 $stringTag12 $stringTag12 $stringTag12 $Ec $nuc $thickness -rho $rho
		element StringPanelLin [expr $eleTag +   8] [expr $nodeTag +  23] [expr $nodeTag +  24] [expr $nodeTag +  37] [expr $nodeTag +  36]	$stringTag12 $stringTag12 $stringTag12 $stringTag12 $Ec $nuc $thickness -rho $rho
		
		
		element StringPanelLin [expr $eleTag +   9] [expr $nodeTag +  25] [expr $nodeTag +  26] [expr $nodeTag +  39] [expr $nodeTag +  38]	$stringTag12 $stringTag12 $stringTag12 $stringTag12 $Ec $nuc $thickness -rho $rho
		element StringPanelLin [expr $eleTag +  10] [expr $nodeTag +  26] [expr $nodeTag +  27] [expr $nodeTag +  40] [expr $nodeTag +  39]	$stringTag12 $stringTag12 $stringTag12 $stringTag12 $Ec $nuc $thickness -rho $rho
		element StringPanelLin [expr $eleTag +  11] [expr $nodeTag +  27] [expr $nodeTag +  28] [expr $nodeTag +  41] [expr $nodeTag +  40]	$stringTag12 $stringTag12 $stringTag12 $stringTag12 $Ec $nuc $thickness -rho $rho
		element StringPanelLin [expr $eleTag +  12] [expr $nodeTag +  28] [expr $nodeTag +  29] [expr $nodeTag +  42] [expr $nodeTag +  41]	$stringTag12 $stringTag12 $stringTag12 $stringTag12 $Ec $nuc $thickness -rho $rho
		element StringPanelLin [expr $eleTag +  13] [expr $nodeTag +  29] [expr $nodeTag +  30] [expr $nodeTag +  43] [expr $nodeTag +  42]	$stringTag12 $stringTag12 $stringTag12 $stringTag12 $Ec $nuc $thickness -rho $rho
		element StringPanelLin [expr $eleTag +  14] [expr $nodeTag +  30] [expr $nodeTag +  31] [expr $nodeTag +  44] [expr $nodeTag +  43]	$stringTag12 $stringTag12 $stringTag12 $stringTag12 $Ec $nuc $thickness -rho $rho
		element StringPanelLin [expr $eleTag +  15] [expr $nodeTag +  31] [expr $nodeTag +  32] [expr $nodeTag +  45] [expr $nodeTag +  44]	$stringTag12 $stringTag14 $stringTag12 $stringTag14 $Ec $nuc $thickness -rho $rho
		element StringPanelLin [expr $eleTag +  16] [expr $nodeTag +  32] [expr $nodeTag +  33] [expr $nodeTag +  46] [expr $nodeTag +  45]	$stringTag12 $stringTag12 $stringTag12 $stringTag12 $Ec $nuc $thickness -rho $rho
		element StringPanelLin [expr $eleTag +  17] [expr $nodeTag +  33] [expr $nodeTag +  34] [expr $nodeTag +  47] [expr $nodeTag +  46]	$stringTag12 $stringTag12 $stringTag12 $stringTag12 $Ec $nuc $thickness -rho $rho
		element StringPanelLin [expr $eleTag +  18] [expr $nodeTag +  34] [expr $nodeTag +  35] [expr $nodeTag +  48] [expr $nodeTag +  47]	$stringTag12 $stringTag12 $stringTag12 $stringTag12 $Ec $nuc $thickness -rho $rho
		element StringPanelLin [expr $eleTag +  19] [expr $nodeTag +  35] [expr $nodeTag +  36] [expr $nodeTag +  49] [expr $nodeTag +  48]	$stringTag12 $stringTag12 $stringTag12 $stringTag12 $Ec $nuc $thickness -rho $rho
		element StringPanelLin [expr $eleTag +  20] [expr $nodeTag +  36] [expr $nodeTag +  37] [expr $nodeTag +  50] [expr $nodeTag +  49]	$stringTag12 $stringTag12 $stringTag12 $stringTag12 $Ec $nuc $thickness -rho $rho
		
		
		element StringPanelLin [expr $eleTag +  21] [expr $nodeTag +  38] [expr $nodeTag +  39] [expr $nodeTag +  52] [expr $nodeTag +  51]	$stringTag12 $stringTag12 $stringTag12 $stringTag12 $Ec $nuc $thickness -rho $rho
		element StringPanelLin [expr $eleTag +  22] [expr $nodeTag +  39] [expr $nodeTag +  40] [expr $nodeTag +  53] [expr $nodeTag +  52]	$stringTag12 $stringTag12 $stringTag12 $stringTag12 $Ec $nuc $thickness -rho $rho
		element StringPanelLin [expr $eleTag +  23] [expr $nodeTag +  40] [expr $nodeTag +  41] [expr $nodeTag +  54] [expr $nodeTag +  53]	$stringTag12 $stringTag12 $stringTag12 $stringTag12 $Ec $nuc $thickness -rho $rho
		element StringPanelLin [expr $eleTag +  24] [expr $nodeTag +  41] [expr $nodeTag +  42] [expr $nodeTag +  55] [expr $nodeTag +  54]	$stringTag12 $stringTag12 $stringTag12 $stringTag12 $Ec $nuc $thickness -rho $rho
		element StringPanelLin [expr $eleTag +  25] [expr $nodeTag +  42] [expr $nodeTag +  43] [expr $nodeTag +  56] [expr $nodeTag +  55]	$stringTag12 $stringTag12 $stringTag12 $stringTag12 $Ec $nuc $thickness -rho $rho
		element StringPanelLin [expr $eleTag +  26] [expr $nodeTag +  43] [expr $nodeTag +  44] [expr $nodeTag +  57] [expr $nodeTag +  56]	$stringTag12 $stringTag12 $stringTag12 $stringTag12 $Ec $nuc $thickness -rho $rho
		element StringPanelLin [expr $eleTag +  27] [expr $nodeTag +  44] [expr $nodeTag +  45] [expr $nodeTag +  58] [expr $nodeTag +  57]	$stringTag12 $stringTag14 $stringTag12 $stringTag14 $Ec $nuc $thickness -rho $rho
		element StringPanelLin [expr $eleTag +  28] [expr $nodeTag +  45] [expr $nodeTag +  46] [expr $nodeTag +  59] [expr $nodeTag +  58]	$stringTag12 $stringTag12 $stringTag12 $stringTag12 $Ec $nuc $thickness -rho $rho
		element StringPanelLin [expr $eleTag +  29] [expr $nodeTag +  46] [expr $nodeTag +  47] [expr $nodeTag +  60] [expr $nodeTag +  59]	$stringTag12 $stringTag12 $stringTag12 $stringTag12 $Ec $nuc $thickness -rho $rho
		element StringPanelLin [expr $eleTag +  30] [expr $nodeTag +  47] [expr $nodeTag +  48] [expr $nodeTag +  61] [expr $nodeTag +  60]	$stringTag12 $stringTag12 $stringTag12 $stringTag12 $Ec $nuc $thickness -rho $rho
		element StringPanelLin [expr $eleTag +  31] [expr $nodeTag +  48] [expr $nodeTag +  49] [expr $nodeTag +  62] [expr $nodeTag +  61]	$stringTag12 $stringTag12 $stringTag12 $stringTag12 $Ec $nuc $thickness -rho $rho
		element StringPanelLin [expr $eleTag +  32] [expr $nodeTag +  49] [expr $nodeTag +  50] [expr $nodeTag +  63] [expr $nodeTag +  62]	$stringTag12 $stringTag12 $stringTag12 $stringTag12 $Ec $nuc $thickness -rho $rho
		
		
		element StringPanelLin [expr $eleTag +  33] [expr $nodeTag +  51] [expr $nodeTag +  52] [expr $nodeTag +  65] [expr $nodeTag +  64]	$stringTag12 $stringTag12 $stringTag12 $stringTag12 $Ec $nuc $thickness -rho $rho
		element StringPanelLin [expr $eleTag +  34] [expr $nodeTag +  52] [expr $nodeTag +  53] [expr $recWallY1 + 1] [expr $nodeTag +  65]	$stringTag12 $stringTag12 $stringTag12 $stringTag12 $Ec $nuc $thickness -rho $rho
		element StringPanelLin [expr $eleTag +  35] [expr $nodeTag +  53] [expr $nodeTag +  54] [expr $nodeTag +  66] [expr $recWallY1 + 1]	$stringTag12 $stringTag12 $stringTag12 $stringTag12 $Ec $nuc $thickness -rho $rho
		element StringPanelLin [expr $eleTag +  36] [expr $nodeTag +  54] [expr $nodeTag +  55] [expr $nodeTag +  67] [expr $nodeTag +  66]	$stringTag12 $stringTag12 $stringTag12 $stringTag12 $Ec $nuc $thickness -rho $rho
		element StringPanelLin [expr $eleTag +  37] [expr $nodeTag +  55] [expr $nodeTag +  56] [expr $nodeTag +  68] [expr $nodeTag +  67]	$stringTag12 $stringTag12 $stringTag12 $stringTag12 $Ec $nuc $thickness -rho $rho
		element StringPanelLin [expr $eleTag +  38] [expr $nodeTag +  56] [expr $nodeTag +  57] [expr $coreWall1 + 2] [expr $nodeTag +  68]	$stringTag12 $stringTag12 $stringTag12 $stringTag12 $Ec $nuc $thickness -rho $rho
		element StringPanelLin [expr $eleTag +  39] [expr $nodeTag +  57] [expr $nodeTag +  58] [expr $coreWall2 + 2] [expr $coreWall1 + 2]	$stringTag12 $stringTag14 $stringTagCB $stringTag14 $Ec $nuc $thickness -rho $rho
		element StringPanelLin [expr $eleTag +  40] [expr $nodeTag +  58] [expr $nodeTag +  59] [expr $nodeTag +  69] [expr $coreWall2 + 2]	$stringTag12 $stringTag12 $stringTag12 $stringTag12 $Ec $nuc $thickness -rho $rho
		element StringPanelLin [expr $eleTag +  41] [expr $nodeTag +  59] [expr $nodeTag +  60] [expr $nodeTag +  70] [expr $nodeTag +  69]	$stringTag12 $stringTag12 $stringTag12 $stringTag12 $Ec $nuc $thickness -rho $rho
		element StringPanelLin [expr $eleTag +  42] [expr $nodeTag +  60] [expr $nodeTag +  61] [expr $nodeTag +  71] [expr $nodeTag +  70]	$stringTag12 $stringTag12 $stringTag12 $stringTag12 $Ec $nuc $thickness -rho $rho
		element StringPanelLin [expr $eleTag +  43] [expr $nodeTag +  61] [expr $nodeTag +  62] [expr $recWallY2 + 1] [expr $nodeTag +  71]	$stringTag12 $stringTag12 $stringTag12 $stringTag12 $Ec $nuc $thickness -rho $rho
		element StringPanelLin [expr $eleTag +  44] [expr $nodeTag +  62] [expr $nodeTag +  63] [expr $nodeTag +  72] [expr $recWallY2 + 1]	$stringTag12 $stringTag12 $stringTag12 $stringTag12 $Ec $nuc $thickness -rho $rho
		
		
		element StringPanelLin [expr $eleTag +  45] [expr $nodeTag +  64] [expr $nodeTag +  65] [expr $nodeTag +  74] [expr $nodeTag +  73]	$stringTag12 $stringTag12 $stringTag12 $stringTag12 $Ec $nuc $thickness -rho $rho
		element StringPanelLin [expr $eleTag +  46] [expr $nodeTag +  65] [expr $recWallY1 + 1] [expr $recWallY1 + 2] [expr $nodeTag +  74]	$stringTag12 $stringTag12 $stringTag12 $stringTag12 $Ec $nuc $thickness -rho $rho
		element StringPanelLin [expr $eleTag +  47] [expr $recWallY1 + 1] [expr $nodeTag +  66] [expr $nodeTag +  75] [expr $recWallY1 + 2]	$stringTag12 $stringTag12 $stringTag12 $stringTag12 $Ec $nuc $thickness -rho $rho
		element StringPanelLin [expr $eleTag +  48] [expr $nodeTag +  66] [expr $nodeTag +  67] [expr $nodeTag +  76] [expr $nodeTag +  75]	$stringTag12 $stringTag12 $stringTag12 $stringTag12 $Ec $nuc $thickness -rho $rho
		element StringPanelLin [expr $eleTag +  49] [expr $nodeTag +  67] [expr $nodeTag +  68] [expr $nodeTag +  77] [expr $nodeTag +  76]	$stringTag12 $stringTag12 $stringTag12 $stringTag12 $Ec $nuc $thickness -rho $rho
		element StringPanelLin [expr $eleTag +  50] [expr $nodeTag +  68] [expr $coreWall1 + 2] [expr $coreWall1 + 1] [expr $nodeTag +  77]	$stringTag12 $stringTag12 $stringTag12 $stringTag12 $Ec $nuc $thickness -rho $rho
		element StringPanelLin [expr $eleTag +  51] [expr $coreWall2 + 2] [expr $nodeTag +  69] [expr $nodeTag +  78] [expr $coreWall2 + 1]	$stringTag12 $stringTag12 $stringTag12 $stringTag12 $Ec $nuc $thickness -rho $rho
		element StringPanelLin [expr $eleTag +  52] [expr $nodeTag +  69] [expr $nodeTag +  70] [expr $nodeTag +  79] [expr $nodeTag +  78]	$stringTag12 $stringTag12 $stringTag12 $stringTag12 $Ec $nuc $thickness -rho $rho
		element StringPanelLin [expr $eleTag +  53] [expr $nodeTag +  70] [expr $nodeTag +  71] [expr $nodeTag +  80] [expr $nodeTag +  79]	$stringTag12 $stringTag12 $stringTag12 $stringTag12 $Ec $nuc $thickness -rho $rho
		element StringPanelLin [expr $eleTag +  54] [expr $nodeTag +  71] [expr $recWallY2 + 1] [expr $recWallY2 + 2] [expr $nodeTag +  80]	$stringTag12 $stringTag12 $stringTag12 $stringTag12 $Ec $nuc $thickness -rho $rho
		element StringPanelLin [expr $eleTag +  55] [expr $recWallY2 + 1] [expr $nodeTag +  72] [expr $nodeTag +  81] [expr $recWallY2 + 2]	$stringTag12 $stringTag12 $stringTag12 $stringTag12 $Ec $nuc $thickness -rho $rho
		
		
		element StringPanelLin [expr $eleTag +  56] [expr $nodeTag +  73] [expr $nodeTag +  74] [expr $nodeTag +  83] [expr $nodeTag +  82]	$stringTag12 $stringTag12 $stringTag12 $stringTag12 $Ec $nuc $thickness -rho $rho
		element StringPanelLin [expr $eleTag +  57] [expr $nodeTag +  74] [expr $recWallY1 + 2] [expr $nodeTag +  84] [expr $nodeTag +  83]	$stringTag12 $stringTag12 $stringTag12 $stringTag12 $Ec $nuc $thickness -rho $rho
		element StringPanelLin [expr $eleTag +  58] [expr $recWallY1 + 2] [expr $nodeTag +  75] [expr $nodeTag +  85] [expr $nodeTag +  84]	$stringTag12 $stringTag12 $stringTag12 $stringTag12 $Ec $nuc $thickness -rho $rho
		element StringPanelLin [expr $eleTag +  59] [expr $nodeTag +  75] [expr $nodeTag +  76] [expr $nodeTag +  86] [expr $nodeTag +  85]	$stringTag12 $stringTag12 $stringTag12 $stringTag12 $Ec $nuc $thickness -rho $rho
		element StringPanelLin [expr $eleTag +  60] [expr $nodeTag +  76] [expr $nodeTag +  77] [expr $nodeTag +  87] [expr $nodeTag +  86]	$stringTag12 $stringTag12 $stringTag12 $stringTag12 $Ec $nuc $thickness -rho $rho
		element StringPanelLin [expr $eleTag +  61] [expr $nodeTag +  77] [expr $coreWall1 + 1] [expr $nodeTag +  88] [expr $nodeTag +  87]	$stringTag12 $stringTag12 $stringTag12 $stringTag12 $Ec $nuc $thickness -rho $rho
		element StringPanelLin [expr $eleTag +  62] [expr $coreWall1 + 1] [expr $coreWall2 + 1] [expr $nodeTag +  89] [expr $nodeTag +  88]	$stringTagCB $stringTag14 $stringTag12 $stringTag14 $Ec $nuc $thickness -rho $rho
		element StringPanelLin [expr $eleTag +  63] [expr $coreWall2 + 1] [expr $nodeTag +  78] [expr $nodeTag +  90] [expr $nodeTag +  89]	$stringTag12 $stringTag12 $stringTag12 $stringTag12 $Ec $nuc $thickness -rho $rho
		element StringPanelLin [expr $eleTag +  64] [expr $nodeTag +  78] [expr $nodeTag +  79] [expr $nodeTag +  91] [expr $nodeTag +  90]	$stringTag12 $stringTag12 $stringTag12 $stringTag12 $Ec $nuc $thickness -rho $rho
		element StringPanelLin [expr $eleTag +  65] [expr $nodeTag +  79] [expr $nodeTag +  80] [expr $nodeTag +  92] [expr $nodeTag +  91]	$stringTag12 $stringTag12 $stringTag12 $stringTag12 $Ec $nuc $thickness -rho $rho
		element StringPanelLin [expr $eleTag +  66] [expr $nodeTag +  80] [expr $recWallY2 + 2] [expr $nodeTag +  93] [expr $nodeTag +  92]	$stringTag12 $stringTag12 $stringTag12 $stringTag12 $Ec $nuc $thickness -rho $rho
		element StringPanelLin [expr $eleTag +  67] [expr $recWallY2 + 2] [expr $nodeTag +  81] [expr $nodeTag +  94] [expr $nodeTag +  93]	$stringTag12 $stringTag12 $stringTag12 $stringTag12 $Ec $nuc $thickness -rho $rho
	
	} else {
		
		element StringPanelLin [expr $eleTag +   1] [expr $nodeTag +  43] [expr $nodeTag +  44] [expr $nodeTag +  57] [expr $nodeTag +  56]	$stringTag12 $stringTag12 $stringTag12 $stringTag12 $Ec $nuc $thickness -rho $rho
		element StringPanelLin [expr $eleTag +   2] [expr $nodeTag +  44] [expr $nodeTag +  45] [expr $nodeTag +  58] [expr $nodeTag +  57]	$stringTag12 $stringTag12 $stringTag12 $stringTag12 $Ec $nuc $thickness -rho $rho
		element StringPanelLin [expr $eleTag +   3] [expr $nodeTag +  45] [expr $nodeTag +  46] [expr $nodeTag +  59] [expr $nodeTag +  58]	$stringTag12 $stringTag12 $stringTag12 $stringTag12 $Ec $nuc $thickness -rho $rho
		
		
		element StringPanelLin [expr $eleTag +   4] [expr $nodeTag +  55] [expr $nodeTag +  56] [expr $nodeTag +  68] [expr $nodeTag +  67]	$stringTag12 $stringTag12 $stringTag12 $stringTag12 $Ec $nuc $thickness -rho $rho
		element StringPanelLin [expr $eleTag +   5] [expr $nodeTag +  56] [expr $nodeTag +  57] [expr $coreWall1 + 2] [expr $nodeTag +  68]	$stringTag12 $stringTag12 $stringTag12 $stringTag12 $Ec $nuc $thickness -rho $rho
		element StringPanelLin [expr $eleTag +   6] [expr $nodeTag +  57] [expr $nodeTag +  58] [expr $coreWall2 + 2] [expr $coreWall1 + 2]	$stringTag12 $stringTag14 $stringTagCB $stringTag14 $Ec $nuc $thickness -rho $rho
		element StringPanelLin [expr $eleTag +   7] [expr $nodeTag +  58] [expr $nodeTag +  59] [expr $nodeTag +  69] [expr $coreWall2 + 2]	$stringTag12 $stringTag12 $stringTag12 $stringTag12 $Ec $nuc $thickness -rho $rho
		element StringPanelLin [expr $eleTag +   8] [expr $nodeTag +  59] [expr $nodeTag +  60] [expr $nodeTag +  70] [expr $nodeTag +  69]	$stringTag12 $stringTag12 $stringTag12 $stringTag12 $Ec $nuc $thickness -rho $rho
		element StringPanelLin [expr $eleTag +   9] [expr $nodeTag +  60] [expr $nodeTag +  61] [expr $nodeTag +  71] [expr $nodeTag +  70]	$stringTag12 $stringTag12 $stringTag12 $stringTag12 $Ec $nuc $thickness -rho $rho
		
		
		element StringPanelLin [expr $eleTag +  10] [expr $nodeTag +  67] [expr $nodeTag +  68] [expr $nodeTag +  77] [expr $nodeTag +  76]	$stringTag12 $stringTag12 $stringTag12 $stringTag12 $Ec $nuc $thickness -rho $rho
		element StringPanelLin [expr $eleTag +  11] [expr $nodeTag +  68] [expr $coreWall1 + 2] [expr $coreWall1 + 1] [expr $nodeTag +  77]	$stringTag12 $stringTag12 $stringTag12 $stringTag12 $Ec $nuc $thickness -rho $rho
		element StringPanelLin [expr $eleTag +  12] [expr $coreWall2 + 2] [expr $nodeTag +  69] [expr $nodeTag +  78] [expr $coreWall2 + 1]	$stringTag12 $stringTag12 $stringTag12 $stringTag12 $Ec $nuc $thickness -rho $rho
		element StringPanelLin [expr $eleTag +  13] [expr $nodeTag +  69] [expr $nodeTag +  70] [expr $nodeTag +  79] [expr $nodeTag +  78]	$stringTag12 $stringTag12 $stringTag12 $stringTag12 $Ec $nuc $thickness -rho $rho
		element StringPanelLin [expr $eleTag +  14] [expr $nodeTag +  70] [expr $nodeTag +  71] [expr $nodeTag +  80] [expr $nodeTag +  79]	$stringTag12 $stringTag12 $stringTag12 $stringTag12 $Ec $nuc $thickness -rho $rho
		
		
		element StringPanelLin [expr $eleTag +  15] [expr $nodeTag +  76] [expr $nodeTag +  77] [expr $nodeTag +  87] [expr $nodeTag +  86]	$stringTag12 $stringTag12 $stringTag12 $stringTag12 $Ec $nuc $thickness -rho $rho
		element StringPanelLin [expr $eleTag +  16] [expr $nodeTag +  77] [expr $coreWall1 + 1] [expr $nodeTag +  88] [expr $nodeTag +  87]	$stringTag12 $stringTag12 $stringTag12 $stringTag12 $Ec $nuc $thickness -rho $rho
		element StringPanelLin [expr $eleTag +  17] [expr $coreWall1 + 1] [expr $coreWall2 + 1] [expr $nodeTag +  89] [expr $nodeTag +  88]	$stringTagCB $stringTag14 $stringTag12 $stringTag14 $Ec $nuc $thickness -rho $rho
		element StringPanelLin [expr $eleTag +  18] [expr $coreWall2 + 1] [expr $nodeTag +  78] [expr $nodeTag +  90] [expr $nodeTag +  89]	$stringTag12 $stringTag12 $stringTag12 $stringTag12 $Ec $nuc $thickness -rho $rho
		element StringPanelLin [expr $eleTag +  19] [expr $nodeTag +  78] [expr $nodeTag +  79] [expr $nodeTag +  91] [expr $nodeTag +  90]	$stringTag12 $stringTag12 $stringTag12 $stringTag12 $Ec $nuc $thickness -rho $rho
		element StringPanelLin [expr $eleTag +  20] [expr $nodeTag +  79] [expr $nodeTag +  80] [expr $nodeTag +  92] [expr $nodeTag +  91]	$stringTag12 $stringTag12 $stringTag12 $stringTag12 $Ec $nuc $thickness -rho $rho
	
	}
}


if {1} {
for {set i 1} {$i <= $nStory} {incr i 1} {
	
	set eleTag [expr 100000 + 1000*$i]
	set nodeTag [expr 1000*$i + 800]
	
	set coreWall1 [expr 1000*$i + 100 + $nEleFloor]
	set coreWall2 [expr 1000*$i + 200 + $nEleFloor]
	
	set recWallX  [expr 1000*$i + 300 + $nEleFloor]
	set recWallY1 [expr 1000*$i + 400 + $nEleFloor]
	set recWallY2 [expr 1000*$i + 500 + $nEleFloor]
	
	if {$i <= 3} {
	
		puts $ModelFile "element StringPanelLin [expr $eleTag +   1] [expr $nodeTag +   1] [expr $nodeTag +   2] [expr $nodeTag +  15] [expr $nodeTag +  14]"
		puts $ModelFile "element StringPanelLin [expr $eleTag +   2] [expr $nodeTag +   2] [expr $nodeTag +   3] [expr $nodeTag +  16] [expr $nodeTag +  15]"
		puts $ModelFile "element StringPanelLin [expr $eleTag +   3] [expr $nodeTag +   3] [expr $nodeTag +   4] [expr $nodeTag +  17] [expr $nodeTag +  16]"
		puts $ModelFile "element StringPanelLin [expr $eleTag +   4] [expr $nodeTag +   4] [expr $nodeTag +   5] [expr $nodeTag +  18] [expr $nodeTag +  17]"
		puts $ModelFile "element StringPanelLin [expr $eleTag +   5] [expr $nodeTag +   5] [expr $nodeTag +   6] [expr $nodeTag +  19] [expr $nodeTag +  18]"
		puts $ModelFile "element StringPanelLin [expr $eleTag +   6] [expr $nodeTag +   6] [expr $nodeTag +   7] [expr $nodeTag +  20] [expr $nodeTag +  19]"
		puts $ModelFile "element StringPanelLin [expr $eleTag +   7] [expr $nodeTag +   7] [expr $nodeTag +   8] [expr $nodeTag +  21] [expr $nodeTag +  20]"
		puts $ModelFile "element StringPanelLin [expr $eleTag +   8] [expr $nodeTag +   8] [expr $nodeTag +   9] [expr $nodeTag +  22] [expr $nodeTag +  21]"
		puts $ModelFile "element StringPanelLin [expr $eleTag +   9] [expr $nodeTag +   9] [expr $nodeTag +  10] [expr $recWallX +  1] [expr $nodeTag +  22]"
		puts $ModelFile "element StringPanelLin [expr $eleTag +  10] [expr $nodeTag +  10] [expr $nodeTag +  11] [expr $recWallX +  2] [expr $recWallX +  1]"
		puts $ModelFile "element StringPanelLin [expr $eleTag +  11] [expr $nodeTag +  11] [expr $nodeTag +  12] [expr $nodeTag +  23] [expr $recWallX +  2]"
		puts $ModelFile "element StringPanelLin [expr $eleTag +  12] [expr $nodeTag +  12] [expr $nodeTag +  13] [expr $nodeTag +  24] [expr $nodeTag +  23]"
		puts $ModelFile "element StringPanelLin [expr $eleTag +  13] [expr $nodeTag +  14] [expr $nodeTag +  15] [expr $nodeTag +  26] [expr $nodeTag +  25]"
		puts $ModelFile "element StringPanelLin [expr $eleTag +  14] [expr $nodeTag +  15] [expr $nodeTag +  16] [expr $nodeTag +  27] [expr $nodeTag +  26]"
		puts $ModelFile "element StringPanelLin [expr $eleTag +  15] [expr $nodeTag +  16] [expr $nodeTag +  17] [expr $nodeTag +  28] [expr $nodeTag +  27]"
		puts $ModelFile "element StringPanelLin [expr $eleTag +  16] [expr $nodeTag +  17] [expr $nodeTag +  18] [expr $nodeTag +  29] [expr $nodeTag +  28]"
		puts $ModelFile "element StringPanelLin [expr $eleTag +  17] [expr $nodeTag +  18] [expr $nodeTag +  19] [expr $nodeTag +  30] [expr $nodeTag +  29]"
		puts $ModelFile "element StringPanelLin [expr $eleTag +  18] [expr $nodeTag +  19] [expr $nodeTag +  20] [expr $nodeTag +  31] [expr $nodeTag +  30]"
		puts $ModelFile "element StringPanelLin [expr $eleTag +  19] [expr $nodeTag +  20] [expr $nodeTag +  21] [expr $nodeTag +  32] [expr $nodeTag +  31]"
		puts $ModelFile "element StringPanelLin [expr $eleTag +  20] [expr $nodeTag +  21] [expr $nodeTag +  22] [expr $nodeTag +  33] [expr $nodeTag +  32]"
		puts $ModelFile "element StringPanelLin [expr $eleTag +  21] [expr $nodeTag +  22] [expr $recWallX +  1] [expr $nodeTag +  34] [expr $nodeTag +  33]"
		puts $ModelFile "element StringPanelLin [expr $eleTag +  22] [expr $recWallX +  1] [expr $recWallX +  2] [expr $nodeTag +  35] [expr $nodeTag +  34]"
		puts $ModelFile "element StringPanelLin [expr $eleTag +  23] [expr $recWallX +  2] [expr $nodeTag +  23] [expr $nodeTag +  36] [expr $nodeTag +  35]"
		puts $ModelFile "element StringPanelLin [expr $eleTag +  24] [expr $nodeTag +  23] [expr $nodeTag +  24] [expr $nodeTag +  37] [expr $nodeTag +  36]"
		puts $ModelFile "element StringPanelLin [expr $eleTag +  25] [expr $nodeTag +  25] [expr $nodeTag +  26] [expr $nodeTag +  39] [expr $nodeTag +  38]"
		puts $ModelFile "element StringPanelLin [expr $eleTag +  26] [expr $nodeTag +  26] [expr $nodeTag +  27] [expr $nodeTag +  40] [expr $nodeTag +  39]"
		puts $ModelFile "element StringPanelLin [expr $eleTag +  27] [expr $nodeTag +  27] [expr $nodeTag +  28] [expr $nodeTag +  41] [expr $nodeTag +  40]"
		puts $ModelFile "element StringPanelLin [expr $eleTag +  28] [expr $nodeTag +  28] [expr $nodeTag +  29] [expr $nodeTag +  42] [expr $nodeTag +  41]"
		puts $ModelFile "element StringPanelLin [expr $eleTag +  29] [expr $nodeTag +  29] [expr $nodeTag +  30] [expr $nodeTag +  43] [expr $nodeTag +  42]"
		puts $ModelFile "element StringPanelLin [expr $eleTag +  30] [expr $nodeTag +  30] [expr $nodeTag +  31] [expr $nodeTag +  44] [expr $nodeTag +  43]"
		puts $ModelFile "element StringPanelLin [expr $eleTag +  31] [expr $nodeTag +  31] [expr $nodeTag +  32] [expr $nodeTag +  45] [expr $nodeTag +  44]"
		puts $ModelFile "element StringPanelLin [expr $eleTag +  32] [expr $nodeTag +  32] [expr $nodeTag +  33] [expr $nodeTag +  46] [expr $nodeTag +  45]"
		puts $ModelFile "element StringPanelLin [expr $eleTag +  33] [expr $nodeTag +  33] [expr $nodeTag +  34] [expr $nodeTag +  47] [expr $nodeTag +  46]"
		puts $ModelFile "element StringPanelLin [expr $eleTag +  34] [expr $nodeTag +  34] [expr $nodeTag +  35] [expr $nodeTag +  48] [expr $nodeTag +  47]"
		puts $ModelFile "element StringPanelLin [expr $eleTag +  35] [expr $nodeTag +  35] [expr $nodeTag +  36] [expr $nodeTag +  49] [expr $nodeTag +  48]"
		puts $ModelFile "element StringPanelLin [expr $eleTag +  36] [expr $nodeTag +  36] [expr $nodeTag +  37] [expr $nodeTag +  50] [expr $nodeTag +  49]"
		puts $ModelFile "element StringPanelLin [expr $eleTag +  37] [expr $nodeTag +  38] [expr $nodeTag +  39] [expr $nodeTag +  52] [expr $nodeTag +  51]"
		puts $ModelFile "element StringPanelLin [expr $eleTag +  38] [expr $nodeTag +  39] [expr $nodeTag +  40] [expr $nodeTag +  53] [expr $nodeTag +  52]"
		puts $ModelFile "element StringPanelLin [expr $eleTag +  39] [expr $nodeTag +  40] [expr $nodeTag +  41] [expr $nodeTag +  54] [expr $nodeTag +  53]"
		puts $ModelFile "element StringPanelLin [expr $eleTag +  40] [expr $nodeTag +  41] [expr $nodeTag +  42] [expr $nodeTag +  55] [expr $nodeTag +  54]"
		puts $ModelFile "element StringPanelLin [expr $eleTag +  41] [expr $nodeTag +  42] [expr $nodeTag +  43] [expr $nodeTag +  56] [expr $nodeTag +  55]"
		puts $ModelFile "element StringPanelLin [expr $eleTag +  42] [expr $nodeTag +  43] [expr $nodeTag +  44] [expr $nodeTag +  57] [expr $nodeTag +  56]"
		puts $ModelFile "element StringPanelLin [expr $eleTag +  43] [expr $nodeTag +  44] [expr $nodeTag +  45] [expr $nodeTag +  58] [expr $nodeTag +  57]"
		puts $ModelFile "element StringPanelLin [expr $eleTag +  44] [expr $nodeTag +  45] [expr $nodeTag +  46] [expr $nodeTag +  59] [expr $nodeTag +  58]"
		puts $ModelFile "element StringPanelLin [expr $eleTag +  45] [expr $nodeTag +  46] [expr $nodeTag +  47] [expr $nodeTag +  60] [expr $nodeTag +  59]"
		puts $ModelFile "element StringPanelLin [expr $eleTag +  46] [expr $nodeTag +  47] [expr $nodeTag +  48] [expr $nodeTag +  61] [expr $nodeTag +  60]"
		puts $ModelFile "element StringPanelLin [expr $eleTag +  47] [expr $nodeTag +  48] [expr $nodeTag +  49] [expr $nodeTag +  62] [expr $nodeTag +  61]"
		puts $ModelFile "element StringPanelLin [expr $eleTag +  48] [expr $nodeTag +  49] [expr $nodeTag +  50] [expr $nodeTag +  63] [expr $nodeTag +  62]"
		puts $ModelFile "element StringPanelLin [expr $eleTag +  49] [expr $nodeTag +  51] [expr $nodeTag +  52] [expr $nodeTag +  65] [expr $nodeTag +  64]"
		puts $ModelFile "element StringPanelLin [expr $eleTag +  50] [expr $nodeTag +  52] [expr $nodeTag +  53] [expr $recWallY1 + 1] [expr $nodeTag +  65]"
		puts $ModelFile "element StringPanelLin [expr $eleTag +  51] [expr $nodeTag +  53] [expr $nodeTag +  54] [expr $nodeTag +  66] [expr $recWallY1 + 1]"
		puts $ModelFile "element StringPanelLin [expr $eleTag +  52] [expr $nodeTag +  54] [expr $nodeTag +  55] [expr $nodeTag +  67] [expr $nodeTag +  66]"
		puts $ModelFile "element StringPanelLin [expr $eleTag +  53] [expr $nodeTag +  55] [expr $nodeTag +  56] [expr $nodeTag +  68] [expr $nodeTag +  67]"
		puts $ModelFile "element StringPanelLin [expr $eleTag +  54] [expr $nodeTag +  56] [expr $nodeTag +  57] [expr $coreWall1 + 2] [expr $nodeTag +  68]"
		puts $ModelFile "element StringPanelLin [expr $eleTag +  55] [expr $nodeTag +  57] [expr $nodeTag +  58] [expr $coreWall2 + 2] [expr $coreWall1 + 2]"
		puts $ModelFile "element StringPanelLin [expr $eleTag +  56] [expr $nodeTag +  58] [expr $nodeTag +  59] [expr $nodeTag +  69] [expr $coreWall2 + 2]"
		puts $ModelFile "element StringPanelLin [expr $eleTag +  57] [expr $nodeTag +  59] [expr $nodeTag +  60] [expr $nodeTag +  70] [expr $nodeTag +  69]"
		puts $ModelFile "element StringPanelLin [expr $eleTag +  58] [expr $nodeTag +  60] [expr $nodeTag +  61] [expr $nodeTag +  71] [expr $nodeTag +  70]"
		puts $ModelFile "element StringPanelLin [expr $eleTag +  59] [expr $nodeTag +  61] [expr $nodeTag +  62] [expr $recWallY2 + 1] [expr $nodeTag +  71]"
		puts $ModelFile "element StringPanelLin [expr $eleTag +  60] [expr $nodeTag +  62] [expr $nodeTag +  63] [expr $nodeTag +  72] [expr $recWallY2 + 1]"
		puts $ModelFile "element StringPanelLin [expr $eleTag +  61] [expr $nodeTag +  64] [expr $nodeTag +  65] [expr $nodeTag +  74] [expr $nodeTag +  73]"
		puts $ModelFile "element StringPanelLin [expr $eleTag +  62] [expr $nodeTag +  65] [expr $recWallY1 + 1] [expr $recWallY1 + 2] [expr $nodeTag +  74]"
		puts $ModelFile "element StringPanelLin [expr $eleTag +  63] [expr $recWallY1 + 1] [expr $nodeTag +  66] [expr $nodeTag +  75] [expr $recWallY1 + 2]"
		puts $ModelFile "element StringPanelLin [expr $eleTag +  64] [expr $nodeTag +  66] [expr $nodeTag +  67] [expr $nodeTag +  76] [expr $nodeTag +  75]"
		puts $ModelFile "element StringPanelLin [expr $eleTag +  65] [expr $nodeTag +  67] [expr $nodeTag +  68] [expr $nodeTag +  77] [expr $nodeTag +  76]"
		puts $ModelFile "element StringPanelLin [expr $eleTag +  66] [expr $nodeTag +  68] [expr $coreWall1 + 2] [expr $coreWall1 + 1] [expr $nodeTag +  77]"
		puts $ModelFile "element StringPanelLin [expr $eleTag +  67] [expr $coreWall2 + 2] [expr $nodeTag +  69] [expr $nodeTag +  78] [expr $coreWall2 + 1]"
		puts $ModelFile "element StringPanelLin [expr $eleTag +  68] [expr $nodeTag +  69] [expr $nodeTag +  70] [expr $nodeTag +  79] [expr $nodeTag +  78]"
		puts $ModelFile "element StringPanelLin [expr $eleTag +  69] [expr $nodeTag +  70] [expr $nodeTag +  71] [expr $nodeTag +  80] [expr $nodeTag +  79]"
		puts $ModelFile "element StringPanelLin [expr $eleTag +  70] [expr $nodeTag +  71] [expr $recWallY2 + 1] [expr $recWallY2 + 2] [expr $nodeTag +  80]"
		puts $ModelFile "element StringPanelLin [expr $eleTag +  71] [expr $recWallY2 + 1] [expr $nodeTag +  72] [expr $nodeTag +  81] [expr $recWallY2 + 2]"
		puts $ModelFile "element StringPanelLin [expr $eleTag +  72] [expr $nodeTag +  73] [expr $nodeTag +  74] [expr $nodeTag +  83] [expr $nodeTag +  82]"
		puts $ModelFile "element StringPanelLin [expr $eleTag +  73] [expr $nodeTag +  74] [expr $recWallY1 + 2] [expr $nodeTag +  84] [expr $nodeTag +  83]"
		puts $ModelFile "element StringPanelLin [expr $eleTag +  74] [expr $recWallY1 + 2] [expr $nodeTag +  75] [expr $nodeTag +  85] [expr $nodeTag +  84]"
		puts $ModelFile "element StringPanelLin [expr $eleTag +  75] [expr $nodeTag +  75] [expr $nodeTag +  76] [expr $nodeTag +  86] [expr $nodeTag +  85]"
		puts $ModelFile "element StringPanelLin [expr $eleTag +  76] [expr $nodeTag +  76] [expr $nodeTag +  77] [expr $nodeTag +  87] [expr $nodeTag +  86]"
		puts $ModelFile "element StringPanelLin [expr $eleTag +  77] [expr $nodeTag +  77] [expr $coreWall1 + 1] [expr $nodeTag +  88] [expr $nodeTag +  87]"
		puts $ModelFile "element StringPanelLin [expr $eleTag +  78] [expr $coreWall1 + 1] [expr $coreWall2 + 1] [expr $nodeTag +  89] [expr $nodeTag +  88]"
		puts $ModelFile "element StringPanelLin [expr $eleTag +  79] [expr $coreWall2 + 1] [expr $nodeTag +  78] [expr $nodeTag +  90] [expr $nodeTag +  89]"
		puts $ModelFile "element StringPanelLin [expr $eleTag +  80] [expr $nodeTag +  78] [expr $nodeTag +  79] [expr $nodeTag +  91] [expr $nodeTag +  90]"
		puts $ModelFile "element StringPanelLin [expr $eleTag +  81] [expr $nodeTag +  79] [expr $nodeTag +  80] [expr $nodeTag +  92] [expr $nodeTag +  91]"
		puts $ModelFile "element StringPanelLin [expr $eleTag +  82] [expr $nodeTag +  80] [expr $recWallY2 + 2] [expr $nodeTag +  93] [expr $nodeTag +  92]"
		puts $ModelFile "element StringPanelLin [expr $eleTag +  83] [expr $recWallY2 + 2] [expr $nodeTag +  81] [expr $nodeTag +  94] [expr $nodeTag +  93]"
	
	} elseif {$i <= 11} {
	
		puts $ModelFile "element StringPanelLin [expr $eleTag +   1] [expr $nodeTag +   9] [expr $nodeTag +  10] [expr $recWallX +  1] [expr $nodeTag +  22]"
		puts $ModelFile "element StringPanelLin [expr $eleTag +   2] [expr $nodeTag +  10] [expr $nodeTag +  11] [expr $recWallX +  2] [expr $recWallX +  1]"
		puts $ModelFile "element StringPanelLin [expr $eleTag +   3] [expr $nodeTag +  11] [expr $nodeTag +  12] [expr $nodeTag +  23] [expr $recWallX +  2]"
		puts $ModelFile "element StringPanelLin [expr $eleTag +   4] [expr $nodeTag +  12] [expr $nodeTag +  13] [expr $nodeTag +  24] [expr $nodeTag +  23]"
		puts $ModelFile "element StringPanelLin [expr $eleTag +   5] [expr $nodeTag +  22] [expr $recWallX +  1] [expr $nodeTag +  34] [expr $nodeTag +  33]"
		puts $ModelFile "element StringPanelLin [expr $eleTag +   6] [expr $recWallX +  1] [expr $recWallX +  2] [expr $nodeTag +  35] [expr $nodeTag +  34]"
		puts $ModelFile "element StringPanelLin [expr $eleTag +   7] [expr $recWallX +  2] [expr $nodeTag +  23] [expr $nodeTag +  36] [expr $nodeTag +  35]"
		puts $ModelFile "element StringPanelLin [expr $eleTag +   8] [expr $nodeTag +  23] [expr $nodeTag +  24] [expr $nodeTag +  37] [expr $nodeTag +  36]"
		puts $ModelFile "element StringPanelLin [expr $eleTag +   9] [expr $nodeTag +  25] [expr $nodeTag +  26] [expr $nodeTag +  39] [expr $nodeTag +  38]"
		puts $ModelFile "element StringPanelLin [expr $eleTag +  10] [expr $nodeTag +  26] [expr $nodeTag +  27] [expr $nodeTag +  40] [expr $nodeTag +  39]"
		puts $ModelFile "element StringPanelLin [expr $eleTag +  11] [expr $nodeTag +  27] [expr $nodeTag +  28] [expr $nodeTag +  41] [expr $nodeTag +  40]"
		puts $ModelFile "element StringPanelLin [expr $eleTag +  12] [expr $nodeTag +  28] [expr $nodeTag +  29] [expr $nodeTag +  42] [expr $nodeTag +  41]"
		puts $ModelFile "element StringPanelLin [expr $eleTag +  13] [expr $nodeTag +  29] [expr $nodeTag +  30] [expr $nodeTag +  43] [expr $nodeTag +  42]"
		puts $ModelFile "element StringPanelLin [expr $eleTag +  14] [expr $nodeTag +  30] [expr $nodeTag +  31] [expr $nodeTag +  44] [expr $nodeTag +  43]"
		puts $ModelFile "element StringPanelLin [expr $eleTag +  15] [expr $nodeTag +  31] [expr $nodeTag +  32] [expr $nodeTag +  45] [expr $nodeTag +  44]"
		puts $ModelFile "element StringPanelLin [expr $eleTag +  16] [expr $nodeTag +  32] [expr $nodeTag +  33] [expr $nodeTag +  46] [expr $nodeTag +  45]"
		puts $ModelFile "element StringPanelLin [expr $eleTag +  17] [expr $nodeTag +  33] [expr $nodeTag +  34] [expr $nodeTag +  47] [expr $nodeTag +  46]"
		puts $ModelFile "element StringPanelLin [expr $eleTag +  18] [expr $nodeTag +  34] [expr $nodeTag +  35] [expr $nodeTag +  48] [expr $nodeTag +  47]"
		puts $ModelFile "element StringPanelLin [expr $eleTag +  19] [expr $nodeTag +  35] [expr $nodeTag +  36] [expr $nodeTag +  49] [expr $nodeTag +  48]"
		puts $ModelFile "element StringPanelLin [expr $eleTag +  20] [expr $nodeTag +  36] [expr $nodeTag +  37] [expr $nodeTag +  50] [expr $nodeTag +  49]"
		puts $ModelFile "element StringPanelLin [expr $eleTag +  21] [expr $nodeTag +  38] [expr $nodeTag +  39] [expr $nodeTag +  52] [expr $nodeTag +  51]"
		puts $ModelFile "element StringPanelLin [expr $eleTag +  22] [expr $nodeTag +  39] [expr $nodeTag +  40] [expr $nodeTag +  53] [expr $nodeTag +  52]"
		puts $ModelFile "element StringPanelLin [expr $eleTag +  23] [expr $nodeTag +  40] [expr $nodeTag +  41] [expr $nodeTag +  54] [expr $nodeTag +  53]"
		puts $ModelFile "element StringPanelLin [expr $eleTag +  24] [expr $nodeTag +  41] [expr $nodeTag +  42] [expr $nodeTag +  55] [expr $nodeTag +  54]"
		puts $ModelFile "element StringPanelLin [expr $eleTag +  25] [expr $nodeTag +  42] [expr $nodeTag +  43] [expr $nodeTag +  56] [expr $nodeTag +  55]"
		puts $ModelFile "element StringPanelLin [expr $eleTag +  26] [expr $nodeTag +  43] [expr $nodeTag +  44] [expr $nodeTag +  57] [expr $nodeTag +  56]"
		puts $ModelFile "element StringPanelLin [expr $eleTag +  27] [expr $nodeTag +  44] [expr $nodeTag +  45] [expr $nodeTag +  58] [expr $nodeTag +  57]"
		puts $ModelFile "element StringPanelLin [expr $eleTag +  28] [expr $nodeTag +  45] [expr $nodeTag +  46] [expr $nodeTag +  59] [expr $nodeTag +  58]"
		puts $ModelFile "element StringPanelLin [expr $eleTag +  29] [expr $nodeTag +  46] [expr $nodeTag +  47] [expr $nodeTag +  60] [expr $nodeTag +  59]"
		puts $ModelFile "element StringPanelLin [expr $eleTag +  30] [expr $nodeTag +  47] [expr $nodeTag +  48] [expr $nodeTag +  61] [expr $nodeTag +  60]"
		puts $ModelFile "element StringPanelLin [expr $eleTag +  31] [expr $nodeTag +  48] [expr $nodeTag +  49] [expr $nodeTag +  62] [expr $nodeTag +  61]"
		puts $ModelFile "element StringPanelLin [expr $eleTag +  32] [expr $nodeTag +  49] [expr $nodeTag +  50] [expr $nodeTag +  63] [expr $nodeTag +  62]"
		puts $ModelFile "element StringPanelLin [expr $eleTag +  33] [expr $nodeTag +  51] [expr $nodeTag +  52] [expr $nodeTag +  65] [expr $nodeTag +  64]"
		puts $ModelFile "element StringPanelLin [expr $eleTag +  34] [expr $nodeTag +  52] [expr $nodeTag +  53] [expr $recWallY1 + 1] [expr $nodeTag +  65]"
		puts $ModelFile "element StringPanelLin [expr $eleTag +  35] [expr $nodeTag +  53] [expr $nodeTag +  54] [expr $nodeTag +  66] [expr $recWallY1 + 1]"
		puts $ModelFile "element StringPanelLin [expr $eleTag +  36] [expr $nodeTag +  54] [expr $nodeTag +  55] [expr $nodeTag +  67] [expr $nodeTag +  66]"
		puts $ModelFile "element StringPanelLin [expr $eleTag +  37] [expr $nodeTag +  55] [expr $nodeTag +  56] [expr $nodeTag +  68] [expr $nodeTag +  67]"
		puts $ModelFile "element StringPanelLin [expr $eleTag +  38] [expr $nodeTag +  56] [expr $nodeTag +  57] [expr $coreWall1 + 2] [expr $nodeTag +  68]"
		puts $ModelFile "element StringPanelLin [expr $eleTag +  39] [expr $nodeTag +  57] [expr $nodeTag +  58] [expr $coreWall2 + 2] [expr $coreWall1 + 2]"
		puts $ModelFile "element StringPanelLin [expr $eleTag +  40] [expr $nodeTag +  58] [expr $nodeTag +  59] [expr $nodeTag +  69] [expr $coreWall2 + 2]"
		puts $ModelFile "element StringPanelLin [expr $eleTag +  41] [expr $nodeTag +  59] [expr $nodeTag +  60] [expr $nodeTag +  70] [expr $nodeTag +  69]"
		puts $ModelFile "element StringPanelLin [expr $eleTag +  42] [expr $nodeTag +  60] [expr $nodeTag +  61] [expr $nodeTag +  71] [expr $nodeTag +  70]"
		puts $ModelFile "element StringPanelLin [expr $eleTag +  43] [expr $nodeTag +  61] [expr $nodeTag +  62] [expr $recWallY2 + 1] [expr $nodeTag +  71]"
		puts $ModelFile "element StringPanelLin [expr $eleTag +  44] [expr $nodeTag +  62] [expr $nodeTag +  63] [expr $nodeTag +  72] [expr $recWallY2 + 1]"
		puts $ModelFile "element StringPanelLin [expr $eleTag +  45] [expr $nodeTag +  64] [expr $nodeTag +  65] [expr $nodeTag +  74] [expr $nodeTag +  73]"
		puts $ModelFile "element StringPanelLin [expr $eleTag +  46] [expr $nodeTag +  65] [expr $recWallY1 + 1] [expr $recWallY1 + 2] [expr $nodeTag +  74]"
		puts $ModelFile "element StringPanelLin [expr $eleTag +  47] [expr $recWallY1 + 1] [expr $nodeTag +  66] [expr $nodeTag +  75] [expr $recWallY1 + 2]"
		puts $ModelFile "element StringPanelLin [expr $eleTag +  48] [expr $nodeTag +  66] [expr $nodeTag +  67] [expr $nodeTag +  76] [expr $nodeTag +  75]"
		puts $ModelFile "element StringPanelLin [expr $eleTag +  49] [expr $nodeTag +  67] [expr $nodeTag +  68] [expr $nodeTag +  77] [expr $nodeTag +  76]"
		puts $ModelFile "element StringPanelLin [expr $eleTag +  50] [expr $nodeTag +  68] [expr $coreWall1 + 2] [expr $coreWall1 + 1] [expr $nodeTag +  77]"
		puts $ModelFile "element StringPanelLin [expr $eleTag +  51] [expr $coreWall2 + 2] [expr $nodeTag +  69] [expr $nodeTag +  78] [expr $coreWall2 + 1]"
		puts $ModelFile "element StringPanelLin [expr $eleTag +  52] [expr $nodeTag +  69] [expr $nodeTag +  70] [expr $nodeTag +  79] [expr $nodeTag +  78]"
		puts $ModelFile "element StringPanelLin [expr $eleTag +  53] [expr $nodeTag +  70] [expr $nodeTag +  71] [expr $nodeTag +  80] [expr $nodeTag +  79]"
		puts $ModelFile "element StringPanelLin [expr $eleTag +  54] [expr $nodeTag +  71] [expr $recWallY2 + 1] [expr $recWallY2 + 2] [expr $nodeTag +  80]"
		puts $ModelFile "element StringPanelLin [expr $eleTag +  55] [expr $recWallY2 + 1] [expr $nodeTag +  72] [expr $nodeTag +  81] [expr $recWallY2 + 2]"
		puts $ModelFile "element StringPanelLin [expr $eleTag +  56] [expr $nodeTag +  73] [expr $nodeTag +  74] [expr $nodeTag +  83] [expr $nodeTag +  82]"
		puts $ModelFile "element StringPanelLin [expr $eleTag +  57] [expr $nodeTag +  74] [expr $recWallY1 + 2] [expr $nodeTag +  84] [expr $nodeTag +  83]"
		puts $ModelFile "element StringPanelLin [expr $eleTag +  58] [expr $recWallY1 + 2] [expr $nodeTag +  75] [expr $nodeTag +  85] [expr $nodeTag +  84]"
		puts $ModelFile "element StringPanelLin [expr $eleTag +  59] [expr $nodeTag +  75] [expr $nodeTag +  76] [expr $nodeTag +  86] [expr $nodeTag +  85]"
		puts $ModelFile "element StringPanelLin [expr $eleTag +  60] [expr $nodeTag +  76] [expr $nodeTag +  77] [expr $nodeTag +  87] [expr $nodeTag +  86]"
		puts $ModelFile "element StringPanelLin [expr $eleTag +  61] [expr $nodeTag +  77] [expr $coreWall1 + 1] [expr $nodeTag +  88] [expr $nodeTag +  87]"
		puts $ModelFile "element StringPanelLin [expr $eleTag +  62] [expr $coreWall1 + 1] [expr $coreWall2 + 1] [expr $nodeTag +  89] [expr $nodeTag +  88]"
		puts $ModelFile "element StringPanelLin [expr $eleTag +  63] [expr $coreWall2 + 1] [expr $nodeTag +  78] [expr $nodeTag +  90] [expr $nodeTag +  89]"
		puts $ModelFile "element StringPanelLin [expr $eleTag +  64] [expr $nodeTag +  78] [expr $nodeTag +  79] [expr $nodeTag +  91] [expr $nodeTag +  90]"
		puts $ModelFile "element StringPanelLin [expr $eleTag +  65] [expr $nodeTag +  79] [expr $nodeTag +  80] [expr $nodeTag +  92] [expr $nodeTag +  91]"
		puts $ModelFile "element StringPanelLin [expr $eleTag +  66] [expr $nodeTag +  80] [expr $recWallY2 + 2] [expr $nodeTag +  93] [expr $nodeTag +  92]"
		puts $ModelFile "element StringPanelLin [expr $eleTag +  67] [expr $recWallY2 + 2] [expr $nodeTag +  81] [expr $nodeTag +  94] [expr $nodeTag +  93]"
	
	
	} else {
	
		puts $ModelFile "element StringPanelLin [expr $eleTag +   1] [expr $nodeTag +  43] [expr $nodeTag +  44] [expr $nodeTag +  57] [expr $nodeTag +  56]"
		puts $ModelFile "element StringPanelLin [expr $eleTag +   2] [expr $nodeTag +  44] [expr $nodeTag +  45] [expr $nodeTag +  58] [expr $nodeTag +  57]"
		puts $ModelFile "element StringPanelLin [expr $eleTag +   3] [expr $nodeTag +  45] [expr $nodeTag +  46] [expr $nodeTag +  59] [expr $nodeTag +  58]"
		puts $ModelFile "element StringPanelLin [expr $eleTag +   4] [expr $nodeTag +  55] [expr $nodeTag +  56] [expr $nodeTag +  68] [expr $nodeTag +  67]"
		puts $ModelFile "element StringPanelLin [expr $eleTag +   5] [expr $nodeTag +  56] [expr $nodeTag +  57] [expr $coreWall1 + 2] [expr $nodeTag +  68]"
		puts $ModelFile "element StringPanelLin [expr $eleTag +   6] [expr $nodeTag +  57] [expr $nodeTag +  58] [expr $coreWall2 + 2] [expr $coreWall1 + 2]"
		puts $ModelFile "element StringPanelLin [expr $eleTag +   7] [expr $nodeTag +  58] [expr $nodeTag +  59] [expr $nodeTag +  69] [expr $coreWall2 + 2]"
		puts $ModelFile "element StringPanelLin [expr $eleTag +   8] [expr $nodeTag +  59] [expr $nodeTag +  60] [expr $nodeTag +  70] [expr $nodeTag +  69]"
		puts $ModelFile "element StringPanelLin [expr $eleTag +   9] [expr $nodeTag +  60] [expr $nodeTag +  61] [expr $nodeTag +  71] [expr $nodeTag +  70]"
		puts $ModelFile "element StringPanelLin [expr $eleTag +  10] [expr $nodeTag +  67] [expr $nodeTag +  68] [expr $nodeTag +  77] [expr $nodeTag +  76]"
		puts $ModelFile "element StringPanelLin [expr $eleTag +  11] [expr $nodeTag +  68] [expr $coreWall1 + 2] [expr $coreWall1 + 1] [expr $nodeTag +  77]"
		puts $ModelFile "element StringPanelLin [expr $eleTag +  12] [expr $coreWall2 + 2] [expr $nodeTag +  69] [expr $nodeTag +  78] [expr $coreWall2 + 1]"
		puts $ModelFile "element StringPanelLin [expr $eleTag +  13] [expr $nodeTag +  69] [expr $nodeTag +  70] [expr $nodeTag +  79] [expr $nodeTag +  78]"
		puts $ModelFile "element StringPanelLin [expr $eleTag +  14] [expr $nodeTag +  70] [expr $nodeTag +  71] [expr $nodeTag +  80] [expr $nodeTag +  79]"
		puts $ModelFile "element StringPanelLin [expr $eleTag +  15] [expr $nodeTag +  76] [expr $nodeTag +  77] [expr $nodeTag +  87] [expr $nodeTag +  86]"
		puts $ModelFile "element StringPanelLin [expr $eleTag +  16] [expr $nodeTag +  77] [expr $coreWall1 + 1] [expr $nodeTag +  88] [expr $nodeTag +  87]"
		puts $ModelFile "element StringPanelLin [expr $eleTag +  17] [expr $coreWall1 + 1] [expr $coreWall2 + 1] [expr $nodeTag +  89] [expr $nodeTag +  88]"
		puts $ModelFile "element StringPanelLin [expr $eleTag +  18] [expr $coreWall2 + 1] [expr $nodeTag +  78] [expr $nodeTag +  90] [expr $nodeTag +  89]"
		puts $ModelFile "element StringPanelLin [expr $eleTag +  19] [expr $nodeTag +  78] [expr $nodeTag +  79] [expr $nodeTag +  91] [expr $nodeTag +  90]"
		puts $ModelFile "element StringPanelLin [expr $eleTag +  20] [expr $nodeTag +  79] [expr $nodeTag +  80] [expr $nodeTag +  92] [expr $nodeTag +  91]"
	
	}
}
}