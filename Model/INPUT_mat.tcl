
# ##############################################################################################################################################################################################
# ######################################################################  UNCONFINED CONCRETE  #################################################################################################
# ##############################################################################################################################################################################################

set lambda 0.1
set fcuFactor 0.2;	# Percentage of f'c considered for residual strength
set matTag 1


#set EcWall5	[expr 33000.*pow(0.140 + 5./1000,1.5)*sqrt(5.)*$ksi];
#set EcWall6	[expr 33000.*pow(0.140 + 6./1000,1.5)*sqrt(6.)*$ksi];
#set EcWall7	[expr 33000.*pow(0.140 + 7./1000,1.5)*sqrt(7.)*$ksi];
#set EcWall8	[expr 33000.*pow(0.140 + 8./1000,1.5)*sqrt(8.)*$ksi];

set EcWall5	[expr 33000.*pow(0.140 + 6.5/1000,1.5)*sqrt(6.5)*$ksi];
set EcWall6	[expr 33000.*pow(0.140 + 7.8/1000,1.5)*sqrt(7.8)*$ksi];
set EcWall7	[expr 33000.*pow(0.140 + 9.1/1000,1.5)*sqrt(9.1)*$ksi];
set EcWall8	[expr 33000.*pow(0.140 + 10.4/1000,1.5)*sqrt(10.4)*$ksi];

# 5 ksi
set unconfinedConc5 $matTag;
incr matTag 1
#uniaxialMaterial Concrete02 $matTag $fpc $epsc0 $fpcu $epsU $lambda $ft $Ets
	
set fpc		[expr 6.5*$ksi];										# Unconfined Concrete Strength
set EcWall	$EcWall5;	# Young's Modulus of Concrete
set epsc	[expr 2.*$fpc/$EcWall];									# Concrete strength at maximum strength
set fpcu	[expr $fcuFactor*$fpc];									# Concrete crushing strength
set fr		[expr 5.7*sqrt(6500.)*$psi];							# Concrete tensile strength
set ecr5	[expr $fr/$EcWall5];									# Cracking strain

set epscu	0.006;													# Concrete strain at crushing strength
set nuc 0.2;														# Poisson's Ratio of Concrete
set GcWall 	[expr $EcWall/(2.0*(1.0+$nuc))];						# Shear Modulus of Concrete
set Ets		[expr $EcWall*0.1];										# Tension softening stiffness
	
uniaxialMaterial Concrete02 $unconfinedConc5 -$fpc -$epsc -$fpcu -$epscu $lambda $fr $Ets

# 6 ksi
set unconfinedConc6 $matTag;
incr matTag 1
#uniaxialMaterial Concrete02 $matTag $fpc $epsc0 $fpcu $epsU $lambda $ft $Ets
	
set fpc		[expr 7.8*$ksi];										# Unconfined Concrete Strength
set EcWall	$EcWall6;	# Young's Modulus of Concrete
set epsc	[expr 2.*$fpc/$EcWall];									# Concrete strength at maximum strength
set fpcu	[expr $fcuFactor*$fpc];									# Concrete crushing strength
set fr		[expr 5.7*sqrt(7800.)*$psi];							# Concrete tensile strength
set ecr6	[expr $fr/$EcWall6];									# Cracking strain

set epscu	0.006;													# Concrete strain at crushing strength
set nuc 0.2;														# Poisson's Ratio of Concrete
set GcWall 	[expr $EcWall/(2.0*(1.0+$nuc))];						# Shear Modulus of Concrete
set Ets		[expr $EcWall*0.1];										# Tension softening stiffness

uniaxialMaterial Concrete02 $unconfinedConc6 -$fpc -$epsc -$fpcu -$epscu $lambda $fr $Ets

# 7 ksi
set unconfinedConc7 $matTag;
incr matTag 1
#uniaxialMaterial Concrete02 $matTag $fpc $epsc0 $fpcu $epsU $lambda $ft $Ets
	
set fpc		[expr 9.1*$ksi];										# Unconfined Concrete Strength
set EcWall	$EcWall7;	# Young's Modulus of Concrete
set epsc	[expr 2.*$fpc/$EcWall];									# Concrete strength at maximum strength
set fpcu	[expr $fcuFactor*$fpc];									# Concrete crushing strength
set fr		[expr 5.7*sqrt(9100.)*$psi];							# Concrete tensile strength
set ecr7	[expr $fr/$EcWall7];									# Cracking strain

