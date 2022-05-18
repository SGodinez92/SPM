# Stringers sections

puts $ModelFile "INPUT_sec_spm_PT.tcl"

set Ec5	[expr 33000.*pow(0.140 + 6.5/1000,1.5)*sqrt(6.5)*$ksi];	# Young's Modulus of Concrete 5 ksi
set Ec6	[expr 33000.*pow(0.140 + 7.8/1000,1.5)*sqrt(7.8)*$ksi];	# Young's Modulus of Concrete 6 ksi

set Es [expr 29000.*$ksi]

set nuc 0.2

set Ec5String $matTag
incr matTag 1

set Ec6String $matTag
incr matTag 1

set stiffFac 0.5

uniaxialMaterial Elastic $Ec5String [expr $stiffFac*$Ec5]
uniaxialMaterial Elastic $Ec6String [expr $stiffFac*$Ec6]

puts $ModelFile "Steel Material"

# Reinforcing steel
set SteelString $matTag
incr matTag 1

# uniaxialMaterial Steel02 $matTag $Fy $E $b $R0 $cR1 $cR2 <$a1 $a2 $a3 $a4 $sigInit>

set Fy	[expr 69.*$ksi];		# Expected yield strength
set Es	[expr 29000.*$ksi];		# Steel Young's modulus
set b 	0.012;					# Strain hardening ratio
set R0	20.;
set cR1	0.9;
set cR2	0.05;

set a1 0.039;
set a2 0.029;
set a3 0.0;
set a4 1.0;

uniaxialMaterial Steel02 $SteelString $Fy $Es $b $R0 $cR1 $cR2 $a1 $a2 $a3 $a4
puts $ModelFile "uniaxialMaterial Steel02 $SteelString $Fy $Es $b $R0 $cR1 $cR2 $a1 $a2 $a3 $a4"

# The tensile strength is also reduced by 2 factors
# Factor fx_1 is to consider that the strut is not going to develop the full tensile strength, strain distribution in the width is not linear and cracks do not spread through the entire width
# Factor fx_2 is to consider that in reality the stringer is not purely in tension, thre is vibration, bending, and other forces/stresses 

set fx_1 1.0
set fx_2 0.6

# 5 ksi
set stringConc5_eff $matTag;
incr matTag 1
#uniaxialMaterial Concrete02 $matTag $fpc $epsc0 $fpcu $epsU $lambda $ft $Ets

set fpc		[expr 6.5*$ksi];										# Unconfined Concrete Strength
set EcWall	$Ec5;	# Young's Modulus of Concrete
set epsc	[expr 2.*$fpc/$EcWall];									# Concrete strength at maximum strength
set fpcu	[expr $fcuFactor*$fpc];									# Concrete crushing strength
set fr		[expr 5.7*sqrt(6500.)*$psi*$fx_1*$fx_2];				# Concrete tensile strength

set epscu	0.006;													# Concrete strain at crushing strength
set nuc 0.2;														# Poisson's Ratio of Concrete
set GcWall 	[expr $EcWall/(2.0*(1.0+$nuc))];						# Shear Modulus of Concrete
set Ets		[expr $EcWall*0.1];										# Tension softening stiffness

uniaxialMaterial Concrete02 $stringConc5_eff -$fpc -$epsc -$fpcu -$epscu $lambda $fr $Ets
puts $ModelFile "uniaxialMaterial Concrete02 $stringConc5_eff -$fpc -$epsc -$fpcu -$epscu $lambda $fr $Ets"

# 6 ksi
set stringConc6_12_eff $matTag;
incr matTag 1
#uniaxialMaterial Concrete02 $matTag $fpc $epsc0 $fpcu $epsU $lambda $ft $Ets
	
set fpc		[expr 7.8*$ksi];										# Unconfined Concrete Strength
set EcWall	$Ec6;	# Young's Modulus of Concrete
set epsc	[expr 2.*$fpc/$EcWall];									# Concrete strength at maximum strength
set fpcu	[expr $fcuFactor*$fpc];									# Concrete crushing strength
set fr		[expr 5.7*sqrt(7800.)*$psi*$fx_1*$fx_2];			# Concrete tensile strength

set epscu	0.006;													# Concrete strain at crushing strength
set nuc 0.2;														# Poisson's Ratio of Concrete
set GcWall 	[expr $EcWall/(2.0*(1.0+$nuc))];						# Shear Modulus of Concrete
set Ets		[expr $EcWall*0.1];										# Tension softening stiffness

