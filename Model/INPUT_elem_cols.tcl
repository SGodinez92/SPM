
 ############################# Columns #######################################
 
 # 6 - 11
 # 11 - 16
 # 16 - 21
 # 21 - 26
 # 26 - 31
 # 31 - 36
 
 set numIntgrPtsCol 2
 
 # 0 - 3 Basements
 for {set i 1} {$i <= 3} {incr i 1} {
	
	set secTagCol1 $C12_6ksi
	set secTagCol2 $C16_6ksi
	set secTagCol3 $C20_6ksi
	set secTagCol4 $C24_6ksi
	set secTagCol5 $C28_6ksi
	set secTagCol6 $C32_6ksi
	set secTagCol7 $C36_6ksi
	set secTagCol8 $C40_6ksi
	set secTagCol9 $C44_6ksi
	
	set iNode [expr 1000*($i-1) + 800]
	set jNode [expr 1000*$i + 800]
	
	set eleTag [expr 1000*$i + 800]

	element dispBeamColumn [expr $eleTag +  9] [expr $iNode +  9] [expr $jNode +  9] $numIntgrPtsCol $secTagCol3 $transfTagVertRecX -integration Lobatto
	element dispBeamColumn [expr $eleTag + 13] [expr $iNode + 13] [expr $jNode + 13] $numIntgrPtsCol $secTagCol3 $transfTagVertRecX -integration Lobatto
	element dispBeamColumn [expr $eleTag + 25] [expr $iNode + 25] [expr $jNode + 25] $numIntgrPtsCol $secTagCol3 $transfTagVertRecX -integration Lobatto
	element dispBeamColumn [expr $eleTag + 82] [expr $iNode + 82] [expr $jNode + 82] $numIntgrPtsCol $secTagCol3 $transfTagVertRecX -integration Lobatto
	
	puts $ModelFile "element dispBeamColumn [expr $eleTag +  9] [expr $iNode +  9] [expr $jNode +  9] $numIntgrPtsCol $secTagCol3 $transfTagVertRecX -integration Lobatto"
	puts $ModelFile "element dispBeamColumn [expr $eleTag + 13] [expr $iNode + 13] [expr $jNode + 13] $numIntgrPtsCol $secTagCol3 $transfTagVertRecX -integration Lobatto"
	puts $ModelFile "element dispBeamColumn [expr $eleTag + 25] [expr $iNode + 25] [expr $jNode + 25] $numIntgrPtsCol $secTagCol3 $transfTagVertRecX -integration Lobatto"
	puts $ModelFile "element dispBeamColumn [expr $eleTag + 82] [expr $iNode + 82] [expr $jNode + 82] $numIntgrPtsCol $secTagCol3 $transfTagVertRecX -integration Lobatto"
	
	element dispBeamColumn [expr $eleTag + 15] [expr $iNode + 15] [expr $jNode + 15] $numIntgrPtsCol $secTagCol2 $transfTagVertRecX -integration Lobatto
	element dispBeamColumn [expr $eleTag + 16] [expr $iNode + 16] [expr $jNode + 16] $numIntgrPtsCol $secTagCol2 $transfTagVertRecX -integration Lobatto
	element dispBeamColumn [expr $eleTag + 17] [expr $iNode + 17] [expr $jNode + 17] $numIntgrPtsCol $secTagCol2 $transfTagVertRecX -integration Lobatto
	element dispBeamColumn [expr $eleTag + 18] [expr $iNode + 18] [expr $jNode + 18] $numIntgrPtsCol $secTagCol2 $transfTagVertRecX -integration Lobatto
	element dispBeamColumn [expr $eleTag + 19] [expr $iNode + 19] [expr $jNode + 19] $numIntgrPtsCol $secTagCol2 $transfTagVertRecX -integration Lobatto
	element dispBeamColumn [expr $eleTag + 20] [expr $iNode + 20] [expr $jNode + 20] $numIntgrPtsCol $secTagCol2 $transfTagVertRecX -integration Lobatto
	element dispBeamColumn [expr $eleTag + 21] [expr $iNode + 21] [expr $jNode + 21] $numIntgrPtsCol $secTagCol2 $transfTagVertRecX -integration Lobatto
	
	puts $ModelFile "element dispBeamColumn [expr $eleTag + 15] [expr $iNode + 15] [expr $jNode + 15] $numIntgrPtsCol $secTagCol2 $transfTagVertRecX -integration Lobatto"
	puts $ModelFile "element dispBeamColumn [expr $eleTag + 16] [expr $iNode + 16] [expr $jNode + 16] $numIntgrPtsCol $secTagCol2 $transfTagVertRecX -integration Lobatto"
	puts $ModelFile "element dispBeamColumn [expr $eleTag + 17] [expr $iNode + 17] [expr $jNode + 17] $numIntgrPtsCol $secTagCol2 $transfTagVertRecX -integration Lobatto"
	puts $ModelFile "element dispBeamColumn [expr $eleTag + 18] [expr $iNode + 18] [expr $jNode + 18] $numIntgrPtsCol $secTagCol2 $transfTagVertRecX -integration Lobatto"
	puts $ModelFile "element dispBeamColumn [expr $eleTag + 19] [expr $iNode + 19] [expr $jNode + 19] $numIntgrPtsCol $secTagCol2 $transfTagVertRecX -integration Lobatto"
	puts $ModelFile "element dispBeamColumn [expr $eleTag + 20] [expr $iNode + 20] [expr $jNode + 20] $numIntgrPtsCol $secTagCol2 $transfTagVertRecX -integration Lobatto"
	puts $ModelFile "element dispBeamColumn [expr $eleTag + 21] [expr $iNode + 21] [expr $jNode + 21] $numIntgrPtsCol $secTagCol2 $transfTagVertRecX -integration Lobatto"
	
	element dispBeamColumn [expr $eleTag + 10] [expr $iNode + 10] [expr $jNode + 10] $numIntgrPtsCol $secTagCol3 $transfTagVertRecX -integration Lobatto
	element dispBeamColumn [expr $eleTag + 11] [expr $iNode + 11] [expr $jNode + 11] $numIntgrPtsCol $secTagCol3 $transfTagVertRecX -integration Lobatto
	element dispBeamColumn [expr $eleTag + 12] [expr $iNode + 12] [expr $jNode + 12] $numIntgrPtsCol $secTagCol3 $transfTagVertRecX -integration Lobatto
	element dispBeamColumn [expr $eleTag + 24] [expr $iNode + 24] [expr $jNode + 24] $numIntgrPtsCol $secTagCol3 $transfTagVertRecX -integration Lobatto
	element dispBeamColumn [expr $eleTag + 26] [expr $iNode + 26] [expr $jNode + 26] $numIntgrPtsCol $secTagCol3 $transfTagVertRecX -integration Lobatto
	element dispBeamColumn [expr $eleTag + 27] [expr $iNode + 27] [expr $jNode + 27] $numIntgrPtsCol $secTagCol3 $transfTagVertRecX -integration Lobatto
	element dispBeamColumn [expr $eleTag + 37] [expr $iNode + 37] [expr $jNode + 37] $numIntgrPtsCol $secTagCol3 $transfTagVertRecX -integration Lobatto
	element dispBeamColumn [expr $eleTag + 38] [expr $iNode + 38] [expr $jNode + 38] $numIntgrPtsCol $secTagCol3 $transfTagVertRecX -integration Lobatto
	element dispBeamColumn [expr $eleTag + 51] [expr $iNode + 51] [expr $jNode + 51] $numIntgrPtsCol $secTagCol3 $transfTagVertRecX -integration Lobatto
	element dispBeamColumn [expr $eleTag + 64] [expr $iNode + 64] [expr $jNode + 64] $numIntgrPtsCol $secTagCol3 $transfTagVertRecX -integration Lobatto
	element dispBeamColumn [expr $eleTag + 73] [expr $iNode + 73] [expr $jNode + 73] $numIntgrPtsCol $secTagCol3 $transfTagVertRecX -integration Lobatto
	element dispBeamColumn [expr $eleTag + 83] [expr $iNode + 83] [expr $jNode + 83] $numIntgrPtsCol $secTagCol3 $transfTagVertRecX -integration Lobatto
	element dispBeamColumn [expr $eleTag + 94] [expr $iNode + 94] [expr $jNode + 94] $numIntgrPtsCol $secTagCol3 $transfTagVertRecX -integration Lobatto
	
	puts $ModelFile "element dispBeamColumn [expr $eleTag + 10] [expr $iNode + 10] [expr $jNode + 10] $numIntgrPtsCol $secTagCol3 $transfTagVertRecX -integration Lobatto"
	puts $ModelFile "element dispBeamColumn [expr $eleTag + 11] [expr $iNode + 11] [expr $jNode + 11] $numIntgrPtsCol $secTagCol3 $transfTagVertRecX -integration Lobatto"
	puts $ModelFile "element dispBeamColumn [expr $eleTag + 12] [expr $iNode + 12] [expr $jNode + 12] $numIntgrPtsCol $secTagCol3 $transfTagVertRecX -integration Lobatto"
	puts $ModelFile "element dispBeamColumn [expr $eleTag + 24] [expr $iNode + 24] [expr $jNode + 24] $numIntgrPtsCol $secTagCol3 $transfTagVertRecX -integration Lobatto"
	puts $ModelFile "element dispBeamColumn [expr $eleTag + 26] [expr $iNode + 26] [expr $jNode + 26] $numIntgrPtsCol $secTagCol3 $transfTagVertRecX -integration Lobatto"
	puts $ModelFile "element dispBeamColumn [expr $eleTag + 27] [expr $iNode + 27] [expr $jNode + 27] $numIntgrPtsCol $secTagCol3 $transfTagVertRecX -integration Lobatto"
	puts $ModelFile "element dispBeamColumn [expr $eleTag + 37] [expr $iNode + 37] [expr $jNode + 37] $numIntgrPtsCol $secTagCol3 $transfTagVertRecX -integration Lobatto"
	puts $ModelFile "element dispBeamColumn [expr $eleTag + 38] [expr $iNode + 38] [expr $jNode + 38] $numIntgrPtsCol $secTagCol3 $transfTagVertRecX -integration Lobatto"
	puts $ModelFile "element dispBeamColumn [expr $eleTag + 51] [expr $iNode + 51] [expr $jNode + 51] $numIntgrPtsCol $secTagCol3 $transfTagVertRecX -integration Lobatto"
	puts $ModelFile "element dispBeamColumn [expr $eleTag + 64] [expr $iNode + 64] [expr $jNode + 64] $numIntgrPtsCol $secTagCol3 $transfTagVertRecX -integration Lobatto"
	puts $ModelFile "element dispBeamColumn [expr $eleTag + 73] [expr $iNode + 73] [expr $jNode + 73] $numIntgrPtsCol $secTagCol3 $transfTagVertRecX -integration Lobatto"
	puts $ModelFile "element dispBeamColumn [expr $eleTag + 83] [expr $iNode + 83] [expr $jNode + 83] $numIntgrPtsCol $secTagCol3 $transfTagVertRecX -integration Lobatto"
	puts $ModelFile "element dispBeamColumn [expr $eleTag + 94] [expr $iNode + 94] [expr $jNode + 94] $numIntgrPtsCol $secTagCol3 $transfTagVertRecX -integration Lobatto"
	
	element dispBeamColumn [expr $eleTag + 22] [expr $iNode + 22] [expr $jNode + 22] $numIntgrPtsCol $secTagCol4 $transfTagVertRecX -integration Lobatto
	element dispBeamColumn [expr $eleTag + 28] [expr $iNode + 28] [expr $jNode + 28] $numIntgrPtsCol $secTagCol4 $transfTagVertRecX -integration Lobatto
	element dispBeamColumn [expr $eleTag + 29] [expr $iNode + 29] [expr $jNode + 29] $numIntgrPtsCol $secTagCol4 $transfTagVertRecX -integration Lobatto
	element dispBeamColumn [expr $eleTag + 30] [expr $iNode + 30] [expr $jNode + 30] $numIntgrPtsCol $secTagCol4 $transfTagVertRecX -integration Lobatto
	element dispBeamColumn [expr $eleTag + 31] [expr $iNode + 31] [expr $jNode + 31] $numIntgrPtsCol $secTagCol4 $transfTagVertRecX -integration Lobatto
	element dispBeamColumn [expr $eleTag + 32] [expr $iNode + 32] [expr $jNode + 32] $numIntgrPtsCol $secTagCol4 $transfTagVertRecX -integration Lobatto
	element dispBeamColumn [expr $eleTag + 33] [expr $iNode + 33] [expr $jNode + 33] $numIntgrPtsCol $secTagCol4 $transfTagVertRecX -integration Lobatto
	element dispBeamColumn [expr $eleTag + 50] [expr $iNode + 50] [expr $jNode + 50] $numIntgrPtsCol $secTagCol4 $transfTagVertRecX -integration Lobatto
	element dispBeamColumn [expr $eleTag + 84] [expr $iNode + 84] [expr $jNode + 84] $numIntgrPtsCol $secTagCol4 $transfTagVertRecX -integration Lobatto
	
	puts $ModelFile "element dispBeamColumn [expr $eleTag + 22] [expr $iNode + 22] [expr $jNode + 22] $numIntgrPtsCol $secTagCol4 $transfTagVertRecX -integration Lobatto"
	puts $ModelFile "element dispBeamColumn [expr $eleTag + 28] [expr $iNode + 28] [expr $jNode + 28] $numIntgrPtsCol $secTagCol4 $transfTagVertRecX -integration Lobatto"
	puts $ModelFile "element dispBeamColumn [expr $eleTag + 29] [expr $iNode + 29] [expr $jNode + 29] $numIntgrPtsCol $secTagCol4 $transfTagVertRecX -integration Lobatto"
	puts $ModelFile "element dispBeamColumn [expr $eleTag + 30] [expr $iNode + 30] [expr $jNode + 30] $numIntgrPtsCol $secTagCol4 $transfTagVertRecX -integration Lobatto"
	puts $ModelFile "element dispBeamColumn [expr $eleTag + 31] [expr $iNode + 31] [expr $jNode + 31] $numIntgrPtsCol $secTagCol4 $transfTagVertRecX -integration Lobatto"
	puts $ModelFile "element dispBeamColumn [expr $eleTag + 32] [expr $iNode + 32] [expr $jNode + 32] $numIntgrPtsCol $secTagCol4 $transfTagVertRecX -integration Lobatto"
	puts $ModelFile "element dispBeamColumn [expr $eleTag + 33] [expr $iNode + 33] [expr $jNode + 33] $numIntgrPtsCol $secTagCol4 $transfTagVertRecX -integration Lobatto"
	puts $ModelFile "element dispBeamColumn [expr $eleTag + 50] [expr $iNode + 50] [expr $jNode + 50] $numIntgrPtsCol $secTagCol4 $transfTagVertRecX -integration Lobatto"
	puts $ModelFile "element dispBeamColumn [expr $eleTag + 84] [expr $iNode + 84] [expr $jNode + 84] $numIntgrPtsCol $secTagCol4 $transfTagVertRecX -integration Lobatto"

	element dispBeamColumn [expr $eleTag + 23] [expr $iNode + 23] [expr $jNode + 23] $numIntgrPtsCol $secTagCol5 $transfTagVertRecX -integration Lobatto
	element dispBeamColumn [expr $eleTag + 34] [expr $iNode + 34] [expr $jNode + 34] $numIntgrPtsCol $secTagCol5 $transfTagVertRecX -integration Lobatto
	element dispBeamColumn [expr $eleTag + 35] [expr $iNode + 35] [expr $jNode + 35] $numIntgrPtsCol $secTagCol5 $transfTagVertRecX -integration Lobatto
	element dispBeamColumn [expr $eleTag + 36] [expr $iNode + 36] [expr $jNode + 36] $numIntgrPtsCol $secTagCol5 $transfTagVertRecX -integration Lobatto
	element dispBeamColumn [expr $eleTag + 39] [expr $iNode + 39] [expr $jNode + 39] $numIntgrPtsCol $secTagCol5 $transfTagVertRecX -integration Lobatto
	element dispBeamColumn [expr $eleTag + 40] [expr $iNode + 40] [expr $jNode + 40] $numIntgrPtsCol $secTagCol5 $transfTagVertRecX -integration Lobatto
	element dispBeamColumn [expr $eleTag + 41] [expr $iNode + 41] [expr $jNode + 41] $numIntgrPtsCol $secTagCol5 $transfTagVertRecX -integration Lobatto
	element dispBeamColumn [expr $eleTag + 42] [expr $iNode + 42] [expr $jNode + 42] $numIntgrPtsCol $secTagCol5 $transfTagVertRecX -integration Lobatto
	element dispBeamColumn [expr $eleTag + 48] [expr $iNode + 48] [expr $jNode + 48] $numIntgrPtsCol $secTagCol5 $transfTagVertRecX -integration Lobatto
	element dispBeamColumn [expr $eleTag + 49] [expr $iNode + 49] [expr $jNode + 49] $numIntgrPtsCol $secTagCol5 $transfTagVertRecX -integration Lobatto
	element dispBeamColumn [expr $eleTag + 52] [expr $iNode + 52] [expr $jNode + 52] $numIntgrPtsCol $secTagCol5 $transfTagVertRecX -integration Lobatto
	element dispBeamColumn [expr $eleTag + 53] [expr $iNode + 53] [expr $jNode + 53] $numIntgrPtsCol $secTagCol5 $transfTagVertRecX -integration Lobatto
	element dispBeamColumn [expr $eleTag + 54] [expr $iNode + 54] [expr $jNode + 54] $numIntgrPtsCol $secTagCol5 $transfTagVertRecX -integration Lobatto
	element dispBeamColumn [expr $eleTag + 62] [expr $iNode + 62] [expr $jNode + 62] $numIntgrPtsCol $secTagCol5 $transfTagVertRecX -integration Lobatto
	element dispBeamColumn [expr $eleTag + 63] [expr $iNode + 63] [expr $jNode + 63] $numIntgrPtsCol $secTagCol5 $transfTagVertRecX -integration Lobatto
	element dispBeamColumn [expr $eleTag + 65] [expr $iNode + 65] [expr $jNode + 65] $numIntgrPtsCol $secTagCol5 $transfTagVertRecX -integration Lobatto
	element dispBeamColumn [expr $eleTag + 66] [expr $iNode + 66] [expr $jNode + 66] $numIntgrPtsCol $secTagCol5 $transfTagVertRecX -integration Lobatto
	element dispBeamColumn [expr $eleTag + 72] [expr $iNode + 72] [expr $jNode + 72] $numIntgrPtsCol $secTagCol5 $transfTagVertRecX -integration Lobatto
	element dispBeamColumn [expr $eleTag + 74] [expr $iNode + 74] [expr $jNode + 74] $numIntgrPtsCol $secTagCol5 $transfTagVertRecX -integration Lobatto
	element dispBeamColumn [expr $eleTag + 75] [expr $iNode + 75] [expr $jNode + 75] $numIntgrPtsCol $secTagCol5 $transfTagVertRecX -integration Lobatto
	element dispBeamColumn [expr $eleTag + 81] [expr $iNode + 81] [expr $jNode + 81] $numIntgrPtsCol $secTagCol5 $transfTagVertRecX -integration Lobatto
	element dispBeamColumn [expr $eleTag + 85] [expr $iNode + 85] [expr $jNode + 85] $numIntgrPtsCol $secTagCol5 $transfTagVertRecX -integration Lobatto
	element dispBeamColumn [expr $eleTag + 86] [expr $iNode + 86] [expr $jNode + 86] $numIntgrPtsCol $secTagCol5 $transfTagVertRecX -integration Lobatto
	element dispBeamColumn [expr $eleTag + 92] [expr $iNode + 92] [expr $jNode + 92] $numIntgrPtsCol $secTagCol5 $transfTagVertRecX -integration Lobatto
	element dispBeamColumn [expr $eleTag + 93] [expr $iNode + 93] [expr $jNode + 93] $numIntgrPtsCol $secTagCol5 $transfTagVertRecX -integration Lobatto
	
	puts $ModelFile "element dispBeamColumn [expr $eleTag + 23] [expr $iNode + 23] [expr $jNode + 23] $numIntgrPtsCol $secTagCol5 $transfTagVertRecX -integration Lobatto"
	puts $ModelFile "element dispBeamColumn [expr $eleTag + 34] [expr $iNode + 34] [expr $jNode + 34] $numIntgrPtsCol $secTagCol5 $transfTagVertRecX -integration Lobatto"
	puts $ModelFile "element dispBeamColumn [expr $eleTag + 35] [expr $iNode + 35] [expr $jNode + 35] $numIntgrPtsCol $secTagCol5 $transfTagVertRecX -integration Lobatto"
	puts $ModelFile "element dispBeamColumn [expr $eleTag + 36] [expr $iNode + 36] [expr $jNode + 36] $numIntgrPtsCol $secTagCol5 $transfTagVertRecX -integration Lobatto"
	puts $ModelFile "element dispBeamColumn [expr $eleTag + 39] [expr $iNode + 39] [expr $jNode + 39] $numIntgrPtsCol $secTagCol5 $transfTagVertRecX -integration Lobatto"
	puts $ModelFile "element dispBeamColumn [expr $eleTag + 40] [expr $iNode + 40] [expr $jNode + 40] $numIntgrPtsCol $secTagCol5 $transfTagVertRecX -integration Lobatto"
	puts $ModelFile "element dispBeamColumn [expr $eleTag + 41] [expr $iNode + 41] [expr $jNode + 41] $numIntgrPtsCol $secTagCol5 $transfTagVertRecX -integration Lobatto"
	puts $ModelFile "element dispBeamColumn [expr $eleTag + 42] [expr $iNode + 42] [expr $jNode + 42] $numIntgrPtsCol $secTagCol5 $transfTagVertRecX -integration Lobatto"
	puts $ModelFile "element dispBeamColumn [expr $eleTag + 48] [expr $iNode + 48] [expr $jNode + 48] $numIntgrPtsCol $secTagCol5 $transfTagVertRecX -integration Lobatto"
	puts $ModelFile "element dispBeamColumn [expr $eleTag + 49] [expr $iNode + 49] [expr $jNode + 49] $numIntgrPtsCol $secTagCol5 $transfTagVertRecX -integration Lobatto"
	puts $ModelFile "element dispBeamColumn [expr $eleTag + 52] [expr $iNode + 52] [expr $jNode + 52] $numIntgrPtsCol $secTagCol5 $transfTagVertRecX -integration Lobatto"
	puts $ModelFile "element dispBeamColumn [expr $eleTag + 53] [expr $iNode + 53] [expr $jNode + 53] $numIntgrPtsCol $secTagCol5 $transfTagVertRecX -integration Lobatto"
	puts $ModelFile "element dispBeamColumn [expr $eleTag + 54] [expr $iNode + 54] [expr $jNode + 54] $numIntgrPtsCol $secTagCol5 $transfTagVertRecX -integration Lobatto"
	puts $ModelFile "element dispBeamColumn [expr $eleTag + 62] [expr $iNode + 62] [expr $jNode + 62] $numIntgrPtsCol $secTagCol5 $transfTagVertRecX -integration Lobatto"
	puts $ModelFile "element dispBeamColumn [expr $eleTag + 63] [expr $iNode + 63] [expr $jNode + 63] $numIntgrPtsCol $secTagCol5 $transfTagVertRecX -integration Lobatto"
	puts $ModelFile "element dispBeamColumn [expr $eleTag + 65] [expr $iNode + 65] [expr $jNode + 65] $numIntgrPtsCol $secTagCol5 $transfTagVertRecX -integration Lobatto"
	puts $ModelFile "element dispBeamColumn [expr $eleTag + 66] [expr $iNode + 66] [expr $jNode + 66] $numIntgrPtsCol $secTagCol5 $transfTagVertRecX -integration Lobatto"
	puts $ModelFile "element dispBeamColumn [expr $eleTag + 72] [expr $iNode + 72] [expr $jNode + 72] $numIntgrPtsCol $secTagCol5 $transfTagVertRecX -integration Lobatto"
	puts $ModelFile "element dispBeamColumn [expr $eleTag + 74] [expr $iNode + 74] [expr $jNode + 74] $numIntgrPtsCol $secTagCol5 $transfTagVertRecX -integration Lobatto"
	puts $ModelFile "element dispBeamColumn [expr $eleTag + 75] [expr $iNode + 75] [expr $jNode + 75] $numIntgrPtsCol $secTagCol5 $transfTagVertRecX -integration Lobatto"
	puts $ModelFile "element dispBeamColumn [expr $eleTag + 81] [expr $iNode + 81] [expr $jNode + 81] $numIntgrPtsCol $secTagCol5 $transfTagVertRecX -integration Lobatto"
	puts $ModelFile "element dispBeamColumn [expr $eleTag + 85] [expr $iNode + 85] [expr $jNode + 85] $numIntgrPtsCol $secTagCol5 $transfTagVertRecX -integration Lobatto"
	puts $ModelFile "element dispBeamColumn [expr $eleTag + 86] [expr $iNode + 86] [expr $jNode + 86] $numIntgrPtsCol $secTagCol5 $transfTagVertRecX -integration Lobatto"
	puts $ModelFile "element dispBeamColumn [expr $eleTag + 92] [expr $iNode + 92] [expr $jNode + 92] $numIntgrPtsCol $secTagCol5 $transfTagVertRecX -integration Lobatto"
	puts $ModelFile "element dispBeamColumn [expr $eleTag + 93] [expr $iNode + 93] [expr $jNode + 93] $numIntgrPtsCol $secTagCol5 $transfTagVertRecX -integration Lobatto"

	element dispBeamColumn [expr $eleTag + 87] [expr $iNode + 87] [expr $jNode + 87] $numIntgrPtsCol $secTagCol6 $transfTagVertRecX -integration Lobatto
	element dispBeamColumn [expr $eleTag + 88] [expr $iNode + 88] [expr $jNode + 88] $numIntgrPtsCol $secTagCol6 $transfTagVertRecX -integration Lobatto
	element dispBeamColumn [expr $eleTag + 89] [expr $iNode + 89] [expr $jNode + 89] $numIntgrPtsCol $secTagCol6 $transfTagVertRecX -integration Lobatto
	element dispBeamColumn [expr $eleTag + 90] [expr $iNode + 90] [expr $jNode + 90] $numIntgrPtsCol $secTagCol6 $transfTagVertRecX -integration Lobatto
	element dispBeamColumn [expr $eleTag + 91] [expr $iNode + 91] [expr $jNode + 91] $numIntgrPtsCol $secTagCol6 $transfTagVertRecX -integration Lobatto
	
	puts $ModelFile "element dispBeamColumn [expr $eleTag + 87] [expr $iNode + 87] [expr $jNode + 87] $numIntgrPtsCol $secTagCol6 $transfTagVertRecX -integration Lobatto"
	puts $ModelFile "element dispBeamColumn [expr $eleTag + 88] [expr $iNode + 88] [expr $jNode + 88] $numIntgrPtsCol $secTagCol6 $transfTagVertRecX -integration Lobatto"
	puts $ModelFile "element dispBeamColumn [expr $eleTag + 89] [expr $iNode + 89] [expr $jNode + 89] $numIntgrPtsCol $secTagCol6 $transfTagVertRecX -integration Lobatto"
	puts $ModelFile "element dispBeamColumn [expr $eleTag + 90] [expr $iNode + 90] [expr $jNode + 90] $numIntgrPtsCol $secTagCol6 $transfTagVertRecX -integration Lobatto"
	puts $ModelFile "element dispBeamColumn [expr $eleTag + 91] [expr $iNode + 91] [expr $jNode + 91] $numIntgrPtsCol $secTagCol6 $transfTagVertRecX -integration Lobatto"
	
	element dispBeamColumn [expr $eleTag + 43] [expr $iNode + 43] [expr $jNode + 43] $numIntgrPtsCol $secTagCol7 $transfTagVertRecX -integration Lobatto
	element dispBeamColumn [expr $eleTag + 46] [expr $iNode + 46] [expr $jNode + 46] $numIntgrPtsCol $secTagCol7 $transfTagVertRecX -integration Lobatto
	element dispBeamColumn [expr $eleTag + 47] [expr $iNode + 47] [expr $jNode + 47] $numIntgrPtsCol $secTagCol7 $transfTagVertRecX -integration Lobatto
	element dispBeamColumn [expr $eleTag + 55] [expr $iNode + 55] [expr $jNode + 55] $numIntgrPtsCol $secTagCol7 $transfTagVertRecX -integration Lobatto
	element dispBeamColumn [expr $eleTag + 60] [expr $iNode + 60] [expr $jNode + 60] $numIntgrPtsCol $secTagCol7 $transfTagVertRecX -integration Lobatto
	element dispBeamColumn [expr $eleTag + 61] [expr $iNode + 61] [expr $jNode + 61] $numIntgrPtsCol $secTagCol7 $transfTagVertRecX -integration Lobatto
	element dispBeamColumn [expr $eleTag + 67] [expr $iNode + 67] [expr $jNode + 67] $numIntgrPtsCol $secTagCol7 $transfTagVertRecX -integration Lobatto
	element dispBeamColumn [expr $eleTag + 71] [expr $iNode + 71] [expr $jNode + 71] $numIntgrPtsCol $secTagCol7 $transfTagVertRecX -integration Lobatto
	element dispBeamColumn [expr $eleTag + 76] [expr $iNode + 76] [expr $jNode + 76] $numIntgrPtsCol $secTagCol7 $transfTagVertRecX -integration Lobatto
	element dispBeamColumn [expr $eleTag + 80] [expr $iNode + 80] [expr $jNode + 80] $numIntgrPtsCol $secTagCol7 $transfTagVertRecX -integration Lobatto
	
	puts $ModelFile "element dispBeamColumn [expr $eleTag + 43] [expr $iNode + 43] [expr $jNode + 43] $numIntgrPtsCol $secTagCol7 $transfTagVertRecX -integration Lobatto"
	puts $ModelFile "element dispBeamColumn [expr $eleTag + 46] [expr $iNode + 46] [expr $jNode + 46] $numIntgrPtsCol $secTagCol7 $transfTagVertRecX -integration Lobatto"
	puts $ModelFile "element dispBeamColumn [expr $eleTag + 47] [expr $iNode + 47] [expr $jNode + 47] $numIntgrPtsCol $secTagCol7 $transfTagVertRecX -integration Lobatto"
	puts $ModelFile "element dispBeamColumn [expr $eleTag + 55] [expr $iNode + 55] [expr $jNode + 55] $numIntgrPtsCol $secTagCol7 $transfTagVertRecX -integration Lobatto"
	puts $ModelFile "element dispBeamColumn [expr $eleTag + 60] [expr $iNode + 60] [expr $jNode + 60] $numIntgrPtsCol $secTagCol7 $transfTagVertRecX -integration Lobatto"
	puts $ModelFile "element dispBeamColumn [expr $eleTag + 61] [expr $iNode + 61] [expr $jNode + 61] $numIntgrPtsCol $secTagCol7 $transfTagVertRecX -integration Lobatto"
	puts $ModelFile "element dispBeamColumn [expr $eleTag + 67] [expr $iNode + 67] [expr $jNode + 67] $numIntgrPtsCol $secTagCol7 $transfTagVertRecX -integration Lobatto"
	puts $ModelFile "element dispBeamColumn [expr $eleTag + 71] [expr $iNode + 71] [expr $jNode + 71] $numIntgrPtsCol $secTagCol7 $transfTagVertRecX -integration Lobatto"
	puts $ModelFile "element dispBeamColumn [expr $eleTag + 76] [expr $iNode + 76] [expr $jNode + 76] $numIntgrPtsCol $secTagCol7 $transfTagVertRecX -integration Lobatto"
	puts $ModelFile "element dispBeamColumn [expr $eleTag + 80] [expr $iNode + 80] [expr $jNode + 80] $numIntgrPtsCol $secTagCol7 $transfTagVertRecX -integration Lobatto"
	
	element dispBeamColumn [expr $eleTag + 44] [expr $iNode + 44] [expr $jNode + 44] $numIntgrPtsCol $secTagCol8 $transfTagVertRecX -integration Lobatto
	element dispBeamColumn [expr $eleTag + 45] [expr $iNode + 45] [expr $jNode + 45] $numIntgrPtsCol $secTagCol8 $transfTagVertRecX -integration Lobatto
	
	puts $ModelFile "element dispBeamColumn [expr $eleTag + 44] [expr $iNode + 44] [expr $jNode + 44] $numIntgrPtsCol $secTagCol8 $transfTagVertRecX -integration Lobatto"
	puts $ModelFile "element dispBeamColumn [expr $eleTag + 45] [expr $iNode + 45] [expr $jNode + 45] $numIntgrPtsCol $secTagCol8 $transfTagVertRecX -integration Lobatto"
	
	element dispBeamColumn [expr $eleTag + 56] [expr $iNode + 56] [expr $jNode + 56] $numIntgrPtsCol $secTagCol9 $transfTagVertRecX -integration Lobatto
	element dispBeamColumn [expr $eleTag + 57] [expr $iNode + 57] [expr $jNode + 57] $numIntgrPtsCol $secTagCol9 $transfTagVertRecX -integration Lobatto
	element dispBeamColumn [expr $eleTag + 58] [expr $iNode + 58] [expr $jNode + 58] $numIntgrPtsCol $secTagCol9 $transfTagVertRecX -integration Lobatto
	element dispBeamColumn [expr $eleTag + 59] [expr $iNode + 59] [expr $jNode + 59] $numIntgrPtsCol $secTagCol9 $transfTagVertRecX -integration Lobatto
	element dispBeamColumn [expr $eleTag + 68] [expr $iNode + 68] [expr $jNode + 68] $numIntgrPtsCol $secTagCol9 $transfTagVertRecX -integration Lobatto
	element dispBeamColumn [expr $eleTag + 69] [expr $iNode + 69] [expr $jNode + 69] $numIntgrPtsCol $secTagCol9 $transfTagVertRecX -integration Lobatto
	element dispBeamColumn [expr $eleTag + 70] [expr $iNode + 70] [expr $jNode + 70] $numIntgrPtsCol $secTagCol9 $transfTagVertRecX -integration Lobatto
	element dispBeamColumn [expr $eleTag + 77] [expr $iNode + 77] [expr $jNode + 77] $numIntgrPtsCol $secTagCol9 $transfTagVertRecX -integration Lobatto
	element dispBeamColumn [expr $eleTag + 78] [expr $iNode + 78] [expr $jNode + 78] $numIntgrPtsCol $secTagCol9 $transfTagVertRecX -integration Lobatto
	element dispBeamColumn [expr $eleTag + 79] [expr $iNode + 79] [expr $jNode + 79] $numIntgrPtsCol $secTagCol9 $transfTagVertRecX -integration Lobatto
	
	puts $ModelFile "element dispBeamColumn [expr $eleTag + 56] [expr $iNode + 56] [expr $jNode + 56] $numIntgrPtsCol $secTagCol9 $transfTagVertRecX -integration Lobatto"
	puts $ModelFile "element dispBeamColumn [expr $eleTag + 57] [expr $iNode + 57] [expr $jNode + 57] $numIntgrPtsCol $secTagCol9 $transfTagVertRecX -integration Lobatto"
	puts $ModelFile "element dispBeamColumn [expr $eleTag + 58] [expr $iNode + 58] [expr $jNode + 58] $numIntgrPtsCol $secTagCol9 $transfTagVertRecX -integration Lobatto"
	puts $ModelFile "element dispBeamColumn [expr $eleTag + 59] [expr $iNode + 59] [expr $jNode + 59] $numIntgrPtsCol $secTagCol9 $transfTagVertRecX -integration Lobatto"
	puts $ModelFile "element dispBeamColumn [expr $eleTag + 68] [expr $iNode + 68] [expr $jNode + 68] $numIntgrPtsCol $secTagCol9 $transfTagVertRecX -integration Lobatto"
	puts $ModelFile "element dispBeamColumn [expr $eleTag + 69] [expr $iNode + 69] [expr $jNode + 69] $numIntgrPtsCol $secTagCol9 $transfTagVertRecX -integration Lobatto"
	puts $ModelFile "element dispBeamColumn [expr $eleTag + 70] [expr $iNode + 70] [expr $jNode + 70] $numIntgrPtsCol $secTagCol9 $transfTagVertRecX -integration Lobatto"
	puts $ModelFile "element dispBeamColumn [expr $eleTag + 77] [expr $iNode + 77] [expr $jNode + 77] $numIntgrPtsCol $secTagCol9 $transfTagVertRecX -integration Lobatto"
	puts $ModelFile "element dispBeamColumn [expr $eleTag + 78] [expr $iNode + 78] [expr $jNode + 78] $numIntgrPtsCol $secTagCol9 $transfTagVertRecX -integration Lobatto"
	puts $ModelFile "element dispBeamColumn [expr $eleTag + 79] [expr $iNode + 79] [expr $jNode + 79] $numIntgrPtsCol $secTagCol9 $transfTagVertRecX -integration Lobatto"
}

 # 3 - 6 Podiums
