
 ############################# Retaining Walls #######################################
 
set RetWallTag $secTag
incr secTag 1

set RetWallH [expr 16.*$in];	#Thickness of retaining wall

set Ec		[expr 33000.*pow(0.140 + 6./1000,1.5)*sqrt(6.)*$ksi];	# Young's Modulus of Concrete
set nuc 	0.2;													# Poisson's Ratio of Concrete
#set Gc	 	[expr $Ec/(2.0*(1.0+$nuc))];							# Shear Modulus of Concrete

#section ElasticMembranePlateSection $secTag $E $nu $h $rho
section ElasticMembranePlateSection $RetWallTag [expr 0.8*$Ec] [expr 0.625*$nuc] $RetWallH 0.

#element ShellMITC4 $eleTag $iNode $jNode $kNode $lNode $secTag
for {set i 1} {$i <= 3} {incr i 1} {

	set shellTag [expr 100000 + 1000*$i + 500]
	set nodeTagi [expr 1000*($i-1) + 800]
	set nodeTagj [expr 1000*$i + 800]

	element ShellMITC4 [expr $shellTag +  1] [expr $nodeTagi +  1] [expr $nodeTagi +  2] [expr $nodeTagj +  2] [expr $nodeTagj +  1] $RetWallTag
	element ShellMITC4 [expr $shellTag +  2] [expr $nodeTagi +  2] [expr $nodeTagi +  3] [expr $nodeTagj +  3] [expr $nodeTagj +  2] $RetWallTag
	element ShellMITC4 [expr $shellTag +  3] [expr $nodeTagi +  3] [expr $nodeTagi +  4] [expr $nodeTagj +  4] [expr $nodeTagj +  3] $RetWallTag
	element ShellMITC4 [expr $shellTag +  4] [expr $nodeTagi +  4] [expr $nodeTagi +  5] [expr $nodeTagj +  5] [expr $nodeTagj +  4] $RetWallTag
	element ShellMITC4 [expr $shellTag +  5] [expr $nodeTagi +  5] [expr $nodeTagi +  6] [expr $nodeTagj +  6] [expr $nodeTagj +  5] $RetWallTag
	element ShellMITC4 [expr $shellTag +  6] [expr $nodeTagi +  6] [expr $nodeTagi +  7] [expr $nodeTagj +  7] [expr $nodeTagj +  6] $RetWallTag
	element ShellMITC4 [expr $shellTag +  7] [expr $nodeTagi +  7] [expr $nodeTagi +  8] [expr $nodeTagj +  8] [expr $nodeTagj +  7] $RetWallTag
	element ShellMITC4 [expr $shellTag +  8] [expr $nodeTagi +  8] [expr $nodeTagi +  9] [expr $nodeTagj +  9] [expr $nodeTagj +  8] $RetWallTag
	element ShellMITC4 [expr $shellTag +  9] [expr $nodeTagi +  9] [expr $nodeTagi + 10] [expr $nodeTagj + 10] [expr $nodeTagj +  9] $RetWallTag
	element ShellMITC4 [expr $shellTag + 10] [expr $nodeTagi + 10] [expr $nodeTagi + 11] [expr $nodeTagj + 11] [expr $nodeTagj + 10] $RetWallTag
	element ShellMITC4 [expr $shellTag + 11] [expr $nodeTagi + 11] [expr $nodeTagi + 12] [expr $nodeTagj + 12] [expr $nodeTagj + 11] $RetWallTag
	element ShellMITC4 [expr $shellTag + 12] [expr $nodeTagi + 12] [expr $nodeTagi + 13] [expr $nodeTagj + 13] [expr $nodeTagj + 12] $RetWallTag
	
	element ShellMITC4 [expr $shellTag + 13] [expr $nodeTagi +  1] [expr $nodeTagi + 14] [expr $nodeTagj + 14] [expr $nodeTagj +  1] $RetWallTag
	element ShellMITC4 [expr $shellTag + 14] [expr $nodeTagi + 14] [expr $nodeTagi + 26] [expr $nodeTagj + 26] [expr $nodeTagj + 14] $RetWallTag
	element ShellMITC4 [expr $shellTag + 15] [expr $nodeTagi + 26] [expr 1000*($i-1) + 500 + $nEleFloor + 1] [expr 1000*$i + 500 + $nEleFloor + 1] [expr $nodeTagj + 26] $RetWallTag
	element ShellMITC4 [expr $shellTag + 16] [expr 1000*($i-1) + 500 + $nEleFloor + 1] [expr $nodeTagi + 49] [expr $nodeTagj + 49] [expr 1000*$i + 500 + $nEleFloor + 1] $RetWallTag
	element ShellMITC4 [expr $shellTag + 17] [expr $nodeTagi + 49] [expr $nodeTagi + 62] [expr $nodeTagj + 62] [expr $nodeTagj + 49] $RetWallTag
	element ShellMITC4 [expr $shellTag + 18] [expr $nodeTagi + 62] [expr 1000*($i-1) + 600 + $nEleFloor + 1] [expr 1000*$i + 600 + $nEleFloor + 1] [expr $nodeTagj + 62] $RetWallTag
	element ShellMITC4 [expr $shellTag + 19] [expr 1000*($i-1) + 600 + $nEleFloor + 1] [expr $nodeTagi + 78] [expr $nodeTagj + 78] [expr 1000*$i + 600 + $nEleFloor + 1] $RetWallTag	
	
	element ShellMITC4 [expr $shellTag + 20] [expr $nodeTagi + 13] [expr $nodeTagi + 25] [expr $nodeTagj + 25] [expr $nodeTagj + 13] $RetWallTag
	element ShellMITC4 [expr $shellTag + 21] [expr $nodeTagi + 25] [expr $nodeTagi + 37] [expr $nodeTagj + 37] [expr $nodeTagj + 25] $RetWallTag
	element ShellMITC4 [expr $shellTag + 22] [expr $nodeTagi + 37] [expr $nodeTagi + 48] [expr $nodeTagj + 48] [expr $nodeTagj + 37] $RetWallTag
	element ShellMITC4 [expr $shellTag + 23] [expr $nodeTagi + 48] [expr $nodeTagi + 61] [expr $nodeTagj + 61] [expr $nodeTagj + 48] $RetWallTag
	element ShellMITC4 [expr $shellTag + 24] [expr $nodeTagi + 61] [expr $nodeTagi + 70] [expr $nodeTagj + 70] [expr $nodeTagj + 61] $RetWallTag
	element ShellMITC4 [expr $shellTag + 25] [expr $nodeTagi + 70] [expr $nodeTagi + 77] [expr $nodeTagj + 77] [expr $nodeTagj + 70] $RetWallTag
	element ShellMITC4 [expr $shellTag + 26] [expr $nodeTagi + 77] [expr $nodeTagi + 90] [expr $nodeTagj + 90] [expr $nodeTagj + 77] $RetWallTag	
	
	element ShellMITC4 [expr $shellTag + 27] [expr $nodeTagi + 78] [expr $nodeTagi + 79] [expr $nodeTagj + 79] [expr $nodeTagj + 78] $RetWallTag
	element ShellMITC4 [expr $shellTag + 28] [expr $nodeTagi + 79] [expr $nodeTagi + 80] [expr $nodeTagj + 80] [expr $nodeTagj + 79] $RetWallTag
	element ShellMITC4 [expr $shellTag + 29] [expr $nodeTagi + 80] [expr $nodeTagi + 81] [expr $nodeTagj + 81] [expr $nodeTagj + 80] $RetWallTag
	element ShellMITC4 [expr $shellTag + 30] [expr $nodeTagi + 81] [expr $nodeTagi + 82] [expr $nodeTagj + 82] [expr $nodeTagj + 81] $RetWallTag
	element ShellMITC4 [expr $shellTag + 31] [expr $nodeTagi + 82] [expr $nodeTagi + 83] [expr $nodeTagj + 83] [expr $nodeTagj + 82] $RetWallTag
	element ShellMITC4 [expr $shellTag + 32] [expr $nodeTagi + 83] [expr $nodeTagi + 84] [expr $nodeTagj + 84] [expr $nodeTagj + 83] $RetWallTag
	element ShellMITC4 [expr $shellTag + 33] [expr $nodeTagi + 84] [expr $nodeTagi + 85] [expr $nodeTagj + 85] [expr $nodeTagj + 84] $RetWallTag
	element ShellMITC4 [expr $shellTag + 34] [expr $nodeTagi + 85] [expr $nodeTagi + 86] [expr $nodeTagj + 86] [expr $nodeTagj + 85] $RetWallTag
	element ShellMITC4 [expr $shellTag + 35] [expr $nodeTagi + 86] [expr $nodeTagi + 87] [expr $nodeTagj + 87] [expr $nodeTagj + 86] $RetWallTag
	element ShellMITC4 [expr $shellTag + 36] [expr $nodeTagi + 87] [expr $nodeTagi + 88] [expr $nodeTagj + 88] [expr $nodeTagj + 87] $RetWallTag
	element ShellMITC4 [expr $shellTag + 37] [expr $nodeTagi + 88] [expr $nodeTagi + 89] [expr $nodeTagj + 89] [expr $nodeTagj + 88] $RetWallTag
	element ShellMITC4 [expr $shellTag + 38] [expr $nodeTagi + 89] [expr $nodeTagi + 90] [expr $nodeTagj + 90] [expr $nodeTagj + 89] $RetWallTag

}