uniaxialMaterial Concrete02 $stringConc6_12_eff -$fpc -$epsc -$fpcu -$epscu $lambda $fr $Ets
puts $ModelFile "uniaxialMaterial Concrete02 $stringConc6_12_eff -$fpc -$epsc -$fpcu -$epscu $lambda $fr $Ets"


# ###################################

puts $ModelFile "Concrete material, immediate cracking"

set fx_1 0.2
set fx_2 0.2

# 5 ksi
set stringConc5 $matTag;
incr matTag 1
#uniaxialMaterial Concrete02 $matTag $fpc $epsc0 $fpcu $epsU $lambda $ft $Ets

set fpc		[expr 6.5*$ksi];										# Unconfined Concrete Strength
set EcWall	$Ec5;	# Young's Modulus of Concrete
set epsc	[expr 2.*$fpc/$EcWall];									# Concrete strength at maximum strength
set fpcu	[expr $fcuFactor*$fpc];									# Concrete crushing strength
set fr		[expr 5.7*sqrt(6500.)*$psi*$fx_1*$fx_2];				# Concrete tensile strength

set epscu	0.006;													# Concrete strain at crushing strength
set nuc 0.2;														# Poisson's Ratio of Concrete
set GcWall 	[expr $EcWall/(2.0*(1.0+$nuc))];						# Shear Modulus of Concrete
set Ets		[expr $EcWall*0.1];										# Tension softening stiffness

uniaxialMaterial Concrete02 $stringConc5 -$fpc -$epsc -$fpcu -$epscu $lambda $fr $Ets
puts $ModelFile "uniaxialMaterial Concrete02 $stringConc5 -$fpc -$epsc -$fpcu -$epscu $lambda $fr $Ets"

# 6 ksi
set stringConc6_12 $matTag;
incr matTag 1
#uniaxialMaterial Concrete02 $matTag $fpc $epsc0 $fpcu $epsU $lambda $ft $Ets
	
set fpc		[expr 7.8*$ksi];										# Unconfined Concrete Strength
set EcWall	$Ec6;	# Young's Modulus of Concrete
set epsc	[expr 2.*$fpc/$EcWall];									# Concrete strength at maximum strength
set fpcu	[expr $fcuFactor*$fpc];									# Concrete crushing strength
set fr		[expr 5.7*sqrt(7800.)*$psi*$fx_1*$fx_2];				# Concrete tensile strength

set epscu	0.006;													# Concrete strain at crushing strength
set nuc 0.2;														# Poisson's Ratio of Concrete
set GcWall 	[expr $EcWall/(2.0*(1.0+$nuc))];						# Shear Modulus of Concrete
set Ets		[expr $EcWall*0.1];										# Tension softening stiffness

uniaxialMaterial Concrete02 $stringConc6_12 -$fpc -$epsc -$fpcu -$epscu $lambda $fr $Ets
puts $ModelFile "uniaxialMaterial Concrete02 $stringConc6_12 -$fpc -$epsc -$fpcu -$epscu $lambda $fr $Ets"

# ##############################################################################################################################################################################################
# ############################################################################ ELASTIC SECTIONS ################################################################################################
# ##############################################################################################################################################################################################

# STRINGER SECTION (8" thickness diaphragm) Story 12-36, Story 4-10, Story 1-2
set t [expr 8.*$in]
set w1 [expr 12.*12*$in]
set w2 [expr 14.*12*$in]

set string12x8_elastic $secTag
incr secTag 1

section Fiber $string12x8_elastic -GJ 0.0 {

fiber 0 0 [expr $t*$w1] $Ec5String;	# Elastic section

}

set string12x8_CB_elastic $secTag
incr secTag 1

section Fiber $string12x8_CB_elastic -GJ 0.0 {

fiber 0 0 [expr $t*$w1] $Ec5String;	# Elastic section

}

set string14x8_elastic $secTag
incr secTag 1

section Fiber $string14x8_elastic -GJ 0.0 {

fiber 0 0 [expr $t*$w2] $Ec5String;	# Elastic section

}

# STRINGER SECTION (12" thickness diaphragm) Story 11 and story 3
set t [expr 12.*$in]
set w1 [expr 12.*12*$in]
set w2 [expr 14.*12*$in]

set string12x12_elastic $secTag
incr secTag 1

section Fiber $string12x12_elastic -GJ 0.0 {

fiber 0 0 [expr $t*$w1] $Ec6String;	# Elastic section

}

set string12x12_CB_elastic $secTag
incr secTag 1

section Fiber $string12x12_CB_elastic -GJ 0.0 {

fiber 0 0 [expr $t*$w1] $Ec6String;	# Elastic section

}

set string14x12_elastic $secTag
incr secTag 1