for {set i 4} {$i <= 6} {incr i 1} {
	
	set secTagCol1 $C12_6ksi
	set secTagCol2 $C20_6ksi
	set secTagCol3 $C24_6ksi
	set secTagCol4 $C28_6ksi
	set secTagCol5 $C32_6ksi
	set secTagCol6 $C36_6ksi
	set secTagCol7 $C40_6ksi
	set secTagCol8 $C44_6ksi
	
	set iNode [expr 1000*($i-1) + 800]
	set jNode [expr 1000*$i + 800]
	
	set eleTag [expr 1000*$i + 800]

	element dispBeamColumn [expr $eleTag +  9] [expr $iNode +  9] [expr $jNode +  9] $numIntgrPtsCol $secTagCol2 $transfTagVertRecX -integration Lobatto
	element dispBeamColumn [expr $eleTag + 13] [expr $iNode + 13] [expr $jNode + 13] $numIntgrPtsCol $secTagCol2 $transfTagVertRecX -integration Lobatto
	element dispBeamColumn [expr $eleTag + 25] [expr $iNode + 25] [expr $jNode + 25] $numIntgrPtsCol $secTagCol2 $transfTagVertRecX -integration Lobatto
	element dispBeamColumn [expr $eleTag + 82] [expr $iNode + 82] [expr $jNode + 82] $numIntgrPtsCol $secTagCol2 $transfTagVertRecX -integration Lobatto
	
	puts $ModelFile "element dispBeamColumn [expr $eleTag +  9] [expr $iNode +  9] [expr $jNode +  9] $numIntgrPtsCol $secTagCol2 $transfTagVertRecX -integration Lobatto"
	puts $ModelFile "element dispBeamColumn [expr $eleTag + 13] [expr $iNode + 13] [expr $jNode + 13] $numIntgrPtsCol $secTagCol2 $transfTagVertRecX -integration Lobatto"
	puts $ModelFile "element dispBeamColumn [expr $eleTag + 25] [expr $iNode + 25] [expr $jNode + 25] $numIntgrPtsCol $secTagCol2 $transfTagVertRecX -integration Lobatto"
	puts $ModelFile "element dispBeamColumn [expr $eleTag + 82] [expr $iNode + 82] [expr $jNode + 82] $numIntgrPtsCol $secTagCol2 $transfTagVertRecX -integration Lobatto"
	
	element dispBeamColumn [expr $eleTag + 10] [expr $iNode + 10] [expr $jNode + 10] $numIntgrPtsCol $secTagCol2 $transfTagVertRecX -integration Lobatto
	element dispBeamColumn [expr $eleTag + 11] [expr $iNode + 11] [expr $jNode + 11] $numIntgrPtsCol $secTagCol2 $transfTagVertRecX -integration Lobatto
	element dispBeamColumn [expr $eleTag + 12] [expr $iNode + 12] [expr $jNode + 12] $numIntgrPtsCol $secTagCol2 $transfTagVertRecX -integration Lobatto
	element dispBeamColumn [expr $eleTag + 22] [expr $iNode + 22] [expr $jNode + 22] $numIntgrPtsCol $secTagCol2 $transfTagVertRecX -integration Lobatto
	element dispBeamColumn [expr $eleTag + 24] [expr $iNode + 24] [expr $jNode + 24] $numIntgrPtsCol $secTagCol2 $transfTagVertRecX -integration Lobatto
	element dispBeamColumn [expr $eleTag + 26] [expr $iNode + 26] [expr $jNode + 26] $numIntgrPtsCol $secTagCol2 $transfTagVertRecX -integration Lobatto
	element dispBeamColumn [expr $eleTag + 27] [expr $iNode + 27] [expr $jNode + 27] $numIntgrPtsCol $secTagCol2 $transfTagVertRecX -integration Lobatto
	element dispBeamColumn [expr $eleTag + 28] [expr $iNode + 28] [expr $jNode + 28] $numIntgrPtsCol $secTagCol2 $transfTagVertRecX -integration Lobatto
	element dispBeamColumn [expr $eleTag + 29] [expr $iNode + 29] [expr $jNode + 29] $numIntgrPtsCol $secTagCol2 $transfTagVertRecX -integration Lobatto
	element dispBeamColumn [expr $eleTag + 30] [expr $iNode + 30] [expr $jNode + 30] $numIntgrPtsCol $secTagCol2 $transfTagVertRecX -integration Lobatto
	element dispBeamColumn [expr $eleTag + 31] [expr $iNode + 31] [expr $jNode + 31] $numIntgrPtsCol $secTagCol2 $transfTagVertRecX -integration Lobatto
	element dispBeamColumn [expr $eleTag + 32] [expr $iNode + 32] [expr $jNode + 32] $numIntgrPtsCol $secTagCol2 $transfTagVertRecX -integration Lobatto
	element dispBeamColumn [expr $eleTag + 33] [expr $iNode + 33] [expr $jNode + 33] $numIntgrPtsCol $secTagCol2 $transfTagVertRecX -integration Lobatto
	element dispBeamColumn [expr $eleTag + 37] [expr $iNode + 37] [expr $jNode + 37] $numIntgrPtsCol $secTagCol2 $transfTagVertRecX -integration Lobatto
	element dispBeamColumn [expr $eleTag + 38] [expr $iNode + 38] [expr $jNode + 38] $numIntgrPtsCol $secTagCol2 $transfTagVertRecX -integration Lobatto
	element dispBeamColumn [expr $eleTag + 51] [expr $iNode + 51] [expr $jNode + 51] $numIntgrPtsCol $secTagCol2 $transfTagVertRecX -integration Lobatto
	element dispBeamColumn [expr $eleTag + 64] [expr $iNode + 64] [expr $jNode + 64] $numIntgrPtsCol $secTagCol2 $transfTagVertRecX -integration Lobatto
	element dispBeamColumn [expr $eleTag + 73] [expr $iNode + 73] [expr $jNode + 73] $numIntgrPtsCol $secTagCol2 $transfTagVertRecX -integration Lobatto
	element dispBeamColumn [expr $eleTag + 83] [expr $iNode + 83] [expr $jNode + 83] $numIntgrPtsCol $secTagCol2 $transfTagVertRecX -integration Lobatto
	element dispBeamColumn [expr $eleTag + 94] [expr $iNode + 94] [expr $jNode + 94] $numIntgrPtsCol $secTagCol2 $transfTagVertRecX -integration Lobatto
	
	puts $ModelFile "element dispBeamColumn [expr $eleTag + 10] [expr $iNode + 10] [expr $jNode + 10] $numIntgrPtsCol $secTagCol2 $transfTagVertRecX -integration Lobatto"
	puts $ModelFile "element dispBeamColumn [expr $eleTag + 11] [expr $iNode + 11] [expr $jNode + 11] $numIntgrPtsCol $secTagCol2 $transfTagVertRecX -integration Lobatto"
	puts $ModelFile "element dispBeamColumn [expr $eleTag + 12] [expr $iNode + 12] [expr $jNode + 12] $numIntgrPtsCol $secTagCol2 $transfTagVertRecX -integration Lobatto"
	puts $ModelFile "element dispBeamColumn [expr $eleTag + 22] [expr $iNode + 22] [expr $jNode + 22] $numIntgrPtsCol $secTagCol2 $transfTagVertRecX -integration Lobatto"
	puts $ModelFile "element dispBeamColumn [expr $eleTag + 24] [expr $iNode + 24] [expr $jNode + 24] $numIntgrPtsCol $secTagCol2 $transfTagVertRecX -integration Lobatto"
	puts $ModelFile "element dispBeamColumn [expr $eleTag + 26] [expr $iNode + 26] [expr $jNode + 26] $numIntgrPtsCol $secTagCol2 $transfTagVertRecX -integration Lobatto"
	puts $ModelFile "element dispBeamColumn [expr $eleTag + 27] [expr $iNode + 27] [expr $jNode + 27] $numIntgrPtsCol $secTagCol2 $transfTagVertRecX -integration Lobatto"
	puts $ModelFile "element dispBeamColumn [expr $eleTag + 28] [expr $iNode + 28] [expr $jNode + 28] $numIntgrPtsCol $secTagCol2 $transfTagVertRecX -integration Lobatto"
	puts $ModelFile "element dispBeamColumn [expr $eleTag + 29] [expr $iNode + 29] [expr $jNode + 29] $numIntgrPtsCol $secTagCol2 $transfTagVertRecX -integration Lobatto"
	puts $ModelFile "element dispBeamColumn [expr $eleTag + 30] [expr $iNode + 30] [expr $jNode + 30] $numIntgrPtsCol $secTagCol2 $transfTagVertRecX -integration Lobatto"
	puts $ModelFile "element dispBeamColumn [expr $eleTag + 31] [expr $iNode + 31] [expr $jNode + 31] $numIntgrPtsCol $secTagCol2 $transfTagVertRecX -integration Lobatto"
	puts $ModelFile "element dispBeamColumn [expr $eleTag + 32] [expr $iNode + 32] [expr $jNode + 32] $numIntgrPtsCol $secTagCol2 $transfTagVertRecX -integration Lobatto"
	puts $ModelFile "element dispBeamColumn [expr $eleTag + 33] [expr $iNode + 33] [expr $jNode + 33] $numIntgrPtsCol $secTagCol2 $transfTagVertRecX -integration Lobatto"
	puts $ModelFile "element dispBeamColumn [expr $eleTag + 37] [expr $iNode + 37] [expr $jNode + 37] $numIntgrPtsCol $secTagCol2 $transfTagVertRecX -integration Lobatto"
	puts $ModelFile "element dispBeamColumn [expr $eleTag + 38] [expr $iNode + 38] [expr $jNode + 38] $numIntgrPtsCol $secTagCol2 $transfTagVertRecX -integration Lobatto"
	puts $ModelFile "element dispBeamColumn [expr $eleTag + 51] [expr $iNode + 51] [expr $jNode + 51] $numIntgrPtsCol $secTagCol2 $transfTagVertRecX -integration Lobatto"
	puts $ModelFile "element dispBeamColumn [expr $eleTag + 64] [expr $iNode + 64] [expr $jNode + 64] $numIntgrPtsCol $secTagCol2 $transfTagVertRecX -integration Lobatto"
	puts $ModelFile "element dispBeamColumn [expr $eleTag + 73] [expr $iNode + 73] [expr $jNode + 73] $numIntgrPtsCol $secTagCol2 $transfTagVertRecX -integration Lobatto"
	puts $ModelFile "element dispBeamColumn [expr $eleTag + 83] [expr $iNode + 83] [expr $jNode + 83] $numIntgrPtsCol $secTagCol2 $transfTagVertRecX -integration Lobatto"
	puts $ModelFile "element dispBeamColumn [expr $eleTag + 94] [expr $iNode + 94] [expr $jNode + 94] $numIntgrPtsCol $secTagCol2 $transfTagVertRecX -integration Lobatto"
	
	element dispBeamColumn [expr $eleTag + 23] [expr $iNode + 23] [expr $jNode + 23] $numIntgrPtsCol $secTagCol3 $transfTagVertRecX -integration Lobatto
	element dispBeamColumn [expr $eleTag + 34] [expr $iNode + 34] [expr $jNode + 34] $numIntgrPtsCol $secTagCol3 $transfTagVertRecX -integration Lobatto
	element dispBeamColumn [expr $eleTag + 35] [expr $iNode + 35] [expr $jNode + 35] $numIntgrPtsCol $secTagCol3 $transfTagVertRecX -integration Lobatto
	element dispBeamColumn [expr $eleTag + 36] [expr $iNode + 36] [expr $jNode + 36] $numIntgrPtsCol $secTagCol3 $transfTagVertRecX -integration Lobatto
	element dispBeamColumn [expr $eleTag + 50] [expr $iNode + 50] [expr $jNode + 50] $numIntgrPtsCol $secTagCol3 $transfTagVertRecX -integration Lobatto
	element dispBeamColumn [expr $eleTag + 65] [expr $iNode + 65] [expr $jNode + 65] $numIntgrPtsCol $secTagCol3 $transfTagVertRecX -integration Lobatto
	element dispBeamColumn [expr $eleTag + 74] [expr $iNode + 74] [expr $jNode + 74] $numIntgrPtsCol $secTagCol3 $transfTagVertRecX -integration Lobatto
	element dispBeamColumn [expr $eleTag + 84] [expr $iNode + 84] [expr $jNode + 84] $numIntgrPtsCol $secTagCol3 $transfTagVertRecX -integration Lobatto
	
	puts $ModelFile "element dispBeamColumn [expr $eleTag + 23] [expr $iNode + 23] [expr $jNode + 23] $numIntgrPtsCol $secTagCol3 $transfTagVertRecX -integration Lobatto"
	puts $ModelFile "element dispBeamColumn [expr $eleTag + 34] [expr $iNode + 34] [expr $jNode + 34] $numIntgrPtsCol $secTagCol3 $transfTagVertRecX -integration Lobatto"
	puts $ModelFile "element dispBeamColumn [expr $eleTag + 35] [expr $iNode + 35] [expr $jNode + 35] $numIntgrPtsCol $secTagCol3 $transfTagVertRecX -integration Lobatto"
	puts $ModelFile "element dispBeamColumn [expr $eleTag + 36] [expr $iNode + 36] [expr $jNode + 36] $numIntgrPtsCol $secTagCol3 $transfTagVertRecX -integration Lobatto"
	puts $ModelFile "element dispBeamColumn [expr $eleTag + 50] [expr $iNode + 50] [expr $jNode + 50] $numIntgrPtsCol $secTagCol3 $transfTagVertRecX -integration Lobatto"
	puts $ModelFile "element dispBeamColumn [expr $eleTag + 65] [expr $iNode + 65] [expr $jNode + 65] $numIntgrPtsCol $secTagCol3 $transfTagVertRecX -integration Lobatto"
	puts $ModelFile "element dispBeamColumn [expr $eleTag + 74] [expr $iNode + 74] [expr $jNode + 74] $numIntgrPtsCol $secTagCol3 $transfTagVertRecX -integration Lobatto"
	puts $ModelFile "element dispBeamColumn [expr $eleTag + 84] [expr $iNode + 84] [expr $jNode + 84] $numIntgrPtsCol $secTagCol3 $transfTagVertRecX -integration Lobatto"
	
	element dispBeamColumn [expr $eleTag + 39] [expr $iNode + 39] [expr $jNode + 39] $numIntgrPtsCol $secTagCol4 $transfTagVertRecX -integration Lobatto
	element dispBeamColumn [expr $eleTag + 40] [expr $iNode + 40] [expr $jNode + 40] $numIntgrPtsCol $secTagCol4 $transfTagVertRecX -integration Lobatto
	element dispBeamColumn [expr $eleTag + 41] [expr $iNode + 41] [expr $jNode + 41] $numIntgrPtsCol $secTagCol4 $transfTagVertRecX -integration Lobatto
	element dispBeamColumn [expr $eleTag + 42] [expr $iNode + 42] [expr $jNode + 42] $numIntgrPtsCol $secTagCol4 $transfTagVertRecX -integration Lobatto
	element dispBeamColumn [expr $eleTag + 48] [expr $iNode + 48] [expr $jNode + 48] $numIntgrPtsCol $secTagCol4 $transfTagVertRecX -integration Lobatto
	element dispBeamColumn [expr $eleTag + 49] [expr $iNode + 49] [expr $jNode + 49] $numIntgrPtsCol $secTagCol4 $transfTagVertRecX -integration Lobatto
	element dispBeamColumn [expr $eleTag + 52] [expr $iNode + 52] [expr $jNode + 52] $numIntgrPtsCol $secTagCol4 $transfTagVertRecX -integration Lobatto
	element dispBeamColumn [expr $eleTag + 53] [expr $iNode + 53] [expr $jNode + 53] $numIntgrPtsCol $secTagCol4 $transfTagVertRecX -integration Lobatto
	element dispBeamColumn [expr $eleTag + 54] [expr $iNode + 54] [expr $jNode + 54] $numIntgrPtsCol $secTagCol4 $transfTagVertRecX -integration Lobatto
	element dispBeamColumn [expr $eleTag + 62] [expr $iNode + 62] [expr $jNode + 62] $numIntgrPtsCol $secTagCol4 $transfTagVertRecX -integration Lobatto
	element dispBeamColumn [expr $eleTag + 63] [expr $iNode + 63] [expr $jNode + 63] $numIntgrPtsCol $secTagCol4 $transfTagVertRecX -integration Lobatto
	element dispBeamColumn [expr $eleTag + 66] [expr $iNode + 66] [expr $jNode + 66] $numIntgrPtsCol $secTagCol4 $transfTagVertRecX -integration Lobatto
	element dispBeamColumn [expr $eleTag + 72] [expr $iNode + 72] [expr $jNode + 72] $numIntgrPtsCol $secTagCol4 $transfTagVertRecX -integration Lobatto
	element dispBeamColumn [expr $eleTag + 75] [expr $iNode + 75] [expr $jNode + 75] $numIntgrPtsCol $secTagCol4 $transfTagVertRecX -integration Lobatto
	element dispBeamColumn [expr $eleTag + 81] [expr $iNode + 81] [expr $jNode + 81] $numIntgrPtsCol $secTagCol4 $transfTagVertRecX -integration Lobatto
	element dispBeamColumn [expr $eleTag + 85] [expr $iNode + 85] [expr $jNode + 85] $numIntgrPtsCol $secTagCol4 $transfTagVertRecX -integration Lobatto
	element dispBeamColumn [expr $eleTag + 86] [expr $iNode + 86] [expr $jNode + 86] $numIntgrPtsCol $secTagCol4 $transfTagVertRecX -integration Lobatto
	element dispBeamColumn [expr $eleTag + 92] [expr $iNode + 92] [expr $jNode + 92] $numIntgrPtsCol $secTagCol4 $transfTagVertRecX -integration Lobatto
	element dispBeamColumn [expr $eleTag + 93] [expr $iNode + 93] [expr $jNode + 93] $numIntgrPtsCol $secTagCol4 $transfTagVertRecX -integration Lobatto
	
	puts $ModelFile "element dispBeamColumn [expr $eleTag + 39] [expr $iNode + 39] [expr $jNode + 39] $numIntgrPtsCol $secTagCol4 $transfTagVertRecX -integration Lobatto"
	puts $ModelFile "element dispBeamColumn [expr $eleTag + 40] [expr $iNode + 40] [expr $jNode + 40] $numIntgrPtsCol $secTagCol4 $transfTagVertRecX -integration Lobatto"
	puts $ModelFile "element dispBeamColumn [expr $eleTag + 41] [expr $iNode + 41] [expr $jNode + 41] $numIntgrPtsCol $secTagCol4 $transfTagVertRecX -integration Lobatto"
	puts $ModelFile "element dispBeamColumn [expr $eleTag + 42] [expr $iNode + 42] [expr $jNode + 42] $numIntgrPtsCol $secTagCol4 $transfTagVertRecX -integration Lobatto"
	puts $ModelFile "element dispBeamColumn [expr $eleTag + 48] [expr $iNode + 48] [expr $jNode + 48] $numIntgrPtsCol $secTagCol4 $transfTagVertRecX -integration Lobatto"
	puts $ModelFile "element dispBeamColumn [expr $eleTag + 49] [expr $iNode + 49] [expr $jNode + 49] $numIntgrPtsCol $secTagCol4 $transfTagVertRecX -integration Lobatto"
	puts $ModelFile "element dispBeamColumn [expr $eleTag + 52] [expr $iNode + 52] [expr $jNode + 52] $numIntgrPtsCol $secTagCol4 $transfTagVertRecX -integration Lobatto"
	puts $ModelFile "element dispBeamColumn [expr $eleTag + 53] [expr $iNode + 53] [expr $jNode + 53] $numIntgrPtsCol $secTagCol4 $transfTagVertRecX -integration Lobatto"
	puts $ModelFile "element dispBeamColumn [expr $eleTag + 54] [expr $iNode + 54] [expr $jNode + 54] $numIntgrPtsCol $secTagCol4 $transfTagVertRecX -integration Lobatto"
	puts $ModelFile "element dispBeamColumn [expr $eleTag + 62] [expr $iNode + 62] [expr $jNode + 62] $numIntgrPtsCol $secTagCol4 $transfTagVertRecX -integration Lobatto"
	puts $ModelFile "element dispBeamColumn [expr $eleTag + 63] [expr $iNode + 63] [expr $jNode + 63] $numIntgrPtsCol $secTagCol4 $transfTagVertRecX -integration Lobatto"
	puts $ModelFile "element dispBeamColumn [expr $eleTag + 66] [expr $iNode + 66] [expr $jNode + 66] $numIntgrPtsCol $secTagCol4 $transfTagVertRecX -integration Lobatto"
	puts $ModelFile "element dispBeamColumn [expr $eleTag + 72] [expr $iNode + 72] [expr $jNode + 72] $numIntgrPtsCol $secTagCol4 $transfTagVertRecX -integration Lobatto"
	puts $ModelFile "element dispBeamColumn [expr $eleTag + 75] [expr $iNode + 75] [expr $jNode + 75] $numIntgrPtsCol $secTagCol4 $transfTagVertRecX -integration Lobatto"
	puts $ModelFile "element dispBeamColumn [expr $eleTag + 81] [expr $iNode + 81] [expr $jNode + 81] $numIntgrPtsCol $secTagCol4 $transfTagVertRecX -integration Lobatto"
	puts $ModelFile "element dispBeamColumn [expr $eleTag + 85] [expr $iNode + 85] [expr $jNode + 85] $numIntgrPtsCol $secTagCol4 $transfTagVertRecX -integration Lobatto"
	puts $ModelFile "element dispBeamColumn [expr $eleTag + 86] [expr $iNode + 86] [expr $jNode + 86] $numIntgrPtsCol $secTagCol4 $transfTagVertRecX -integration Lobatto"
	puts $ModelFile "element dispBeamColumn [expr $eleTag + 92] [expr $iNode + 92] [expr $jNode + 92] $numIntgrPtsCol $secTagCol4 $transfTagVertRecX -integration Lobatto"
	puts $ModelFile "element dispBeamColumn [expr $eleTag + 93] [expr $iNode + 93] [expr $jNode + 93] $numIntgrPtsCol $secTagCol4 $transfTagVertRecX -integration Lobatto"

	element dispBeamColumn [expr $eleTag + 87] [expr $iNode + 87] [expr $jNode + 87] $numIntgrPtsCol $secTagCol5 $transfTagVertRecX -integration Lobatto
	element dispBeamColumn [expr $eleTag + 88] [expr $iNode + 88] [expr $jNode + 88] $numIntgrPtsCol $secTagCol5 $transfTagVertRecX -integration Lobatto
	element dispBeamColumn [expr $eleTag + 89] [expr $iNode + 89] [expr $jNode + 89] $numIntgrPtsCol $secTagCol5 $transfTagVertRecX -integration Lobatto
	element dispBeamColumn [expr $eleTag + 90] [expr $iNode + 90] [expr $jNode + 90] $numIntgrPtsCol $secTagCol5 $transfTagVertRecX -integration Lobatto
	element dispBeamColumn [expr $eleTag + 91] [expr $iNode + 91] [expr $jNode + 91] $numIntgrPtsCol $secTagCol5 $transfTagVertRecX -integration Lobatto
	
	puts $ModelFile "element dispBeamColumn [expr $eleTag + 87] [expr $iNode + 87] [expr $jNode + 87] $numIntgrPtsCol $secTagCol5 $transfTagVertRecX -integration Lobatto"
	puts $ModelFile "element dispBeamColumn [expr $eleTag + 88] [expr $iNode + 88] [expr $jNode + 88] $numIntgrPtsCol $secTagCol5 $transfTagVertRecX -integration Lobatto"
	puts $ModelFile "element dispBeamColumn [expr $eleTag + 89] [expr $iNode + 89] [expr $jNode + 89] $numIntgrPtsCol $secTagCol5 $transfTagVertRecX -integration Lobatto"
	puts $ModelFile "element dispBeamColumn [expr $eleTag + 90] [expr $iNode + 90] [expr $jNode + 90] $numIntgrPtsCol $secTagCol5 $transfTagVertRecX -integration Lobatto"
	puts $ModelFile "element dispBeamColumn [expr $eleTag + 91] [expr $iNode + 91] [expr $jNode + 91] $numIntgrPtsCol $secTagCol5 $transfTagVertRecX -integration Lobatto"
	
	element dispBeamColumn [expr $eleTag + 43] [expr $iNode + 43] [expr $jNode + 43] $numIntgrPtsCol $secTagCol6 $transfTagVertRecX -integration Lobatto
	element dispBeamColumn [expr $eleTag + 44] [expr $iNode + 44] [expr $jNode + 44] $numIntgrPtsCol $secTagCol6 $transfTagVertRecX -integration Lobatto
	element dispBeamColumn [expr $eleTag + 45] [expr $iNode + 45] [expr $jNode + 45] $numIntgrPtsCol $secTagCol6 $transfTagVertRecX -integration Lobatto
	element dispBeamColumn [expr $eleTag + 46] [expr $iNode + 46] [expr $jNode + 46] $numIntgrPtsCol $secTagCol6 $transfTagVertRecX -integration Lobatto
	element dispBeamColumn [expr $eleTag + 47] [expr $iNode + 47] [expr $jNode + 47] $numIntgrPtsCol $secTagCol6 $transfTagVertRecX -integration Lobatto
	element dispBeamColumn [expr $eleTag + 55] [expr $iNode + 55] [expr $jNode + 55] $numIntgrPtsCol $secTagCol6 $transfTagVertRecX -integration Lobatto
	element dispBeamColumn [expr $eleTag + 60] [expr $iNode + 60] [expr $jNode + 60] $numIntgrPtsCol $secTagCol6 $transfTagVertRecX -integration Lobatto
	element dispBeamColumn [expr $eleTag + 61] [expr $iNode + 61] [expr $jNode + 61] $numIntgrPtsCol $secTagCol6 $transfTagVertRecX -integration Lobatto
	element dispBeamColumn [expr $eleTag + 67] [expr $iNode + 67] [expr $jNode + 67] $numIntgrPtsCol $secTagCol6 $transfTagVertRecX -integration Lobatto
	element dispBeamColumn [expr $eleTag + 71] [expr $iNode + 71] [expr $jNode + 71] $numIntgrPtsCol $secTagCol6 $transfTagVertRecX -integration Lobatto
	element dispBeamColumn [expr $eleTag + 76] [expr $iNode + 76] [expr $jNode + 76] $numIntgrPtsCol $secTagCol6 $transfTagVertRecX -integration Lobatto
	element dispBeamColumn [expr $eleTag + 80] [expr $iNode + 80] [expr $jNode + 80] $numIntgrPtsCol $secTagCol6 $transfTagVertRecX -integration Lobatto
	
	puts $ModelFile "element dispBeamColumn [expr $eleTag + 43] [expr $iNode + 43] [expr $jNode + 43] $numIntgrPtsCol $secTagCol6 $transfTagVertRecX -integration Lobatto"
	puts $ModelFile "element dispBeamColumn [expr $eleTag + 44] [expr $iNode + 44] [expr $jNode + 44] $numIntgrPtsCol $secTagCol6 $transfTagVertRecX -integration Lobatto"
	puts $ModelFile "element dispBeamColumn [expr $eleTag + 45] [expr $iNode + 45] [expr $jNode + 45] $numIntgrPtsCol $secTagCol6 $transfTagVertRecX -integration Lobatto"
	puts $ModelFile "element dispBeamColumn [expr $eleTag + 46] [expr $iNode + 46] [expr $jNode + 46] $numIntgrPtsCol $secTagCol6 $transfTagVertRecX -integration Lobatto"
	puts $ModelFile "element dispBeamColumn [expr $eleTag + 47] [expr $iNode + 47] [expr $jNode + 47] $numIntgrPtsCol $secTagCol6 $transfTagVertRecX -integration Lobatto"
	puts $ModelFile "element dispBeamColumn [expr $eleTag + 55] [expr $iNode + 55] [expr $jNode + 55] $numIntgrPtsCol $secTagCol6 $transfTagVertRecX -integration Lobatto"
	puts $ModelFile "element dispBeamColumn [expr $eleTag + 60] [expr $iNode + 60] [expr $jNode + 60] $numIntgrPtsCol $secTagCol6 $transfTagVertRecX -integration Lobatto"
	puts $ModelFile "element dispBeamColumn [expr $eleTag + 61] [expr $iNode + 61] [expr $jNode + 61] $numIntgrPtsCol $secTagCol6 $transfTagVertRecX -integration Lobatto"
	puts $ModelFile "element dispBeamColumn [expr $eleTag + 67] [expr $iNode + 67] [expr $jNode + 67] $numIntgrPtsCol $secTagCol6 $transfTagVertRecX -integration Lobatto"
	puts $ModelFile "element dispBeamColumn [expr $eleTag + 71] [expr $iNode + 71] [expr $jNode + 71] $numIntgrPtsCol $secTagCol6 $transfTagVertRecX -integration Lobatto"
	puts $ModelFile "element dispBeamColumn [expr $eleTag + 76] [expr $iNode + 76] [expr $jNode + 76] $numIntgrPtsCol $secTagCol6 $transfTagVertRecX -integration Lobatto"
	puts $ModelFile "element dispBeamColumn [expr $eleTag + 80] [expr $iNode + 80] [expr $jNode + 80] $numIntgrPtsCol $secTagCol6 $transfTagVertRecX -integration Lobatto"
	
	element dispBeamColumn [expr $eleTag + 56] [expr $iNode + 56] [expr $jNode + 56] $numIntgrPtsCol $secTagCol7 $transfTagVertRecX -integration Lobatto
	element dispBeamColumn [expr $eleTag + 59] [expr $iNode + 59] [expr $jNode + 59] $numIntgrPtsCol $secTagCol7 $transfTagVertRecX -integration Lobatto

	puts $ModelFile "element dispBeamColumn [expr $eleTag + 56] [expr $iNode + 56] [expr $jNode + 56] $numIntgrPtsCol $secTagCol7 $transfTagVertRecX -integration Lobatto"
	puts $ModelFile "element dispBeamColumn [expr $eleTag + 59] [expr $iNode + 59] [expr $jNode + 59] $numIntgrPtsCol $secTagCol7 $transfTagVertRecX -integration Lobatto"

	element dispBeamColumn [expr $eleTag + 57] [expr $iNode + 57] [expr $jNode + 57] $numIntgrPtsCol $secTagCol8 $transfTagVertRecX -integration Lobatto
	element dispBeamColumn [expr $eleTag + 58] [expr $iNode + 58] [expr $jNode + 58] $numIntgrPtsCol $secTagCol8 $transfTagVertRecX -integration Lobatto
	element dispBeamColumn [expr $eleTag + 68] [expr $iNode + 68] [expr $jNode + 68] $numIntgrPtsCol $secTagCol8 $transfTagVertRecX -integration Lobatto
	element dispBeamColumn [expr $eleTag + 69] [expr $iNode + 69] [expr $jNode + 69] $numIntgrPtsCol $secTagCol8 $transfTagVertRecX -integration Lobatto
	element dispBeamColumn [expr $eleTag + 70] [expr $iNode + 70] [expr $jNode + 70] $numIntgrPtsCol $secTagCol8 $transfTagVertRecX -integration Lobatto
	element dispBeamColumn [expr $eleTag + 77] [expr $iNode + 77] [expr $jNode + 77] $numIntgrPtsCol $secTagCol8 $transfTagVertRecX -integration Lobatto
	element dispBeamColumn [expr $eleTag + 78] [expr $iNode + 78] [expr $jNode + 78] $numIntgrPtsCol $secTagCol8 $transfTagVertRecX -integration Lobatto
	element dispBeamColumn [expr $eleTag + 79] [expr $iNode + 79] [expr $jNode + 79] $numIntgrPtsCol $secTagCol8 $transfTagVertRecX -integration Lobatto
	
	puts $ModelFile "element dispBeamColumn [expr $eleTag + 57] [expr $iNode + 57] [expr $jNode + 57] $numIntgrPtsCol $secTagCol8 $transfTagVertRecX -integration Lobatto"
	puts $ModelFile "element dispBeamColumn [expr $eleTag + 58] [expr $iNode + 58] [expr $jNode + 58] $numIntgrPtsCol $secTagCol8 $transfTagVertRecX -integration Lobatto"
	puts $ModelFile "element dispBeamColumn [expr $eleTag + 68] [expr $iNode + 68] [expr $jNode + 68] $numIntgrPtsCol $secTagCol8 $transfTagVertRecX -integration Lobatto"
	puts $ModelFile "element dispBeamColumn [expr $eleTag + 69] [expr $iNode + 69] [expr $jNode + 69] $numIntgrPtsCol $secTagCol8 $transfTagVertRecX -integration Lobatto"
	puts $ModelFile "element dispBeamColumn [expr $eleTag + 70] [expr $iNode + 70] [expr $jNode + 70] $numIntgrPtsCol $secTagCol8 $transfTagVertRecX -integration Lobatto"
	puts $ModelFile "element dispBeamColumn [expr $eleTag + 77] [expr $iNode + 77] [expr $jNode + 77] $numIntgrPtsCol $secTagCol8 $transfTagVertRecX -integration Lobatto"
	puts $ModelFile "element dispBeamColumn [expr $eleTag + 78] [expr $iNode + 78] [expr $jNode + 78] $numIntgrPtsCol $secTagCol8 $transfTagVertRecX -integration Lobatto"
	puts $ModelFile "element dispBeamColumn [expr $eleTag + 79] [expr $iNode + 79] [expr $jNode + 79] $numIntgrPtsCol $secTagCol8 $transfTagVertRecX -integration Lobatto"
	
}

 # 6 - 11 Offices