set epscu	0.006;													# Concrete strain at crushing strength
set nuc 0.2;														# Poisson's Ratio of Concrete
set GcWall 	[expr $EcWall/(2.0*(1.0+$nuc))];						# Shear Modulus of Concrete
set Ets		[expr $EcWall*0.1];										# Tension softening stiffness

uniaxialMaterial Concrete02 $unconfinedConc7 -$fpc -$epsc -$fpcu -$epscu $lambda $fr $Ets

# 8 ksi
set unconfinedConc8 $matTag;
incr matTag 1
#uniaxialMaterial Concrete02 $matTag $fpc $epsc0 $fpcu $epsU $lambda $ft $Ets
	
set fpc		[expr 10.4*$ksi];										# Unconfined Concrete Strength
set EcWall	$EcWall8;	# Young's Modulus of Concrete
set epsc	[expr 2.*$fpc/$EcWall];									# Concrete strength at maximum strength
set fpcu	[expr $fcuFactor*$fpc];									# Concrete crushing strength
set fr		[expr 5.7*sqrt(10400.)*$psi];							# Concrete tensile strength
set ecr8	[expr $fr/$EcWall8];									# Cracking strain

set epscu	0.006;													# Concrete strain at crushing strength
set nuc 0.2;														# Poisson's Ratio of Concrete
set GcWall 	[expr $EcWall/(2.0*(1.0+$nuc))];						# Shear Modulus of Concrete
set Ets		[expr $EcWall*0.1];										# Tension softening stiffness

uniaxialMaterial Concrete02 $unconfinedConc8 -$fpc -$epsc -$fpcu -$epscu $lambda $fr $Ets
# ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

# ##############################################################################################################################################################################################
# ########################################################################	CONFINED CONCRETE WALLS ############################################################################################
# ##############################################################################################################################################################################################

# Wall 36 8 ksi boundary element
set confinedConcW36_8_be $matTag;
incr matTag 1
#uniaxialMaterial Concrete02 $matTag $fpc $epsc0 $fpcu $epsU $lambda $ft $Ets
	
set fpc		[expr 10.4*$ksi];										# Unconfined Concrete Strength
set fpcc	[expr 13.72*$ksi];
set EcWall	$EcWall8;	# Young's Modulus of Concrete
set epsc	[expr 2.*$fpcc/$EcWall];								# Concrete strength at maximum strength
set fpcu	[expr $fcuFactor*$fpcc];								# Concrete crushing strength
set fr		[expr 5.7*sqrt(10400.)*$psi];							# Concrete tensile strength

set epscu	0.0105;													# Concrete strain at crushing strength
set nuc 0.2;														# Poisson's Ratio of Concrete
set GcWall 	[expr $EcWall/(2.0*(1.0+$nuc))];						# Shear Modulus of Concrete
set Ets		[expr $EcWall*0.1];										# Tension softening stiffness

uniaxialMaterial Concrete02 $confinedConcW36_8_be -$fpcc -$epsc -$fpcu -$epscu $lambda $fr $Ets

# Wall 36 8 ksi corner element
set confinedConcW36_8_ce $matTag;
incr matTag 1
#uniaxialMaterial Concrete02 $matTag $fpc $epsc0 $fpcu $epsU $lambda $ft $Ets
	
set fpc		[expr 10.4*$ksi];										# Unconfined Concrete Strength
set fpcc	[expr 12.21*$ksi];
set EcWall	$EcWall8;	# Young's Modulus of Concrete
set epsc	[expr 2.*$fpcc/$EcWall];								# Concrete strength at maximum strength
set fpcu	[expr $fcuFactor*$fpcc];								# Concrete crushing strength
set fr		[expr 5.7*sqrt(10400.)*$psi];							# Concrete tensile strength

set epscu	0.0072;													# Concrete strain at crushing strength
set nuc 0.2;														# Poisson's Ratio of Concrete
set GcWall 	[expr $EcWall/(2.0*(1.0+$nuc))];						# Shear Modulus of Concrete
set Ets		[expr $EcWall*0.1];										# Tension softening stiffness

uniaxialMaterial Concrete02 $confinedConcW36_8_ce -$fpcc -$epsc -$fpcu -$epscu $lambda $fr $Ets