section Fiber $string14x12_elastic -GJ 0.0 {

fiber 0 0 [expr $t*$w2] $Ec6String;	# Elastic section

}

# ##############################################################################################################################################################################################
# ########################################################################## NONLINEAR SECTIONS ################################################################################################
# ##############################################################################################################################################################################################

# Two concrete fibers are defined, one considering the effective area in tension (starting point, 4*thickness) and the other considering the rest of the area with immediate cracking
# Thus, for the 8" thickness and 12', the effective area ratio is 144/(4*8)=4.5
# Thus, for the 8" thickness and 14', the effective area ratio is 168/(4*8)=5.25
# Thus, for the 12" thickness and 12', the effective area ratio is 144/(4*12)=3
# Thus, for the 12" thickness and 14', the effective area ratio is 168/(4*12)=3.5

# A minimum steel area of 1% of the effective slab area is assigned to the stringers

# Rebar area
set Adb4	[expr $pi*pow((0.5),2)/4.]
set Adb8	[expr $pi*pow((1.0),2)/4.]
set Adb10	[expr $pi*pow((1.27),2)/4.]


# STRINGER SECTION (8" thickness diaphragm) Story 21-36
set t [expr 8.*$in]
set w1 [expr 12.*12*$in]
set w2 [expr 14.*12*$in]

set string12x8_21_36 $secTag
incr secTag 1

section Fiber $string12x8_21_36 -GJ 0.0 {

fiber 0 0 [expr $t*$w1/4.5] $stringConc5_eff;
fiber 0 0 [expr $t*$w1*3.5/4.5] $stringConc5;
fiber 0 0 [expr 4.*$Adb4] $SteelString;

}

set string12x8_21_36_4num8 $secTag
incr secTag 1

section Fiber $string12x8_21_36_4num8 -GJ 0.0 {

fiber 0 0 [expr $t*$w1/4.5] $stringConc5_eff;
fiber 0 0 [expr $t*$w1*3.5/4.5] $stringConc5;
fiber 0 0 [expr 4.*$Adb8] $SteelString;

}

set string12x8_21_36_CB $secTag
incr secTag 1

section Fiber $string12x8_21_36_CB -GJ 0.0 {

fiber 0 0 [expr $t*$w1/4.5] $stringConc5_eff;
fiber 0 0 [expr $t*$w1*3.5/4.5] $stringConc5;
fiber 0 0 [expr 4.*$Adb4] $SteelString;

}

set string14x8_21_36 $secTag
incr secTag 1

section Fiber $string14x8_21_36 -GJ 0.0 {

fiber 0 0 [expr $t*$w2/5.25] $stringConc5_eff;
fiber 0 0 [expr $t*$w2*4.25/5.25] $stringConc5;
fiber 0 0 [expr 4.*$Adb4] $SteelString;

}

set string14x8_21_36_4num8 $secTag
incr secTag 1

section Fiber $string14x8_21_36_4num8 -GJ 0.0 {

fiber 0 0 [expr $t*$w2/5.25] $stringConc5_eff;
fiber 0 0 [expr $t*$w2*4.25/5.25] $stringConc5;
fiber 0 0 [expr 4.*$Adb8] $SteelString;

}


# STRINGER SECTION (8" thickness diaphragm) Story 17-20
set t [expr 8.*$in]
set w1 [expr 12.*12*$in]
set w2 [expr 14.*12*$in]

set string12x8_17_20 $secTag
incr secTag 1

section Fiber $string12x8_17_20 -GJ 0.0 {

fiber 0 0 [expr $t*$w1/4.5] $stringConc5_eff;
fiber 0 0 [expr $t*$w1*3.5/4.5] $stringConc5;
fiber 0 0 [expr 4.*$Adb4] $SteelString;

}

set string12x8_17_20_6num8 $secTag
incr secTag 1

section Fiber $string12x8_17_20_6num8 -GJ 0.0 {

fiber 0 0 [expr $t*$w1/4.5] $stringConc5_eff;
fiber 0 0 [expr $t*$w1*3.5/4.5] $stringConc5;
fiber 0 0 [expr 6.*$Adb8] $SteelString;

}

set string12x8_17_20_4num8 $secTag
incr secTag 1

section Fiber $string12x8_17_20_4num8 -GJ 0.0 {

fiber 0 0 [expr $t*$w1/4.5] $stringConc5_eff;
fiber 0 0 [expr $t*$w1*3.5/4.5] $stringConc5;
fiber 0 0 [expr 4.*$Adb8] $SteelString;

}

set string12x8_17_20_CB $secTag
incr secTag 1