for {set i 7} {$i <= 11} {incr i 1} {
	
	set secTagCol1 $C12_6ksi
	set secTagCol2 $C20_6ksi
	set secTagCol3 $C28_6ksi
	set secTagCol4 $C32_6ksi
	set secTagCol5 $C36_6ksi
	set secTagCol6 $C40_6ksi
	
	set iNode [expr 1000*($i-1) + 800]
	set jNode [expr 1000*$i + 800]
	
	set eleTag [expr 1000*$i + 800]

	element dispBeamColumn [expr $eleTag +  9] [expr $iNode + 9] [expr $jNode + 9] $numIntgrPtsCol $secTagCol1 $transfTagVertRecX -integration Lobatto
	element dispBeamColumn [expr $eleTag + 10] [expr $iNode + 10] [expr $jNode + 10] $numIntgrPtsCol $secTagCol1 $transfTagVertRecX -integration Lobatto
	element dispBeamColumn [expr $eleTag + 11] [expr $iNode + 11] [expr $jNode + 11] $numIntgrPtsCol $secTagCol1 $transfTagVertRecX -integration Lobatto
	element dispBeamColumn [expr $eleTag + 12] [expr $iNode + 12] [expr $jNode + 12] $numIntgrPtsCol $secTagCol1 $transfTagVertRecX -integration Lobatto
	element dispBeamColumn [expr $eleTag + 13] [expr $iNode + 13] [expr $jNode + 13] $numIntgrPtsCol $secTagCol1 $transfTagVertRecX -integration Lobatto
	element dispBeamColumn [expr $eleTag + 22] [expr $iNode + 22] [expr $jNode + 22] $numIntgrPtsCol $secTagCol1 $transfTagVertRecX -integration Lobatto
	element dispBeamColumn [expr $eleTag + 24] [expr $iNode + 24] [expr $jNode + 24] $numIntgrPtsCol $secTagCol1 $transfTagVertRecX -integration Lobatto
	element dispBeamColumn [expr $eleTag + 25] [expr $iNode + 25] [expr $jNode + 25] $numIntgrPtsCol $secTagCol1 $transfTagVertRecX -integration Lobatto
	element dispBeamColumn [expr $eleTag + 26] [expr $iNode + 26] [expr $jNode + 26] $numIntgrPtsCol $secTagCol1 $transfTagVertRecX -integration Lobatto
	element dispBeamColumn [expr $eleTag + 27] [expr $iNode + 27] [expr $jNode + 27] $numIntgrPtsCol $secTagCol1 $transfTagVertRecX -integration Lobatto
	element dispBeamColumn [expr $eleTag + 28] [expr $iNode + 28] [expr $jNode + 28] $numIntgrPtsCol $secTagCol1 $transfTagVertRecX -integration Lobatto
	element dispBeamColumn [expr $eleTag + 29] [expr $iNode + 29] [expr $jNode + 29] $numIntgrPtsCol $secTagCol1 $transfTagVertRecX -integration Lobatto
	element dispBeamColumn [expr $eleTag + 30] [expr $iNode + 30] [expr $jNode + 30] $numIntgrPtsCol $secTagCol1 $transfTagVertRecX -integration Lobatto
	element dispBeamColumn [expr $eleTag + 31] [expr $iNode + 31] [expr $jNode + 31] $numIntgrPtsCol $secTagCol1 $transfTagVertRecX -integration Lobatto
	element dispBeamColumn [expr $eleTag + 32] [expr $iNode + 32] [expr $jNode + 32] $numIntgrPtsCol $secTagCol1 $transfTagVertRecX -integration Lobatto
	element dispBeamColumn [expr $eleTag + 37] [expr $iNode + 37] [expr $jNode + 37] $numIntgrPtsCol $secTagCol1 $transfTagVertRecX -integration Lobatto
	element dispBeamColumn [expr $eleTag + 38] [expr $iNode + 38] [expr $jNode + 38] $numIntgrPtsCol $secTagCol1 $transfTagVertRecX -integration Lobatto
	element dispBeamColumn [expr $eleTag + 50] [expr $iNode + 50] [expr $jNode + 50] $numIntgrPtsCol $secTagCol1 $transfTagVertRecX -integration Lobatto
	element dispBeamColumn [expr $eleTag + 51] [expr $iNode + 51] [expr $jNode + 51] $numIntgrPtsCol $secTagCol1 $transfTagVertRecX -integration Lobatto
	element dispBeamColumn [expr $eleTag + 63] [expr $iNode + 63] [expr $jNode + 63] $numIntgrPtsCol $secTagCol1 $transfTagVertRecX -integration Lobatto
	element dispBeamColumn [expr $eleTag + 64] [expr $iNode + 64] [expr $jNode + 64] $numIntgrPtsCol $secTagCol1 $transfTagVertRecX -integration Lobatto
	element dispBeamColumn [expr $eleTag + 72] [expr $iNode + 72] [expr $jNode + 72] $numIntgrPtsCol $secTagCol1 $transfTagVertRecX -integration Lobatto
	element dispBeamColumn [expr $eleTag + 73] [expr $iNode + 73] [expr $jNode + 73] $numIntgrPtsCol $secTagCol1 $transfTagVertRecX -integration Lobatto
	element dispBeamColumn [expr $eleTag + 81] [expr $iNode + 81] [expr $jNode + 81] $numIntgrPtsCol $secTagCol1 $transfTagVertRecX -integration Lobatto
	element dispBeamColumn [expr $eleTag + 82] [expr $iNode + 82] [expr $jNode + 82] $numIntgrPtsCol $secTagCol1 $transfTagVertRecX -integration Lobatto
	element dispBeamColumn [expr $eleTag + 83] [expr $iNode + 83] [expr $jNode + 83] $numIntgrPtsCol $secTagCol1 $transfTagVertRecX -integration Lobatto
	element dispBeamColumn [expr $eleTag + 84] [expr $iNode + 84] [expr $jNode + 84] $numIntgrPtsCol $secTagCol1 $transfTagVertRecX -integration Lobatto
	element dispBeamColumn [expr $eleTag + 85] [expr $iNode + 85] [expr $jNode + 85] $numIntgrPtsCol $secTagCol1 $transfTagVertRecX -integration Lobatto
	element dispBeamColumn [expr $eleTag + 93] [expr $iNode + 93] [expr $jNode + 93] $numIntgrPtsCol $secTagCol1 $transfTagVertRecX -integration Lobatto
	element dispBeamColumn [expr $eleTag + 94] [expr $iNode + 94] [expr $jNode + 94] $numIntgrPtsCol $secTagCol1 $transfTagVertRecX -integration Lobatto
	
	puts $ModelFile "element dispBeamColumn [expr $eleTag + 9] [expr $iNode + 9] [expr $jNode + 9] $numIntgrPtsCol $secTagCol1 $transfTagVertRecX -integration Lobatto"
	puts $ModelFile "element dispBeamColumn [expr $eleTag + 10] [expr $iNode + 10] [expr $jNode + 10] $numIntgrPtsCol $secTagCol1 $transfTagVertRecX -integration Lobatto"
	puts $ModelFile "element dispBeamColumn [expr $eleTag + 11] [expr $iNode + 11] [expr $jNode + 11] $numIntgrPtsCol $secTagCol1 $transfTagVertRecX -integration Lobatto"
	puts $ModelFile "element dispBeamColumn [expr $eleTag + 12] [expr $iNode + 12] [expr $jNode + 12] $numIntgrPtsCol $secTagCol1 $transfTagVertRecX -integration Lobatto"
	puts $ModelFile "element dispBeamColumn [expr $eleTag + 13] [expr $iNode + 13] [expr $jNode + 13] $numIntgrPtsCol $secTagCol1 $transfTagVertRecX -integration Lobatto"
	puts $ModelFile "element dispBeamColumn [expr $eleTag + 22] [expr $iNode + 22] [expr $jNode + 22] $numIntgrPtsCol $secTagCol1 $transfTagVertRecX -integration Lobatto"
	puts $ModelFile "element dispBeamColumn [expr $eleTag + 24] [expr $iNode + 24] [expr $jNode + 24] $numIntgrPtsCol $secTagCol1 $transfTagVertRecX -integration Lobatto"
	puts $ModelFile "element dispBeamColumn [expr $eleTag + 25] [expr $iNode + 25] [expr $jNode + 25] $numIntgrPtsCol $secTagCol1 $transfTagVertRecX -integration Lobatto"
	puts $ModelFile "element dispBeamColumn [expr $eleTag + 26] [expr $iNode + 26] [expr $jNode + 26] $numIntgrPtsCol $secTagCol1 $transfTagVertRecX -integration Lobatto"
	puts $ModelFile "element dispBeamColumn [expr $eleTag + 27] [expr $iNode + 27] [expr $jNode + 27] $numIntgrPtsCol $secTagCol1 $transfTagVertRecX -integration Lobatto"
	puts $ModelFile "element dispBeamColumn [expr $eleTag + 28] [expr $iNode + 28] [expr $jNode + 28] $numIntgrPtsCol $secTagCol1 $transfTagVertRecX -integration Lobatto"
	puts $ModelFile "element dispBeamColumn [expr $eleTag + 29] [expr $iNode + 29] [expr $jNode + 29] $numIntgrPtsCol $secTagCol1 $transfTagVertRecX -integration Lobatto"
	puts $ModelFile "element dispBeamColumn [expr $eleTag + 30] [expr $iNode + 30] [expr $jNode + 30] $numIntgrPtsCol $secTagCol1 $transfTagVertRecX -integration Lobatto"
	puts $ModelFile "element dispBeamColumn [expr $eleTag + 31] [expr $iNode + 31] [expr $jNode + 31] $numIntgrPtsCol $secTagCol1 $transfTagVertRecX -integration Lobatto"
	puts $ModelFile "element dispBeamColumn [expr $eleTag + 32] [expr $iNode + 32] [expr $jNode + 32] $numIntgrPtsCol $secTagCol1 $transfTagVertRecX -integration Lobatto"
	puts $ModelFile "element dispBeamColumn [expr $eleTag + 37] [expr $iNode + 37] [expr $jNode + 37] $numIntgrPtsCol $secTagCol1 $transfTagVertRecX -integration Lobatto"
	puts $ModelFile "element dispBeamColumn [expr $eleTag + 38] [expr $iNode + 38] [expr $jNode + 38] $numIntgrPtsCol $secTagCol1 $transfTagVertRecX -integration Lobatto"
	puts $ModelFile "element dispBeamColumn [expr $eleTag + 50] [expr $iNode + 50] [expr $jNode + 50] $numIntgrPtsCol $secTagCol1 $transfTagVertRecX -integration Lobatto"
	puts $ModelFile "element dispBeamColumn [expr $eleTag + 51] [expr $iNode + 51] [expr $jNode + 51] $numIntgrPtsCol $secTagCol1 $transfTagVertRecX -integration Lobatto"
	puts $ModelFile "element dispBeamColumn [expr $eleTag + 63] [expr $iNode + 63] [expr $jNode + 63] $numIntgrPtsCol $secTagCol1 $transfTagVertRecX -integration Lobatto"
	puts $ModelFile "element dispBeamColumn [expr $eleTag + 64] [expr $iNode + 64] [expr $jNode + 64] $numIntgrPtsCol $secTagCol1 $transfTagVertRecX -integration Lobatto"
	puts $ModelFile "element dispBeamColumn [expr $eleTag + 72] [expr $iNode + 72] [expr $jNode + 72] $numIntgrPtsCol $secTagCol1 $transfTagVertRecX -integration Lobatto"
	puts $ModelFile "element dispBeamColumn [expr $eleTag + 73] [expr $iNode + 73] [expr $jNode + 73] $numIntgrPtsCol $secTagCol1 $transfTagVertRecX -integration Lobatto"
	puts $ModelFile "element dispBeamColumn [expr $eleTag + 81] [expr $iNode + 81] [expr $jNode + 81] $numIntgrPtsCol $secTagCol1 $transfTagVertRecX -integration Lobatto"
	puts $ModelFile "element dispBeamColumn [expr $eleTag + 82] [expr $iNode + 82] [expr $jNode + 82] $numIntgrPtsCol $secTagCol1 $transfTagVertRecX -integration Lobatto"
	puts $ModelFile "element dispBeamColumn [expr $eleTag + 83] [expr $iNode + 83] [expr $jNode + 83] $numIntgrPtsCol $secTagCol1 $transfTagVertRecX -integration Lobatto"
	puts $ModelFile "element dispBeamColumn [expr $eleTag + 84] [expr $iNode + 84] [expr $jNode + 84] $numIntgrPtsCol $secTagCol1 $transfTagVertRecX -integration Lobatto"
	puts $ModelFile "element dispBeamColumn [expr $eleTag + 85] [expr $iNode + 85] [expr $jNode + 85] $numIntgrPtsCol $secTagCol1 $transfTagVertRecX -integration Lobatto"
	puts $ModelFile "element dispBeamColumn [expr $eleTag + 93] [expr $iNode + 93] [expr $jNode + 93] $numIntgrPtsCol $secTagCol1 $transfTagVertRecX -integration Lobatto"
	puts $ModelFile "element dispBeamColumn [expr $eleTag + 94] [expr $iNode + 94] [expr $jNode + 94] $numIntgrPtsCol $secTagCol1 $transfTagVertRecX -integration Lobatto"
	
	element dispBeamColumn [expr $eleTag + 23] [expr $iNode + 23] [expr $jNode + 23] $numIntgrPtsCol $secTagCol2 $transfTagVertRecX -integration Lobatto
	element dispBeamColumn [expr $eleTag + 33] [expr $iNode + 33] [expr $jNode + 33] $numIntgrPtsCol $secTagCol2 $transfTagVertRecX -integration Lobatto
	element dispBeamColumn [expr $eleTag + 34] [expr $iNode + 34] [expr $jNode + 34] $numIntgrPtsCol $secTagCol2 $transfTagVertRecX -integration Lobatto
	element dispBeamColumn [expr $eleTag + 35] [expr $iNode + 35] [expr $jNode + 35] $numIntgrPtsCol $secTagCol2 $transfTagVertRecX -integration Lobatto
	element dispBeamColumn [expr $eleTag + 36] [expr $iNode + 36] [expr $jNode + 36] $numIntgrPtsCol $secTagCol2 $transfTagVertRecX -integration Lobatto
	element dispBeamColumn [expr $eleTag + 39] [expr $iNode + 39] [expr $jNode + 39] $numIntgrPtsCol $secTagCol2 $transfTagVertRecX -integration Lobatto
	element dispBeamColumn [expr $eleTag + 40] [expr $iNode + 40] [expr $jNode + 40] $numIntgrPtsCol $secTagCol2 $transfTagVertRecX -integration Lobatto
	element dispBeamColumn [expr $eleTag + 41] [expr $iNode + 41] [expr $jNode + 41] $numIntgrPtsCol $secTagCol2 $transfTagVertRecX -integration Lobatto
	element dispBeamColumn [expr $eleTag + 42] [expr $iNode + 42] [expr $jNode + 42] $numIntgrPtsCol $secTagCol2 $transfTagVertRecX -integration Lobatto
	element dispBeamColumn [expr $eleTag + 48] [expr $iNode + 48] [expr $jNode + 48] $numIntgrPtsCol $secTagCol2 $transfTagVertRecX -integration Lobatto
	element dispBeamColumn [expr $eleTag + 49] [expr $iNode + 49] [expr $jNode + 49] $numIntgrPtsCol $secTagCol2 $transfTagVertRecX -integration Lobatto
	element dispBeamColumn [expr $eleTag + 52] [expr $iNode + 52] [expr $jNode + 52] $numIntgrPtsCol $secTagCol2 $transfTagVertRecX -integration Lobatto
	element dispBeamColumn [expr $eleTag + 53] [expr $iNode + 53] [expr $jNode + 53] $numIntgrPtsCol $secTagCol2 $transfTagVertRecX -integration Lobatto
	element dispBeamColumn [expr $eleTag + 54] [expr $iNode + 54] [expr $jNode + 54] $numIntgrPtsCol $secTagCol2 $transfTagVertRecX -integration Lobatto
	element dispBeamColumn [expr $eleTag + 62] [expr $iNode + 62] [expr $jNode + 62] $numIntgrPtsCol $secTagCol2 $transfTagVertRecX -integration Lobatto
	element dispBeamColumn [expr $eleTag + 65] [expr $iNode + 65] [expr $jNode + 65] $numIntgrPtsCol $secTagCol2 $transfTagVertRecX -integration Lobatto
	element dispBeamColumn [expr $eleTag + 66] [expr $iNode + 66] [expr $jNode + 66] $numIntgrPtsCol $secTagCol2 $transfTagVertRecX -integration Lobatto
	element dispBeamColumn [expr $eleTag + 74] [expr $iNode + 74] [expr $jNode + 74] $numIntgrPtsCol $secTagCol2 $transfTagVertRecX -integration Lobatto
	element dispBeamColumn [expr $eleTag + 75] [expr $iNode + 75] [expr $jNode + 75] $numIntgrPtsCol $secTagCol2 $transfTagVertRecX -integration Lobatto
	
	puts $ModelFile "element dispBeamColumn [expr $eleTag + 23] [expr $iNode + 23] [expr $jNode + 23] $numIntgrPtsCol $secTagCol2 $transfTagVertRecX -integration Lobatto"
	puts $ModelFile "element dispBeamColumn [expr $eleTag + 33] [expr $iNode + 33] [expr $jNode + 33] $numIntgrPtsCol $secTagCol2 $transfTagVertRecX -integration Lobatto"
	puts $ModelFile "element dispBeamColumn [expr $eleTag + 34] [expr $iNode + 34] [expr $jNode + 34] $numIntgrPtsCol $secTagCol2 $transfTagVertRecX -integration Lobatto"
	puts $ModelFile "element dispBeamColumn [expr $eleTag + 35] [expr $iNode + 35] [expr $jNode + 35] $numIntgrPtsCol $secTagCol2 $transfTagVertRecX -integration Lobatto"
	puts $ModelFile "element dispBeamColumn [expr $eleTag + 36] [expr $iNode + 36] [expr $jNode + 36] $numIntgrPtsCol $secTagCol2 $transfTagVertRecX -integration Lobatto"
	puts $ModelFile "element dispBeamColumn [expr $eleTag + 39] [expr $iNode + 39] [expr $jNode + 39] $numIntgrPtsCol $secTagCol2 $transfTagVertRecX -integration Lobatto"
	puts $ModelFile "element dispBeamColumn [expr $eleTag + 40] [expr $iNode + 40] [expr $jNode + 40] $numIntgrPtsCol $secTagCol2 $transfTagVertRecX -integration Lobatto"
	puts $ModelFile "element dispBeamColumn [expr $eleTag + 41] [expr $iNode + 41] [expr $jNode + 41] $numIntgrPtsCol $secTagCol2 $transfTagVertRecX -integration Lobatto"
	puts $ModelFile "element dispBeamColumn [expr $eleTag + 42] [expr $iNode + 42] [expr $jNode + 42] $numIntgrPtsCol $secTagCol2 $transfTagVertRecX -integration Lobatto"
	puts $ModelFile "element dispBeamColumn [expr $eleTag + 48] [expr $iNode + 48] [expr $jNode + 48] $numIntgrPtsCol $secTagCol2 $transfTagVertRecX -integration Lobatto"
	puts $ModelFile "element dispBeamColumn [expr $eleTag + 49] [expr $iNode + 49] [expr $jNode + 49] $numIntgrPtsCol $secTagCol2 $transfTagVertRecX -integration Lobatto"
	puts $ModelFile "element dispBeamColumn [expr $eleTag + 52] [expr $iNode + 52] [expr $jNode + 52] $numIntgrPtsCol $secTagCol2 $transfTagVertRecX -integration Lobatto"
	puts $ModelFile "element dispBeamColumn [expr $eleTag + 53] [expr $iNode + 53] [expr $jNode + 53] $numIntgrPtsCol $secTagCol2 $transfTagVertRecX -integration Lobatto"
	puts $ModelFile "element dispBeamColumn [expr $eleTag + 54] [expr $iNode + 54] [expr $jNode + 54] $numIntgrPtsCol $secTagCol2 $transfTagVertRecX -integration Lobatto"
	puts $ModelFile "element dispBeamColumn [expr $eleTag + 62] [expr $iNode + 62] [expr $jNode + 62] $numIntgrPtsCol $secTagCol2 $transfTagVertRecX -integration Lobatto"
	puts $ModelFile "element dispBeamColumn [expr $eleTag + 65] [expr $iNode + 65] [expr $jNode + 65] $numIntgrPtsCol $secTagCol2 $transfTagVertRecX -integration Lobatto"
	puts $ModelFile "element dispBeamColumn [expr $eleTag + 66] [expr $iNode + 66] [expr $jNode + 66] $numIntgrPtsCol $secTagCol2 $transfTagVertRecX -integration Lobatto"
	puts $ModelFile "element dispBeamColumn [expr $eleTag + 74] [expr $iNode + 74] [expr $jNode + 74] $numIntgrPtsCol $secTagCol2 $transfTagVertRecX -integration Lobatto"
	puts $ModelFile "element dispBeamColumn [expr $eleTag + 75] [expr $iNode + 75] [expr $jNode + 75] $numIntgrPtsCol $secTagCol2 $transfTagVertRecX -integration Lobatto"
	
	element dispBeamColumn [expr $eleTag + 43] [expr $iNode + 43] [expr $jNode + 43] $numIntgrPtsCol $secTagCol3 $transfTagVertRecX -integration Lobatto
	element dispBeamColumn [expr $eleTag + 46] [expr $iNode + 46] [expr $jNode + 46] $numIntgrPtsCol $secTagCol3 $transfTagVertRecX -integration Lobatto
	element dispBeamColumn [expr $eleTag + 47] [expr $iNode + 47] [expr $jNode + 47] $numIntgrPtsCol $secTagCol3 $transfTagVertRecX -integration Lobatto
	element dispBeamColumn [expr $eleTag + 61] [expr $iNode + 61] [expr $jNode + 61] $numIntgrPtsCol $secTagCol3 $transfTagVertRecX -integration Lobatto
	element dispBeamColumn [expr $eleTag + 86] [expr $iNode + 86] [expr $jNode + 86] $numIntgrPtsCol $secTagCol3 $transfTagVertRecX -integration Lobatto
	element dispBeamColumn [expr $eleTag + 92] [expr $iNode + 92] [expr $jNode + 92] $numIntgrPtsCol $secTagCol3 $transfTagVertRecX -integration Lobatto
	
	puts $ModelFile "element dispBeamColumn [expr $eleTag + 43] [expr $iNode + 43] [expr $jNode + 43] $numIntgrPtsCol $secTagCol3 $transfTagVertRecX -integration Lobatto"
	puts $ModelFile "element dispBeamColumn [expr $eleTag + 46] [expr $iNode + 46] [expr $jNode + 46] $numIntgrPtsCol $secTagCol3 $transfTagVertRecX -integration Lobatto"
	puts $ModelFile "element dispBeamColumn [expr $eleTag + 47] [expr $iNode + 47] [expr $jNode + 47] $numIntgrPtsCol $secTagCol3 $transfTagVertRecX -integration Lobatto"
	puts $ModelFile "element dispBeamColumn [expr $eleTag + 61] [expr $iNode + 61] [expr $jNode + 61] $numIntgrPtsCol $secTagCol3 $transfTagVertRecX -integration Lobatto"
	puts $ModelFile "element dispBeamColumn [expr $eleTag + 86] [expr $iNode + 86] [expr $jNode + 86] $numIntgrPtsCol $secTagCol3 $transfTagVertRecX -integration Lobatto"
	puts $ModelFile "element dispBeamColumn [expr $eleTag + 92] [expr $iNode + 92] [expr $jNode + 92] $numIntgrPtsCol $secTagCol3 $transfTagVertRecX -integration Lobatto"

	element dispBeamColumn [expr $eleTag + 44] [expr $iNode + 44] [expr $jNode + 44] $numIntgrPtsCol $secTagCol4 $transfTagVertRecX -integration Lobatto
	element dispBeamColumn [expr $eleTag + 45] [expr $iNode + 45] [expr $jNode + 45] $numIntgrPtsCol $secTagCol4 $transfTagVertRecX -integration Lobatto
	element dispBeamColumn [expr $eleTag + 55] [expr $iNode + 55] [expr $jNode + 55] $numIntgrPtsCol $secTagCol4 $transfTagVertRecX -integration Lobatto
	element dispBeamColumn [expr $eleTag + 60] [expr $iNode + 60] [expr $jNode + 60] $numIntgrPtsCol $secTagCol4 $transfTagVertRecX -integration Lobatto
	element dispBeamColumn [expr $eleTag + 67] [expr $iNode + 67] [expr $jNode + 67] $numIntgrPtsCol $secTagCol4 $transfTagVertRecX -integration Lobatto
	element dispBeamColumn [expr $eleTag + 71] [expr $iNode + 71] [expr $jNode + 71] $numIntgrPtsCol $secTagCol4 $transfTagVertRecX -integration Lobatto
	element dispBeamColumn [expr $eleTag + 76] [expr $iNode + 76] [expr $jNode + 76] $numIntgrPtsCol $secTagCol4 $transfTagVertRecX -integration Lobatto
	element dispBeamColumn [expr $eleTag + 80] [expr $iNode + 80] [expr $jNode + 80] $numIntgrPtsCol $secTagCol4 $transfTagVertRecX -integration Lobatto
	element dispBeamColumn [expr $eleTag + 87] [expr $iNode + 87] [expr $jNode + 87] $numIntgrPtsCol $secTagCol4 $transfTagVertRecX -integration Lobatto
	element dispBeamColumn [expr $eleTag + 88] [expr $iNode + 88] [expr $jNode + 88] $numIntgrPtsCol $secTagCol4 $transfTagVertRecX -integration Lobatto
	element dispBeamColumn [expr $eleTag + 89] [expr $iNode + 89] [expr $jNode + 89] $numIntgrPtsCol $secTagCol4 $transfTagVertRecX -integration Lobatto
	element dispBeamColumn [expr $eleTag + 90] [expr $iNode + 90] [expr $jNode + 90] $numIntgrPtsCol $secTagCol4 $transfTagVertRecX -integration Lobatto
	element dispBeamColumn [expr $eleTag + 91] [expr $iNode + 91] [expr $jNode + 91] $numIntgrPtsCol $secTagCol4 $transfTagVertRecX -integration Lobatto
	
	puts $ModelFile "element dispBeamColumn [expr $eleTag + 44] [expr $iNode + 44] [expr $jNode + 44] $numIntgrPtsCol $secTagCol4 $transfTagVertRecX -integration Lobatto"
	puts $ModelFile "element dispBeamColumn [expr $eleTag + 45] [expr $iNode + 45] [expr $jNode + 45] $numIntgrPtsCol $secTagCol4 $transfTagVertRecX -integration Lobatto"
	puts $ModelFile "element dispBeamColumn [expr $eleTag + 55] [expr $iNode + 55] [expr $jNode + 55] $numIntgrPtsCol $secTagCol4 $transfTagVertRecX -integration Lobatto"
	puts $ModelFile "element dispBeamColumn [expr $eleTag + 60] [expr $iNode + 60] [expr $jNode + 60] $numIntgrPtsCol $secTagCol4 $transfTagVertRecX -integration Lobatto"
	puts $ModelFile "element dispBeamColumn [expr $eleTag + 67] [expr $iNode + 67] [expr $jNode + 67] $numIntgrPtsCol $secTagCol4 $transfTagVertRecX -integration Lobatto"
	puts $ModelFile "element dispBeamColumn [expr $eleTag + 71] [expr $iNode + 71] [expr $jNode + 71] $numIntgrPtsCol $secTagCol4 $transfTagVertRecX -integration Lobatto"
	puts $ModelFile "element dispBeamColumn [expr $eleTag + 76] [expr $iNode + 76] [expr $jNode + 76] $numIntgrPtsCol $secTagCol4 $transfTagVertRecX -integration Lobatto"
	puts $ModelFile "element dispBeamColumn [expr $eleTag + 80] [expr $iNode + 80] [expr $jNode + 80] $numIntgrPtsCol $secTagCol4 $transfTagVertRecX -integration Lobatto"
	puts $ModelFile "element dispBeamColumn [expr $eleTag + 87] [expr $iNode + 87] [expr $jNode + 87] $numIntgrPtsCol $secTagCol4 $transfTagVertRecX -integration Lobatto"
	puts $ModelFile "element dispBeamColumn [expr $eleTag + 88] [expr $iNode + 88] [expr $jNode + 88] $numIntgrPtsCol $secTagCol4 $transfTagVertRecX -integration Lobatto"
	puts $ModelFile "element dispBeamColumn [expr $eleTag + 89] [expr $iNode + 89] [expr $jNode + 89] $numIntgrPtsCol $secTagCol4 $transfTagVertRecX -integration Lobatto"
	puts $ModelFile "element dispBeamColumn [expr $eleTag + 90] [expr $iNode + 90] [expr $jNode + 90] $numIntgrPtsCol $secTagCol4 $transfTagVertRecX -integration Lobatto"
	puts $ModelFile "element dispBeamColumn [expr $eleTag + 91] [expr $iNode + 91] [expr $jNode + 91] $numIntgrPtsCol $secTagCol4 $transfTagVertRecX -integration Lobatto"
	
	element dispBeamColumn [expr $eleTag + 56] [expr $iNode + 56] [expr $jNode + 56] $numIntgrPtsCol $secTagCol5 $transfTagVertRecX -integration Lobatto
	element dispBeamColumn [expr $eleTag + 59] [expr $iNode + 59] [expr $jNode + 59] $numIntgrPtsCol $secTagCol5 $transfTagVertRecX -integration Lobatto

	puts $ModelFile "element dispBeamColumn [expr $eleTag + 56] [expr $iNode + 56] [expr $jNode + 56] $numIntgrPtsCol $secTagCol5 $transfTagVertRecX -integration Lobatto"
	puts $ModelFile "element dispBeamColumn [expr $eleTag + 59] [expr $iNode + 59] [expr $jNode + 59] $numIntgrPtsCol $secTagCol5 $transfTagVertRecX -integration Lobatto"

	element dispBeamColumn [expr $eleTag + 57] [expr $iNode + 57] [expr $jNode + 57] $numIntgrPtsCol $secTagCol6 $transfTagVertRecX -integration Lobatto
	element dispBeamColumn [expr $eleTag + 58] [expr $iNode + 58] [expr $jNode + 58] $numIntgrPtsCol $secTagCol6 $transfTagVertRecX -integration Lobatto
	element dispBeamColumn [expr $eleTag + 68] [expr $iNode + 68] [expr $jNode + 68] $numIntgrPtsCol $secTagCol6 $transfTagVertRecX -integration Lobatto
	element dispBeamColumn [expr $eleTag + 69] [expr $iNode + 69] [expr $jNode + 69] $numIntgrPtsCol $secTagCol6 $transfTagVertRecX -integration Lobatto
	element dispBeamColumn [expr $eleTag + 70] [expr $iNode + 70] [expr $jNode + 70] $numIntgrPtsCol $secTagCol6 $transfTagVertRecX -integration Lobatto
	element dispBeamColumn [expr $eleTag + 77] [expr $iNode + 77] [expr $jNode + 77] $numIntgrPtsCol $secTagCol6 $transfTagVertRecX -integration Lobatto
	element dispBeamColumn [expr $eleTag + 78] [expr $iNode + 78] [expr $jNode + 78] $numIntgrPtsCol $secTagCol6 $transfTagVertRecX -integration Lobatto
	element dispBeamColumn [expr $eleTag + 79] [expr $iNode + 79] [expr $jNode + 79] $numIntgrPtsCol $secTagCol6 $transfTagVertRecX -integration Lobatto
	
	puts $ModelFile "element dispBeamColumn [expr $eleTag + 57] [expr $iNode + 57] [expr $jNode + 57] $numIntgrPtsCol $secTagCol6 $transfTagVertRecX -integration Lobatto"
	puts $ModelFile "element dispBeamColumn [expr $eleTag + 58] [expr $iNode + 58] [expr $jNode + 58] $numIntgrPtsCol $secTagCol6 $transfTagVertRecX -integration Lobatto"
	puts $ModelFile "element dispBeamColumn [expr $eleTag + 68] [expr $iNode + 68] [expr $jNode + 68] $numIntgrPtsCol $secTagCol6 $transfTagVertRecX -integration Lobatto"
	puts $ModelFile "element dispBeamColumn [expr $eleTag + 69] [expr $iNode + 69] [expr $jNode + 69] $numIntgrPtsCol $secTagCol6 $transfTagVertRecX -integration Lobatto"
	puts $ModelFile "element dispBeamColumn [expr $eleTag + 70] [expr $iNode + 70] [expr $jNode + 70] $numIntgrPtsCol $secTagCol6 $transfTagVertRecX -integration Lobatto"
	puts $ModelFile "element dispBeamColumn [expr $eleTag + 77] [expr $iNode + 77] [expr $jNode + 77] $numIntgrPtsCol $secTagCol6 $transfTagVertRecX -integration Lobatto"
	puts $ModelFile "element dispBeamColumn [expr $eleTag + 78] [expr $iNode + 78] [expr $jNode + 78] $numIntgrPtsCol $secTagCol6 $transfTagVertRecX -integration Lobatto"
	puts $ModelFile "element dispBeamColumn [expr $eleTag + 79] [expr $iNode + 79] [expr $jNode + 79] $numIntgrPtsCol $secTagCol6 $transfTagVertRecX -integration Lobatto"
	
}

 # 11 - 16 Residential