# Wall 36 and 32 7 ksi boundary element
set confinedConcW36_32_7_be $matTag;
incr matTag 1
#uniaxialMaterial Concrete02 $matTag $fpc $epsc0 $fpcu $epsU $lambda $ft $Ets
	
set fpc		[expr 9.1*$ksi];										# Unconfined Concrete Strength
set fpcc	[expr 12.32*$ksi];
set EcWall	$EcWall7;	# Young's Modulus of Concrete
set epsc	[expr 2.*$fpcc/$EcWall];								# Concrete strength at maximum strength
set fpcu	[expr $fcuFactor*$fpcc];								# Concrete crushing strength
set fr		[expr 5.7*sqrt(9100.)*$psi];							# Concrete tensile strength

set epscu	0.0115;													# Concrete strain at crushing strength
set nuc 0.2;														# Poisson's Ratio of Concrete
set GcWall 	[expr $EcWall/(2.0*(1.0+$nuc))];						# Shear Modulus of Concrete
set Ets		[expr $EcWall*0.1];										# Tension softening stiffness

uniaxialMaterial Concrete02 $confinedConcW36_32_7_be -$fpcc -$epsc -$fpcu -$epscu $lambda $fr $Ets

# Wall 36 and 32 7 ksi corner element
set confinedConcW36_32_7_ce $matTag;
incr matTag 1
#uniaxialMaterial Concrete02 $matTag $fpc $epsc0 $fpcu $epsU $lambda $ft $Ets
	
set fpc		[expr 9.1*$ksi];										# Unconfined Concrete Strength
set fpcc	[expr 10.88*$ksi];
set EcWall	$EcWall7;	# Young's Modulus of Concrete
set epsc	[expr 2.*$fpcc/$EcWall];								# Concrete strength at maximum strength
set fpcu	[expr $fcuFactor*$fpcc];								# Concrete crushing strength
set fr		[expr 5.7*sqrt(9100.)*$psi];							# Concrete tensile strength

set epscu	0.00767;												# Concrete strain at crushing strength
set nuc 0.2;														# Poisson's Ratio of Concrete
set GcWall 	[expr $EcWall/(2.0*(1.0+$nuc))];						# Shear Modulus of Concrete
set Ets		[expr $EcWall*0.1];										# Tension softening stiffness

uniaxialMaterial Concrete02 $confinedConcW36_32_7_ce -$fpcc -$epsc -$fpcu -$epscu $lambda $fr $Ets

# Wall 28 and 24 6 ksi boundary element
set confinedConcW28_24_6_be $matTag;
incr matTag 1
#uniaxialMaterial Concrete02 $matTag $fpc $epsc0 $fpcu $epsU $lambda $ft $Ets
	
set fpc		[expr 7.8*$ksi];										# Unconfined Concrete Strength
set fpcc	[expr 10.17*$ksi];
set EcWall	$EcWall6;	# Young's Modulus of Concrete
set epsc	[expr 2.*$fpcc/$EcWall];								# Concrete strength at maximum strength
set fpcu	[expr $fcuFactor*$fpcc];								# Concrete crushing strength
set fr		[expr 5.7*sqrt(7800.)*$psi];							# Concrete tensile strength

set epscu	0.0102;													# Concrete strain at crushing strength
set nuc 0.2;														# Poisson's Ratio of Concrete
set GcWall 	[expr $EcWall/(2.0*(1.0+$nuc))];						# Shear Modulus of Concrete
set Ets		[expr $EcWall*0.1];										# Tension softening stiffness

uniaxialMaterial Concrete02 $confinedConcW28_24_6_be -$fpcc -$epsc -$fpcu -$epscu $lambda $fr $Ets

# Wall 28 and 24 6 ksi corner element
set confinedConcW28_24_6_ce $matTag;
incr matTag 1
#uniaxialMaterial Concrete02 $matTag $fpc $epsc0 $fpcu $epsU $lambda $ft $Ets
	
set fpc		[expr 7.8*$ksi];										# Unconfined Concrete Strength
set fpcc	[expr 9.29*$ksi];
set EcWall	$EcWall6;	# Young's Modulus of Concrete
set epsc	[expr 2.*$fpcc/$EcWall];								# Concrete strength at maximum strength
set fpcu	[expr $fcuFactor*$fpcc];								# Concrete crushing strength
set fr		[expr 5.7*sqrt(7800.)*$psi];							# Concrete tensile strength