section Fiber $string12x8_17_20_CB -GJ 0.0 {

fiber 0 0 [expr $t*$w1/4.5] $stringConc5_eff;
fiber 0 0 [expr $t*$w1*3.5/4.5] $stringConc5;
fiber 0 0 [expr 4.*$Adb4] $SteelString;

}

set string14x8_17_20 $secTag
incr secTag 1

section Fiber $string14x8_17_20 -GJ 0.0 {

fiber 0 0 [expr $t*$w2/5.25] $stringConc5_eff;
fiber 0 0 [expr $t*$w2*4.25/5.25] $stringConc5;
fiber 0 0 [expr 4.*$Adb4] $SteelString;

}

set string14x8_17_20_4num8 $secTag
incr secTag 1

section Fiber $string14x8_17_20_4num8 -GJ 0.0 {

fiber 0 0 [expr $t*$w2/5.25] $stringConc5_eff;
fiber 0 0 [expr $t*$w2*4.25/5.25] $stringConc5;
fiber 0 0 [expr 4.*$Adb8] $SteelString;

}

# STRINGER SECTION (8" thickness diaphragm) Story 12-16
set t [expr 8.*$in]
set w1 [expr 12.*12*$in]
set w2 [expr 14.*12*$in]

set string12x8_12_16 $secTag
incr secTag 1

section Fiber $string12x8_12_16 -GJ 0.0 {

fiber 0 0 [expr $t*$w1/4.5] $stringConc5_eff;
fiber 0 0 [expr $t*$w1*3.5/4.5] $stringConc5;
fiber 0 0 [expr 4.*$Adb4] $SteelString;

}

set string12x8_12_16_3num8 $secTag
incr secTag 1

section Fiber $string12x8_12_16_3num8 -GJ 0.0 {

fiber 0 0 [expr $t*$w1/4.5] $stringConc5_eff;
fiber 0 0 [expr $t*$w1*3.5/4.5] $stringConc5;
fiber 0 0 [expr 3.*$Adb8] $SteelString;

}

set string12x8_12_16_4num8 $secTag
incr secTag 1

section Fiber $string12x8_12_16_4num8 -GJ 0.0 {

fiber 0 0 [expr $t*$w1/4.5] $stringConc5_eff;
fiber 0 0 [expr $t*$w1*3.5/4.5] $stringConc5;
fiber 0 0 [expr 4.*$Adb8] $SteelString;

}

set string12x8_12_16_6num8 $secTag
incr secTag 1

section Fiber $string12x8_12_16_6num8 -GJ 0.0 {

fiber 0 0 [expr $t*$w1/4.5] $stringConc5_eff;
fiber 0 0 [expr $t*$w1*3.5/4.5] $stringConc5;
fiber 0 0 [expr 6.*$Adb8] $SteelString;

}

set string12x8_12_16_8num10 $secTag
incr secTag 1

section Fiber $string12x8_12_16_8num10 -GJ 0.0 {

fiber 0 0 [expr $t*$w1/4.5] $stringConc5_eff;
fiber 0 0 [expr $t*$w1*3.5/4.5] $stringConc5;
fiber 0 0 [expr 8.*$Adb10] $SteelString;

}

set string12x8_12_16_CB $secTag
incr secTag 1

section Fiber $string12x8_12_16_CB -GJ 0.0 {

fiber 0 0 [expr $t*$w1/4.5] $stringConc5_eff;
fiber 0 0 [expr $t*$w1*3.5/4.5] $stringConc5;
fiber 0 0 [expr 4.*$Adb4] $SteelString;

}

set string14x8_12_16 $secTag
incr secTag 1

section Fiber $string14x8_12_16 -GJ 0.0 {

fiber 0 0 [expr $t*$w2/5.25] $stringConc5_eff;
fiber 0 0 [expr $t*$w2*4.25/5.25] $stringConc5;
fiber 0 0 [expr 4.*$Adb4] $SteelString;

}

set string14x8_12_16_4num8 $secTag
incr secTag 1

section Fiber $string14x8_12_16_4num8 -GJ 0.0 {

fiber 0 0 [expr $t*$w2/5.25] $stringConc5_eff;
fiber 0 0 [expr $t*$w2*4.25/5.25] $stringConc5;
fiber 0 0 [expr 4.*$Adb8] $SteelString;

}

# STRINGER SECTION (12" thickness diaphragm) Story 11
set t [expr 12.*$in]
set w1 [expr 12.*12*$in]
set w2 [expr 14.*12*$in]

set string12x12_11 $secTag
incr secTag 1

section Fiber $string12x12_11 -GJ 0.0 {

fiber 0 0 [expr $t*$w1/3.] $stringConc6_12_eff;
fiber 0 0 [expr $t*$w1*2/3.] $stringConc6_12;
fiber 0 0 [expr 10.*$Adb4] $SteelString;

}