for {set i 12} {$i <= 16} {incr i 1} {
	
	set secTagCol1 $C28_6ksi
	set secTagCol2 $C32_6ksi
	set secTagCol3 $C36_6ksi
	
	set iNode [expr 1000*($i-1) + 800]
	set jNode [expr 1000*$i + 800]
	
	set eleTag [expr 1000*$i + 800]

	element dispBeamColumn [expr $eleTag + 43] [expr $iNode + 43] [expr $jNode + 43] $numIntgrPtsCol $secTagCol1 $transfTagVertRecX -integration Lobatto
	element dispBeamColumn [expr $eleTag + 44] [expr $iNode + 44] [expr $jNode + 44] $numIntgrPtsCol $secTagCol1 $transfTagVertRecX -integration Lobatto
	element dispBeamColumn [expr $eleTag + 45] [expr $iNode + 45] [expr $jNode + 45] $numIntgrPtsCol $secTagCol1 $transfTagVertRecX -integration Lobatto
	element dispBeamColumn [expr $eleTag + 46] [expr $iNode + 46] [expr $jNode + 46] $numIntgrPtsCol $secTagCol1 $transfTagVertRecX -integration Lobatto
	element dispBeamColumn [expr $eleTag + 55] [expr $iNode + 55] [expr $jNode + 55] $numIntgrPtsCol $secTagCol1 $transfTagVertRecX -integration Lobatto
	element dispBeamColumn [expr $eleTag + 60] [expr $iNode + 60] [expr $jNode + 60] $numIntgrPtsCol $secTagCol1 $transfTagVertRecX -integration Lobatto
	element dispBeamColumn [expr $eleTag + 61] [expr $iNode + 61] [expr $jNode + 61] $numIntgrPtsCol $secTagCol1 $transfTagVertRecX -integration Lobatto
	element dispBeamColumn [expr $eleTag + 67] [expr $iNode + 67] [expr $jNode + 67] $numIntgrPtsCol $secTagCol1 $transfTagVertRecX -integration Lobatto
	element dispBeamColumn [expr $eleTag + 71] [expr $iNode + 71] [expr $jNode + 71] $numIntgrPtsCol $secTagCol1 $transfTagVertRecX -integration Lobatto
	element dispBeamColumn [expr $eleTag + 76] [expr $iNode + 76] [expr $jNode + 76] $numIntgrPtsCol $secTagCol1 $transfTagVertRecX -integration Lobatto
	element dispBeamColumn [expr $eleTag + 80] [expr $iNode + 80] [expr $jNode + 80] $numIntgrPtsCol $secTagCol1 $transfTagVertRecX -integration Lobatto
	element dispBeamColumn [expr $eleTag + 86] [expr $iNode + 86] [expr $jNode + 86] $numIntgrPtsCol $secTagCol1 $transfTagVertRecX -integration Lobatto
	element dispBeamColumn [expr $eleTag + 87] [expr $iNode + 87] [expr $jNode + 87] $numIntgrPtsCol $secTagCol1 $transfTagVertRecX -integration Lobatto
	element dispBeamColumn [expr $eleTag + 88] [expr $iNode + 88] [expr $jNode + 88] $numIntgrPtsCol $secTagCol1 $transfTagVertRecX -integration Lobatto
	element dispBeamColumn [expr $eleTag + 89] [expr $iNode + 89] [expr $jNode + 89] $numIntgrPtsCol $secTagCol1 $transfTagVertRecX -integration Lobatto
	element dispBeamColumn [expr $eleTag + 90] [expr $iNode + 90] [expr $jNode + 90] $numIntgrPtsCol $secTagCol1 $transfTagVertRecX -integration Lobatto
	element dispBeamColumn [expr $eleTag + 91] [expr $iNode + 91] [expr $jNode + 91] $numIntgrPtsCol $secTagCol1 $transfTagVertRecX -integration Lobatto
	element dispBeamColumn [expr $eleTag + 92] [expr $iNode + 92] [expr $jNode + 92] $numIntgrPtsCol $secTagCol1 $transfTagVertRecX -integration Lobatto
	
	puts $ModelFile "element dispBeamColumn [expr $eleTag + 43] [expr $iNode + 43] [expr $jNode + 43] $numIntgrPtsCol $secTagCol1 $transfTagVertRecX -integration Lobatto"
	puts $ModelFile "element dispBeamColumn [expr $eleTag + 44] [expr $iNode + 44] [expr $jNode + 44] $numIntgrPtsCol $secTagCol1 $transfTagVertRecX -integration Lobatto"
	puts $ModelFile "element dispBeamColumn [expr $eleTag + 45] [expr $iNode + 45] [expr $jNode + 45] $numIntgrPtsCol $secTagCol1 $transfTagVertRecX -integration Lobatto"
	puts $ModelFile "element dispBeamColumn [expr $eleTag + 46] [expr $iNode + 46] [expr $jNode + 46] $numIntgrPtsCol $secTagCol1 $transfTagVertRecX -integration Lobatto"
	puts $ModelFile "element dispBeamColumn [expr $eleTag + 55] [expr $iNode + 55] [expr $jNode + 55] $numIntgrPtsCol $secTagCol1 $transfTagVertRecX -integration Lobatto"
	puts $ModelFile "element dispBeamColumn [expr $eleTag + 60] [expr $iNode + 60] [expr $jNode + 60] $numIntgrPtsCol $secTagCol1 $transfTagVertRecX -integration Lobatto"
	puts $ModelFile "element dispBeamColumn [expr $eleTag + 61] [expr $iNode + 61] [expr $jNode + 61] $numIntgrPtsCol $secTagCol1 $transfTagVertRecX -integration Lobatto"
	puts $ModelFile "element dispBeamColumn [expr $eleTag + 67] [expr $iNode + 67] [expr $jNode + 67] $numIntgrPtsCol $secTagCol1 $transfTagVertRecX -integration Lobatto"
	puts $ModelFile "element dispBeamColumn [expr $eleTag + 71] [expr $iNode + 71] [expr $jNode + 71] $numIntgrPtsCol $secTagCol1 $transfTagVertRecX -integration Lobatto"
	puts $ModelFile "element dispBeamColumn [expr $eleTag + 76] [expr $iNode + 76] [expr $jNode + 76] $numIntgrPtsCol $secTagCol1 $transfTagVertRecX -integration Lobatto"
	puts $ModelFile "element dispBeamColumn [expr $eleTag + 80] [expr $iNode + 80] [expr $jNode + 80] $numIntgrPtsCol $secTagCol1 $transfTagVertRecX -integration Lobatto"
	puts $ModelFile "element dispBeamColumn [expr $eleTag + 86] [expr $iNode + 86] [expr $jNode + 86] $numIntgrPtsCol $secTagCol1 $transfTagVertRecX -integration Lobatto"
	puts $ModelFile "element dispBeamColumn [expr $eleTag + 87] [expr $iNode + 87] [expr $jNode + 87] $numIntgrPtsCol $secTagCol1 $transfTagVertRecX -integration Lobatto"
	puts $ModelFile "element dispBeamColumn [expr $eleTag + 88] [expr $iNode + 88] [expr $jNode + 88] $numIntgrPtsCol $secTagCol1 $transfTagVertRecX -integration Lobatto"
	puts $ModelFile "element dispBeamColumn [expr $eleTag + 89] [expr $iNode + 89] [expr $jNode + 89] $numIntgrPtsCol $secTagCol1 $transfTagVertRecX -integration Lobatto"
	puts $ModelFile "element dispBeamColumn [expr $eleTag + 90] [expr $iNode + 90] [expr $jNode + 90] $numIntgrPtsCol $secTagCol1 $transfTagVertRecX -integration Lobatto"
	puts $ModelFile "element dispBeamColumn [expr $eleTag + 91] [expr $iNode + 91] [expr $jNode + 91] $numIntgrPtsCol $secTagCol1 $transfTagVertRecX -integration Lobatto"
	puts $ModelFile "element dispBeamColumn [expr $eleTag + 92] [expr $iNode + 92] [expr $jNode + 92] $numIntgrPtsCol $secTagCol1 $transfTagVertRecX -integration Lobatto"
	
	element dispBeamColumn [expr $eleTag + 56] [expr $iNode + 56] [expr $jNode + 56] $numIntgrPtsCol $secTagCol2 $transfTagVertRecX -integration Lobatto
	element dispBeamColumn [expr $eleTag + 59] [expr $iNode + 59] [expr $jNode + 59] $numIntgrPtsCol $secTagCol2 $transfTagVertRecX -integration Lobatto

	puts $ModelFile "element dispBeamColumn [expr $eleTag + 56] [expr $iNode + 56] [expr $jNode + 56] $numIntgrPtsCol $secTagCol2 $transfTagVertRecX -integration Lobatto"
	puts $ModelFile "element dispBeamColumn [expr $eleTag + 59] [expr $iNode + 59] [expr $jNode + 59] $numIntgrPtsCol $secTagCol2 $transfTagVertRecX -integration Lobatto"

	element dispBeamColumn [expr $eleTag + 57] [expr $iNode + 57] [expr $jNode + 57] $numIntgrPtsCol $secTagCol3 $transfTagVertRecX -integration Lobatto
	element dispBeamColumn [expr $eleTag + 58] [expr $iNode + 58] [expr $jNode + 58] $numIntgrPtsCol $secTagCol3 $transfTagVertRecX -integration Lobatto
	element dispBeamColumn [expr $eleTag + 68] [expr $iNode + 68] [expr $jNode + 68] $numIntgrPtsCol $secTagCol3 $transfTagVertRecX -integration Lobatto
	element dispBeamColumn [expr $eleTag + 69] [expr $iNode + 69] [expr $jNode + 69] $numIntgrPtsCol $secTagCol3 $transfTagVertRecX -integration Lobatto
	element dispBeamColumn [expr $eleTag + 70] [expr $iNode + 70] [expr $jNode + 70] $numIntgrPtsCol $secTagCol3 $transfTagVertRecX -integration Lobatto
	element dispBeamColumn [expr $eleTag + 77] [expr $iNode + 77] [expr $jNode + 77] $numIntgrPtsCol $secTagCol3 $transfTagVertRecX -integration Lobatto
	element dispBeamColumn [expr $eleTag + 78] [expr $iNode + 78] [expr $jNode + 78] $numIntgrPtsCol $secTagCol3 $transfTagVertRecX -integration Lobatto
	element dispBeamColumn [expr $eleTag + 79] [expr $iNode + 79] [expr $jNode + 79] $numIntgrPtsCol $secTagCol3 $transfTagVertRecX -integration Lobatto
	
	puts $ModelFile "element dispBeamColumn [expr $eleTag + 57] [expr $iNode + 57] [expr $jNode + 57] $numIntgrPtsCol $secTagCol3 $transfTagVertRecX -integration Lobatto"
	puts $ModelFile "element dispBeamColumn [expr $eleTag + 58] [expr $iNode + 58] [expr $jNode + 58] $numIntgrPtsCol $secTagCol3 $transfTagVertRecX -integration Lobatto"
	puts $ModelFile "element dispBeamColumn [expr $eleTag + 68] [expr $iNode + 68] [expr $jNode + 68] $numIntgrPtsCol $secTagCol3 $transfTagVertRecX -integration Lobatto"
	puts $ModelFile "element dispBeamColumn [expr $eleTag + 69] [expr $iNode + 69] [expr $jNode + 69] $numIntgrPtsCol $secTagCol3 $transfTagVertRecX -integration Lobatto"
	puts $ModelFile "element dispBeamColumn [expr $eleTag + 70] [expr $iNode + 70] [expr $jNode + 70] $numIntgrPtsCol $secTagCol3 $transfTagVertRecX -integration Lobatto"
	puts $ModelFile "element dispBeamColumn [expr $eleTag + 77] [expr $iNode + 77] [expr $jNode + 77] $numIntgrPtsCol $secTagCol3 $transfTagVertRecX -integration Lobatto"
	puts $ModelFile "element dispBeamColumn [expr $eleTag + 78] [expr $iNode + 78] [expr $jNode + 78] $numIntgrPtsCol $secTagCol3 $transfTagVertRecX -integration Lobatto"
	puts $ModelFile "element dispBeamColumn [expr $eleTag + 79] [expr $iNode + 79] [expr $jNode + 79] $numIntgrPtsCol $secTagCol3 $transfTagVertRecX -integration Lobatto"
	
}