set epscu	0.0075;													# Concrete strain at crushing strength
set nuc 0.2;														# Poisson's Ratio of Concrete
set GcWall 	[expr $EcWall/(2.0*(1.0+$nuc))];						# Shear Modulus of Concrete
set Ets		[expr $EcWall*0.1];										# Tension softening stiffness

uniaxialMaterial Concrete02 $confinedConcW28_24_6_ce -$fpcc -$epsc -$fpcu -$epscu $lambda $fr $Ets

# Wall 20 6 boundary element
set confinedConcW20_6_be $matTag;
incr matTag 1
#uniaxialMaterial Concrete02 $matTag $fpc $epsc0 $fpcu $epsU $lambda $ft $Ets
	
set fpc		[expr 7.8*$ksi];										# Unconfined Concrete Strength
set fpcc	[expr 9.96*$ksi];
set EcWall	$EcWall6;	# Young's Modulus of Concrete
set epsc	[expr 2.*$fpcc/$EcWall];								# Concrete strength at maximum strength
set fpcu	[expr $fcuFactor*$fpcc];								# Concrete crushing strength
set fr		[expr 5.7*sqrt(7800.)*$psi];							# Concrete tensile strength

set epscu	0.0095;													# Concrete strain at crushing strength
set nuc 0.2;														# Poisson's Ratio of Concrete
set GcWall 	[expr $EcWall/(2.0*(1.0+$nuc))];						# Shear Modulus of Concrete
set Ets		[expr $EcWall*0.1];										# Tension softening stiffness

uniaxialMaterial Concrete02 $confinedConcW20_6_be -$fpcc -$epsc -$fpcu -$epscu $lambda $fr $Ets

# Wall 20 6 corner element
set confinedConcW20_6_ce $matTag;
incr matTag 1
#uniaxialMaterial Concrete02 $matTag $fpc $epsc0 $fpcu $epsU $lambda $ft $Ets
	
set fpc		[expr 7.8*$ksi];										# Unconfined Concrete Strength
set fpcc	[expr 9.06*$ksi];
set EcWall	$EcWall6;	# Young's Modulus of Concrete
set epsc	[expr 2.*$fpcc/$EcWall];								# Concrete strength at maximum strength
set fpcu	[expr $fcuFactor*$fpcc];								# Concrete crushing strength
set fr		[expr 5.7*sqrt(7800.)*$psi];							# Concrete tensile strength

set epscu	0.0069;													# Concrete strain at crushing strength
set nuc 0.2;														# Poisson's Ratio of Concrete
set GcWall 	[expr $EcWall/(2.0*(1.0+$nuc))];						# Shear Modulus of Concrete
set Ets		[expr $EcWall*0.1];										# Tension softening stiffness

uniaxialMaterial Concrete02 $confinedConcW20_6_ce -$fpcc -$epsc -$fpcu -$epscu $lambda $fr $Ets

# Wall 20 6 rectangular wall boundary element
set confinedConcW20_6_rec_be $matTag;
incr matTag 1
#uniaxialMaterial Concrete02 $matTag $fpc $epsc0 $fpcu $epsU $lambda $ft $Ets
	
set fpc		[expr 7.8*$ksi];										# Unconfined Concrete Strength
set fpcc	[expr 10.54*$ksi];
set EcWall	$EcWall6;	# Young's Modulus of Concrete
set epsc	[expr 2.*$fpcc/$EcWall];								# Concrete strength at maximum strength
set fpcu	[expr $fcuFactor*$fpcc];								# Concrete crushing strength
set fr		[expr 5.7*sqrt(7800.)*$psi];							# Concrete tensile strength

set epscu	0.0114;													# Concrete strain at crushing strength
set nuc 0.2;														# Poisson's Ratio of Concrete
set GcWall 	[expr $EcWall/(2.0*(1.0+$nuc))];						# Shear Modulus of Concrete
set Ets		[expr $EcWall*0.1];										# Tension softening stiffness

uniaxialMaterial Concrete02 $confinedConcW20_6_rec_be -$fpcc -$epsc -$fpcu -$epscu $lambda $fr $Ets

# Wall 20 6 rectangular wall boundary element office
set confinedConcW20_6_rec_be_o $matTag;
incr matTag 1
#uniaxialMaterial Concrete02 $matTag $fpc $epsc0 $fpcu $epsU $lambda $ft $Ets
	