set string12x12_11_3num8 $secTag
incr secTag 1

section Fiber $string12x12_11_3num8 -GJ 0.0 {

fiber 0 0 [expr $t*$w1/3.] $stringConc6_12_eff;
fiber 0 0 [expr $t*$w1*2/3.] $stringConc6_12;
fiber 0 0 [expr 3.*$Adb8] $SteelString;

}

set string12x12_11_4num8 $secTag
incr secTag 1

section Fiber $string12x12_11_4num8 -GJ 0.0 {

fiber 0 0 [expr $t*$w1/3.] $stringConc6_12_eff;
fiber 0 0 [expr $t*$w1*2/3.] $stringConc6_12;
fiber 0 0 [expr 4.*$Adb8] $SteelString;

}

set string12x12_11_6num8 $secTag
incr secTag 1

section Fiber $string12x12_11_6num8 -GJ 0.0 {

fiber 0 0 [expr $t*$w1/3.] $stringConc6_12_eff;
fiber 0 0 [expr $t*$w1*2/3.] $stringConc6_12;
fiber 0 0 [expr 6.*$Adb8] $SteelString;

}

set string12x12_11_8num8 $secTag
incr secTag 1

section Fiber $string12x12_11_8num8 -GJ 0.0 {

fiber 0 0 [expr $t*$w1/3.] $stringConc6_12_eff;
fiber 0 0 [expr $t*$w1*2/3.] $stringConc6_12;
fiber 0 0 [expr 8.*$Adb8] $SteelString;

}


set string12x12_11_4num10 $secTag
incr secTag 1

section Fiber $string12x12_11_4num10 -GJ 0.0 {

fiber 0 0 [expr $t*$w1/3.] $stringConc6_12_eff;
fiber 0 0 [expr $t*$w1*2/3.] $stringConc6_12;
fiber 0 0 [expr 4.*$Adb10] $SteelString;

}

set string12x12_11_6num10 $secTag
incr secTag 1

section Fiber $string12x12_11_6num10 -GJ 0.0 {

fiber 0 0 [expr $t*$w1/3.] $stringConc6_12_eff;
fiber 0 0 [expr $t*$w1*2/3.] $stringConc6_12;
fiber 0 0 [expr 6.*$Adb10] $SteelString;

}

set string12x12_11_8num10 $secTag
incr secTag 1

section Fiber $string12x12_11_8num10 -GJ 0.0 {

fiber 0 0 [expr $t*$w1/3.] $stringConc6_12_eff;
fiber 0 0 [expr $t*$w1*2/3.] $stringConc6_12;
fiber 0 0 [expr 8.*$Adb10] $SteelString;

}

set string12x12_11_9num10 $secTag
incr secTag 1

section Fiber $string12x12_11_9num10 -GJ 0.0 {

fiber 0 0 [expr $t*$w1/3.] $stringConc6_12_eff;
fiber 0 0 [expr $t*$w1*2/3.] $stringConc6_12;
fiber 0 0 [expr 9.*$Adb10] $SteelString;

}

set string12x12_11_12num10 $secTag
incr secTag 1

section Fiber $string12x12_11_12num10 -GJ 0.0 {

fiber 0 0 [expr $t*$w1/3.] $stringConc6_12_eff;
fiber 0 0 [expr $t*$w1*2/3.] $stringConc6_12;
fiber 0 0 [expr 12.*$Adb10] $SteelString;

}

set string12x12_11_18num10 $secTag
incr secTag 1

section Fiber $string12x12_11_18num10 -GJ 0.0 {

fiber 0 0 [expr $t*$w1/3.] $stringConc6_12_eff;
fiber 0 0 [expr $t*$w1*2/3.] $stringConc6_12;
fiber 0 0 [expr 18.*$Adb10] $SteelString;

}

set string12x12_11_CB $secTag
incr secTag 1

section Fiber $string12x12_11_CB -GJ 0.0 {

fiber 0 0 [expr $t*$w1/3.] $stringConc6_12_eff;
fiber 0 0 [expr $t*$w1*2/3.] $stringConc6_12;
fiber 0 0 [expr 10.*$Adb4] $SteelString;

}

set string14x12_11 $secTag
incr secTag 1

section Fiber $string14x12_11 -GJ 0.0 {

fiber 0 0 [expr $t*$w2/3.5] $stringConc6_12_eff;
fiber 0 0 [expr $t*$w2*2.5/3.5] $stringConc6_12;
fiber 0 0 [expr 10.*$Adb4] $SteelString;

}