# 17 - 21 Residential
for {set i 17} {$i <= 21} {incr i 1} {
	
	set secTagCol1 $C24_6ksi
	set secTagCol2 $C24_6ksi
	set secTagCol3 $C28_6ksi
	set secTagCol4 $C36_6ksi
	
	set iNode [expr 1000*($i-1) + 800]
	set jNode [expr 1000*$i + 800]
	
	set eleTag [expr 1000*$i + 800]

	element dispBeamColumn [expr $eleTag + 43] [expr $iNode + 43] [expr $jNode + 43] $numIntgrPtsCol $secTagCol1 $transfTagVertRecX -integration Lobatto
	element dispBeamColumn [expr $eleTag + 46] [expr $iNode + 46] [expr $jNode + 46] $numIntgrPtsCol $secTagCol1 $transfTagVertRecX -integration Lobatto
	element dispBeamColumn [expr $eleTag + 55] [expr $iNode + 55] [expr $jNode + 55] $numIntgrPtsCol $secTagCol1 $transfTagVertRecX -integration Lobatto
	element dispBeamColumn [expr $eleTag + 61] [expr $iNode + 61] [expr $jNode + 61] $numIntgrPtsCol $secTagCol1 $transfTagVertRecX -integration Lobatto
	element dispBeamColumn [expr $eleTag + 86] [expr $iNode + 86] [expr $jNode + 86] $numIntgrPtsCol $secTagCol1 $transfTagVertRecX -integration Lobatto
	element dispBeamColumn [expr $eleTag + 92] [expr $iNode + 92] [expr $jNode + 92] $numIntgrPtsCol $secTagCol1 $transfTagVertRecX -integration Lobatto
	
	puts $ModelFile "element dispBeamColumn [expr $eleTag + 43] [expr $iNode + 43] [expr $jNode + 43] $numIntgrPtsCol $secTagCol1 $transfTagVertRecX -integration Lobatto"
	puts $ModelFile "element dispBeamColumn [expr $eleTag + 46] [expr $iNode + 46] [expr $jNode + 46] $numIntgrPtsCol $secTagCol1 $transfTagVertRecX -integration Lobatto"
	puts $ModelFile "element dispBeamColumn [expr $eleTag + 55] [expr $iNode + 55] [expr $jNode + 55] $numIntgrPtsCol $secTagCol1 $transfTagVertRecX -integration Lobatto"
	puts $ModelFile "element dispBeamColumn [expr $eleTag + 61] [expr $iNode + 61] [expr $jNode + 61] $numIntgrPtsCol $secTagCol1 $transfTagVertRecX -integration Lobatto"
	puts $ModelFile "element dispBeamColumn [expr $eleTag + 86] [expr $iNode + 86] [expr $jNode + 86] $numIntgrPtsCol $secTagCol1 $transfTagVertRecX -integration Lobatto"
	puts $ModelFile "element dispBeamColumn [expr $eleTag + 92] [expr $iNode + 92] [expr $jNode + 92] $numIntgrPtsCol $secTagCol1 $transfTagVertRecX -integration Lobatto"
	
	element dispBeamColumn [expr $eleTag + 44] [expr $iNode + 44] [expr $jNode + 44] $numIntgrPtsCol $secTagCol2 $transfTagVertRecX -integration Lobatto
	element dispBeamColumn [expr $eleTag + 45] [expr $iNode + 45] [expr $jNode + 45] $numIntgrPtsCol $secTagCol2 $transfTagVertRecX -integration Lobatto
	element dispBeamColumn [expr $eleTag + 60] [expr $iNode + 60] [expr $jNode + 60] $numIntgrPtsCol $secTagCol2 $transfTagVertRecX -integration Lobatto
	element dispBeamColumn [expr $eleTag + 67] [expr $iNode + 67] [expr $jNode + 67] $numIntgrPtsCol $secTagCol2 $transfTagVertRecX -integration Lobatto
	element dispBeamColumn [expr $eleTag + 71] [expr $iNode + 71] [expr $jNode + 71] $numIntgrPtsCol $secTagCol2 $transfTagVertRecX -integration Lobatto
	element dispBeamColumn [expr $eleTag + 76] [expr $iNode + 76] [expr $jNode + 76] $numIntgrPtsCol $secTagCol2 $transfTagVertRecX -integration Lobatto
	element dispBeamColumn [expr $eleTag + 80] [expr $iNode + 80] [expr $jNode + 80] $numIntgrPtsCol $secTagCol2 $transfTagVertRecX -integration Lobatto
	element dispBeamColumn [expr $eleTag + 87] [expr $iNode + 87] [expr $jNode + 87] $numIntgrPtsCol $secTagCol2 $transfTagVertRecX -integration Lobatto
	element dispBeamColumn [expr $eleTag + 88] [expr $iNode + 88] [expr $jNode + 88] $numIntgrPtsCol $secTagCol2 $transfTagVertRecX -integration Lobatto
	element dispBeamColumn [expr $eleTag + 89] [expr $iNode + 89] [expr $jNode + 89] $numIntgrPtsCol $secTagCol2 $transfTagVertRecX -integration Lobatto
	element dispBeamColumn [expr $eleTag + 90] [expr $iNode + 90] [expr $jNode + 90] $numIntgrPtsCol $secTagCol2 $transfTagVertRecX -integration Lobatto
	element dispBeamColumn [expr $eleTag + 91] [expr $iNode + 91] [expr $jNode + 91] $numIntgrPtsCol $secTagCol2 $transfTagVertRecX -integration Lobatto
	
	puts $ModelFile "element dispBeamColumn [expr $eleTag + 44] [expr $iNode + 44] [expr $jNode + 44] $numIntgrPtsCol $secTagCol2 $transfTagVertRecX -integration Lobatto"
	puts $ModelFile "element dispBeamColumn [expr $eleTag + 45] [expr $iNode + 45] [expr $jNode + 45] $numIntgrPtsCol $secTagCol2 $transfTagVertRecX -integration Lobatto"
	puts $ModelFile "element dispBeamColumn [expr $eleTag + 60] [expr $iNode + 60] [expr $jNode + 60] $numIntgrPtsCol $secTagCol2 $transfTagVertRecX -integration Lobatto"
	puts $ModelFile "element dispBeamColumn [expr $eleTag + 67] [expr $iNode + 67] [expr $jNode + 67] $numIntgrPtsCol $secTagCol2 $transfTagVertRecX -integration Lobatto"
	puts $ModelFile "element dispBeamColumn [expr $eleTag + 71] [expr $iNode + 71] [expr $jNode + 71] $numIntgrPtsCol $secTagCol2 $transfTagVertRecX -integration Lobatto"
	puts $ModelFile "element dispBeamColumn [expr $eleTag + 76] [expr $iNode + 76] [expr $jNode + 76] $numIntgrPtsCol $secTagCol2 $transfTagVertRecX -integration Lobatto"
	puts $ModelFile "element dispBeamColumn [expr $eleTag + 80] [expr $iNode + 80] [expr $jNode + 80] $numIntgrPtsCol $secTagCol2 $transfTagVertRecX -integration Lobatto"
	puts $ModelFile "element dispBeamColumn [expr $eleTag + 87] [expr $iNode + 87] [expr $jNode + 87] $numIntgrPtsCol $secTagCol2 $transfTagVertRecX -integration Lobatto"
	puts $ModelFile "element dispBeamColumn [expr $eleTag + 88] [expr $iNode + 88] [expr $jNode + 88] $numIntgrPtsCol $secTagCol2 $transfTagVertRecX -integration Lobatto"
	puts $ModelFile "element dispBeamColumn [expr $eleTag + 89] [expr $iNode + 89] [expr $jNode + 89] $numIntgrPtsCol $secTagCol2 $transfTagVertRecX -integration Lobatto"
	puts $ModelFile "element dispBeamColumn [expr $eleTag + 90] [expr $iNode + 90] [expr $jNode + 90] $numIntgrPtsCol $secTagCol2 $transfTagVertRecX -integration Lobatto"
	puts $ModelFile "element dispBeamColumn [expr $eleTag + 91] [expr $iNode + 91] [expr $jNode + 91] $numIntgrPtsCol $secTagCol2 $transfTagVertRecX -integration Lobatto"
	
	element dispBeamColumn [expr $eleTag + 56] [expr $iNode + 56] [expr $jNode + 56] $numIntgrPtsCol $secTagCol3 $transfTagVertRecX -integration Lobatto
	element dispBeamColumn [expr $eleTag + 59] [expr $iNode + 59] [expr $jNode + 59] $numIntgrPtsCol $secTagCol3 $transfTagVertRecX -integration Lobatto

	puts $ModelFile "element dispBeamColumn [expr $eleTag + 56] [expr $iNode + 56] [expr $jNode + 56] $numIntgrPtsCol $secTagCol3 $transfTagVertRecX -integration Lobatto"
	puts $ModelFile "element dispBeamColumn [expr $eleTag + 59] [expr $iNode + 59] [expr $jNode + 59] $numIntgrPtsCol $secTagCol3 $transfTagVertRecX -integration Lobatto"

	element dispBeamColumn [expr $eleTag + 57] [expr $iNode + 57] [expr $jNode + 57] $numIntgrPtsCol $secTagCol4 $transfTagVertRecX -integration Lobatto
	element dispBeamColumn [expr $eleTag + 58] [expr $iNode + 58] [expr $jNode + 58] $numIntgrPtsCol $secTagCol4 $transfTagVertRecX -integration Lobatto
	element dispBeamColumn [expr $eleTag + 68] [expr $iNode + 68] [expr $jNode + 68] $numIntgrPtsCol $secTagCol4 $transfTagVertRecX -integration Lobatto
	element dispBeamColumn [expr $eleTag + 69] [expr $iNode + 69] [expr $jNode + 69] $numIntgrPtsCol $secTagCol4 $transfTagVertRecX -integration Lobatto
	element dispBeamColumn [expr $eleTag + 70] [expr $iNode + 70] [expr $jNode + 70] $numIntgrPtsCol $secTagCol4 $transfTagVertRecX -integration Lobatto
	element dispBeamColumn [expr $eleTag + 77] [expr $iNode + 77] [expr $jNode + 77] $numIntgrPtsCol $secTagCol4 $transfTagVertRecX -integration Lobatto
	element dispBeamColumn [expr $eleTag + 78] [expr $iNode + 78] [expr $jNode + 78] $numIntgrPtsCol $secTagCol4 $transfTagVertRecX -integration Lobatto
	element dispBeamColumn [expr $eleTag + 79] [expr $iNode + 79] [expr $jNode + 79] $numIntgrPtsCol $secTagCol4 $transfTagVertRecX -integration Lobatto
	
	puts $ModelFile "element dispBeamColumn [expr $eleTag + 57] [expr $iNode + 57] [expr $jNode + 57] $numIntgrPtsCol $secTagCol4 $transfTagVertRecX -integration Lobatto"
	puts $ModelFile "element dispBeamColumn [expr $eleTag + 58] [expr $iNode + 58] [expr $jNode + 58] $numIntgrPtsCol $secTagCol4 $transfTagVertRecX -integration Lobatto"
	puts $ModelFile "element dispBeamColumn [expr $eleTag + 68] [expr $iNode + 68] [expr $jNode + 68] $numIntgrPtsCol $secTagCol4 $transfTagVertRecX -integration Lobatto"
	puts $ModelFile "element dispBeamColumn [expr $eleTag + 69] [expr $iNode + 69] [expr $jNode + 69] $numIntgrPtsCol $secTagCol4 $transfTagVertRecX -integration Lobatto"
	puts $ModelFile "element dispBeamColumn [expr $eleTag + 70] [expr $iNode + 70] [expr $jNode + 70] $numIntgrPtsCol $secTagCol4 $transfTagVertRecX -integration Lobatto"
	puts $ModelFile "element dispBeamColumn [expr $eleTag + 77] [expr $iNode + 77] [expr $jNode + 77] $numIntgrPtsCol $secTagCol4 $transfTagVertRecX -integration Lobatto"
	puts $ModelFile "element dispBeamColumn [expr $eleTag + 78] [expr $iNode + 78] [expr $jNode + 78] $numIntgrPtsCol $secTagCol4 $transfTagVertRecX -integration Lobatto"
	puts $ModelFile "element dispBeamColumn [expr $eleTag + 79] [expr $iNode + 79] [expr $jNode + 79] $numIntgrPtsCol $secTagCol4 $transfTagVertRecX -integration Lobatto"
	
}