set fpc		[expr 7.8*$ksi];										# Unconfined Concrete Strength
set fpcc	[expr 10.12*$ksi];
set EcWall	$EcWall6;	# Young's Modulus of Concrete
set epsc	[expr 2.*$fpcc/$EcWall];								# Concrete strength at maximum strength
set fpcu	[expr $fcuFactor*$fpcc];								# Concrete crushing strength
set fr		[expr 5.7*sqrt(7800.)*$psi];							# Concrete tensile strength

set epscu	0.01;													# Concrete strain at crushing strength
set nuc 0.2;														# Poisson's Ratio of Concrete
set GcWall 	[expr $EcWall/(2.0*(1.0+$nuc))];						# Shear Modulus of Concrete
set Ets		[expr $EcWall*0.1];										# Tension softening stiffness

uniaxialMaterial Concrete02 $confinedConcW20_6_rec_be_o -$fpcc -$epsc -$fpcu -$epscu $lambda $fr $Ets
# ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

# ##############################################################################################################################################################################################
# ########################################################################	CONFINED CONCRETE COLS #############################################################################################
# ##############################################################################################################################################################################################

# Columns 12, 16, 20
set confinedConcCol12_20 $matTag;
incr matTag 1
#uniaxialMaterial Concrete02 $matTag $fpc $epsc0 $fpcu $epsU $lambda $ft $Ets
	
set fpc		[expr 7.8*$ksi];										# Unconfined Concrete Strength
set fpcc	[expr 9.41*$ksi];
set EcWall	$EcWall6;	# Young's Modulus of Concrete
set epsc	[expr 2.*$fpcc/$EcWall];								# Concrete strength at maximum strength
set fpcu	[expr $fcuFactor*$fpcc];								# Concrete crushing strength
set fr		[expr 5.7*sqrt(7800.)*$psi];							# Concrete tensile strength

set epscu	0.0079;													# Concrete strain at crushing strength
set nuc 0.2;														# Poisson's Ratio of Concrete
set GcWall 	[expr $EcWall/(2.0*(1.0+$nuc))];						# Shear Modulus of Concrete
set Ets		[expr $EcWall*0.1];										# Tension softening stiffness

uniaxialMaterial Concrete02 $confinedConcCol12_20 -$fpcc -$epsc -$fpcu -$epscu $lambda $fr $Ets

# Columns 24, 28, 32, 36, 40, 44
set confinedConcCol24_44 $matTag;
incr matTag 1
#uniaxialMaterial Concrete02 $matTag $fpc $epsc0 $fpcu $epsU $lambda $ft $Ets
	
set fpc		[expr 7.8*$ksi];										# Unconfined Concrete Strength
set fpcc	[expr 10.31*$ksi];
set EcWall	$EcWall6;	# Young's Modulus of Concrete
set epsc	[expr 2.*$fpcc/$EcWall];								# Concrete strength at maximum strength
set fpcu	[expr $fcuFactor*$fpcc];								# Concrete crushing strength
set fr		[expr 5.7*sqrt(7800.)*$psi];							# Concrete tensile strength

set epscu	0.0106;													# Concrete strain at crushing strength
set nuc 0.2;														# Poisson's Ratio of Concrete
set GcWall 	[expr $EcWall/(2.0*(1.0+$nuc))];						# Shear Modulus of Concrete
set Ets		[expr $EcWall*0.1];										# Tension softening stiffness

uniaxialMaterial Concrete02 $confinedConcCol24_44 -$fpcc -$epsc -$fpcu -$epscu $lambda $fr $Ets

# ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

# ##############################################################################################################################################################################################
# #################################################################################	BEAM CONCRETE  #############################################################################################
# ##############################################################################################################################################################################################

# CB 36x36 8 ksi
set confinedConcCB36x36 $matTag;
incr matTag 1
#uniaxialMaterial Concrete02 $matTag $fpc $epsc0 $fpcu $epsU $lambda $ft $Ets
	
set fpc		[expr 10.4*$ksi];										# Unconfined Concrete Strength
set fpcc	[expr 14.32*$ksi];
set EcWall	$EcWall8;	# Young's Modulus of Concrete
set epsc	[expr 2.*$fpcc/$EcWall];								# Concrete strength at maximum strength
set fpcu	[expr $fcuFactor*$fpcc];								# Concrete crushing strength
set fr		[expr 334.7*$psi];										# Concrete tensile strength