set string14x12_11_4num8 $secTag
incr secTag 1

section Fiber $string14x12_11_4num8 -GJ 0.0 {

fiber 0 0 [expr $t*$w2/3.5] $stringConc6_12_eff;
fiber 0 0 [expr $t*$w2*2.5/3.5] $stringConc6_12;
fiber 0 0 [expr 4.*$Adb8] $SteelString;

}

set string14x12_11_8num8 $secTag
incr secTag 1

section Fiber $string14x12_11_8num8 -GJ 0.0 {

fiber 0 0 [expr $t*$w2/3.5] $stringConc6_12_eff;
fiber 0 0 [expr $t*$w2*2.5/3.5] $stringConc6_12;
fiber 0 0 [expr 8.*$Adb8] $SteelString;

}

set string14x12_11_4num10 $secTag
incr secTag 1

section Fiber $string14x12_11_4num10 -GJ 0.0 {

fiber 0 0 [expr $t*$w2/3.5] $stringConc6_12_eff;
fiber 0 0 [expr $t*$w2*2.5/3.5] $stringConc6_12;
fiber 0 0 [expr 4.*$Adb10] $SteelString;

}

# STRINGER SECTION (8" thickness diaphragm) Story 4-10
set t [expr 8.*$in]
set w1 [expr 12.*12*$in]
set w2 [expr 14.*12*$in]

set string12x8_4_10 $secTag
incr secTag 1

section Fiber $string12x8_4_10 -GJ 0.0 {

fiber 0 0 [expr $t*$w1/4.5] $stringConc5_eff;
fiber 0 0 [expr $t*$w1*3.5/4.5] $stringConc5;
fiber 0 0 [expr 4.*$Adb4] $SteelString;

}

set string12x8_4_10_4num8 $secTag
incr secTag 1

section Fiber $string12x8_4_10_4num8 -GJ 0.0 {

fiber 0 0 [expr $t*$w1/4.5] $stringConc5_eff;
fiber 0 0 [expr $t*$w1*3.5/4.5] $stringConc5;
fiber 0 0 [expr 4.*$Adb8] $SteelString;

}

set string12x8_4_10_8num10 $secTag
incr secTag 1

section Fiber $string12x8_4_10_8num10 -GJ 0.0 {

fiber 0 0 [expr $t*$w1/4.5] $stringConc5_eff;
fiber 0 0 [expr $t*$w1*3.5/4.5] $stringConc5;
fiber 0 0 [expr 8.*$Adb10] $SteelString;

}

set string12x8_4_10_CB $secTag
incr secTag 1

section Fiber $string12x8_4_10_CB -GJ 0.0 {

fiber 0 0 [expr $t*$w1/4.5] $stringConc5_eff;
fiber 0 0 [expr $t*$w1*3.5/4.5] $stringConc5;
fiber 0 0 [expr 4.*$Adb4] $SteelString;

}

set string14x8_4_10 $secTag
incr secTag 1

section Fiber $string14x8_4_10 -GJ 0.0 {

fiber 0 0 [expr $t*$w1/4.5] $stringConc5_eff;
fiber 0 0 [expr $t*$w1*3.5/4.5] $stringConc5;
fiber 0 0 [expr 4.*$Adb4] $SteelString;

}

set string14x8_4_10_4num8 $secTag
incr secTag 1

section Fiber $string14x8_4_10_4num8 -GJ 0.0 {

fiber 0 0 [expr $t*$w1/4.5] $stringConc5_eff;
fiber 0 0 [expr $t*$w1*3.5/4.5] $stringConc5;
fiber 0 0 [expr 4.*$Adb8] $SteelString;

}

# STRINGER SECTION (12" thickness diaphragm) Story 3
set t [expr 12.*$in]
set w1 [expr 12.*12*$in]
set w2 [expr 14.*12*$in]

set string12x12_3 $secTag
incr secTag 1

section Fiber $string12x12_3 -GJ 0.0 {

fiber 0 0 [expr $t*$w1/3.] $stringConc6_12_eff;
fiber 0 0 [expr $t*$w1*2/3.] $stringConc6_12;
fiber 0 0 [expr 10.*$Adb4] $SteelString;

}

set string12x12_3_4num8 $secTag
incr secTag 1

section Fiber $string12x12_3_4num8 -GJ 0.0 {

fiber 0 0 [expr $t*$w1/3.] $stringConc6_12_eff;
fiber 0 0 [expr $t*$w1*2/3.] $stringConc6_12;
fiber 0 0 [expr 4.*$Adb8] $SteelString;

}

set string12x12_3_8num8 $secTag
incr secTag 1