# 22 - 26 Residential
for {set i 22} {$i <= 26} {incr i 1} {
	
	set secTagCol1 $C20_6ksi
	set secTagCol2 $C24_6ksi
	set secTagCol3 $C32_6ksi
	
	set iNode [expr 1000*($i-1) + 800]
	set jNode [expr 1000*$i + 800]
	
	set eleTag [expr 1000*$i + 800]

	element dispBeamColumn [expr $eleTag + 43] [expr $iNode + 43] [expr $jNode + 43] $numIntgrPtsCol $secTagCol1 $transfTagVertRecX -integration Lobatto
	element dispBeamColumn [expr $eleTag + 44] [expr $iNode + 44] [expr $jNode + 44] $numIntgrPtsCol $secTagCol1 $transfTagVertRecX -integration Lobatto
	element dispBeamColumn [expr $eleTag + 45] [expr $iNode + 45] [expr $jNode + 45] $numIntgrPtsCol $secTagCol1 $transfTagVertRecX -integration Lobatto
	element dispBeamColumn [expr $eleTag + 46] [expr $iNode + 46] [expr $jNode + 46] $numIntgrPtsCol $secTagCol1 $transfTagVertRecX -integration Lobatto
	element dispBeamColumn [expr $eleTag + 55] [expr $iNode + 55] [expr $jNode + 55] $numIntgrPtsCol $secTagCol1 $transfTagVertRecX -integration Lobatto
	element dispBeamColumn [expr $eleTag + 60] [expr $iNode + 60] [expr $jNode + 60] $numIntgrPtsCol $secTagCol1 $transfTagVertRecX -integration Lobatto
	element dispBeamColumn [expr $eleTag + 61] [expr $iNode + 61] [expr $jNode + 61] $numIntgrPtsCol $secTagCol1 $transfTagVertRecX -integration Lobatto
	element dispBeamColumn [expr $eleTag + 67] [expr $iNode + 67] [expr $jNode + 67] $numIntgrPtsCol $secTagCol1 $transfTagVertRecX -integration Lobatto
	element dispBeamColumn [expr $eleTag + 71] [expr $iNode + 71] [expr $jNode + 71] $numIntgrPtsCol $secTagCol1 $transfTagVertRecX -integration Lobatto
	element dispBeamColumn [expr $eleTag + 76] [expr $iNode + 76] [expr $jNode + 76] $numIntgrPtsCol $secTagCol1 $transfTagVertRecX -integration Lobatto
	element dispBeamColumn [expr $eleTag + 80] [expr $iNode + 80] [expr $jNode + 80] $numIntgrPtsCol $secTagCol1 $transfTagVertRecX -integration Lobatto
	element dispBeamColumn [expr $eleTag + 86] [expr $iNode + 86] [expr $jNode + 86] $numIntgrPtsCol $secTagCol1 $transfTagVertRecX -integration Lobatto
	element dispBeamColumn [expr $eleTag + 87] [expr $iNode + 87] [expr $jNode + 87] $numIntgrPtsCol $secTagCol1 $transfTagVertRecX -integration Lobatto
	element dispBeamColumn [expr $eleTag + 88] [expr $iNode + 88] [expr $jNode + 88] $numIntgrPtsCol $secTagCol1 $transfTagVertRecX -integration Lobatto
	element dispBeamColumn [expr $eleTag + 89] [expr $iNode + 89] [expr $jNode + 89] $numIntgrPtsCol $secTagCol1 $transfTagVertRecX -integration Lobatto
	element dispBeamColumn [expr $eleTag + 90] [expr $iNode + 90] [expr $jNode + 90] $numIntgrPtsCol $secTagCol1 $transfTagVertRecX -integration Lobatto
	element dispBeamColumn [expr $eleTag + 91] [expr $iNode + 91] [expr $jNode + 91] $numIntgrPtsCol $secTagCol1 $transfTagVertRecX -integration Lobatto
	element dispBeamColumn [expr $eleTag + 92] [expr $iNode + 92] [expr $jNode + 92] $numIntgrPtsCol $secTagCol1 $transfTagVertRecX -integration Lobatto
	
	puts $ModelFile "element dispBeamColumn [expr $eleTag + 43] [expr $iNode + 43] [expr $jNode + 43] $numIntgrPtsCol $secTagCol1 $transfTagVertRecX -integration Lobatto"
	puts $ModelFile "element dispBeamColumn [expr $eleTag + 44] [expr $iNode + 44] [expr $jNode + 44] $numIntgrPtsCol $secTagCol1 $transfTagVertRecX -integration Lobatto"
	puts $ModelFile "element dispBeamColumn [expr $eleTag + 45] [expr $iNode + 45] [expr $jNode + 45] $numIntgrPtsCol $secTagCol1 $transfTagVertRecX -integration Lobatto"
	puts $ModelFile "element dispBeamColumn [expr $eleTag + 46] [expr $iNode + 46] [expr $jNode + 46] $numIntgrPtsCol $secTagCol1 $transfTagVertRecX -integration Lobatto"
	puts $ModelFile "element dispBeamColumn [expr $eleTag + 55] [expr $iNode + 55] [expr $jNode + 55] $numIntgrPtsCol $secTagCol1 $transfTagVertRecX -integration Lobatto"
	puts $ModelFile "element dispBeamColumn [expr $eleTag + 60] [expr $iNode + 60] [expr $jNode + 60] $numIntgrPtsCol $secTagCol1 $transfTagVertRecX -integration Lobatto"
	puts $ModelFile "element dispBeamColumn [expr $eleTag + 61] [expr $iNode + 61] [expr $jNode + 61] $numIntgrPtsCol $secTagCol1 $transfTagVertRecX -integration Lobatto"
	puts $ModelFile "element dispBeamColumn [expr $eleTag + 67] [expr $iNode + 67] [expr $jNode + 67] $numIntgrPtsCol $secTagCol1 $transfTagVertRecX -integration Lobatto"
	puts $ModelFile "element dispBeamColumn [expr $eleTag + 71] [expr $iNode + 71] [expr $jNode + 71] $numIntgrPtsCol $secTagCol1 $transfTagVertRecX -integration Lobatto"
	puts $ModelFile "element dispBeamColumn [expr $eleTag + 76] [expr $iNode + 76] [expr $jNode + 76] $numIntgrPtsCol $secTagCol1 $transfTagVertRecX -integration Lobatto"
	puts $ModelFile "element dispBeamColumn [expr $eleTag + 80] [expr $iNode + 80] [expr $jNode + 80] $numIntgrPtsCol $secTagCol1 $transfTagVertRecX -integration Lobatto"
	puts $ModelFile "element dispBeamColumn [expr $eleTag + 86] [expr $iNode + 86] [expr $jNode + 86] $numIntgrPtsCol $secTagCol1 $transfTagVertRecX -integration Lobatto"
	puts $ModelFile "element dispBeamColumn [expr $eleTag + 87] [expr $iNode + 87] [expr $jNode + 87] $numIntgrPtsCol $secTagCol1 $transfTagVertRecX -integration Lobatto"
	puts $ModelFile "element dispBeamColumn [expr $eleTag + 88] [expr $iNode + 88] [expr $jNode + 88] $numIntgrPtsCol $secTagCol1 $transfTagVertRecX -integration Lobatto"
	puts $ModelFile "element dispBeamColumn [expr $eleTag + 89] [expr $iNode + 89] [expr $jNode + 89] $numIntgrPtsCol $secTagCol1 $transfTagVertRecX -integration Lobatto"
	puts $ModelFile "element dispBeamColumn [expr $eleTag + 90] [expr $iNode + 90] [expr $jNode + 90] $numIntgrPtsCol $secTagCol1 $transfTagVertRecX -integration Lobatto"
	puts $ModelFile "element dispBeamColumn [expr $eleTag + 91] [expr $iNode + 91] [expr $jNode + 91] $numIntgrPtsCol $secTagCol1 $transfTagVertRecX -integration Lobatto"
	puts $ModelFile "element dispBeamColumn [expr $eleTag + 92] [expr $iNode + 92] [expr $jNode + 92] $numIntgrPtsCol $secTagCol1 $transfTagVertRecX -integration Lobatto"
	
	element dispBeamColumn [expr $eleTag + 56] [expr $iNode + 56] [expr $jNode + 56] $numIntgrPtsCol $secTagCol2 $transfTagVertRecX -integration Lobatto
	element dispBeamColumn [expr $eleTag + 59] [expr $iNode + 59] [expr $jNode + 59] $numIntgrPtsCol $secTagCol2 $transfTagVertRecX -integration Lobatto

	puts $ModelFile "element dispBeamColumn [expr $eleTag + 56] [expr $iNode + 56] [expr $jNode + 56] $numIntgrPtsCol $secTagCol2 $transfTagVertRecX -integration Lobatto"
	puts $ModelFile "element dispBeamColumn [expr $eleTag + 59] [expr $iNode + 59] [expr $jNode + 59] $numIntgrPtsCol $secTagCol2 $transfTagVertRecX -integration Lobatto"

	element dispBeamColumn [expr $eleTag + 57] [expr $iNode + 57] [expr $jNode + 57] $numIntgrPtsCol $secTagCol3 $transfTagVertRecX -integration Lobatto
	element dispBeamColumn [expr $eleTag + 58] [expr $iNode + 58] [expr $jNode + 58] $numIntgrPtsCol $secTagCol3 $transfTagVertRecX -integration Lobatto
	element dispBeamColumn [expr $eleTag + 68] [expr $iNode + 68] [expr $jNode + 68] $numIntgrPtsCol $secTagCol3 $transfTagVertRecX -integration Lobatto
	element dispBeamColumn [expr $eleTag + 69] [expr $iNode + 69] [expr $jNode + 69] $numIntgrPtsCol $secTagCol3 $transfTagVertRecX -integration Lobatto
	element dispBeamColumn [expr $eleTag + 70] [expr $iNode + 70] [expr $jNode + 70] $numIntgrPtsCol $secTagCol3 $transfTagVertRecX -integration Lobatto
	element dispBeamColumn [expr $eleTag + 77] [expr $iNode + 77] [expr $jNode + 77] $numIntgrPtsCol $secTagCol3 $transfTagVertRecX -integration Lobatto
	element dispBeamColumn [expr $eleTag + 78] [expr $iNode + 78] [expr $jNode + 78] $numIntgrPtsCol $secTagCol3 $transfTagVertRecX -integration Lobatto
	element dispBeamColumn [expr $eleTag + 79] [expr $iNode + 79] [expr $jNode + 79] $numIntgrPtsCol $secTagCol3 $transfTagVertRecX -integration Lobatto
	
	puts $ModelFile "element dispBeamColumn [expr $eleTag + 57] [expr $iNode + 57] [expr $jNode + 57] $numIntgrPtsCol $secTagCol3 $transfTagVertRecX -integration Lobatto"
	puts $ModelFile "element dispBeamColumn [expr $eleTag + 58] [expr $iNode + 58] [expr $jNode + 58] $numIntgrPtsCol $secTagCol3 $transfTagVertRecX -integration Lobatto"
	puts $ModelFile "element dispBeamColumn [expr $eleTag + 68] [expr $iNode + 68] [expr $jNode + 68] $numIntgrPtsCol $secTagCol3 $transfTagVertRecX -integration Lobatto"
	puts $ModelFile "element dispBeamColumn [expr $eleTag + 69] [expr $iNode + 69] [expr $jNode + 69] $numIntgrPtsCol $secTagCol3 $transfTagVertRecX -integration Lobatto"
	puts $ModelFile "element dispBeamColumn [expr $eleTag + 70] [expr $iNode + 70] [expr $jNode + 70] $numIntgrPtsCol $secTagCol3 $transfTagVertRecX -integration Lobatto"
	puts $ModelFile "element dispBeamColumn [expr $eleTag + 77] [expr $iNode + 77] [expr $jNode + 77] $numIntgrPtsCol $secTagCol3 $transfTagVertRecX -integration Lobatto"
	puts $ModelFile "element dispBeamColumn [expr $eleTag + 78] [expr $iNode + 78] [expr $jNode + 78] $numIntgrPtsCol $secTagCol3 $transfTagVertRecX -integration Lobatto"
	puts $ModelFile "element dispBeamColumn [expr $eleTag + 79] [expr $iNode + 79] [expr $jNode + 79] $numIntgrPtsCol $secTagCol3 $transfTagVertRecX -integration Lobatto"
	
}