set epscu	0.0121;													# Concrete strain at crushing strength
set nuc 0.2;														# Poisson's Ratio of Concrete
set GcWall 	[expr $EcWall/(2.0*(1.0+$nuc))];						# Shear Modulus of Concrete
set Ets		[expr $EcWall*0.1];										# Tension softening stiffness

uniaxialMaterial Concrete02 $confinedConcCB36x36 -$fpcc -$epsc -$fpcu -$epscu $lambda $fr $Ets

# CB 36x60 8 ksi
set confinedConcCB36x60 $matTag;
incr matTag 1
#uniaxialMaterial Concrete02 $matTag $fpc $epsc0 $fpcu $epsU $lambda $ft $Ets
	
set fpc		[expr 10.4*$ksi];										# Unconfined Concrete Strength
set fpcc	[expr 14.23*$ksi];
set EcWall	$EcWall8;	# Young's Modulus of Concrete
set epsc	[expr 2.*$fpcc/$EcWall];								# Concrete strength at maximum strength
set fpcu	[expr $fcuFactor*$fpcc];								# Concrete crushing strength
set fr		[expr 445.9*$psi];										# Concrete tensile strength

set epscu	0.0119;													# Concrete strain at crushing strength
set nuc 0.2;														# Poisson's Ratio of Concrete
set GcWall 	[expr $EcWall/(2.0*(1.0+$nuc))];						# Shear Modulus of Concrete
set Ets		[expr $EcWall*0.1];										# Tension softening stiffness

uniaxialMaterial Concrete02 $confinedConcCB36x60 -$fpcc -$epsc -$fpcu -$epscu $lambda $fr $Ets

# CB 36x42 7 ksi
set confinedConcCB36x42 $matTag;
incr matTag 1
#uniaxialMaterial Concrete02 $matTag $fpc $epsc0 $fpcu $epsU $lambda $ft $Ets
	
set fpc		[expr 9.1*$ksi];										# Unconfined Concrete Strength
set fpcc	[expr 12.48*$ksi];
set EcWall	$EcWall7;	# Young's Modulus of Concrete
set epsc	[expr 2.*$fpcc/$EcWall];								# Concrete strength at maximum strength
set fpcu	[expr $fcuFactor*$fpcc];								# Concrete crushing strength
set fr		[expr 285.2*$psi];										# Concrete tensile strength

set epscu	0.012;													# Concrete strain at crushing strength
set nuc 0.2;														# Poisson's Ratio of Concrete
set GcWall 	[expr $EcWall/(2.0*(1.0+$nuc))];						# Shear Modulus of Concrete
set Ets		[expr $EcWall*0.1];										# Tension softening stiffness

uniaxialMaterial Concrete02 $confinedConcCB36x42 -$fpcc -$epsc -$fpcu -$epscu $lambda $fr $Ets

# CB 32x30 7 ksi
set confinedConcCB32x30 $matTag;
incr matTag 1
#uniaxialMaterial Concrete02 $matTag $fpc $epsc0 $fpcu $epsU $lambda $ft $Ets
	
set fpc		[expr 9.1*$ksi];										# Unconfined Concrete Strength
set fpcc	[expr 12.12*$ksi];
set EcWall	$EcWall7;	# Young's Modulus of Concrete
set epsc	[expr 2.*$fpcc/$EcWall];								# Concrete strength at maximum strength
set fpcu	[expr $fcuFactor*$fpcc];								# Concrete crushing strength
set fr		[expr 230.7*$psi];										# Concrete tensile strength

set epscu	0.0109;													# Concrete strain at crushing strength
set nuc 0.2;														# Poisson's Ratio of Concrete
set GcWall 	[expr $EcWall/(2.0*(1.0+$nuc))];						# Shear Modulus of Concrete
set Ets		[expr $EcWall*0.1];										# Tension softening stiffness

uniaxialMaterial Concrete02 $confinedConcCB32x30 -$fpcc -$epsc -$fpcu -$epscu $lambda $fr $Ets

# CB 28x30 6 ksi
set confinedConcCB28x30 $matTag;
incr matTag 1
#uniaxialMaterial Concrete02 $matTag $fpc $epsc0 $fpcu $epsU $lambda $ft $Ets
	