section Fiber $string12x12_3_8num8 -GJ 0.0 {

fiber 0 0 [expr $t*$w1/3.] $stringConc6_12_eff;
fiber 0 0 [expr $t*$w1*2/3.] $stringConc6_12;
fiber 0 0 [expr 8.*$Adb8] $SteelString;

}

set string12x12_3_4num10 $secTag
incr secTag 1

section Fiber $string12x12_3_4num10 -GJ 0.0 {

fiber 0 0 [expr $t*$w1/3.] $stringConc6_12_eff;
fiber 0 0 [expr $t*$w1*2/3.] $stringConc6_12;
fiber 0 0 [expr 4.*$Adb10] $SteelString;

}

set string12x12_3_6num10 $secTag
incr secTag 1

section Fiber $string12x12_3_6num10 -GJ 0.0 {

fiber 0 0 [expr $t*$w1/3.] $stringConc6_12_eff;
fiber 0 0 [expr $t*$w1*2/3.] $stringConc6_12;
fiber 0 0 [expr 6.*$Adb10] $SteelString;

}

set string12x12_3_9num10 $secTag
incr secTag 1

section Fiber $string12x12_3_9num10 -GJ 0.0 {

fiber 0 0 [expr $t*$w1/3.] $stringConc6_12_eff;
fiber 0 0 [expr $t*$w1*2/3.] $stringConc6_12;
fiber 0 0 [expr 9.*$Adb10] $SteelString;

}


set string12x12_3_CB $secTag
incr secTag 1

section Fiber $string12x12_3_CB -GJ 0.0 {

fiber 0 0 [expr $t*$w1/3.] $stringConc6_12_eff;
fiber 0 0 [expr $t*$w1*2/3.] $stringConc6_12;
fiber 0 0 [expr 6.*$Adb4] $SteelString;

}

set string14x12_3 $secTag
incr secTag 1

section Fiber $string14x12_3 -GJ 0.0 {

fiber 0 0 [expr $t*$w2/3.5] $stringConc6_12_eff;
fiber 0 0 [expr $t*$w2*2.5/3.5] $stringConc6_12;
fiber 0 0 [expr 10.*$Adb4] $SteelString;

}

set string14x12_3_8num8 $secTag
incr secTag 1

section Fiber $string14x12_3_8num8 -GJ 0.0 {

fiber 0 0 [expr $t*$w2/3.5] $stringConc6_12_eff;
fiber 0 0 [expr $t*$w2*2.5/3.5] $stringConc6_12;
fiber 0 0 [expr 8.*$Adb8] $SteelString;

}

set string14x12_3_4num10 $secTag
incr secTag 1

section Fiber $string14x12_3_4num10 -GJ 0.0 {

fiber 0 0 [expr $t*$w2/3.5] $stringConc6_12_eff;
fiber 0 0 [expr $t*$w2*2.5/3.5] $stringConc6_12;
fiber 0 0 [expr 4.*$Adb10] $SteelString;

}

set string14x12_3_6num10 $secTag
incr secTag 1

section Fiber $string14x12_3_6num10 -GJ 0.0 {

fiber 0 0 [expr $t*$w2/3.5] $stringConc6_12_eff;
fiber 0 0 [expr $t*$w2*2.5/3.5] $stringConc6_12;
fiber 0 0 [expr 6.*$Adb10] $SteelString;

}

set string14x12_3_9num10 $secTag
incr secTag 1

section Fiber $string14x12_3_9num10 -GJ 0.0 {

fiber 0 0 [expr $t*$w2/3.5] $stringConc6_12_eff;
fiber 0 0 [expr $t*$w2*2.5/3.5] $stringConc6_12;
fiber 0 0 [expr 9.*$Adb10] $SteelString;

}

# STRINGER SECTION (8" thickness diaphragm) Story 1-2
set t [expr 8.*$in]
set w1 [expr 12.*12*$in]
set w2 [expr 14.*12*$in]

set string12x8_1_2 $secTag
incr secTag 1

section Fiber $string12x8_1_2 -GJ 0.0 {

fiber 0 0 [expr $t*$w1/4.5] $stringConc5_eff;
fiber 0 0 [expr $t*$w1*3.5/4.5] $stringConc5;
fiber 0 0 [expr 6.*$Adb4] $SteelString;

}

set string12x8_1_2_3num8 $secTag
incr secTag 1

section Fiber $string12x8_1_2_3num8 -GJ 0.0 {

fiber 0 0 [expr $t*$w1/4.5] $stringConc5_eff;
fiber 0 0 [expr $t*$w1*3.5/4.5] $stringConc5;
fiber 0 0 [expr 3.*$Adb8] $SteelString;

}