# 27 - 31 Residential
for {set i 27} {$i <= 31} {incr i 1} {
	
	set secTagCol1 $C16_6ksi
	set secTagCol2 $C20_6ksi
	set secTagCol3 $C24_6ksi
	
	set iNode [expr 1000*($i-1) + 800]
	set jNode [expr 1000*$i + 800]
	
	set eleTag [expr 1000*$i + 800]

	element dispBeamColumn [expr $eleTag + 43] [expr $iNode + 43] [expr $jNode + 43] $numIntgrPtsCol $secTagCol1 $transfTagVertRecX -integration Lobatto
	element dispBeamColumn [expr $eleTag + 46] [expr $iNode + 46] [expr $jNode + 46] $numIntgrPtsCol $secTagCol1 $transfTagVertRecX -integration Lobatto
	element dispBeamColumn [expr $eleTag + 55] [expr $iNode + 55] [expr $jNode + 55] $numIntgrPtsCol $secTagCol1 $transfTagVertRecX -integration Lobatto
	element dispBeamColumn [expr $eleTag + 61] [expr $iNode + 61] [expr $jNode + 61] $numIntgrPtsCol $secTagCol1 $transfTagVertRecX -integration Lobatto
	element dispBeamColumn [expr $eleTag + 86] [expr $iNode + 86] [expr $jNode + 86] $numIntgrPtsCol $secTagCol1 $transfTagVertRecX -integration Lobatto
	element dispBeamColumn [expr $eleTag + 92] [expr $iNode + 92] [expr $jNode + 92] $numIntgrPtsCol $secTagCol1 $transfTagVertRecX -integration Lobatto
	
	puts $ModelFile "element dispBeamColumn [expr $eleTag + 43] [expr $iNode + 43] [expr $jNode + 43] $numIntgrPtsCol $secTagCol1 $transfTagVertRecX -integration Lobatto"
	puts $ModelFile "element dispBeamColumn [expr $eleTag + 46] [expr $iNode + 46] [expr $jNode + 46] $numIntgrPtsCol $secTagCol1 $transfTagVertRecX -integration Lobatto"
	puts $ModelFile "element dispBeamColumn [expr $eleTag + 55] [expr $iNode + 55] [expr $jNode + 55] $numIntgrPtsCol $secTagCol1 $transfTagVertRecX -integration Lobatto"
	puts $ModelFile "element dispBeamColumn [expr $eleTag + 61] [expr $iNode + 61] [expr $jNode + 61] $numIntgrPtsCol $secTagCol1 $transfTagVertRecX -integration Lobatto"
	puts $ModelFile "element dispBeamColumn [expr $eleTag + 86] [expr $iNode + 86] [expr $jNode + 86] $numIntgrPtsCol $secTagCol1 $transfTagVertRecX -integration Lobatto"
	puts $ModelFile "element dispBeamColumn [expr $eleTag + 92] [expr $iNode + 92] [expr $jNode + 92] $numIntgrPtsCol $secTagCol1 $transfTagVertRecX -integration Lobatto"
	
	element dispBeamColumn [expr $eleTag + 44] [expr $iNode + 44] [expr $jNode + 44] $numIntgrPtsCol $secTagCol2 $transfTagVertRecX -integration Lobatto
	element dispBeamColumn [expr $eleTag + 45] [expr $iNode + 45] [expr $jNode + 45] $numIntgrPtsCol $secTagCol2 $transfTagVertRecX -integration Lobatto
	element dispBeamColumn [expr $eleTag + 56] [expr $iNode + 56] [expr $jNode + 56] $numIntgrPtsCol $secTagCol2 $transfTagVertRecX -integration Lobatto
	element dispBeamColumn [expr $eleTag + 59] [expr $iNode + 59] [expr $jNode + 59] $numIntgrPtsCol $secTagCol2 $transfTagVertRecX -integration Lobatto
	element dispBeamColumn [expr $eleTag + 60] [expr $iNode + 60] [expr $jNode + 60] $numIntgrPtsCol $secTagCol2 $transfTagVertRecX -integration Lobatto
	element dispBeamColumn [expr $eleTag + 67] [expr $iNode + 67] [expr $jNode + 67] $numIntgrPtsCol $secTagCol2 $transfTagVertRecX -integration Lobatto
	element dispBeamColumn [expr $eleTag + 71] [expr $iNode + 71] [expr $jNode + 71] $numIntgrPtsCol $secTagCol2 $transfTagVertRecX -integration Lobatto
	element dispBeamColumn [expr $eleTag + 76] [expr $iNode + 76] [expr $jNode + 76] $numIntgrPtsCol $secTagCol2 $transfTagVertRecX -integration Lobatto
	element dispBeamColumn [expr $eleTag + 80] [expr $iNode + 80] [expr $jNode + 80] $numIntgrPtsCol $secTagCol2 $transfTagVertRecX -integration Lobatto
	element dispBeamColumn [expr $eleTag + 87] [expr $iNode + 87] [expr $jNode + 87] $numIntgrPtsCol $secTagCol2 $transfTagVertRecX -integration Lobatto
	element dispBeamColumn [expr $eleTag + 88] [expr $iNode + 88] [expr $jNode + 88] $numIntgrPtsCol $secTagCol2 $transfTagVertRecX -integration Lobatto
	element dispBeamColumn [expr $eleTag + 89] [expr $iNode + 89] [expr $jNode + 89] $numIntgrPtsCol $secTagCol2 $transfTagVertRecX -integration Lobatto
	element dispBeamColumn [expr $eleTag + 90] [expr $iNode + 90] [expr $jNode + 90] $numIntgrPtsCol $secTagCol2 $transfTagVertRecX -integration Lobatto
	element dispBeamColumn [expr $eleTag + 91] [expr $iNode + 91] [expr $jNode + 91] $numIntgrPtsCol $secTagCol2 $transfTagVertRecX -integration Lobatto
	
	puts $ModelFile "element dispBeamColumn [expr $eleTag + 44] [expr $iNode + 44] [expr $jNode + 44] $numIntgrPtsCol $secTagCol2 $transfTagVertRecX -integration Lobatto"
	puts $ModelFile "element dispBeamColumn [expr $eleTag + 45] [expr $iNode + 45] [expr $jNode + 45] $numIntgrPtsCol $secTagCol2 $transfTagVertRecX -integration Lobatto"
	puts $ModelFile "element dispBeamColumn [expr $eleTag + 56] [expr $iNode + 56] [expr $jNode + 56] $numIntgrPtsCol $secTagCol2 $transfTagVertRecX -integration Lobatto"
	puts $ModelFile "element dispBeamColumn [expr $eleTag + 59] [expr $iNode + 59] [expr $jNode + 59] $numIntgrPtsCol $secTagCol2 $transfTagVertRecX -integration Lobatto"
	puts $ModelFile "element dispBeamColumn [expr $eleTag + 60] [expr $iNode + 60] [expr $jNode + 60] $numIntgrPtsCol $secTagCol2 $transfTagVertRecX -integration Lobatto"
	puts $ModelFile "element dispBeamColumn [expr $eleTag + 67] [expr $iNode + 67] [expr $jNode + 67] $numIntgrPtsCol $secTagCol2 $transfTagVertRecX -integration Lobatto"
	puts $ModelFile "element dispBeamColumn [expr $eleTag + 71] [expr $iNode + 71] [expr $jNode + 71] $numIntgrPtsCol $secTagCol2 $transfTagVertRecX -integration Lobatto"
	puts $ModelFile "element dispBeamColumn [expr $eleTag + 76] [expr $iNode + 76] [expr $jNode + 76] $numIntgrPtsCol $secTagCol2 $transfTagVertRecX -integration Lobatto"
	puts $ModelFile "element dispBeamColumn [expr $eleTag + 80] [expr $iNode + 80] [expr $jNode + 80] $numIntgrPtsCol $secTagCol2 $transfTagVertRecX -integration Lobatto"
	puts $ModelFile "element dispBeamColumn [expr $eleTag + 87] [expr $iNode + 87] [expr $jNode + 87] $numIntgrPtsCol $secTagCol2 $transfTagVertRecX -integration Lobatto"
	puts $ModelFile "element dispBeamColumn [expr $eleTag + 88] [expr $iNode + 88] [expr $jNode + 88] $numIntgrPtsCol $secTagCol2 $transfTagVertRecX -integration Lobatto"
	puts $ModelFile "element dispBeamColumn [expr $eleTag + 89] [expr $iNode + 89] [expr $jNode + 89] $numIntgrPtsCol $secTagCol2 $transfTagVertRecX -integration Lobatto"
	puts $ModelFile "element dispBeamColumn [expr $eleTag + 90] [expr $iNode + 90] [expr $jNode + 90] $numIntgrPtsCol $secTagCol2 $transfTagVertRecX -integration Lobatto"
	puts $ModelFile "element dispBeamColumn [expr $eleTag + 91] [expr $iNode + 91] [expr $jNode + 91] $numIntgrPtsCol $secTagCol2 $transfTagVertRecX -integration Lobatto"

	element dispBeamColumn [expr $eleTag + 57] [expr $iNode + 57] [expr $jNode + 57] $numIntgrPtsCol $secTagCol3 $transfTagVertRecX -integration Lobatto
	element dispBeamColumn [expr $eleTag + 58] [expr $iNode + 58] [expr $jNode + 58] $numIntgrPtsCol $secTagCol3 $transfTagVertRecX -integration Lobatto
	element dispBeamColumn [expr $eleTag + 68] [expr $iNode + 68] [expr $jNode + 68] $numIntgrPtsCol $secTagCol3 $transfTagVertRecX -integration Lobatto
	element dispBeamColumn [expr $eleTag + 69] [expr $iNode + 69] [expr $jNode + 69] $numIntgrPtsCol $secTagCol3 $transfTagVertRecX -integration Lobatto
	element dispBeamColumn [expr $eleTag + 70] [expr $iNode + 70] [expr $jNode + 70] $numIntgrPtsCol $secTagCol3 $transfTagVertRecX -integration Lobatto
	element dispBeamColumn [expr $eleTag + 77] [expr $iNode + 77] [expr $jNode + 77] $numIntgrPtsCol $secTagCol3 $transfTagVertRecX -integration Lobatto
	element dispBeamColumn [expr $eleTag + 78] [expr $iNode + 78] [expr $jNode + 78] $numIntgrPtsCol $secTagCol3 $transfTagVertRecX -integration Lobatto
	element dispBeamColumn [expr $eleTag + 79] [expr $iNode + 79] [expr $jNode + 79] $numIntgrPtsCol $secTagCol3 $transfTagVertRecX -integration Lobatto
	
	puts $ModelFile "element dispBeamColumn [expr $eleTag + 57] [expr $iNode + 57] [expr $jNode + 57] $numIntgrPtsCol $secTagCol3 $transfTagVertRecX -integration Lobatto"
	puts $ModelFile "element dispBeamColumn [expr $eleTag + 58] [expr $iNode + 58] [expr $jNode + 58] $numIntgrPtsCol $secTagCol3 $transfTagVertRecX -integration Lobatto"
	puts $ModelFile "element dispBeamColumn [expr $eleTag + 68] [expr $iNode + 68] [expr $jNode + 68] $numIntgrPtsCol $secTagCol3 $transfTagVertRecX -integration Lobatto"
	puts $ModelFile "element dispBeamColumn [expr $eleTag + 69] [expr $iNode + 69] [expr $jNode + 69] $numIntgrPtsCol $secTagCol3 $transfTagVertRecX -integration Lobatto"
	puts $ModelFile "element dispBeamColumn [expr $eleTag + 70] [expr $iNode + 70] [expr $jNode + 70] $numIntgrPtsCol $secTagCol3 $transfTagVertRecX -integration Lobatto"
	puts $ModelFile "element dispBeamColumn [expr $eleTag + 77] [expr $iNode + 77] [expr $jNode + 77] $numIntgrPtsCol $secTagCol3 $transfTagVertRecX -integration Lobatto"
	puts $ModelFile "element dispBeamColumn [expr $eleTag + 78] [expr $iNode + 78] [expr $jNode + 78] $numIntgrPtsCol $secTagCol3 $transfTagVertRecX -integration Lobatto"
	puts $ModelFile "element dispBeamColumn [expr $eleTag + 79] [expr $iNode + 79] [expr $jNode + 79] $numIntgrPtsCol $secTagCol3 $transfTagVertRecX -integration Lobatto"
	
}