set fpc		[expr 7.8*$ksi];										# Unconfined Concrete Strength
set fpcc	[expr 10.61*$ksi];
set EcWall	$EcWall6;	# Young's Modulus of Concrete
set epsc	[expr 2.*$fpcc/$EcWall];								# Concrete strength at maximum strength
set fpcu	[expr $fcuFactor*$fpcc];								# Concrete crushing strength
set fr		[expr 204.4*$psi];										# Concrete tensile strength

set epscu	0.0117;													# Concrete strain at crushing strength
set nuc 0.2;														# Poisson's Ratio of Concrete
set GcWall 	[expr $EcWall/(2.0*(1.0+$nuc))];						# Shear Modulus of Concrete
set Ets		[expr $EcWall*0.1];										# Tension softening stiffness

uniaxialMaterial Concrete02 $confinedConcCB28x30 -$fpcc -$epsc -$fpcu -$epscu $lambda $fr $Ets

# CB 24x30 6 ksi
set confinedConcCB24x30 $matTag;
incr matTag 1
#uniaxialMaterial Concrete02 $matTag $fpc $epsc0 $fpcu $epsU $lambda $ft $Ets
	
set fpc		[expr 7.8*$ksi];											# Unconfined Concrete Strength
set fpcc	[expr 10.47*$ksi];
set EcWall	$EcWall6;	# Young's Modulus of Concrete
set epsc	[expr 2.*$fpcc/$EcWall];								# Concrete strength at maximum strength
set fpcu	[expr $fcuFactor*$fpcc];								# Concrete crushing strength
set fr		[expr 206.*$psi];										# Concrete tensile strength

set epscu	0.0112;													# Concrete strain at crushing strength
set nuc 0.2;														# Poisson's Ratio of Concrete
set GcWall 	[expr $EcWall/(2.0*(1.0+$nuc))];						# Shear Modulus of Concrete
set Ets		[expr $EcWall*0.1];										# Tension softening stiffness

uniaxialMaterial Concrete02 $confinedConcCB24x30 -$fpcc -$epsc -$fpcu -$epscu $lambda $fr $Ets

# CB 20x30 6 ksi
set confinedConcCB20x30 $matTag;
incr matTag 1
#uniaxialMaterial Concrete02 $matTag $fpc $epsc0 $fpcu $epsU $lambda $ft $Ets
	
set fpc		[expr 7.8*$ksi];											# Unconfined Concrete Strength
set fpcc	[expr 10.66*$ksi];
set EcWall	$EcWall6;	# Young's Modulus of Concrete
set epsc	[expr 2.*$fpcc/$EcWall];								# Concrete strength at maximum strength
set fpcu	[expr $fcuFactor*$fpcc];								# Concrete crushing strength
set fr		[expr 208.3*$psi];										# Concrete tensile strength

set epscu	0.0118;													# Concrete strain at crushing strength
set nuc 0.2;														# Poisson's Ratio of Concrete
set GcWall 	[expr $EcWall/(2.0*(1.0+$nuc))];						# Shear Modulus of Concrete
set Ets		[expr $EcWall*0.1];										# Tension softening stiffness

uniaxialMaterial Concrete02 $confinedConcCB20x30 -$fpcc -$epsc -$fpcu -$epscu $lambda $fr $Ets
# ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

# ##############################################################################################################################################################################################
# #################################################################################### STEEL ###################################################################################################
# ##############################################################################################################################################################################################
set SteelMatTag $matTag
incr matTag 1

# uniaxialMaterial Steel02 $matTag $Fy $E $b $R0 $cR1 $cR2 <$a1 $a2 $a3 $a4 $sigInit>

set Fy	[expr 69.*$ksi];		# Expected yield strength
set Es	[expr 29000.*$ksi];		# Steel Young's modulus
set b 	0.0165;					# Strain hardening ratio
set R0	20.;
set cR1	0.925;
set cR2	0.15;

uniaxialMaterial Steel02 $SteelMatTag $Fy $Es $b $R0 $cR1 $cR2

# ##############################################################################################################################################################################################
# #################################################################################### ELASTIC #################################################################################################
# ##############################################################################################################################################################################################

set rigidMat $matTag
incr matTag 1

set elasticE 1e10

uniaxialMaterial Elastic $rigidMat $elasticE