set string12x8_1_2_4num8 $secTag
incr secTag 1

section Fiber $string12x8_1_2_4num8 -GJ 0.0 {

fiber 0 0 [expr $t*$w1/4.5] $stringConc5_eff;
fiber 0 0 [expr $t*$w1*3.5/4.5] $stringConc5;
fiber 0 0 [expr 4.*$Adb8] $SteelString;

}

set string12x8_1_2_4num10 $secTag
incr secTag 1

section Fiber $string12x8_1_2_4num10 -GJ 0.0 {

fiber 0 0 [expr $t*$w1/4.5] $stringConc5_eff;
fiber 0 0 [expr $t*$w1*3.5/4.5] $stringConc5;
fiber 0 0 [expr 4.*$Adb10] $SteelString;

}

set string12x8_1_2_6num10 $secTag
incr secTag 1

section Fiber $string12x8_1_2_6num10 -GJ 0.0 {

fiber 0 0 [expr $t*$w1/4.5] $stringConc5_eff;
fiber 0 0 [expr $t*$w1*3.5/4.5] $stringConc5;
fiber 0 0 [expr 6.*$Adb10] $SteelString;

}

set string12x8_1_2_9num10 $secTag
incr secTag 1

section Fiber $string12x8_1_2_9num10 -GJ 0.0 {

fiber 0 0 [expr $t*$w1/4.5] $stringConc5_eff;
fiber 0 0 [expr $t*$w1*3.5/4.5] $stringConc5;
fiber 0 0 [expr 9.*$Adb10] $SteelString;

}

set string12x8_1_2_CB $secTag
incr secTag 1

section Fiber $string12x8_1_2_CB -GJ 0.0 {

fiber 0 0 [expr $t*$w1/4.5] $stringConc5_eff;
fiber 0 0 [expr $t*$w1*3.5/4.5] $stringConc5;
fiber 0 0 [expr 4.*$Adb4] $SteelString;

}

set string14x8_1_2 $secTag
incr secTag 1

section Fiber $string14x8_1_2 -GJ 0.0 {

fiber 0 0 [expr $t*$w2/5.25] $stringConc5_eff;
fiber 0 0 [expr $t*$w2*4.25/5.25] $stringConc5;
fiber 0 0 [expr 6.*$Adb4] $SteelString;

}

set string14x8_1_2_4num8 $secTag
incr secTag 1

section Fiber $string14x8_1_2_4num8 -GJ 0.0 {

fiber 0 0 [expr $t*$w2/5.25] $stringConc5_eff;
fiber 0 0 [expr $t*$w2*4.25/5.25] $stringConc5;
fiber 0 0 [expr 4.*$Adb8] $SteelString;

}

set string14x8_1_2_4num10 $secTag
incr secTag 1

section Fiber $string14x8_1_2_4num10 -GJ 0.0 {

fiber 0 0 [expr $t*$w2/5.25] $stringConc5_eff;
fiber 0 0 [expr $t*$w2*4.25/5.25] $stringConc5;
fiber 0 0 [expr 4.*$Adb10] $SteelString;

}

set string14x8_1_2_6num10 $secTag
incr secTag 1

section Fiber $string14x8_1_2_6num10 -GJ 0.0 {

fiber 0 0 [expr $t*$w2/5.25] $stringConc5_eff;
fiber 0 0 [expr $t*$w2*4.25/5.25] $stringConc5;
fiber 0 0 [expr 6.*$Adb10] $SteelString;

}

set string14x8_1_2_9num10 $secTag
incr secTag 1

section Fiber $string14x8_1_2_9num10 -GJ 0.0 {

fiber 0 0 [expr $t*$w2/5.25] $stringConc5_eff;
fiber 0 0 [expr $t*$w2*4.25/5.25] $stringConc5;
fiber 0 0 [expr 9.*$Adb10] $SteelString;

}

set string14x8_1_2_3num8 $secTag
incr secTag 1

section Fiber $string14x8_1_2_3num8 -GJ 0.0 {

fiber 0 0 [expr $t*$w2/5.25] $stringConc5_eff;
fiber 0 0 [expr $t*$w2*4.25/5.25] $stringConc5;
fiber 0 0 [expr 3.*$Adb8] $SteelString;

}

set string14x8_1_2_4num8 $secTag
incr secTag 1

section Fiber $string14x8_1_2_4num8 -GJ 0.0 {

fiber 0 0 [expr $t*$w2/5.25] $stringConc5_eff;
fiber 0 0 [expr $t*$w2*4.25/5.25] $stringConc5;
fiber 0 0 [expr 4.*$Adb8] $SteelString;

}