# 32 - 36 Residential
for {set i 32} {$i <= 36} {incr i 1} {
	
	set secTagCol1 $C12_6ksi
	set secTagCol2 $C16_6ksi
	set secTagCol3 $C20_6ksi
	
	set iNode [expr 1000*($i-1) + 800]
	set jNode [expr 1000*$i + 800]
	
	set eleTag [expr 1000*$i + 800]

	element dispBeamColumn [expr $eleTag + 43] [expr $iNode + 43] [expr $jNode + 43] $numIntgrPtsCol $secTagCol1 $transfTagVertRecX -integration Lobatto
	element dispBeamColumn [expr $eleTag + 46] [expr $iNode + 46] [expr $jNode + 46] $numIntgrPtsCol $secTagCol1 $transfTagVertRecX -integration Lobatto
	element dispBeamColumn [expr $eleTag + 55] [expr $iNode + 55] [expr $jNode + 55] $numIntgrPtsCol $secTagCol1 $transfTagVertRecX -integration Lobatto
	element dispBeamColumn [expr $eleTag + 61] [expr $iNode + 61] [expr $jNode + 61] $numIntgrPtsCol $secTagCol1 $transfTagVertRecX -integration Lobatto
	element dispBeamColumn [expr $eleTag + 86] [expr $iNode + 86] [expr $jNode + 86] $numIntgrPtsCol $secTagCol1 $transfTagVertRecX -integration Lobatto
	element dispBeamColumn [expr $eleTag + 92] [expr $iNode + 92] [expr $jNode + 92] $numIntgrPtsCol $secTagCol1 $transfTagVertRecX -integration Lobatto
	
	puts $ModelFile "element dispBeamColumn [expr $eleTag + 43] [expr $iNode + 43] [expr $jNode + 43] $numIntgrPtsCol $secTagCol1 $transfTagVertRecX -integration Lobatto"
	puts $ModelFile "element dispBeamColumn [expr $eleTag + 46] [expr $iNode + 46] [expr $jNode + 46] $numIntgrPtsCol $secTagCol1 $transfTagVertRecX -integration Lobatto"
	puts $ModelFile "element dispBeamColumn [expr $eleTag + 55] [expr $iNode + 55] [expr $jNode + 55] $numIntgrPtsCol $secTagCol1 $transfTagVertRecX -integration Lobatto"
	puts $ModelFile "element dispBeamColumn [expr $eleTag + 61] [expr $iNode + 61] [expr $jNode + 61] $numIntgrPtsCol $secTagCol1 $transfTagVertRecX -integration Lobatto"
	puts $ModelFile "element dispBeamColumn [expr $eleTag + 86] [expr $iNode + 86] [expr $jNode + 86] $numIntgrPtsCol $secTagCol1 $transfTagVertRecX -integration Lobatto"
	puts $ModelFile "element dispBeamColumn [expr $eleTag + 92] [expr $iNode + 92] [expr $jNode + 92] $numIntgrPtsCol $secTagCol1 $transfTagVertRecX -integration Lobatto"
	
	element dispBeamColumn [expr $eleTag + 44] [expr $iNode + 44] [expr $jNode + 44] $numIntgrPtsCol $secTagCol2 $transfTagVertRecX -integration Lobatto
	element dispBeamColumn [expr $eleTag + 45] [expr $iNode + 45] [expr $jNode + 45] $numIntgrPtsCol $secTagCol2 $transfTagVertRecX -integration Lobatto
	element dispBeamColumn [expr $eleTag + 56] [expr $iNode + 56] [expr $jNode + 56] $numIntgrPtsCol $secTagCol2 $transfTagVertRecX -integration Lobatto
	element dispBeamColumn [expr $eleTag + 59] [expr $iNode + 59] [expr $jNode + 59] $numIntgrPtsCol $secTagCol2 $transfTagVertRecX -integration Lobatto
	element dispBeamColumn [expr $eleTag + 60] [expr $iNode + 60] [expr $jNode + 60] $numIntgrPtsCol $secTagCol2 $transfTagVertRecX -integration Lobatto
	element dispBeamColumn [expr $eleTag + 67] [expr $iNode + 67] [expr $jNode + 67] $numIntgrPtsCol $secTagCol2 $transfTagVertRecX -integration Lobatto
	element dispBeamColumn [expr $eleTag + 71] [expr $iNode + 71] [expr $jNode + 71] $numIntgrPtsCol $secTagCol2 $transfTagVertRecX -integration Lobatto
	element dispBeamColumn [expr $eleTag + 76] [expr $iNode + 76] [expr $jNode + 76] $numIntgrPtsCol $secTagCol2 $transfTagVertRecX -integration Lobatto
	element dispBeamColumn [expr $eleTag + 80] [expr $iNode + 80] [expr $jNode + 80] $numIntgrPtsCol $secTagCol2 $transfTagVertRecX -integration Lobatto
	element dispBeamColumn [expr $eleTag + 87] [expr $iNode + 87] [expr $jNode + 87] $numIntgrPtsCol $secTagCol2 $transfTagVertRecX -integration Lobatto
	element dispBeamColumn [expr $eleTag + 88] [expr $iNode + 88] [expr $jNode + 88] $numIntgrPtsCol $secTagCol2 $transfTagVertRecX -integration Lobatto
	element dispBeamColumn [expr $eleTag + 89] [expr $iNode + 89] [expr $jNode + 89] $numIntgrPtsCol $secTagCol2 $transfTagVertRecX -integration Lobatto
	element dispBeamColumn [expr $eleTag + 90] [expr $iNode + 90] [expr $jNode + 90] $numIntgrPtsCol $secTagCol2 $transfTagVertRecX -integration Lobatto
	element dispBeamColumn [expr $eleTag + 91] [expr $iNode + 91] [expr $jNode + 91] $numIntgrPtsCol $secTagCol2 $transfTagVertRecX -integration Lobatto
	
	puts $ModelFile "element dispBeamColumn [expr $eleTag + 44] [expr $iNode + 44] [expr $jNode + 44] $numIntgrPtsCol $secTagCol2 $transfTagVertRecX -integration Lobatto"
	puts $ModelFile "element dispBeamColumn [expr $eleTag + 45] [expr $iNode + 45] [expr $jNode + 45] $numIntgrPtsCol $secTagCol2 $transfTagVertRecX -integration Lobatto"
	puts $ModelFile "element dispBeamColumn [expr $eleTag + 56] [expr $iNode + 56] [expr $jNode + 56] $numIntgrPtsCol $secTagCol2 $transfTagVertRecX -integration Lobatto"
	puts $ModelFile "element dispBeamColumn [expr $eleTag + 59] [expr $iNode + 59] [expr $jNode + 59] $numIntgrPtsCol $secTagCol2 $transfTagVertRecX -integration Lobatto"
	puts $ModelFile "element dispBeamColumn [expr $eleTag + 60] [expr $iNode + 60] [expr $jNode + 60] $numIntgrPtsCol $secTagCol2 $transfTagVertRecX -integration Lobatto"
	puts $ModelFile "element dispBeamColumn [expr $eleTag + 67] [expr $iNode + 67] [expr $jNode + 67] $numIntgrPtsCol $secTagCol2 $transfTagVertRecX -integration Lobatto"
	puts $ModelFile "element dispBeamColumn [expr $eleTag + 71] [expr $iNode + 71] [expr $jNode + 71] $numIntgrPtsCol $secTagCol2 $transfTagVertRecX -integration Lobatto"
	puts $ModelFile "element dispBeamColumn [expr $eleTag + 76] [expr $iNode + 76] [expr $jNode + 76] $numIntgrPtsCol $secTagCol2 $transfTagVertRecX -integration Lobatto"
	puts $ModelFile "element dispBeamColumn [expr $eleTag + 80] [expr $iNode + 80] [expr $jNode + 80] $numIntgrPtsCol $secTagCol2 $transfTagVertRecX -integration Lobatto"
	puts $ModelFile "element dispBeamColumn [expr $eleTag + 87] [expr $iNode + 87] [expr $jNode + 87] $numIntgrPtsCol $secTagCol2 $transfTagVertRecX -integration Lobatto"
	puts $ModelFile "element dispBeamColumn [expr $eleTag + 88] [expr $iNode + 88] [expr $jNode + 88] $numIntgrPtsCol $secTagCol2 $transfTagVertRecX -integration Lobatto"
	puts $ModelFile "element dispBeamColumn [expr $eleTag + 89] [expr $iNode + 89] [expr $jNode + 89] $numIntgrPtsCol $secTagCol2 $transfTagVertRecX -integration Lobatto"
	puts $ModelFile "element dispBeamColumn [expr $eleTag + 90] [expr $iNode + 90] [expr $jNode + 90] $numIntgrPtsCol $secTagCol2 $transfTagVertRecX -integration Lobatto"
	puts $ModelFile "element dispBeamColumn [expr $eleTag + 91] [expr $iNode + 91] [expr $jNode + 91] $numIntgrPtsCol $secTagCol2 $transfTagVertRecX -integration Lobatto"

	element dispBeamColumn [expr $eleTag + 57] [expr $iNode + 57] [expr $jNode + 57] $numIntgrPtsCol $secTagCol3 $transfTagVertRecX -integration Lobatto
	element dispBeamColumn [expr $eleTag + 58] [expr $iNode + 58] [expr $jNode + 58] $numIntgrPtsCol $secTagCol3 $transfTagVertRecX -integration Lobatto
	element dispBeamColumn [expr $eleTag + 68] [expr $iNode + 68] [expr $jNode + 68] $numIntgrPtsCol $secTagCol3 $transfTagVertRecX -integration Lobatto
	element dispBeamColumn [expr $eleTag + 69] [expr $iNode + 69] [expr $jNode + 69] $numIntgrPtsCol $secTagCol3 $transfTagVertRecX -integration Lobatto
	element dispBeamColumn [expr $eleTag + 70] [expr $iNode + 70] [expr $jNode + 70] $numIntgrPtsCol $secTagCol3 $transfTagVertRecX -integration Lobatto
	element dispBeamColumn [expr $eleTag + 77] [expr $iNode + 77] [expr $jNode + 77] $numIntgrPtsCol $secTagCol3 $transfTagVertRecX -integration Lobatto
	element dispBeamColumn [expr $eleTag + 78] [expr $iNode + 78] [expr $jNode + 78] $numIntgrPtsCol $secTagCol3 $transfTagVertRecX -integration Lobatto
	element dispBeamColumn [expr $eleTag + 79] [expr $iNode + 79] [expr $jNode + 79] $numIntgrPtsCol $secTagCol3 $transfTagVertRecX -integration Lobatto
	
	puts $ModelFile "element dispBeamColumn [expr $eleTag + 57] [expr $iNode + 57] [expr $jNode + 57] $numIntgrPtsCol $secTagCol3 $transfTagVertRecX -integration Lobatto"
	puts $ModelFile "element dispBeamColumn [expr $eleTag + 58] [expr $iNode + 58] [expr $jNode + 58] $numIntgrPtsCol $secTagCol3 $transfTagVertRecX -integration Lobatto"
	puts $ModelFile "element dispBeamColumn [expr $eleTag + 68] [expr $iNode + 68] [expr $jNode + 68] $numIntgrPtsCol $secTagCol3 $transfTagVertRecX -integration Lobatto"
	puts $ModelFile "element dispBeamColumn [expr $eleTag + 69] [expr $iNode + 69] [expr $jNode + 69] $numIntgrPtsCol $secTagCol3 $transfTagVertRecX -integration Lobatto"
	puts $ModelFile "element dispBeamColumn [expr $eleTag + 70] [expr $iNode + 70] [expr $jNode + 70] $numIntgrPtsCol $secTagCol3 $transfTagVertRecX -integration Lobatto"
	puts $ModelFile "element dispBeamColumn [expr $eleTag + 77] [expr $iNode + 77] [expr $jNode + 77] $numIntgrPtsCol $secTagCol3 $transfTagVertRecX -integration Lobatto"
	puts $ModelFile "element dispBeamColumn [expr $eleTag + 78] [expr $iNode + 78] [expr $jNode + 78] $numIntgrPtsCol $secTagCol3 $transfTagVertRecX -integration Lobatto"
	puts $ModelFile "element dispBeamColumn [expr $eleTag + 79] [expr $iNode + 79] [expr $jNode + 79] $numIntgrPtsCol $secTagCol3 $transfTagVertRecX -integration Lobatto"
	
}