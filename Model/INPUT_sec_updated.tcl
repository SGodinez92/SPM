# Updated reinforcement, more steel in walls
set secTag 1

# Rebar area
set Adb6	[expr $pi*pow((0.75),2)/4.]
set Adb7	[expr $pi*pow((0.875),2)/4.]
set Adb8	[expr $pi*pow((1.0),2)/4.]
set Adb9	[expr $pi*pow((1.128),2)/4.]
set Adb10	[expr $pi*pow((1.27),2)/4.]
set Adb11	[expr $pi*pow((1.41),2)/4.]

# WALLS SECTIONS --------------------------------------------------------------------------

#           ____________
#          |  __________|
#          | | ^ y    
#          | | |    
#          | | |    
#       z <----o    
#          | |           
#          | |           
#          | |__________ 
#          |____________|
#          

# local y-z axis defined for C - wall section (left wall)

# WALL SECTION 36 in 8 ksi
set secWall36_8 $secTag
incr secTag 1

#section Fiber $secTag <-GJ $GJ> {
#fiber...
#patch...
#layer...
#...
#}

set EcWall	$EcWall8;	# Young's Modulus of Concrete
set nuc 0.2;														# Poisson's Ratio of Concrete
set GcWall 	[expr $EcWall/(2.0*(1.0+$nuc))];						# Shear Modulus of Concrete

set JWall [expr 2.*12.*$ft*pow(3.*$ft,3)*0.281]
set JWall [expr $JWall + 21.*$ft*pow(3.*$ft,3)*0.302]

set thick 	[expr 36.*$in]
set cover 	[expr 1.*$in]
set be		[expr 4.*$ft]
set ce		[expr 4.*$ft]

section Fiber $secWall36_8 -GJ [expr $GcWall*$JWall] {
#patch rect $matTag $numSubdivY $numSubdivZ $yI $zI $yJ $zJ

#Confined concrete in boundary
patch rect $confinedConcW36_8_be 12 16 [expr -$C_dim1 - $thick/2. + $cover] [expr -$C_dim2 + $cover] [expr -$C_dim1 + $thick/2. - $cover] [expr -$C_dim2+$be]
patch rect $confinedConcW36_8_be 12 16 [expr $C_dim1 - $thick/2. + $cover]  [expr -$C_dim2 + $cover] [expr $C_dim1 + $thick/2. - $cover]  [expr -$C_dim2+$be]

#Unconfined concrete horizontal patch in boundary
patch rect $unconfinedConc8 2 8 [expr -$C_dim1 - $thick/2.] [expr -$C_dim2 + $cover] [expr -$C_dim1 - $thick/2. + $cover] [expr -$C_dim2 + $be]
patch rect $unconfinedConc8 2 8 [expr -$C_dim1 + $thick/2. - $cover] [expr -$C_dim2 + $cover] [expr -$C_dim1 + $thick/2.] [expr -$C_dim2 + $be]
patch rect $unconfinedConc8 2 8 [expr $C_dim1 - $thick/2.] [expr -$C_dim2 + $cover] [expr $C_dim1 - $thick/2. + $cover] [expr -$C_dim2 + $be]
patch rect $unconfinedConc8 2 8 [expr $C_dim1 + $thick/2. - $cover] [expr -$C_dim2 + $cover] [expr $C_dim1 + $thick/2.] [expr -$C_dim2 + $be]

#Unconfined concrete vertical patch in boundary
patch rect $unconfinedConc8 6 2 [expr -$C_dim1 - $thick/2.] [expr -$C_dim2] [expr -$C_dim1 + $thick/2.] [expr -$C_dim2 + $cover]
patch rect $unconfinedConc8 6 2 [expr $C_dim1 - $thick/2.]  [expr -$C_dim2] [expr $C_dim1 + $thick/2.]  [expr -$C_dim2 + $cover]

#Unconfined concrete in flanges
patch rect $unconfinedConc8 8 32 [expr -$C_dim1 - $thick/2.] [expr -$C_dim2 + $be] [expr -$C_dim1 + $thick/2.] [expr $Centr - $thick/2.]
patch rect $unconfinedConc8 8 32 [expr $C_dim1 - $thick/2.]  [expr -$C_dim2 + $be] [expr $C_dim1 + $thick/2.]  [expr $Centr - $thick/2.]

#Unconfined concrete in web
patch rect $unconfinedConc8 60 8 [expr -$C_dim1 -$thick/2. + $ce] [expr $Centr - $thick/2.] [expr $C_dim1 + $thick/2. - $ce] [expr $Centr + $thick/2.]

#Confined concrete in corner element
patch rect $confinedConcW36_8_ce 16 12 [expr -$C_dim1 - $thick/2. + $cover] [expr $Centr - $thick/2. + $cover] [expr -$C_dim1 - $thick/2. + $ce] [expr $Centr + $thick/2. - $cover]
patch rect $confinedConcW36_8_ce 16 12 [expr $C_dim1 + $thick/2. - $ce] [expr $Centr - $thick/2. + $cover] [expr $C_dim1 + $thick/2. - $cover] [expr $Centr + $thick/2. - $cover]

#Unconfined concrete vertical patch in corner
patch rect $unconfinedConc8 8 2 [expr -$C_dim1 - $thick/2.] [expr $Centr - $thick/2.] [expr -$C_dim1 - $thick/2. + $ce] [expr $Centr - $thick/2. + $cover]
patch rect $unconfinedConc8 8 2 [expr -$C_dim1 - $thick/2.] [expr $Centr + $thick/2. - $cover] [expr -$C_dim1 - $thick/2. + $ce] [expr $Centr + $thick/2.]
patch rect $unconfinedConc8 8 2 [expr $C_dim1 + $thick/2. - $ce] [expr $Centr - $thick/2.] [expr $C_dim1 + $thick/2.] [expr $Centr - $thick/2. + $cover]
patch rect $unconfinedConc8 8 2 [expr $C_dim1 + $thick/2. - $ce] [expr $Centr + $thick/2. - $cover] [expr $C_dim1 + $thick/2.] [expr $Centr + $thick/2.]

#Unconfined concrete horizontal patch in corner
patch rect $unconfinedConc8 2 6 [expr -$C_dim1 - $thick/2.] [expr $Centr - $thick/2. + $cover] [expr -$C_dim1 - $thick/2. + $cover] [expr $Centr + $thick/2. - $cover]
patch rect $unconfinedConc8 2 6 [expr $C_dim1 + $thick/2. - $cover] [expr $Centr - $thick/2. + $cover] [expr $C_dim1 + $thick/2.] [expr $Centr + $thick/2. - $cover]

#layer straight $matTag $numFiber $areaFiber $yStart $zStart $yEnd $zEnd

#Steel rebar in flanges
layer straight $SteelMatTag 7 [expr 2.*$Adb9] [expr -$C_dim1 + $thick/2. - $cover - 1] [expr -$C_dim2 + $be + 8] [expr -$C_dim1 + $thick/2. - $cover - 1] [expr $Centr - $thick/2. - 8]
layer straight $SteelMatTag 7 [expr 2.*$Adb9] [expr -$C_dim1 - $thick/2. + $cover + 1] [expr -$C_dim2 + $be + 8] [expr -$C_dim1 - $thick/2. + $cover + 1] [expr $Centr - $thick/2. - 8]
layer straight $SteelMatTag 7 [expr 2.*$Adb9] [expr $C_dim1 + $thick/2. - $cover - 1] [expr -$C_dim2 + $be + 8] [expr $C_dim1 + $thick/2. - $cover - 1] [expr $Centr - $thick/2. - 8]
layer straight $SteelMatTag 7 [expr 2.*$Adb9] [expr $C_dim1 - $thick/2. + $cover + 1] [expr -$C_dim2 + $be + 8] [expr $C_dim1 - $thick/2. + $cover + 1] [expr $Centr - $thick/2. - 8]

#Steel rebar in web
layer straight $SteelMatTag 29 [expr 2.*$Adb9] [expr -$C_dim1 - $thick/2. + $ce + 8] [expr $Centr - $thick/2. + $cover + 1] [expr $C_dim1 + $thick/2. - $ce - 8] [expr $Centr - $thick/2. + $cover + 1]
layer straight $SteelMatTag 29 [expr 2.*$Adb9] [expr -$C_dim1 - $thick/2. + $ce + 8] [expr $Centr + $thick/2. - $cover - 1] [expr $C_dim1 + $thick/2. - $ce - 8] [expr $Centr + $thick/2. - $cover - 1]

#Steel rebars in boundary elements
layer straight $SteelMatTag 9 $Adb11 [expr -$C_dim1 - $thick/2. + $cover + 1] [expr -$C_dim2 + $cover + 1] [expr -$C_dim1 - $thick/2. + $cover + 1] [expr -$C_dim2 + $be - 1]
layer straight $SteelMatTag 9 $Adb11 [expr -$C_dim1 + $thick/2. - $cover - 1] [expr -$C_dim2 + $cover + 1] [expr -$C_dim1 + $thick/2. - $cover - 1] [expr -$C_dim2 + $be - 1]
layer straight $SteelMatTag 5 $Adb11 [expr -$C_dim1 - $thick/2. + $cover + 6] [expr -$C_dim2 + $cover + 1] [expr -$C_dim1 + $thick/2. - $cover - 6] [expr -$C_dim2 + $cover + 1]
layer straight $SteelMatTag 5 $Adb11 [expr -$C_dim1 - $thick/2. + $cover + 6] [expr -$C_dim2 + $be - 1] [expr -$C_dim1 + $thick/2. - $cover - 6] [expr -$C_dim2 + $be - 1]

layer straight $SteelMatTag 9 $Adb11 [expr $C_dim1 - $thick/2. + $cover + 1] [expr -$C_dim2 + $cover + 1] [expr $C_dim1 - $thick/2. + $cover + 1] [expr -$C_dim2 + $be - 1]
layer straight $SteelMatTag 9 $Adb11 [expr $C_dim1 + $thick/2. - $cover - 1] [expr -$C_dim2 + $cover + 1] [expr $C_dim1 + $thick/2. - $cover - 1] [expr -$C_dim2 + $be - 1]
layer straight $SteelMatTag 5 $Adb11 [expr $C_dim1 - $thick/2. + $cover + 6] [expr -$C_dim2 + $cover + 1] [expr $C_dim1 + $thick/2. - $cover - 6] [expr -$C_dim2 + $cover + 1]
layer straight $SteelMatTag 5 $Adb11 [expr $C_dim1 - $thick/2. + $cover + 6] [expr -$C_dim2 + $be - 1] [expr $C_dim1 + $thick/2. - $cover - 6] [expr -$C_dim2 + $be - 1]

#Steel rebars in corner elements
layer straight $SteelMatTag 7 $Adb10 [expr -$C_dim1 - $thick/2. + $cover + 1] [expr $Centr - $thick/2. + $cover + 1] [expr -$C_dim1 - $thick/2. + $ce - $cover - 1] [expr $Centr - $thick/2. + $cover + 1]
layer straight $SteelMatTag 7 $Adb10 [expr -$C_dim1 - $thick/2. + $cover + 1] [expr $Centr + $thick/2. - $cover - 1] [expr -$C_dim1 - $thick/2. + $ce - $cover - 1] [expr $Centr + $thick/2. - $cover - 1]
layer straight $SteelMatTag 3 $Adb10 [expr -$C_dim1 - $thick/2. + $cover + 1] [expr $Centr - $thick/2. + 10] [expr -$C_dim1 - $thick/2. + $cover + 1] [expr $Centr + $thick/2. - 10]
layer straight $SteelMatTag 3 $Adb10 [expr -$C_dim1 - $thick/2. + $ce - $cover - 1] [expr $Centr - $thick/2. + 10] [expr -$C_dim1 - $thick/2. + $ce - $cover - 1] [expr $Centr + $thick/2. - 10]

layer straight $SteelMatTag 7 $Adb10 [expr $C_dim1 + $thick/2. - $ce + $cover + 1] [expr $Centr - $thick/2. + $cover + 1] [expr $C_dim1 + $thick/2. - $cover - 1] [expr $Centr - $thick/2. + $cover + 1]
layer straight $SteelMatTag 7 $Adb10 [expr $C_dim1 + $thick/2. - $ce + $cover + 1] [expr $Centr + $thick/2. - $cover - 1] [expr $C_dim1 + $thick/2. - $cover - 1] [expr $Centr + $thick/2. - $cover - 1]
layer straight $SteelMatTag 3 $Adb10 [expr $C_dim1 + $thick/2. - $cover - 1] [expr $Centr - $thick/2. + 10] [expr $C_dim1 + $thick/2. - $cover - 1] [expr $Centr + $thick/2. - 10]
layer straight $SteelMatTag 3 $Adb10 [expr $C_dim1 + $thick/2. - $ce + $cover + 1] [expr $Centr - $thick/2. + 10] [expr $C_dim1 + $thick/2. - $ce + $cover + 1] [expr $Centr + $thick/2. - 10]
};


# ################################################
# WALL SECTION 36 in 7 ksi
set secWall36_7 $secTag
incr secTag 1

#section Fiber $secTag <-GJ $GJ> {
#fiber...
#patch...
#layer...
#...
#}

set EcWall	$EcWall7;	# Young's Modulus of Concrete
set nuc 0.2;														# Poisson's Ratio of Concrete
set GcWall 	[expr $EcWall/(2.0*(1.0+$nuc))];						# Shear Modulus of Concrete

set JWall [expr 2.*12.*$ft*pow(3.*$ft,3)*0.281]
set JWall [expr $JWall + 21.*$ft*pow(3.*$ft,3)*0.302]

set thick 	[expr 36.*$in]
set cover 	[expr 1.*$in]
set be		[expr 4.*$ft]
set ce		[expr 4.*$ft]

section Fiber $secWall36_7 -GJ [expr $GcWall*$JWall] {
#patch rect $matTag $numSubdivY $numSubdivZ $yI $zI $yJ $zJ

#Confined concrete in boundary
patch rect $confinedConcW36_32_7_be 12 16 [expr -$C_dim1 - $thick/2. + $cover] [expr -$C_dim2+$cover] [expr -$C_dim1 + $thick/2. - $cover] [expr -$C_dim2+$be]
patch rect $confinedConcW36_32_7_be 12 16 [expr $C_dim1 - $thick/2. + $cover]  [expr -$C_dim2+$cover] [expr $C_dim1 + $thick/2. - $cover]  [expr -$C_dim2+$be]

#Unconfined concrete horizontal patch in boundary
patch rect $unconfinedConc7 2 8 [expr -$C_dim1 - $thick/2.] [expr -$C_dim2 + $cover] [expr -$C_dim1 - $thick/2. + $cover] [expr -$C_dim2 + $be]
patch rect $unconfinedConc7 2 8 [expr -$C_dim1 + $thick/2. - $cover] [expr -$C_dim2 + $cover] [expr -$C_dim1 + $thick/2.] [expr -$C_dim2 + $be]
patch rect $unconfinedConc7 2 8 [expr $C_dim1 - $thick/2.] [expr -$C_dim2 + $cover] [expr $C_dim1 - $thick/2. + $cover] [expr -$C_dim2 + $be]
patch rect $unconfinedConc7 2 8 [expr $C_dim1 + $thick/2. - $cover] [expr -$C_dim2 + $cover] [expr $C_dim1 + $thick/2.] [expr -$C_dim2 + $be]

#Unconfined concrete vertical patch in boundary
patch rect $unconfinedConc7 6 2 [expr -$C_dim1 - $thick/2.] [expr -$C_dim2] [expr -$C_dim1 + $thick/2.] [expr -$C_dim2 + $cover]
patch rect $unconfinedConc7 6 2 [expr $C_dim1 - $thick/2.]  [expr -$C_dim2] [expr $C_dim1 + $thick/2.]  [expr -$C_dim2 + $cover]

#Unconfined concrete in flanges
patch rect $unconfinedConc7 8 32 [expr -$C_dim1 - $thick/2.] [expr -$C_dim2 + $be] [expr -$C_dim1 + $thick/2.] [expr $Centr - $thick/2.]
patch rect $unconfinedConc7 8 32 [expr $C_dim1 - $thick/2.]  [expr -$C_dim2 + $be] [expr $C_dim1 + $thick/2.]  [expr $Centr - $thick/2.]

#Unconfined concrete in web
patch rect $unconfinedConc7 60 8 [expr -$C_dim1 -$thick/2. + $ce] [expr $Centr - $thick/2.] [expr $C_dim1 + $thick/2. - $ce] [expr $Centr + $thick/2.]

#Confined concrete in corner element
patch rect $confinedConcW36_32_7_ce 16 12 [expr -$C_dim1 - $thick/2. + $cover] [expr $Centr - $thick/2. + $cover] [expr -$C_dim1 - $thick/2. + $ce] [expr $Centr + $thick/2. - $cover]
patch rect $confinedConcW36_32_7_ce 16 12 [expr $C_dim1 + $thick/2. - $ce] [expr $Centr - $thick/2. + $cover] [expr $C_dim1 + $thick/2. - $cover] [expr $Centr + $thick/2. - $cover]

#Unconfined concrete vertical patch in corner
patch rect $unconfinedConc7 8 2 [expr -$C_dim1 - $thick/2.] [expr $Centr - $thick/2.] [expr -$C_dim1 - $thick/2. + $ce] [expr $Centr - $thick/2. + $cover]
patch rect $unconfinedConc7 8 2 [expr -$C_dim1 - $thick/2.] [expr $Centr + $thick/2. - $cover] [expr -$C_dim1 - $thick/2. + $ce] [expr $Centr + $thick/2.]
patch rect $unconfinedConc7 8 2 [expr $C_dim1 + $thick/2. - $ce] [expr $Centr - $thick/2.] [expr $C_dim1 + $thick/2.] [expr $Centr - $thick/2. + $cover]
patch rect $unconfinedConc7 8 2 [expr $C_dim1 + $thick/2. - $ce] [expr $Centr + $thick/2. - $cover] [expr $C_dim1 + $thick/2.] [expr $Centr + $thick/2.]

#Unconfined concrete horizontal patch in corner
patch rect $unconfinedConc7 2 6 [expr -$C_dim1 - $thick/2.] [expr $Centr - $thick/2. + $cover] [expr -$C_dim1 - $thick/2. + $cover] [expr $Centr + $thick/2. - $cover]
patch rect $unconfinedConc7 2 6 [expr $C_dim1 + $thick/2. - $cover] [expr $Centr - $thick/2. + $cover] [expr $C_dim1 + $thick/2.] [expr $Centr + $thick/2. - $cover]

#layer straight $matTag $numFiber $areaFiber $yStart $zStart $yEnd $zEnd

#Steel rebar in flanges
layer straight $SteelMatTag 7 [expr 2.*$Adb9] [expr -$C_dim1 + $thick/2. - $cover - 1] [expr -$C_dim2 + $be + 8] [expr -$C_dim1 + $thick/2. - $cover - 1] [expr $Centr - $thick/2. - 8]
layer straight $SteelMatTag 7 [expr 2.*$Adb9] [expr -$C_dim1 - $thick/2. + $cover + 1] [expr -$C_dim2 + $be + 8] [expr -$C_dim1 - $thick/2. + $cover + 1] [expr $Centr - $thick/2. - 8]
layer straight $SteelMatTag 7 [expr 2.*$Adb9] [expr $C_dim1 + $thick/2. - $cover - 1] [expr -$C_dim2 + $be + 8] [expr $C_dim1 + $thick/2. - $cover - 1] [expr $Centr - $thick/2. - 8]
layer straight $SteelMatTag 7 [expr 2.*$Adb9] [expr $C_dim1 - $thick/2. + $cover + 1] [expr -$C_dim2 + $be + 8] [expr $C_dim1 - $thick/2. + $cover + 1] [expr $Centr - $thick/2. - 8]

#Steel rebar in web
layer straight $SteelMatTag 29 [expr 2.*$Adb9] [expr -$C_dim1 - $thick/2. + $ce + 8] [expr $Centr - $thick/2. + $cover + 1] [expr $C_dim1 + $thick/2. - $ce - 8] [expr $Centr - $thick/2. + $cover + 1]
layer straight $SteelMatTag 29 [expr 2.*$Adb9] [expr -$C_dim1 - $thick/2. + $ce + 8] [expr $Centr + $thick/2. - $cover - 1] [expr $C_dim1 + $thick/2. - $ce - 8] [expr $Centr + $thick/2. - $cover - 1]

#Steel rebars in boundary elements
layer straight $SteelMatTag 9 $Adb11 [expr -$C_dim1 - $thick/2. + $cover + 1] [expr -$C_dim2 + $cover + 1] [expr -$C_dim1 - $thick/2. + $cover + 1] [expr -$C_dim2 + $be - 1]
layer straight $SteelMatTag 9 $Adb11 [expr -$C_dim1 + $thick/2. - $cover - 1] [expr -$C_dim2 + $cover + 1] [expr -$C_dim1 + $thick/2. - $cover - 1] [expr -$C_dim2 + $be - 1]
layer straight $SteelMatTag 5 $Adb11 [expr -$C_dim1 - $thick/2. + $cover + 6] [expr -$C_dim2 + $cover + 1] [expr -$C_dim1 + $thick/2. - $cover - 6] [expr -$C_dim2 + $cover + 1]
layer straight $SteelMatTag 5 $Adb11 [expr -$C_dim1 - $thick/2. + $cover + 6] [expr -$C_dim2 + $be - 1] [expr -$C_dim1 + $thick/2. - $cover - 6] [expr -$C_dim2 + $be - 1]

layer straight $SteelMatTag 9 $Adb11 [expr $C_dim1 - $thick/2. + $cover + 1] [expr -$C_dim2 + $cover + 1] [expr $C_dim1 - $thick/2. + $cover + 1] [expr -$C_dim2 + $be - 1]
layer straight $SteelMatTag 9 $Adb11 [expr $C_dim1 + $thick/2. - $cover - 1] [expr -$C_dim2 + $cover + 1] [expr $C_dim1 + $thick/2. - $cover - 1] [expr -$C_dim2 + $be - 1]
layer straight $SteelMatTag 5 $Adb11 [expr $C_dim1 - $thick/2. + $cover + 6] [expr -$C_dim2 + $cover + 1] [expr $C_dim1 + $thick/2. - $cover - 6] [expr -$C_dim2 + $cover + 1]
layer straight $SteelMatTag 5 $Adb11 [expr $C_dim1 - $thick/2. + $cover + 6] [expr -$C_dim2 + $be - 1] [expr $C_dim1 + $thick/2. - $cover - 6] [expr -$C_dim2 + $be - 1]

#Steel rebars in corner elements
layer straight $SteelMatTag 7 $Adb10 [expr -$C_dim1 - $thick/2. + $cover + 1] [expr $Centr - $thick/2. + $cover + 1] [expr -$C_dim1 - $thick/2. + $ce - $cover - 1] [expr $Centr - $thick/2. + $cover + 1]
layer straight $SteelMatTag 7 $Adb10 [expr -$C_dim1 - $thick/2. + $cover + 1] [expr $Centr + $thick/2. - $cover - 1] [expr -$C_dim1 - $thick/2. + $ce - $cover - 1] [expr $Centr + $thick/2. - $cover - 1]
layer straight $SteelMatTag 3 $Adb10 [expr -$C_dim1 - $thick/2. + $cover + 1] [expr $Centr - $thick/2. + 10] [expr -$C_dim1 - $thick/2. + $cover + 1] [expr $Centr + $thick/2. - 10]
layer straight $SteelMatTag 3 $Adb10 [expr -$C_dim1 - $thick/2. + $ce - $cover - 1] [expr $Centr - $thick/2. + 10] [expr -$C_dim1 - $thick/2. + $ce - $cover - 1] [expr $Centr + $thick/2. - 10]

layer straight $SteelMatTag 7 $Adb10 [expr $C_dim1 + $thick/2. - $ce + $cover + 1] [expr $Centr - $thick/2. + $cover + 1] [expr $C_dim1 + $thick/2. - $cover - 1] [expr $Centr - $thick/2. + $cover + 1]
layer straight $SteelMatTag 7 $Adb10 [expr $C_dim1 + $thick/2. - $ce + $cover + 1] [expr $Centr + $thick/2. - $cover - 1] [expr $C_dim1 + $thick/2. - $cover - 1] [expr $Centr + $thick/2. - $cover - 1]
layer straight $SteelMatTag 3 $Adb10 [expr $C_dim1 + $thick/2. - $cover - 1] [expr $Centr - $thick/2. + 10] [expr $C_dim1 + $thick/2. - $cover - 1] [expr $Centr + $thick/2. - 10]
layer straight $SteelMatTag 3 $Adb10 [expr $C_dim1 + $thick/2. - $ce + $cover + 1] [expr $Centr - $thick/2. + 10] [expr $C_dim1 + $thick/2. - $ce + $cover + 1] [expr $Centr + $thick/2. - 10]

};


# ################################################
# WALL SECTION 32 in 7 ksi
set secWall32_7 $secTag
incr secTag 1

#section Fiber $secTag <-GJ $GJ> {
#fiber...
#patch...
#layer...
#...
#}

set EcWall	$EcWall7;	# Young's Modulus of Concrete
set nuc 0.2;														# Poisson's Ratio of Concrete
set GcWall 	[expr $EcWall/(2.0*(1.0+$nuc))];						# Shear Modulus of Concrete

set JWall [expr 2.*142.*$in*pow(32*$in,3)*0.285]
set JWall [expr $JWall + 256.*$in*pow(32*$in,3)*0.306]

set thick 	[expr 32.*$in]
set cover 	[expr 1.*$in]
set be		[expr 4.*$ft]
set ce		[expr 3.*$ft + 10.*$in]

section Fiber $secWall32_7 -GJ [expr $GcWall*$JWall] {
#patch rect $matTag $numSubdivY $numSubdivZ $yI $zI $yJ $zJ

#Confined concrete in boundary
patch rect $confinedConcW36_32_7_be 12 16 [expr -$C_dim1 - $thick/2. + $cover] [expr -$C_dim2+$cover] [expr -$C_dim1 + $thick/2. - $cover] [expr -$C_dim2+$be]
patch rect $confinedConcW36_32_7_be 12 16 [expr $C_dim1 - $thick/2. + $cover]  [expr -$C_dim2+$cover] [expr $C_dim1 + $thick/2. - $cover]  [expr -$C_dim2+$be]

#Unconfined concrete horizontal patch in boundary
patch rect $unconfinedConc7 2 8 [expr -$C_dim1 - $thick/2.] [expr -$C_dim2 + $cover] [expr -$C_dim1 - $thick/2. + $cover] [expr -$C_dim2 + $be]
patch rect $unconfinedConc7 2 8 [expr -$C_dim1 + $thick/2. - $cover] [expr -$C_dim2 + $cover] [expr -$C_dim1 + $thick/2.] [expr -$C_dim2 + $be]
patch rect $unconfinedConc7 2 8 [expr $C_dim1 - $thick/2.] [expr -$C_dim2 + $cover] [expr $C_dim1 - $thick/2. + $cover] [expr -$C_dim2 + $be]
patch rect $unconfinedConc7 2 8 [expr $C_dim1 + $thick/2. - $cover] [expr -$C_dim2 + $cover] [expr $C_dim1 + $thick/2.] [expr -$C_dim2 + $be]

#Unconfined concrete vertical patch in boundary
patch rect $unconfinedConc7 6 2 [expr -$C_dim1 - $thick/2.] [expr -$C_dim2] [expr -$C_dim1 + $thick/2.] [expr -$C_dim2 + $cover]
patch rect $unconfinedConc7 6 2 [expr $C_dim1 - $thick/2.]  [expr -$C_dim2] [expr $C_dim1 + $thick/2.]  [expr -$C_dim2 + $cover]

#Unconfined concrete in flanges
patch rect $unconfinedConc7 8 32 [expr -$C_dim1 - $thick/2.] [expr -$C_dim2 + $be] [expr -$C_dim1 + $thick/2.] $Centr
patch rect $unconfinedConc7 8 32 [expr $C_dim1 - $thick/2.]  [expr -$C_dim2 + $be] [expr $C_dim1 + $thick/2.]  $Centr

#Unconfined concrete in web
patch rect $unconfinedConc7 60 8 [expr -$C_dim1 -$thick/2. + $ce] [expr $Centr - $thick/2.] [expr $C_dim1 + $thick/2. - $ce] [expr $Centr + $thick/2.]

#Confined concrete in corner element
patch rect $confinedConcW36_32_7_ce 16 12 [expr -$C_dim1 - $thick/2. + $cover] [expr $Centr - $thick/2. + $cover] [expr -$C_dim1 - $thick/2. + $ce] [expr $Centr + $thick/2. - $cover]
patch rect $confinedConcW36_32_7_ce 16 12 [expr $C_dim1 + $thick/2. - $ce] [expr $Centr - $thick/2. + $cover] [expr $C_dim1 + $thick/2. - $cover] [expr $Centr + $thick/2. - $cover]

#Unconfined concrete vertical patch in corner
patch rect $unconfinedConc7 8 2 [expr -$C_dim1 - $thick/2.] [expr $Centr - $thick/2.] [expr -$C_dim1 - $thick/2. + $ce] [expr $Centr - $thick/2. + $cover]
patch rect $unconfinedConc7 8 2 [expr -$C_dim1 - $thick/2.] [expr $Centr + $thick/2. - $cover] [expr -$C_dim1 - $thick/2. + $ce] [expr $Centr + $thick/2.]
patch rect $unconfinedConc7 8 2 [expr $C_dim1 + $thick/2. - $ce] [expr $Centr - $thick/2.] [expr $C_dim1 + $thick/2.] [expr $Centr - $thick/2. + $cover]
patch rect $unconfinedConc7 8 2 [expr $C_dim1 + $thick/2. - $ce] [expr $Centr + $thick/2. - $cover] [expr $C_dim1 + $thick/2.] [expr $Centr + $thick/2.]

#Unconfined concrete horizontal patch in corner
patch rect $unconfinedConc7 2 6 [expr -$C_dim1 - $thick/2.] [expr $Centr - $thick/2. + $cover] [expr -$C_dim1 - $thick/2. + $cover] [expr $Centr + $thick/2. - $cover]
patch rect $unconfinedConc7 2 6 [expr $C_dim1 + $thick/2. - $cover] [expr $Centr - $thick/2. + $cover] [expr $C_dim1 + $thick/2.] [expr $Centr + $thick/2. - $cover]


#layer straight $matTag $numFiber $areaFiber $yStart $zStart $yEnd $zEnd

#Steel rebar in flanges
layer straight $SteelMatTag 7 [expr 2.*$Adb8] [expr -$C_dim1 + $thick/2. - $cover - 1] [expr -$C_dim2 + $be + 8] [expr -$C_dim1 + $thick/2. - $cover - 1] [expr $Centr - $thick/2. - 8]
layer straight $SteelMatTag 7 [expr 2.*$Adb8] [expr -$C_dim1 - $thick/2. + $cover + 1] [expr -$C_dim2 + $be + 8] [expr -$C_dim1 - $thick/2. + $cover + 1] [expr $Centr - $thick/2. - 8]
layer straight $SteelMatTag 7 [expr 2.*$Adb8] [expr $C_dim1 + $thick/2. - $cover - 1] [expr -$C_dim2 + $be + 8] [expr $C_dim1 + $thick/2. - $cover - 1] [expr $Centr - $thick/2. - 8]
layer straight $SteelMatTag 7 [expr 2.*$Adb8] [expr $C_dim1 - $thick/2. + $cover + 1] [expr -$C_dim2 + $be + 8] [expr $C_dim1 - $thick/2. + $cover + 1] [expr $Centr - $thick/2. - 8]

#Steel rebar in web
layer straight $SteelMatTag 29 [expr 2.*$Adb8] [expr -$C_dim1 - $thick/2. + $ce + 8] [expr $Centr - $thick/2. + $cover + 1] [expr $C_dim1 + $thick/2. - $ce - 8] [expr $Centr - $thick/2. + $cover + 1]
layer straight $SteelMatTag 29 [expr 2.*$Adb8] [expr -$C_dim1 - $thick/2. + $ce + 8] [expr $Centr + $thick/2. - $cover - 1] [expr $C_dim1 + $thick/2. - $ce - 8] [expr $Centr + $thick/2. - $cover - 1]

#Steel rebars in boundary elements
layer straight $SteelMatTag 9 $Adb10 [expr -$C_dim1 - $thick/2. + $cover + 1] [expr -$C_dim2 + $cover + 1] [expr -$C_dim1 - $thick/2. + $cover + 1] [expr -$C_dim2 + $be - 1]
layer straight $SteelMatTag 9 $Adb10 [expr -$C_dim1 + $thick/2. - $cover - 1] [expr -$C_dim2 + $cover + 1] [expr -$C_dim1 + $thick/2. - $cover - 1] [expr -$C_dim2 + $be - 1]
layer straight $SteelMatTag 4 $Adb10 [expr -$C_dim1 - $thick/2. + $cover + 6] [expr -$C_dim2 + $cover + 1] [expr -$C_dim1 + $thick/2. - $cover - 6] [expr -$C_dim2 + $cover + 1]
layer straight $SteelMatTag 4 $Adb10 [expr -$C_dim1 - $thick/2. + $cover + 6] [expr -$C_dim2 + $be - 1] [expr -$C_dim1 + $thick/2. - $cover - 6] [expr -$C_dim2 + $be - 1]

layer straight $SteelMatTag 9 $Adb10 [expr $C_dim1 - $thick/2. + $cover + 1] [expr -$C_dim2 + $cover + 1] [expr $C_dim1 - $thick/2. + $cover + 1] [expr -$C_dim2 + $be - 1]
layer straight $SteelMatTag 9 $Adb10 [expr $C_dim1 + $thick/2. - $cover - 1] [expr -$C_dim2 + $cover + 1] [expr $C_dim1 + $thick/2. - $cover - 1] [expr -$C_dim2 + $be - 1]
layer straight $SteelMatTag 4 $Adb10 [expr $C_dim1 - $thick/2. + $cover + 6] [expr -$C_dim2 + $cover + 1] [expr $C_dim1 + $thick/2. - $cover - 6] [expr -$C_dim2 + $cover + 1]
layer straight $SteelMatTag 4 $Adb10 [expr $C_dim1 - $thick/2. + $cover + 6] [expr -$C_dim2 + $be - 1] [expr $C_dim1 + $thick/2. - $cover - 6] [expr -$C_dim2 + $be - 1]

#Steel rebars in corner elements
layer straight $SteelMatTag 7 $Adb10 [expr -$C_dim1 - $thick/2. + $cover + 1] [expr $Centr - $thick/2. + $cover + 1] [expr -$C_dim1 - $thick/2. + $ce - $cover - 1] [expr $Centr - $thick/2. + $cover + 1]
layer straight $SteelMatTag 7 $Adb10 [expr -$C_dim1 - $thick/2. + $cover + 1] [expr $Centr + $thick/2. - $cover - 1] [expr -$C_dim1 - $thick/2. + $ce - $cover - 1] [expr $Centr + $thick/2. - $cover - 1]
layer straight $SteelMatTag 3 $Adb10 [expr -$C_dim1 - $thick/2. + $cover + 1] [expr $Centr - $thick/2. + 10] [expr -$C_dim1 - $thick/2. + $cover + 1] [expr $Centr + $thick/2. - 10]
layer straight $SteelMatTag 3 $Adb10 [expr -$C_dim1 - $thick/2. + $ce - $cover - 1] [expr $Centr - $thick/2. + 10] [expr -$C_dim1 - $thick/2. + $ce - $cover - 1] [expr $Centr + $thick/2. - 10]

layer straight $SteelMatTag 7 $Adb10 [expr $C_dim1 + $thick/2. - $ce + $cover + 1] [expr $Centr - $thick/2. + $cover + 1] [expr $C_dim1 + $thick/2. - $cover - 1] [expr $Centr - $thick/2. + $cover + 1]
layer straight $SteelMatTag 7 $Adb10 [expr $C_dim1 + $thick/2. - $ce + $cover + 1] [expr $Centr + $thick/2. - $cover - 1] [expr $C_dim1 + $thick/2. - $cover - 1] [expr $Centr + $thick/2. - $cover - 1]
layer straight $SteelMatTag 3 $Adb10 [expr $C_dim1 + $thick/2. - $cover - 1] [expr $Centr - $thick/2. + 10] [expr $C_dim1 + $thick/2. - $cover - 1] [expr $Centr + $thick/2. - 10]
layer straight $SteelMatTag 3 $Adb10 [expr $C_dim1 + $thick/2. - $ce + $cover + 1] [expr $Centr - $thick/2. + 10] [expr $C_dim1 + $thick/2. - $ce + $cover + 1] [expr $Centr + $thick/2. - 10]

};


# ################################################
# WALL SECTION 28 in 6 ksi
set secWall28_6 $secTag
incr secTag 1

#section Fiber $secTag <-GJ $GJ> {
#fiber...
#patch...
#layer...
#...
#}

set EcWall	$EcWall6;	# Young's Modulus of Concrete
set nuc 0.2;														# Poisson's Ratio of Concrete
set GcWall 	[expr $EcWall/(2.0*(1.0+$nuc))];						# Shear Modulus of Concrete

set JWall [expr 2.*140.*$in*pow(28*$in,3)*0.291]
set JWall [expr $JWall + 260.*$in*pow(28*$in,3)*0.310]

set thick 	[expr 28.*$in]
set cover 	[expr 1.*$in]
set be		[expr 4.*$ft]
set ce		[expr 3.*$ft + 8.*$in]

section Fiber $secWall28_6 -GJ [expr $GcWall*$JWall] {
#patch rect $matTag $numSubdivY $numSubdivZ $yI $zI $yJ $zJ

#Confined concrete in boundary
patch rect $confinedConcW28_24_6_be 12 16 [expr -$C_dim1 - $thick/2. + $cover] [expr -$C_dim2+$cover] [expr -$C_dim1 + $thick/2. - $cover] [expr -$C_dim2+$be]
patch rect $confinedConcW28_24_6_be 12 16 [expr $C_dim1 - $thick/2. + $cover]  [expr -$C_dim2+$cover] [expr $C_dim1 + $thick/2. - $cover]  [expr -$C_dim2+$be]

#Unconfined concrete horizontal patch in boundary
patch rect $unconfinedConc6 2 8 [expr -$C_dim1 - $thick/2.] [expr -$C_dim2 + $cover] [expr -$C_dim1 - $thick/2. + $cover] [expr -$C_dim2 + $be]
patch rect $unconfinedConc6 2 8 [expr -$C_dim1 + $thick/2. - $cover] [expr -$C_dim2 + $cover] [expr -$C_dim1 + $thick/2.] [expr -$C_dim2 + $be]
patch rect $unconfinedConc6 2 8 [expr $C_dim1 - $thick/2.] [expr -$C_dim2 + $cover] [expr $C_dim1 - $thick/2. + $cover] [expr -$C_dim2 + $be]
patch rect $unconfinedConc6 2 8 [expr $C_dim1 + $thick/2. - $cover] [expr -$C_dim2 + $cover] [expr $C_dim1 + $thick/2.] [expr -$C_dim2 + $be]

#Unconfined concrete vertical patch in boundary
patch rect $unconfinedConc6 6 2 [expr -$C_dim1 - $thick/2.] [expr -$C_dim2] [expr -$C_dim1 + $thick/2.] [expr -$C_dim2 + $cover]
patch rect $unconfinedConc6 6 2 [expr $C_dim1 - $thick/2.]  [expr -$C_dim2] [expr $C_dim1 + $thick/2.]  [expr -$C_dim2 + $cover]

#Unconfined concrete in flanges
patch rect $unconfinedConc6 8 32 [expr -$C_dim1 - $thick/2.] [expr -$C_dim2 + $be] [expr -$C_dim1 + $thick/2.] $Centr
patch rect $unconfinedConc6 8 32 [expr $C_dim1 - $thick/2.]  [expr -$C_dim2 + $be] [expr $C_dim1 + $thick/2.]  $Centr

#Unconfined concrete in web
patch rect $unconfinedConc6 60 8 [expr -$C_dim1 -$thick/2. + $ce] [expr $Centr - $thick/2.] [expr $C_dim1 + $thick/2. - $ce] [expr $Centr + $thick/2.]

#Confined concrete in corner element
patch rect $confinedConcW28_24_6_ce 16 12 [expr -$C_dim1 - $thick/2. + $cover] [expr $Centr - $thick/2. + $cover] [expr -$C_dim1 - $thick/2. + $ce] [expr $Centr + $thick/2. - $cover]
patch rect $confinedConcW28_24_6_ce 16 12 [expr $C_dim1 + $thick/2. - $ce] [expr $Centr - $thick/2. + $cover] [expr $C_dim1 + $thick/2. - $cover] [expr $Centr + $thick/2. - $cover]

#Unconfined concrete vertical patch in corner
patch rect $unconfinedConc6 8 2 [expr -$C_dim1 - $thick/2.] [expr $Centr - $thick/2.] [expr -$C_dim1 - $thick/2. + $ce] [expr $Centr - $thick/2. + $cover]
patch rect $unconfinedConc6 8 2 [expr -$C_dim1 - $thick/2.] [expr $Centr + $thick/2. - $cover] [expr -$C_dim1 - $thick/2. + $ce] [expr $Centr + $thick/2.]
patch rect $unconfinedConc6 8 2 [expr $C_dim1 + $thick/2. - $ce] [expr $Centr - $thick/2.] [expr $C_dim1 + $thick/2.] [expr $Centr - $thick/2. + $cover]
patch rect $unconfinedConc6 8 2 [expr $C_dim1 + $thick/2. - $ce] [expr $Centr + $thick/2. - $cover] [expr $C_dim1 + $thick/2.] [expr $Centr + $thick/2.]

#Unconfined concrete horizontal patch in corner
patch rect $unconfinedConc6 2 6 [expr -$C_dim1 - $thick/2.] [expr $Centr - $thick/2. + $cover] [expr -$C_dim1 - $thick/2. + $cover] [expr $Centr + $thick/2. - $cover]
patch rect $unconfinedConc6 2 6 [expr $C_dim1 + $thick/2. - $cover] [expr $Centr - $thick/2. + $cover] [expr $C_dim1 + $thick/2.] [expr $Centr + $thick/2. - $cover]

#layer straight $matTag $numFiber $areaFiber $yStart $zStart $yEnd $zEnd

#Steel rebar in flanges
layer straight $SteelMatTag 7 [expr 2.*$Adb8] [expr -$C_dim1 + $thick/2. - $cover - 1] [expr -$C_dim2 + $be + 8] [expr -$C_dim1 + $thick/2. - $cover - 1] [expr $Centr - $thick/2. - 8]
layer straight $SteelMatTag 7 [expr 2.*$Adb8] [expr -$C_dim1 - $thick/2. + $cover + 1] [expr -$C_dim2 + $be + 8] [expr -$C_dim1 - $thick/2. + $cover + 1] [expr $Centr - $thick/2. - 8]
layer straight $SteelMatTag 7 [expr 2.*$Adb8] [expr $C_dim1 + $thick/2. - $cover - 1] [expr -$C_dim2 + $be + 8] [expr $C_dim1 + $thick/2. - $cover - 1] [expr $Centr - $thick/2. - 8]
layer straight $SteelMatTag 7 [expr 2.*$Adb8] [expr $C_dim1 - $thick/2. + $cover + 1] [expr -$C_dim2 + $be + 8] [expr $C_dim1 - $thick/2. + $cover + 1] [expr $Centr - $thick/2. - 8]

#Steel rebar in web
layer straight $SteelMatTag 29 [expr 2.*$Adb8] [expr -$C_dim1 - $thick/2. + $ce + 8] [expr $Centr - $thick/2. + $cover + 1] [expr $C_dim1 + $thick/2. - $ce - 8] [expr $Centr - $thick/2. + $cover + 1]
layer straight $SteelMatTag 29 [expr 2.*$Adb8] [expr -$C_dim1 - $thick/2. + $ce + 8] [expr $Centr + $thick/2. - $cover - 1] [expr $C_dim1 + $thick/2. - $ce - 8] [expr $Centr + $thick/2. - $cover - 1]

#Steel rebars in boundary elements
layer straight $SteelMatTag 7 $Adb10 [expr -$C_dim1 - $thick/2. + $cover + 1] [expr -$C_dim2 + $cover + 1] [expr -$C_dim1 - $thick/2. + $cover + 1] [expr -$C_dim2 + $be - 1]
layer straight $SteelMatTag 7 $Adb10 [expr -$C_dim1 + $thick/2. - $cover - 1] [expr -$C_dim2 + $cover + 1] [expr -$C_dim1 + $thick/2. - $cover - 1] [expr -$C_dim2 + $be - 1]
layer straight $SteelMatTag 2 $Adb10 [expr -$C_dim1 - $thick/2. + $cover + 10] [expr -$C_dim2 + $cover + 1] [expr -$C_dim1 + $thick/2. - $cover - 10] [expr -$C_dim2 + $cover + 1]
layer straight $SteelMatTag 2 $Adb10 [expr -$C_dim1 - $thick/2. + $cover + 10] [expr -$C_dim2 + $be - 1] [expr -$C_dim1 + $thick/2. - $cover - 10] [expr -$C_dim2 + $be - 1]

layer straight $SteelMatTag 7 $Adb10 [expr $C_dim1 - $thick/2. + $cover + 1] [expr -$C_dim2 + $cover + 1] [expr $C_dim1 - $thick/2. + $cover + 1] [expr -$C_dim2 + $be - 1]
layer straight $SteelMatTag 7 $Adb10 [expr $C_dim1 + $thick/2. - $cover - 1] [expr -$C_dim2 + $cover + 1] [expr $C_dim1 + $thick/2. - $cover - 1] [expr -$C_dim2 + $be - 1]
layer straight $SteelMatTag 2 $Adb10 [expr $C_dim1 - $thick/2. + $cover + 10] [expr -$C_dim2 + $cover + 1] [expr $C_dim1 + $thick/2. - $cover - 10] [expr -$C_dim2 + $cover + 1]
layer straight $SteelMatTag 2 $Adb10 [expr $C_dim1 - $thick/2. + $cover + 10] [expr -$C_dim2 + $be - 1] [expr $C_dim1 + $thick/2. - $cover - 10] [expr -$C_dim2 + $be - 1]

#Steel rebars in corner elements
layer straight $SteelMatTag 7 $Adb10 [expr -$C_dim1 - $thick/2. + $cover + 1] [expr $Centr - $thick/2. + $cover + 1] [expr -$C_dim1 - $thick/2. + $ce - $cover - 1] [expr $Centr - $thick/2. + $cover + 1]
layer straight $SteelMatTag 7 $Adb10 [expr -$C_dim1 - $thick/2. + $cover + 1] [expr $Centr + $thick/2. - $cover - 1] [expr -$C_dim1 - $thick/2. + $ce - $cover - 1] [expr $Centr + $thick/2. - $cover - 1]
layer straight $SteelMatTag 2 $Adb10 [expr -$C_dim1 - $thick/2. + $cover + 1] [expr $Centr - $thick/2. + 10] [expr -$C_dim1 - $thick/2. + $cover + 1] [expr $Centr + $thick/2. - 10]
layer straight $SteelMatTag 2 $Adb10 [expr -$C_dim1 - $thick/2. + $ce - $cover - 1] [expr $Centr - $thick/2. + 10] [expr -$C_dim1 - $thick/2. + $ce - $cover - 1] [expr $Centr + $thick/2. - 10]

layer straight $SteelMatTag 7 $Adb10 [expr $C_dim1 + $thick/2. - $ce + $cover + 1] [expr $Centr - $thick/2. + $cover + 1] [expr $C_dim1 + $thick/2. - $cover - 1] [expr $Centr - $thick/2. + $cover + 1]
layer straight $SteelMatTag 7 $Adb10 [expr $C_dim1 + $thick/2. - $ce + $cover + 1] [expr $Centr + $thick/2. - $cover - 1] [expr $C_dim1 + $thick/2. - $cover - 1] [expr $Centr + $thick/2. - $cover - 1]
layer straight $SteelMatTag 2 $Adb10 [expr $C_dim1 + $thick/2. - $cover - 1] [expr $Centr - $thick/2. + 10] [expr $C_dim1 + $thick/2. - $cover - 1] [expr $Centr + $thick/2. - 10]
layer straight $SteelMatTag 2 $Adb10 [expr $C_dim1 + $thick/2. - $ce + $cover + 1] [expr $Centr - $thick/2. + 10] [expr $C_dim1 + $thick/2. - $ce + $cover + 1] [expr $Centr + $thick/2. - 10]

};


# ################################################
# WALL SECTION 24 in 6 ksi
set secWall24_6 $secTag
incr secTag 1

#section Fiber $secTag <-GJ $GJ> {
#fiber...
#patch...
#layer...
#...
#}

set EcWall	$EcWall6;	# Young's Modulus of Concrete
set nuc 0.2;														# Poisson's Ratio of Concrete
set GcWall 	[expr $EcWall/(2.0*(1.0+$nuc))];						# Shear Modulus of Concrete

set JWall [expr 2.*138.*$in*pow(24*$in,3)*0.297]
set JWall [expr $JWall + 264.*$in*pow(24*$in,3)*0.333]

set thick 	[expr 24.*$in]
set cover 	[expr 1.*$in]
set be		[expr 4.*$ft]
set ce		[expr 3.*$ft + 6.*$in]

section Fiber $secWall24_6 -GJ [expr $GcWall*$JWall] {
#patch rect $matTag $numSubdivY $numSubdivZ $yI $zI $yJ $zJ

#Confined concrete in boundary
patch rect $confinedConcW28_24_6_be 12 16 [expr -$C_dim1 - $thick/2. + $cover] [expr -$C_dim2+$cover] [expr -$C_dim1 + $thick/2. - $cover] [expr -$C_dim2+$be]
patch rect $confinedConcW28_24_6_be 12 16 [expr $C_dim1 - $thick/2. + $cover]  [expr -$C_dim2+$cover] [expr $C_dim1 + $thick/2. - $cover]  [expr -$C_dim2+$be]

#Unconfined concrete horizontal patch in boundary
patch rect $unconfinedConc6 2 8 [expr -$C_dim1 - $thick/2.] [expr -$C_dim2 + $cover] [expr -$C_dim1 - $thick/2. + $cover] [expr -$C_dim2 + $be]
patch rect $unconfinedConc6 2 8 [expr -$C_dim1 + $thick/2. - $cover] [expr -$C_dim2 + $cover] [expr -$C_dim1 + $thick/2.] [expr -$C_dim2 + $be]
patch rect $unconfinedConc6 2 8 [expr $C_dim1 - $thick/2.] [expr -$C_dim2 + $cover] [expr $C_dim1 - $thick/2. + $cover] [expr -$C_dim2 + $be]
patch rect $unconfinedConc6 2 8 [expr $C_dim1 + $thick/2. - $cover] [expr -$C_dim2 + $cover] [expr $C_dim1 + $thick/2.] [expr -$C_dim2 + $be]

#Unconfined concrete vertical patch in boundary
patch rect $unconfinedConc6 6 2 [expr -$C_dim1 - $thick/2.] [expr -$C_dim2] [expr -$C_dim1 + $thick/2.] [expr -$C_dim2 + $cover]
patch rect $unconfinedConc6 6 2 [expr $C_dim1 - $thick/2.]  [expr -$C_dim2] [expr $C_dim1 + $thick/2.]  [expr -$C_dim2 + $cover]

#Unconfined concrete in flanges
patch rect $unconfinedConc6 8 32 [expr -$C_dim1 - $thick/2.] [expr -$C_dim2 + $be] [expr -$C_dim1 + $thick/2.] $Centr
patch rect $unconfinedConc6 8 32 [expr $C_dim1 - $thick/2.]  [expr -$C_dim2 + $be] [expr $C_dim1 + $thick/2.]  $Centr

#Unconfined concrete in web
patch rect $unconfinedConc6 60 8 [expr -$C_dim1 -$thick/2. + $ce] [expr $Centr - $thick/2.] [expr $C_dim1 + $thick/2. - $ce] [expr $Centr + $thick/2.]

#Confined concrete in corner element
patch rect $confinedConcW28_24_6_ce 16 12 [expr -$C_dim1 - $thick/2. + $cover] [expr $Centr - $thick/2. + $cover] [expr -$C_dim1 - $thick/2. + $ce] [expr $Centr + $thick/2. - $cover]
patch rect $confinedConcW28_24_6_ce 16 12 [expr $C_dim1 + $thick/2. - $ce] [expr $Centr - $thick/2. + $cover] [expr $C_dim1 + $thick/2. - $cover] [expr $Centr + $thick/2. - $cover]

#Unconfined concrete vertical patch in corner
patch rect $unconfinedConc6 8 2 [expr -$C_dim1 - $thick/2.] [expr $Centr - $thick/2.] [expr -$C_dim1 - $thick/2. + $ce] [expr $Centr - $thick/2. + $cover]
patch rect $unconfinedConc6 8 2 [expr -$C_dim1 - $thick/2.] [expr $Centr + $thick/2. - $cover] [expr -$C_dim1 - $thick/2. + $ce] [expr $Centr + $thick/2.]
patch rect $unconfinedConc6 8 2 [expr $C_dim1 + $thick/2. - $ce] [expr $Centr - $thick/2.] [expr $C_dim1 + $thick/2.] [expr $Centr - $thick/2. + $cover]
patch rect $unconfinedConc6 8 2 [expr $C_dim1 + $thick/2. - $ce] [expr $Centr + $thick/2. - $cover] [expr $C_dim1 + $thick/2.] [expr $Centr + $thick/2.]

#Unconfined concrete horizontal patch in corner
patch rect $unconfinedConc6 2 6 [expr -$C_dim1 - $thick/2.] [expr $Centr - $thick/2. + $cover] [expr -$C_dim1 - $thick/2. + $cover] [expr $Centr + $thick/2. - $cover]
patch rect $unconfinedConc6 2 6 [expr $C_dim1 + $thick/2. - $cover] [expr $Centr - $thick/2. + $cover] [expr $C_dim1 + $thick/2.] [expr $Centr + $thick/2. - $cover]

#layer straight $matTag $numFiber $areaFiber $yStart $zStart $yEnd $zEnd

#Steel rebar in flanges
layer straight $SteelMatTag 10 $Adb8 [expr -$C_dim1 + $thick/2. - $cover - 1] [expr -$C_dim2 + $be + 8] [expr -$C_dim1 + $thick/2. - $cover - 1] [expr $Centr - $thick/2. - 8]
layer straight $SteelMatTag 10 $Adb8 [expr -$C_dim1 - $thick/2. + $cover + 1] [expr -$C_dim2 + $be + 8] [expr -$C_dim1 - $thick/2. + $cover + 1] [expr $Centr - $thick/2. - 8]
layer straight $SteelMatTag 10 $Adb8 [expr $C_dim1 + $thick/2. - $cover - 1] [expr -$C_dim2 + $be + 8] [expr $C_dim1 + $thick/2. - $cover - 1] [expr $Centr - $thick/2. - 8]
layer straight $SteelMatTag 10 $Adb8 [expr $C_dim1 - $thick/2. + $cover + 1] [expr -$C_dim2 + $be + 8] [expr $C_dim1 - $thick/2. + $cover + 1] [expr $Centr - $thick/2. - 8]

#Steel rebar in web
layer straight $SteelMatTag 37 $Adb8 [expr -$C_dim1 - $thick/2. + $ce + 8] [expr $Centr - $thick/2. + $cover + 1] [expr $C_dim1 + $thick/2. - $ce - 8] [expr $Centr - $thick/2. + $cover + 1]
layer straight $SteelMatTag 37 $Adb8 [expr -$C_dim1 - $thick/2. + $ce + 8] [expr $Centr + $thick/2. - $cover - 1] [expr $C_dim1 + $thick/2. - $ce - 8] [expr $Centr + $thick/2. - $cover - 1]

#Steel rebars in boundary elements
layer straight $SteelMatTag 7 $Adb8 [expr -$C_dim1 - $thick/2. + $cover + 1] [expr -$C_dim2 + $cover + 1] [expr -$C_dim1 - $thick/2. + $cover + 1] [expr -$C_dim2 + $be - 1]
layer straight $SteelMatTag 7 $Adb8 [expr -$C_dim1 + $thick/2. - $cover - 1] [expr -$C_dim2 + $cover + 1] [expr -$C_dim1 + $thick/2. - $cover - 1] [expr -$C_dim2 + $be - 1]
layer straight $SteelMatTag 2 $Adb8 [expr -$C_dim1 - $thick/2. + $cover + 9] [expr -$C_dim2 + $cover + 1] [expr -$C_dim1 + $thick/2. - $cover - 9] [expr -$C_dim2 + $cover + 1]
layer straight $SteelMatTag 2 $Adb8 [expr -$C_dim1 - $thick/2. + $cover + 9] [expr -$C_dim2 + $be - 1] [expr -$C_dim1 + $thick/2. - $cover - 9] [expr -$C_dim2 + $be - 1]

layer straight $SteelMatTag 7 $Adb8 [expr $C_dim1 - $thick/2. + $cover + 1] [expr -$C_dim2 + $cover + 1] [expr $C_dim1 - $thick/2. + $cover + 1] [expr -$C_dim2 + $be - 1]
layer straight $SteelMatTag 7 $Adb8 [expr $C_dim1 + $thick/2. - $cover - 1] [expr -$C_dim2 + $cover + 1] [expr $C_dim1 + $thick/2. - $cover - 1] [expr -$C_dim2 + $be - 1]
layer straight $SteelMatTag 2 $Adb8 [expr $C_dim1 - $thick/2. + $cover + 9] [expr -$C_dim2 + $cover + 1] [expr $C_dim1 + $thick/2. - $cover - 9] [expr -$C_dim2 + $cover + 1]
layer straight $SteelMatTag 2 $Adb8 [expr $C_dim1 - $thick/2. + $cover + 9] [expr -$C_dim2 + $be - 1] [expr $C_dim1 + $thick/2. - $cover - 9] [expr -$C_dim2 + $be - 1]

#Steel rebars in corner elements
layer straight $SteelMatTag 7 $Adb8 [expr -$C_dim1 - $thick/2. + $cover + 1] [expr $Centr - $thick/2. + $cover + 1] [expr -$C_dim1 - $thick/2. + $ce - $cover - 1] [expr $Centr - $thick/2. + $cover + 1]
layer straight $SteelMatTag 7 $Adb8 [expr -$C_dim1 - $thick/2. + $cover + 1] [expr $Centr + $thick/2. - $cover - 1] [expr -$C_dim1 - $thick/2. + $ce - $cover - 1] [expr $Centr + $thick/2. - $cover - 1]
layer straight $SteelMatTag 2 $Adb8 [expr -$C_dim1 - $thick/2. + $cover + 1] [expr $Centr - $thick/2. + 9] [expr -$C_dim1 - $thick/2. + $cover + 1] [expr $Centr + $thick/2. - 9]
layer straight $SteelMatTag 2 $Adb8 [expr -$C_dim1 - $thick/2. + $ce - $cover - 1] [expr $Centr - $thick/2. + 9] [expr -$C_dim1 - $thick/2. + $ce - $cover - 1] [expr $Centr + $thick/2. - 9]

layer straight $SteelMatTag 7 $Adb8 [expr $C_dim1 + $thick/2. - $ce + $cover + 1] [expr $Centr - $thick/2. + $cover + 1] [expr $C_dim1 + $thick/2. - $cover - 1] [expr $Centr - $thick/2. + $cover + 1]
layer straight $SteelMatTag 7 $Adb8 [expr $C_dim1 + $thick/2. - $ce + $cover + 1] [expr $Centr + $thick/2. - $cover - 1] [expr $C_dim1 + $thick/2. - $cover - 1] [expr $Centr + $thick/2. - $cover - 1]
layer straight $SteelMatTag 2 $Adb8 [expr $C_dim1 + $thick/2. - $cover - 1] [expr $Centr - $thick/2. + 9] [expr $C_dim1 + $thick/2. - $cover - 1] [expr $Centr + $thick/2. - 9]
layer straight $SteelMatTag 2 $Adb8 [expr $C_dim1 + $thick/2. - $ce + $cover + 1] [expr $Centr - $thick/2. + 9] [expr $C_dim1 + $thick/2. - $ce + $cover + 1] [expr $Centr + $thick/2. - 9]

};


# ################################################
# WALL SECTION 20 in 6 ksi
set secWall20_6 $secTag
incr secTag 1

#section Fiber $secTag <-GJ $GJ> {
#fiber...
#patch...
#layer...
#...
#}

set EcWall	$EcWall6;	# Young's Modulus of Concrete
set nuc 0.2;														# Poisson's Ratio of Concrete
set GcWall 	[expr $EcWall/(2.0*(1.0+$nuc))];						# Shear Modulus of Concrete

set JWall [expr 2.*136.*$in*pow(20*$in,3)*0.302]
set JWall [expr $JWall + 268.*$in*pow(20*$in,3)*0.333]

set thick 	[expr 20.*$in]
set cover 	[expr 1.*$in]
set be		[expr 3.*$ft]
set ce		[expr 3.*$ft + 4.*$in]

section Fiber $secWall20_6 -GJ [expr $GcWall*$JWall] {
#patch rect $matTag $numSubdivY $numSubdivZ $yI $zI $yJ $zJ

#Confined concrete in boundary
patch rect $confinedConcW20_6_be 12 16 [expr -$C_dim1 - $thick/2. + $cover] [expr -$C_dim2+$cover] [expr -$C_dim1 + $thick/2. - $cover] [expr -$C_dim2+$be]
patch rect $confinedConcW20_6_be 12 16 [expr $C_dim1 - $thick/2. + $cover]  [expr -$C_dim2+$cover] [expr $C_dim1 + $thick/2. - $cover]  [expr -$C_dim2+$be]

#Unconfined concrete horizontal patch in boundary
patch rect $unconfinedConc6 2 8 [expr -$C_dim1 - $thick/2.] [expr -$C_dim2 + $cover] [expr -$C_dim1 - $thick/2. + $cover] [expr -$C_dim2 + $be]
patch rect $unconfinedConc6 2 8 [expr -$C_dim1 + $thick/2. - $cover] [expr -$C_dim2 + $cover] [expr -$C_dim1 + $thick/2.] [expr -$C_dim2 + $be]
patch rect $unconfinedConc6 2 8 [expr $C_dim1 - $thick/2.] [expr -$C_dim2 + $cover] [expr $C_dim1 - $thick/2. + $cover] [expr -$C_dim2 + $be]
patch rect $unconfinedConc6 2 8 [expr $C_dim1 + $thick/2. - $cover] [expr -$C_dim2 + $cover] [expr $C_dim1 + $thick/2.] [expr -$C_dim2 + $be]

#Unconfined concrete vertical patch in boundary
patch rect $unconfinedConc6 6 2 [expr -$C_dim1 - $thick/2.] [expr -$C_dim2] [expr -$C_dim1 + $thick/2.] [expr -$C_dim2 + $cover]
patch rect $unconfinedConc6 6 2 [expr $C_dim1 - $thick/2.]  [expr -$C_dim2] [expr $C_dim1 + $thick/2.]  [expr -$C_dim2 + $cover]

#Unconfined concrete in flanges
patch rect $unconfinedConc6 8 32 [expr -$C_dim1 - $thick/2.] [expr -$C_dim2 + $be] [expr -$C_dim1 + $thick/2.] $Centr
patch rect $unconfinedConc6 8 32 [expr $C_dim1 - $thick/2.]  [expr -$C_dim2 + $be] [expr $C_dim1 + $thick/2.]  $Centr

#Unconfined concrete in web
patch rect $unconfinedConc6 60 8 [expr -$C_dim1 -$thick/2. + $ce] [expr $Centr - $thick/2.] [expr $C_dim1 + $thick/2. - $ce] [expr $Centr + $thick/2.]

#Confined concrete in corner element
patch rect $confinedConcW20_6_ce 16 12 [expr -$C_dim1 - $thick/2. + $cover] [expr $Centr - $thick/2. + $cover] [expr -$C_dim1 - $thick/2. + $ce] [expr $Centr + $thick/2. - $cover]
patch rect $confinedConcW20_6_ce 16 12 [expr $C_dim1 + $thick/2. - $ce] [expr $Centr - $thick/2. + $cover] [expr $C_dim1 + $thick/2. - $cover] [expr $Centr + $thick/2. - $cover]

#Unconfined concrete vertical patch in corner
patch rect $unconfinedConc6 8 2 [expr -$C_dim1 - $thick/2.] [expr $Centr - $thick/2.] [expr -$C_dim1 - $thick/2. + $ce] [expr $Centr - $thick/2. + $cover]
patch rect $unconfinedConc6 8 2 [expr -$C_dim1 - $thick/2.] [expr $Centr + $thick/2. - $cover] [expr -$C_dim1 - $thick/2. + $ce] [expr $Centr + $thick/2.]
patch rect $unconfinedConc6 8 2 [expr $C_dim1 + $thick/2. - $ce] [expr $Centr - $thick/2.] [expr $C_dim1 + $thick/2.] [expr $Centr - $thick/2. + $cover]
patch rect $unconfinedConc6 8 2 [expr $C_dim1 + $thick/2. - $ce] [expr $Centr + $thick/2. - $cover] [expr $C_dim1 + $thick/2.] [expr $Centr + $thick/2.]

#Unconfined concrete horizontal patch in corner
patch rect $unconfinedConc6 2 6 [expr -$C_dim1 - $thick/2.] [expr $Centr - $thick/2. + $cover] [expr -$C_dim1 - $thick/2. + $cover] [expr $Centr + $thick/2. - $cover]
patch rect $unconfinedConc6 2 6 [expr $C_dim1 + $thick/2. - $cover] [expr $Centr - $thick/2. + $cover] [expr $C_dim1 + $thick/2.] [expr $Centr + $thick/2. - $cover]

#layer straight $matTag $numFiber $areaFiber $yStart $zStart $yEnd $zEnd

#Steel rebar in flanges
layer straight $SteelMatTag 6 $Adb8 [expr -$C_dim1 + $thick/2. - $cover - 1] [expr -$C_dim2 + $be + 8] [expr -$C_dim1 + $thick/2. - $cover - 1] [expr $Centr - $thick/2. - 8]
layer straight $SteelMatTag 6 $Adb8 [expr -$C_dim1 - $thick/2. + $cover + 1] [expr -$C_dim2 + $be + 8] [expr -$C_dim1 - $thick/2. + $cover + 1] [expr $Centr - $thick/2. - 8]
layer straight $SteelMatTag 6 $Adb8 [expr $C_dim1 + $thick/2. - $cover - 1] [expr -$C_dim2 + $be + 8] [expr $C_dim1 + $thick/2. - $cover - 1] [expr $Centr - $thick/2. - 8]
layer straight $SteelMatTag 6 $Adb8 [expr $C_dim1 - $thick/2. + $cover + 1] [expr -$C_dim2 + $be + 8] [expr $C_dim1 - $thick/2. + $cover + 1] [expr $Centr - $thick/2. - 8]

#Steel rebar in web
layer straight $SteelMatTag 18 $Adb8 [expr -$C_dim1 - $thick/2. + $ce + 8] [expr $Centr - $thick/2. + $cover + 1] [expr $C_dim1 + $thick/2. - $ce - 8] [expr $Centr - $thick/2. + $cover + 1]
layer straight $SteelMatTag 18 $Adb8 [expr -$C_dim1 - $thick/2. + $ce + 8] [expr $Centr + $thick/2. - $cover - 1] [expr $C_dim1 + $thick/2. - $ce - 8] [expr $Centr + $thick/2. - $cover - 1]

#Steel rebars in boundary elements 
layer straight $SteelMatTag 5 $Adb8 [expr -$C_dim1 - $thick/2. + $cover + 1] [expr -$C_dim2 + $cover + 1] [expr -$C_dim1 - $thick/2. + $cover + 1] [expr -$C_dim2 + $be - 1]
layer straight $SteelMatTag 5 $Adb8 [expr -$C_dim1 + $thick/2. - $cover - 1] [expr -$C_dim2 + $cover + 1] [expr -$C_dim1 + $thick/2. - $cover - 1] [expr -$C_dim2 + $be - 1]
layer straight $SteelMatTag 2 $Adb8 -$C_dim1 [expr -$C_dim2 + $cover + 1] -$C_dim1 [expr -$C_dim2 + $be - 1]

layer straight $SteelMatTag 5 $Adb8 [expr $C_dim1 - $thick/2. + $cover + 1] [expr -$C_dim2 + $cover + 1] [expr $C_dim1 - $thick/2. + $cover + 1] [expr -$C_dim2 + $be - 1]
layer straight $SteelMatTag 5 $Adb8 [expr $C_dim1 + $thick/2. - $cover - 1] [expr -$C_dim2 + $cover + 1] [expr $C_dim1 + $thick/2. - $cover - 1] [expr -$C_dim2 + $be - 1]
layer straight $SteelMatTag 2 $Adb8 $C_dim1 [expr -$C_dim2 + $cover + 1] $C_dim1 [expr -$C_dim2 + $be - 1]

#Steel rebars in corner elements
layer straight $SteelMatTag 5 $Adb8 [expr -$C_dim1 - $thick/2. + $cover + 1] [expr $Centr - $thick/2. + $cover + 1] [expr -$C_dim1 - $thick/2. + $ce - $cover - 1] [expr $Centr - $thick/2. + $cover + 1]
layer straight $SteelMatTag 5 $Adb8 [expr -$C_dim1 - $thick/2. + $cover + 1] [expr $Centr + $thick/2. - $cover - 1] [expr -$C_dim1 - $thick/2. + $ce - $cover - 1] [expr $Centr + $thick/2. - $cover - 1]
layer straight $SteelMatTag 2 $Adb8 [expr -$C_dim1 - $thick/2. + $cover + 1] $Centr [expr -$C_dim1 - $thick/2. + $ce -$cover - 1] $Centr

layer straight $SteelMatTag 5 $Adb8 [expr $C_dim1 + $thick/2. - $ce + $cover + 1] [expr $Centr - $thick/2. + $cover + 1] [expr $C_dim1 + $thick/2. - $cover - 1] [expr $Centr - $thick/2. + $cover + 1]
layer straight $SteelMatTag 5 $Adb8 [expr $C_dim1 + $thick/2. - $ce + $cover + 1] [expr $Centr + $thick/2. - $cover - 1] [expr $C_dim1 + $thick/2. - $cover - 1] [expr $Centr + $thick/2. - $cover - 1]
layer straight $SteelMatTag 2 $Adb8 [expr $C_dim1 + $thick/2. - $ce + $cover + 1] $Centr [expr $C_dim1 + $thick/2. -$cover - 1] $Centr

};

# COUPLING BEAM SECTIONS --------------------------------------------------------------------------

# ################################################
# COUPLING BEAM 36x36
set CB36x36 $secTag
incr secTag 1

set EcCB	$EcWall8;	# Young's Modulus of Concrete
set nuc 0.2;														# Poisson's Ratio of Concrete
set GcCB 	[expr $EcCB/(2.0*(1.0+$nuc))];							# Shear Modulus of Concrete
set J_CB 	[expr pow(36*$in,4)*0.141]

section Fiber $CB36x36 -GJ [expr $GcCB*$J_CB] {
#fiber $yLoc $zLoc $A $matTag

#Equivalent concrete fiber
fiber 0 0 [expr 0.751*36.*$in*36.*$in] $confinedConcCB36x36

#Steel diagonal reinforcement fiber
fiber 0 0 [expr 9.*$Adb8] $SteelMatTag
}

# ################################################
# COUPLING BEAM 36x60
set CB36x60 $secTag
incr secTag 1

set EcCB	$EcWall8;	# Young's Modulus of Concrete
set nuc 0.2;														# Poisson's Ratio of Concrete
set GcCB 	[expr $EcCB/(2.0*(1.0+$nuc))];							# Shear Modulus of Concrete
set J_CB 	[expr 60*$in*pow(36*$in,3)*0.207]

section Fiber $CB36x60 -GJ [expr $GcCB*$J_CB] {
#fiber $yLoc $zLoc $A $matTag

#Equivalent concrete fiber
fiber 0 0 [expr 0.566*36.*$in*60.*$in] $confinedConcCB36x60

#Steel diagonal reinforcement fiber
fiber 0 0 [expr 20.*$Adb11] $SteelMatTag
}

# ################################################
# COUPLING BEAM 36x42
set CB36x42 $secTag
incr secTag 1

set EcCB	$EcWall7;	# Young's Modulus of Concrete
set nuc 0.2;														# Poisson's Ratio of Concrete
set GcCB 	[expr $EcCB/(2.0*(1.0+$nuc))];							# Shear Modulus of Concrete
set J_CB 	[expr 42*$in*pow(36*$in,3)*0.159]

section Fiber $CB36x42 -GJ [expr $GcCB*$J_CB] {
#fiber $yLoc $zLoc $A $matTag

#Equivalent concrete fiber
fiber 0 0 [expr 0.909*36.*$in*42.*$in] $confinedConcCB36x42

#Steel diagonal reinforcement fiber
fiber 0 0 [expr 16.*$Adb11] $SteelMatTag
}

# ################################################
# COUPLING BEAM 32x30
set CB32x30 $secTag
incr secTag 1

set EcCB	$EcWall7;	# Young's Modulus of Concrete
set nuc 0.2;														# Poisson's Ratio of Concrete
set GcCB 	[expr $EcCB/(2.0*(1.0+$nuc))];							# Shear Modulus of Concrete
set J_CB 	[expr 32*$in*pow(30*$in,3)*0.141]

section Fiber $CB32x30 -GJ [expr $GcCB*$J_CB] {
#fiber $yLoc $zLoc $A $matTag

#Equivalent concrete fiber
fiber 0 0 [expr 1.139*32.*$in*30.*$in] $confinedConcCB32x30

#Steel diagonal reinforcement fiber
fiber 0 0 [expr 12.*$Adb11] $SteelMatTag
}

# ################################################
# COUPLING BEAM 28x30
set CB28x30 $secTag
incr secTag 1

set EcCB	$EcWall6;	# Young's Modulus of Concrete
set nuc 0.2;														# Poisson's Ratio of Concrete
set GcCB 	[expr $EcCB/(2.0*(1.0+$nuc))];							# Shear Modulus of Concrete
set J_CB 	[expr 30*$in*pow(28*$in,3)*0.141]

section Fiber $CB28x30 -GJ [expr $GcCB*$J_CB] {
#fiber $yLoc $zLoc $A $matTag

#Equivalent concrete fiber
fiber 0 0 [expr 1.139*28.*$in*30.*$in] $confinedConcCB28x30

#Steel diagonal reinforcement fiber
fiber 0 0 [expr 15.*$Adb11] $SteelMatTag
}

# ################################################
# COUPLING BEAM 24x30
set CB24x30 $secTag
incr secTag 1

set EcCB	$EcWall6;	# Young's Modulus of Concrete
set nuc 0.2;														# Poisson's Ratio of Concrete
set GcCB 	[expr $EcCB/(2.0*(1.0+$nuc))];							# Shear Modulus of Concrete
set J_CB 	[expr 30*$in*pow(24*$in,3)*0.169]

section Fiber $CB24x30 -GJ [expr $GcCB*$J_CB] {
#fiber $yLoc $zLoc $A $matTag

#Equivalent concrete fiber
fiber 0 0 [expr 1.139*24.*$in*30.*$in] $confinedConcCB24x30

#Steel diagonal reinforcement fiber
fiber 0 0 [expr 12.*$Adb11] $SteelMatTag
}

# ################################################
# COUPLING BEAM 20x30
set CB20x30 $secTag
incr secTag 1

set EcCB	$EcWall6;	# Young's Modulus of Concrete
set nuc 0.2;														# Poisson's Ratio of Concrete
set GcCB 	[expr $EcCB/(2.0*(1.0+$nuc))];							# Shear Modulus of Concrete
set J_CB 	[expr 30*$in*pow(20*$in,3)*0.196]

section Fiber $CB20x30 -GJ [expr $GcCB*$J_CB] {
#fiber $yLoc $zLoc $A $matTag

#Equivalent concrete fiber
fiber 0 0 [expr 1.139*20.*$in*30.*$in] $confinedConcCB20x30

#Steel diagonal reinforcement fiber
fiber 0 0 [expr 9.*$Adb11] $SteelMatTag
}

# COLUMN SECTIONS -----------------------------------------------------------------------------

# ################################
# Col 12x12 5 ksi
set C12_5ksi $secTag
incr secTag 1

set Ec_col	$EcWall5;	# Young's Modulus of Concrete
set nuc 0.2;														# Poisson's Ratio of Concrete
set Gc_col 	[expr $Ec_col/(2.0*(1.0+$nuc))];						# Shear Modulus of Concrete

set dim [expr 12*$in]
set Jcol [expr 0.141*pow($dim,4)]

section Fiber $C12_5ksi -GJ [expr $Gc_col*$Jcol] {
#patch rect $matTag $numSubdivY $numSubdivZ $yI $zI $yJ $zJ

patch rect $unconfinedConc5 6 6 [expr -$dim/2.] [expr -$dim/2.] [expr $dim/2.] [expr $dim/2.]

layer straight $SteelMatTag 3 $Adb6 [expr -$dim/2. + 2.] [expr -$dim/2. + 2.] [expr $dim/2. - 2.] [expr -$dim/2. + 2.]
layer straight $SteelMatTag 3 $Adb6 [expr -$dim/2. + 2.] [expr $dim/2. - 2.] [expr $dim/2. - 2.] [expr $dim/2. - 2.]
layer straight $SteelMatTag 2 $Adb6 [expr -$dim/2. + 2.] 0 [expr $dim/2. - 2.] 0

}

# ################################
# Col 16x16 5 ksi
set C16_5ksi $secTag
incr secTag 1

set Ec_col	$EcWall5;	# Young's Modulus of Concrete
set nuc 0.2;														# Poisson's Ratio of Concrete
set Gc_col 	[expr $Ec_col/(2.0*(1.0+$nuc))];						# Shear Modulus of Concrete

set dim [expr 16*$in]
set Jcol [expr 0.141*pow($dim,4)]

section Fiber $C16_5ksi -GJ [expr $Gc_col*$Jcol] {
#patch rect $matTag $numSubdivY $numSubdivZ $yI $zI $yJ $zJ

patch rect $unconfinedConc5 6 6 [expr -$dim/2.] [expr -$dim/2.] [expr $dim/2.] [expr $dim/2.]

layer straight $SteelMatTag 3 $Adb6 [expr -$dim/2. + 2.] [expr -$dim/2. + 2.] [expr $dim/2. - 2.] [expr -$dim/2. + 2.]
layer straight $SteelMatTag 3 $Adb6 [expr -$dim/2. + 2.] [expr $dim/2. - 2.] [expr $dim/2. - 2.] [expr $dim/2. - 2.]
layer straight $SteelMatTag 2 $Adb6 [expr -$dim/2. + 2.] 0 [expr $dim/2. - 2.] 0

}

# ################################
# Col 20x20 5 ksi
set C20_5ksi $secTag
incr secTag 1

set Ec_col	$EcWall5;	# Young's Modulus of Concrete
set nuc 0.2;														# Poisson's Ratio of Concrete
set Gc_col 	[expr $Ec_col/(2.0*(1.0+$nuc))];						# Shear Modulus of Concrete

set dim [expr 20*$in]
set Jcol [expr 0.141*pow($dim,4)]

section Fiber $C20_5ksi -GJ [expr $Gc_col*$Jcol] {
#patch rect $matTag $numSubdivY $numSubdivZ $yI $zI $yJ $zJ

patch rect $unconfinedConc5 8 8 [expr -$dim/2.] [expr -$dim/2.] [expr $dim/2.] [expr $dim/2.]

layer straight $SteelMatTag 3 $Adb7 [expr -$dim/2. + 2.] [expr -$dim/2. + 2.] [expr $dim/2. - 2.] [expr -$dim/2. + 2.]
layer straight $SteelMatTag 3 $Adb7 [expr -$dim/2. + 2.] [expr $dim/2. - 2.] [expr $dim/2. - 2.] [expr $dim/2. - 2.]
layer straight $SteelMatTag 2 $Adb7 [expr -$dim/2. + 2.] 0 [expr $dim/2. - 2.] 0

}

# ################################
# Col 24x24 5 ksi
set C24_5ksi $secTag
incr secTag 1

set Ec_col	$EcWall5;	# Young's Modulus of Concrete
set nuc 0.2;														# Poisson's Ratio of Concrete
set Gc_col 	[expr $Ec_col/(2.0*(1.0+$nuc))];						# Shear Modulus of Concrete

set dim [expr 24*$in]
set Jcol [expr 0.141*pow($dim,4)]

section Fiber $C24_5ksi -GJ [expr $Gc_col*$Jcol] {
#patch rect $matTag $numSubdivY $numSubdivZ $yI $zI $yJ $zJ

patch rect $unconfinedConc5 10 10 [expr -$dim/2.] [expr -$dim/2.] [expr $dim/2.] [expr $dim/2.]

layer straight $SteelMatTag 4 $Adb7 [expr -$dim/2. + 2.] [expr -$dim/2. + 2.] [expr $dim/2. - 2.] [expr -$dim/2. + 2.]
layer straight $SteelMatTag 4 $Adb7 [expr -$dim/2. + 2.] [expr $dim/2. - 2.] [expr $dim/2. - 2.] [expr $dim/2. - 2.]
layer straight $SteelMatTag 2 $Adb7 [expr -$dim/2. + 2.] [expr -3.5*$in] [expr $dim/2. - 2.] [expr -3.5*$in]
layer straight $SteelMatTag 2 $Adb7 [expr -$dim/2. + 2.] [expr 3.5*$in] [expr $dim/2. - 2.] [expr 3.5*$in]

}

# ################################
# Col 28x28 5 ksi
set C28_5ksi $secTag
incr secTag 1

set Ec_col	$EcWall5;	# Young's Modulus of Concrete
set nuc 0.2;														# Poisson's Ratio of Concrete
set Gc_col 	[expr $Ec_col/(2.0*(1.0+$nuc))];						# Shear Modulus of Concrete

set dim [expr 28*$in]
set Jcol [expr 0.141*pow($dim,4)]

section Fiber $C28_5ksi -GJ [expr $Gc_col*$Jcol] {
#patch rect $matTag $numSubdivY $numSubdivZ $yI $zI $yJ $zJ

patch rect $unconfinedConc5 10 10 [expr -$dim/2.] [expr -$dim/2.] [expr $dim/2.] [expr $dim/2.]

layer straight $SteelMatTag 4 $Adb8 [expr -$dim/2. + 2.] [expr -$dim/2. + 2.] [expr $dim/2. - 2.] [expr -$dim/2. + 2.]
layer straight $SteelMatTag 4 $Adb8 [expr -$dim/2. + 2.] [expr $dim/2. - 2.] [expr $dim/2. - 2.] [expr $dim/2. - 2.]
layer straight $SteelMatTag 2 $Adb8 [expr -$dim/2. + 2.] [expr -4.*$in] [expr $dim/2. - 2.] [expr -4.*$in]
layer straight $SteelMatTag 2 $Adb8 [expr -$dim/2. + 2.] [expr 4.*$in] [expr $dim/2. - 2.] [expr 4.*$in]

}

# ################################
# Col 32x32 5 ksi
set C32_5ksi $secTag
incr secTag 1

set Ec_col	$EcWall5;	# Young's Modulus of Concrete
set nuc 0.2;														# Poisson's Ratio of Concrete
set Gc_col 	[expr $Ec_col/(2.0*(1.0+$nuc))];						# Shear Modulus of Concrete

set dim [expr 32*$in]
set Jcol [expr 0.141*pow($dim,4)]

section Fiber $C32_5ksi -GJ [expr $Gc_col*$Jcol] {
#patch rect $matTag $numSubdivY $numSubdivZ $yI $zI $yJ $zJ

patch rect $unconfinedConc5 12 12 [expr -$dim/2.] [expr -$dim/2.] [expr $dim/2.] [expr $dim/2.]

layer straight $SteelMatTag 5 $Adb8 [expr -$dim/2. + 2.] [expr -$dim/2. + 2.] [expr $dim/2. - 2.] [expr -$dim/2. + 2.]
layer straight $SteelMatTag 5 $Adb8 [expr -$dim/2. + 2.] [expr $dim/2. - 2.] [expr $dim/2. - 2.] [expr $dim/2. - 2.]
layer straight $SteelMatTag 3 $Adb8 [expr -$dim/2. + 2.] [expr -6.*$in] [expr -$dim/2. + 2.] [expr 6.*$in]
layer straight $SteelMatTag 3 $Adb8 [expr $dim/2. - 2.] [expr -6.*$in] [expr $dim/2. - 2.] [expr 6.*$in]

}

# ################################
set fGJ 0.1
set cover [expr 1.0*$in]

# Col 12x12 6 ksi
set C12_6ksi $secTag
incr secTag 1

set Ec_col	$EcWall6;	# Young's Modulus of Concrete
set nuc 0.2;														# Poisson's Ratio of Concrete
set Gc_col 	[expr $Ec_col/(2.0*(1.0+$nuc))];						# Shear Modulus of Concrete

set dim [expr 12*$in]
set Jcol [expr 0.141*pow($dim,4)]

section Fiber $C12_6ksi -GJ [expr $Gc_col*$Jcol*$fGJ] {
#patch rect $matTag $numSubdivY $numSubdivZ $yI $zI $yJ $zJ

patch rect $unconfinedConc6 6 2 [expr -$dim/2.] [expr -$dim/2.] [expr $dim/2.] [expr -$dim/2. + $cover]
patch rect $unconfinedConc6 6 2 [expr -$dim/2.] [expr $dim/2. - $cover] [expr $dim/2.] [expr $dim/2.]
patch rect $unconfinedConc6 2 4 [expr -$dim/2.] [expr -$dim/2. + $cover] [expr -$dim/2. + $cover] [expr $dim/2. - $cover]
patch rect $unconfinedConc6 2 4 [expr $dim/2. - $cover] [expr -$dim/2. + $cover] [expr $dim/2.] [expr $dim/2. - $cover]

patch rect $confinedConcCol12_20 6 6 [expr -$dim/2. + $cover] [expr -$dim/2. + $cover] [expr $dim/2. - $cover] [expr $dim/2. - $cover]

layer straight $SteelMatTag 3 $Adb6 [expr -$dim/2. + 2.] [expr -$dim/2. + 2.] [expr $dim/2. - 2.] [expr -$dim/2. + 2.]
layer straight $SteelMatTag 3 $Adb6 [expr -$dim/2. + 2.] [expr $dim/2. - 2.] [expr $dim/2. - 2.] [expr $dim/2. - 2.]
layer straight $SteelMatTag 2 $Adb6 [expr -$dim/2. + 2.] 0 [expr $dim/2. - 2.] 0

}

# ################################
# Col 16x16 6 ksi
set C16_6ksi $secTag
incr secTag 1

set Ec_col	$EcWall6;	# Young's Modulus of Concrete
set nuc 0.2;														# Poisson's Ratio of Concrete
set Gc_col 	[expr $Ec_col/(2.0*(1.0+$nuc))];						# Shear Modulus of Concrete

set dim [expr 16*$in]
set Jcol [expr 0.141*pow($dim,4)]

section Fiber $C16_6ksi -GJ [expr $Gc_col*$Jcol*$fGJ] {
#patch rect $matTag $numSubdivY $numSubdivZ $yI $zI $yJ $zJ

patch rect $unconfinedConc6 6 2 [expr -$dim/2.] [expr -$dim/2.] [expr $dim/2.] [expr -$dim/2. + $cover]
patch rect $unconfinedConc6 6 2 [expr -$dim/2.] [expr $dim/2. - $cover] [expr $dim/2.] [expr $dim/2.]
patch rect $unconfinedConc6 2 4 [expr -$dim/2.] [expr -$dim/2. + $cover] [expr -$dim/2. + $cover] [expr $dim/2. - $cover]
patch rect $unconfinedConc6 2 4 [expr $dim/2. - $cover] [expr -$dim/2. + $cover] [expr $dim/2.] [expr $dim/2. - $cover]

patch rect $confinedConcCol12_20 7 7 [expr -$dim/2. + $cover] [expr -$dim/2. + $cover] [expr $dim/2. - $cover] [expr $dim/2. - $cover]

layer straight $SteelMatTag 3 $Adb6 [expr -$dim/2. + 2.] [expr -$dim/2. + 2.] [expr $dim/2. - 2.] [expr -$dim/2. + 2.]
layer straight $SteelMatTag 3 $Adb6 [expr -$dim/2. + 2.] [expr $dim/2. - 2.] [expr $dim/2. - 2.] [expr $dim/2. - 2.]
layer straight $SteelMatTag 2 $Adb6 [expr -$dim/2. + 2.] 0 [expr $dim/2. - 2.] 0

}

# ################################
# Col 20x20 6 ksi
set C20_6ksi $secTag
incr secTag 1

set Ec_col	$EcWall6;	# Young's Modulus of Concrete
set nuc 0.2;														# Poisson's Ratio of Concrete
set Gc_col 	[expr $Ec_col/(2.0*(1.0+$nuc))];						# Shear Modulus of Concrete

set dim [expr 20*$in]
set Jcol [expr 0.141*pow($dim,4)]

section Fiber $C20_6ksi -GJ [expr $Gc_col*$Jcol*$fGJ] {
#patch rect $matTag $numSubdivY $numSubdivZ $yI $zI $yJ $zJ

patch rect $unconfinedConc6 8 2 [expr -$dim/2.] [expr -$dim/2.] [expr $dim/2.] [expr -$dim/2. + $cover]
patch rect $unconfinedConc6 8 2 [expr -$dim/2.] [expr $dim/2. - $cover] [expr $dim/2.] [expr $dim/2.]
patch rect $unconfinedConc6 2 6 [expr -$dim/2.] [expr -$dim/2. + $cover] [expr -$dim/2. + $cover] [expr $dim/2. - $cover]
patch rect $unconfinedConc6 2 6 [expr $dim/2. - $cover] [expr -$dim/2. + $cover] [expr $dim/2.] [expr $dim/2. - $cover]

patch rect $confinedConcCol12_20 9 9 [expr -$dim/2. + $cover] [expr -$dim/2. + $cover] [expr $dim/2. - $cover] [expr $dim/2. - $cover]

layer straight $SteelMatTag 4 $Adb7 [expr -$dim/2. + 2.] [expr -$dim/2. + 2.] [expr $dim/2. - 2.] [expr -$dim/2. + 2.]
layer straight $SteelMatTag 4 $Adb7 [expr -$dim/2. + 2.] [expr $dim/2. - 2.] [expr $dim/2. - 2.] [expr $dim/2. - 2.]
layer straight $SteelMatTag 2 $Adb7 [expr -$dim/2. + 2.] -3. [expr -$dim/2. + 2.] 3.
layer straight $SteelMatTag 2 $Adb7 [expr $dim/2. - 2.] -3. [expr $dim/2. - 2.] 3.

}

# ################################
# Col 24x24 6 ksi
set C24_6ksi $secTag
incr secTag 1

set Ec_col	$EcWall6;	# Young's Modulus of Concrete
set nuc 0.2;														# Poisson's Ratio of Concrete
set Gc_col 	[expr $Ec_col/(2.0*(1.0+$nuc))];						# Shear Modulus of Concrete

set dim [expr 24*$in]
set Jcol [expr 0.141*pow($dim,4)]

section Fiber $C24_6ksi -GJ [expr $Gc_col*$Jcol*$fGJ] {
#patch rect $matTag $numSubdivY $numSubdivZ $yI $zI $yJ $zJ

patch rect $unconfinedConc6 11 2 [expr -$dim/2.] [expr -$dim/2.] [expr $dim/2.] [expr -$dim/2. + $cover]
patch rect $unconfinedConc6 11 2 [expr -$dim/2.] [expr $dim/2. - $cover] [expr $dim/2.] [expr $dim/2.]
patch rect $unconfinedConc6 2 11 [expr -$dim/2.] [expr -$dim/2. + $cover] [expr -$dim/2. + $cover] [expr $dim/2. - $cover]
patch rect $unconfinedConc6 2 11 [expr $dim/2. - $cover] [expr -$dim/2. + $cover] [expr $dim/2.] [expr $dim/2. - $cover]

patch rect $confinedConcCol24_44 11 11 [expr -$dim/2. + $cover] [expr -$dim/2. + $cover] [expr $dim/2. - $cover] [expr $dim/2. - $cover]

layer straight $SteelMatTag 5 $Adb7 [expr -$dim/2. + 2.] [expr -$dim/2. + 2.] [expr $dim/2. - 2.] [expr -$dim/2. + 2.]
layer straight $SteelMatTag 5 $Adb7 [expr -$dim/2. + 2.] [expr $dim/2. - 2.] [expr $dim/2. - 2.] [expr $dim/2. - 2.]
layer straight $SteelMatTag 3 $Adb7 [expr -$dim/2. + 2.] [expr -3.5*$in] [expr $dim/2. - 2.] [expr -3.5*$in]
layer straight $SteelMatTag 3 $Adb7 [expr -$dim/2. + 2.] [expr 3.5*$in] [expr $dim/2. - 2.] [expr 3.5*$in]

}

# ################################
# Col 28x28 6 ksi
set C28_6ksi $secTag
incr secTag 1

set Ec_col	$EcWall6;	# Young's Modulus of Concrete
set nuc 0.2;														# Poisson's Ratio of Concrete
set Gc_col 	[expr $Ec_col/(2.0*(1.0+$nuc))];						# Shear Modulus of Concrete

set dim [expr 28*$in]
set Jcol [expr 0.141*pow($dim,4)]

section Fiber $C28_6ksi -GJ [expr $Gc_col*$Jcol*$fGJ] {
#patch rect $matTag $numSubdivY $numSubdivZ $yI $zI $yJ $zJ

patch rect $unconfinedConc6 13 2 [expr -$dim/2.] [expr -$dim/2.] [expr $dim/2.] [expr -$dim/2. + $cover]
patch rect $unconfinedConc6 13 2 [expr -$dim/2.] [expr $dim/2. - $cover] [expr $dim/2.] [expr $dim/2.]
patch rect $unconfinedConc6 2 13 [expr -$dim/2.] [expr -$dim/2. + $cover] [expr -$dim/2. + $cover] [expr $dim/2. - $cover]
patch rect $unconfinedConc6 2 13 [expr $dim/2. - $cover] [expr -$dim/2. + $cover] [expr $dim/2.] [expr $dim/2. - $cover]

patch rect $confinedConcCol24_44 13 13 [expr -$dim/2. + $cover] [expr -$dim/2. + $cover] [expr $dim/2. - $cover] [expr $dim/2. - $cover]

layer straight $SteelMatTag 6 $Adb7 [expr -$dim/2. + 2.] [expr -$dim/2. + 2.] [expr $dim/2. - 2.] [expr -$dim/2. + 2.]
layer straight $SteelMatTag 6 $Adb7 [expr -$dim/2. + 2.] [expr $dim/2. - 2.] [expr $dim/2. - 2.] [expr $dim/2. - 2.]
layer straight $SteelMatTag 4 $Adb7 [expr -$dim/2. + 2.] [expr -4.*$in] [expr $dim/2. - 2.] [expr -4.*$in]
layer straight $SteelMatTag 4 $Adb7 [expr -$dim/2. + 2.] [expr 4.*$in] [expr $dim/2. - 2.] [expr 4.*$in]

}

# ################################
# Col 32x32 6 ksi
set C32_6ksi $secTag
incr secTag 1

set Ec_col	$EcWall6;	# Young's Modulus of Concrete
set nuc 0.2;														# Poisson's Ratio of Concrete
set Gc_col 	[expr $Ec_col/(2.0*(1.0+$nuc))];						# Shear Modulus of Concrete

set dim [expr 32*$in]
set Jcol [expr 0.141*pow($dim,4)]

section Fiber $C32_6ksi -GJ [expr $Gc_col*$Jcol*$fGJ] {
#patch rect $matTag $numSubdivY $numSubdivZ $yI $zI $yJ $zJ

patch rect $unconfinedConc6 15 2 [expr -$dim/2.] [expr -$dim/2.] [expr $dim/2.] [expr -$dim/2. + $cover]
patch rect $unconfinedConc6 15 2 [expr -$dim/2.] [expr $dim/2. - $cover] [expr $dim/2.] [expr $dim/2.]
patch rect $unconfinedConc6 2 15 [expr -$dim/2.] [expr -$dim/2. + $cover] [expr -$dim/2. + $cover] [expr $dim/2. - $cover]
patch rect $unconfinedConc6 2 15 [expr $dim/2. - $cover] [expr -$dim/2. + $cover] [expr $dim/2.] [expr $dim/2. - $cover]

patch rect $confinedConcCol24_44 15 15 [expr -$dim/2. + $cover] [expr -$dim/2. + $cover] [expr $dim/2. - $cover] [expr $dim/2. - $cover]

layer straight $SteelMatTag 6 $Adb8 [expr -$dim/2. + 2.] [expr -$dim/2. + 2.] [expr $dim/2. - 2.] [expr -$dim/2. + 2.]
layer straight $SteelMatTag 6 $Adb8 [expr -$dim/2. + 2.] [expr $dim/2. - 2.] [expr $dim/2. - 2.] [expr $dim/2. - 2.]
layer straight $SteelMatTag 4 $Adb8 [expr -$dim/2. + 2.] [expr -8.*$in] [expr -$dim/2. + 2.] [expr 8.*$in]
layer straight $SteelMatTag 4 $Adb8 [expr $dim/2. - 2.] [expr -8.*$in] [expr $dim/2. - 2.] [expr 8.*$in]

}

# ################################
# Col 36x36 6 ksi
set C36_6ksi $secTag
incr secTag 1

set Ec_col	$EcWall6;	# Young's Modulus of Concrete
set nuc 0.2;														# Poisson's Ratio of Concrete
set Gc_col 	[expr $Ec_col/(2.0*(1.0+$nuc))];						# Shear Modulus of Concrete

set dim [expr 36*$in]
set Jcol [expr 0.141*pow($dim,4)]

section Fiber $C36_6ksi -GJ [expr $Gc_col*$Jcol*$fGJ] {
#patch rect $matTag $numSubdivY $numSubdivZ $yI $zI $yJ $zJ

patch rect $unconfinedConc6 17 2 [expr -$dim/2.] [expr -$dim/2.] [expr $dim/2.] [expr -$dim/2. + $cover]
patch rect $unconfinedConc6 17 2 [expr -$dim/2.] [expr $dim/2. - $cover] [expr $dim/2.] [expr $dim/2.]
patch rect $unconfinedConc6 2 17 [expr -$dim/2.] [expr -$dim/2. + $cover] [expr -$dim/2. + $cover] [expr $dim/2. - $cover]
patch rect $unconfinedConc6 2 17 [expr $dim/2. - $cover] [expr -$dim/2. + $cover] [expr $dim/2.] [expr $dim/2. - $cover]

patch rect $confinedConcCol24_44 17 17 [expr -$dim/2. + $cover] [expr -$dim/2. + $cover] [expr $dim/2. - $cover] [expr $dim/2. - $cover]

layer straight $SteelMatTag 7 $Adb8 [expr -$dim/2. + 2.] [expr -$dim/2. + 2.] [expr $dim/2. - 2.] [expr -$dim/2. + 2.]
layer straight $SteelMatTag 7 $Adb8 [expr -$dim/2. + 2.] [expr $dim/2. - 2.] [expr $dim/2. - 2.] [expr $dim/2. - 2.]
layer straight $SteelMatTag 5 $Adb8 [expr -$dim/2. + 2.] [expr -10.*$in] [expr -$dim/2. + 2.] [expr 10.*$in]
layer straight $SteelMatTag 5 $Adb8 [expr $dim/2. - 2.] [expr -10.*$in] [expr $dim/2. - 2.] [expr 10.*$in]

}

# ################################
# Col 40x40 6 ksi
set C40_6ksi $secTag
incr secTag 1

set Ec_col	$EcWall6;	# Young's Modulus of Concrete
set nuc 0.2;														# Poisson's Ratio of Concrete
set Gc_col 	[expr $Ec_col/(2.0*(1.0+$nuc))];						# Shear Modulus of Concrete

set dim [expr 40*$in]
set Jcol [expr 0.141*pow($dim,4)]

section Fiber $C40_6ksi -GJ [expr $Gc_col*$Jcol*$fGJ] {
#patch rect $matTag $numSubdivY $numSubdivZ $yI $zI $yJ $zJ

patch rect $unconfinedConc6 19 2 [expr -$dim/2.] [expr -$dim/2.] [expr $dim/2.] [expr -$dim/2. + $cover]
patch rect $unconfinedConc6 19 2 [expr -$dim/2.] [expr $dim/2. - $cover] [expr $dim/2.] [expr $dim/2.]
patch rect $unconfinedConc6 2 19 [expr -$dim/2.] [expr -$dim/2. + $cover] [expr -$dim/2. + $cover] [expr $dim/2. - $cover]
patch rect $unconfinedConc6 2 19 [expr $dim/2. - $cover] [expr -$dim/2. + $cover] [expr $dim/2.] [expr $dim/2. - $cover]

patch rect $confinedConcCol24_44 19 19 [expr -$dim/2. + $cover] [expr -$dim/2. + $cover] [expr $dim/2. - $cover] [expr $dim/2. - $cover]

layer straight $SteelMatTag 8 $Adb8 [expr -$dim/2. + 2.] [expr -$dim/2. + 2.] [expr $dim/2. - 2.] [expr -$dim/2. + 2.]
layer straight $SteelMatTag 8 $Adb8 [expr -$dim/2. + 2.] [expr $dim/2. - 2.] [expr $dim/2. - 2.] [expr $dim/2. - 2.]
layer straight $SteelMatTag 6 $Adb8 [expr -$dim/2. + 2.] [expr -12.5*$in] [expr -$dim/2. + 2.] [expr 12.5*$in]
layer straight $SteelMatTag 6 $Adb8 [expr $dim/2. - 2.] [expr -12.5*$in] [expr $dim/2. - 2.] [expr 12.5*$in]

}

# ################################
# Col 44x44 6 ksi
set C44_6ksi $secTag
incr secTag 1

set Ec_col	$EcWall6;	# Young's Modulus of Concrete
set nuc 0.2;														# Poisson's Ratio of Concrete
set Gc_col 	[expr $Ec_col/(2.0*(1.0+$nuc))];						# Shear Modulus of Concrete

set dim [expr 44*$in]
set Jcol [expr 0.141*pow($dim,4)]

section Fiber $C44_6ksi -GJ [expr $Gc_col*$Jcol*$fGJ] {
#patch rect $matTag $numSubdivY $numSubdivZ $yI $zI $yJ $zJ

patch rect $unconfinedConc6 21 2 [expr -$dim/2.] [expr -$dim/2.] [expr $dim/2.] [expr -$dim/2. + $cover]
patch rect $unconfinedConc6 21 2 [expr -$dim/2.] [expr $dim/2. - $cover] [expr $dim/2.] [expr $dim/2.]
patch rect $unconfinedConc6 2 21 [expr -$dim/2.] [expr -$dim/2. + $cover] [expr -$dim/2. + $cover] [expr $dim/2. - $cover]
patch rect $unconfinedConc6 2 21 [expr $dim/2. - $cover] [expr -$dim/2. + $cover] [expr $dim/2.] [expr $dim/2. - $cover]

patch rect $confinedConcCol24_44 21 21 [expr -$dim/2. + $cover] [expr -$dim/2. + $cover] [expr $dim/2. - $cover] [expr $dim/2. - $cover]

layer straight $SteelMatTag 9 $Adb8 [expr -$dim/2. + 2.] [expr -$dim/2. + 2.] [expr $dim/2. - 2.] [expr -$dim/2. + 2.]
layer straight $SteelMatTag 9 $Adb8 [expr -$dim/2. + 2.] [expr $dim/2. - 2.] [expr $dim/2. - 2.] [expr $dim/2. - 2.]
layer straight $SteelMatTag 7 $Adb8 [expr -$dim/2. + 2.] [expr -15.*$in] [expr -$dim/2. + 2.] [expr 15.*$in]
layer straight $SteelMatTag 7 $Adb8 [expr $dim/2. - 2.] [expr -15.*$in] [expr $dim/2. - 2.] [expr 15.*$in]

}

# RECTANGULAR WALL SECTIONS -------------------------------------------------------------------

#           ___
#          | z |
#          | ^ |      
#          | | |     
#          | | |     
#       y <--o |   
#          |   |           
#          |   |           
#          |   | 
#          |___|
#      

# ################################################
# WALL SECTION 24 in 6 ksi PODIUMS
set recWall24_6_pod $secTag
incr secTag 1

#section Fiber $secTag <-GJ $GJ> {
#fiber...
#patch...
#layer...
#...
#}

set EcWall	$EcWall6;	# Young's Modulus of Concrete
set nuc 0.2;														# Poisson's Ratio of Concrete
set GcWall 	[expr $EcWall/(2.0*(1.0+$nuc))];						# Shear Modulus of Concrete

set JWall [expr 312.*$in*pow(20*$in,3)*0.333]

set thick 	[expr 24.*$in]
set length	[expr 312.*$in]
set cover 	[expr 1.*$in]
set be		[expr 6.5*$ft]

section Fiber $recWall24_6_pod -GJ [expr $GcWall*$JWall] {
#patch rect $matTag $numSubdivY $numSubdivZ $yI $zI $yJ $zJ

#Confined concrete in boundary
patch rect $confinedConcW20_6_rec_be 8 32 [expr -$thick/2. + $cover] [expr -$length/2. + $cover] [expr $thick/2. - $cover] [expr -$length/2. + $be]
patch rect $confinedConcW20_6_rec_be 8 32 [expr -$thick/2. + $cover] [expr $length/2. - $be] [expr $thick/2. - $cover] [expr $length/2. - $cover]

#Unconfined concrete horizontal patch in boundary
patch rect $unconfinedConc6 1 12 [expr -$thick/2.] [expr -$length/2.] [expr -$thick/2. + $cover] [expr -$length/2. + $be]
patch rect $unconfinedConc6 1 12 [expr $thick/2. - $cover] [expr -$length/2.] [expr $thick/2.] [expr -$length/2. + $be]
patch rect $unconfinedConc6 1 12 [expr -$thick/2.] [expr $length/2. - $be] [expr -$thick/2. + $cover] [expr $length/2.]
patch rect $unconfinedConc6 1 12 [expr $thick/2. - $cover] [expr $length/2. - $be] [expr $thick/2.] [expr $length/2.]

#Unconfined concrete vertical patch in boundary
patch rect $unconfinedConc6 6 1 [expr -$thick/2. + $cover] [expr -$length/2.] [expr $thick/2. - $cover] [expr -$length/2. + $cover]
patch rect $unconfinedConc6 6 1 [expr -$thick/2. + $cover] [expr $length/2. - $cover] [expr $thick/2. - $cover] [expr $length/2.]

#Unconfined concrete web
patch rect $unconfinedConc6 8 40 [expr -$thick/2.] [expr -$length/2. + $be] [expr $thick/2.] [expr $length/2. - $be]

#layer straight $matTag $numFiber $areaFiber $yStart $zStart $yEnd $zEnd

#Steel rebar in web
layer straight $SteelMatTag 12 $Adb8 [expr -$thick/2. + $cover + 1] [expr -$length/2. + 11] [expr -$thick/2. + $cover + 1] [expr $length/2. - 11]
layer straight $SteelMatTag 12 $Adb8 [expr $thick/2. - $cover - 1] [expr -$length/2. + 11] [expr $thick/2. - $cover - 1] [expr $length/2. - 11]

#Steel rebars in boundary elements
layer straight $SteelMatTag 12 $Adb8 [expr -$thick/2. + $cover + 1] [expr -$length/2. + $cover + 1] [expr -$thick/2. + $cover + 1] [expr -$length/2. + $be - 1]
layer straight $SteelMatTag 12 $Adb8 [expr $thick/2. - $cover - 1] [expr -$length/2. + $cover + 1] [expr $thick/2. - $cover - 1] [expr -$length/2. + $be - 1]
layer straight $SteelMatTag 2 $Adb8 [expr -2.5*$in] [expr -$length/2. + $cover + 1] [expr 2.5*$in] [expr -$length/2. + $cover + 1]
layer straight $SteelMatTag 2 $Adb8 [expr -2.5*$in] [expr -$length/2. + $be - 1] [expr 2.5*$in] [expr -$length/2. + $be - 1]

layer straight $SteelMatTag 12 $Adb8 [expr -$thick/2. + $cover + 1] [expr $length/2. - $be + 1] [expr -$thick/2. + $cover + 1] [expr $length/2. - $cover - 1]
layer straight $SteelMatTag 12 $Adb8 [expr $thick/2. - $cover - 1] [expr $length/2. - $be + 1] [expr $thick/2. - $cover - 1] [expr $length/2. - 1]
layer straight $SteelMatTag 2 $Adb8 [expr -2.5*$in] [expr $length/2. - $be + 1] [expr 2.5*$in] [expr $length/2. - $be + 1]
layer straight $SteelMatTag 2 $Adb8 [expr -2.5*$in] [expr $length/2. - $cover - 1] [expr 2.5*$in] [expr $length/2. - $cover - 1]

};

# ################################################
# WALL SECTION 24 in 6 ksi OFFICE
set recWall24_6_off $secTag
incr secTag 1

#section Fiber $secTag <-GJ $GJ> {
#fiber...
#patch...
#layer...
#...
#}

set EcWall	$EcWall6;	# Young's Modulus of Concrete
set nuc 0.2;														# Poisson's Ratio of Concrete
set GcWall 	[expr $EcWall/(2.0*(1.0+$nuc))];						# Shear Modulus of Concrete

set JWall [expr 312.*$in*pow(20*$in,3)*0.333]

set thick 	[expr 24.*$in]
set length	[expr 312.*$in]
set cover 	[expr 1.*$in]
set be		[expr 4.*$ft]

section Fiber $recWall24_6_off -GJ [expr $GcWall*$JWall] {
#patch rect $matTag $numSubdivY $numSubdivZ $yI $zI $yJ $zJ

#Confined concrete in boundary
patch rect $confinedConcW20_6_rec_be_o 8 20 [expr -$thick/2. + $cover] [expr -$length/2. + $cover] [expr $thick/2. - $cover] [expr -$length/2. + $be]
patch rect $confinedConcW20_6_rec_be_o 8 20 [expr -$thick/2. + $cover] [expr $length/2. - $be] [expr $thick/2. - $cover] [expr $length/2. - $cover]

#Unconfined concrete horizontal patch in boundary
patch rect $unconfinedConc6 1 8 [expr -$thick/2.] [expr -$length/2.] [expr -$thick/2. + $cover] [expr -$length/2. + $be]
patch rect $unconfinedConc6 1 8 [expr $thick/2. - $cover] [expr -$length/2.] [expr $thick/2.] [expr -$length/2. + $be]
patch rect $unconfinedConc6 1 8 [expr -$thick/2.] [expr $length/2. - $be] [expr -$thick/2. + $cover] [expr $length/2.]
patch rect $unconfinedConc6 1 8 [expr $thick/2. - $cover] [expr $length/2. - $be] [expr $thick/2.] [expr $length/2.]

#Unconfined concrete vertical patch in boundary
patch rect $unconfinedConc6 6 1 [expr -$thick/2. + $cover] [expr -$length/2.] [expr $thick/2. - $cover] [expr -$length/2. + $cover]
patch rect $unconfinedConc6 6 1 [expr -$thick/2. + $cover] [expr $length/2. - $cover] [expr $thick/2. - $cover] [expr $length/2.]

#Unconfined concrete web
patch rect $unconfinedConc6 8 60 [expr -$thick/2.] [expr -$length/2. + $be] [expr $thick/2.] [expr $length/2. - $be]

#layer straight $matTag $numFiber $areaFiber $yStart $zStart $yEnd $zEnd

#Steel rebar in web
layer straight $SteelMatTag 17 $Adb8 [expr -$thick/2. + $cover + 1] [expr -$length/2. + 11] [expr -$thick/2. + $cover + 1] [expr $length/2. - 11]
layer straight $SteelMatTag 17 $Adb8 [expr $thick/2. - $cover - 1] [expr -$length/2. + 11] [expr $thick/2. - $cover - 1] [expr $length/2. - 11]

#Steel rebars in boundary elements
layer straight $SteelMatTag 7 $Adb8 [expr -$thick/2. + $cover + 1] [expr -$length/2. + $cover + 1] [expr -$thick/2. + $cover + 1] [expr -$length/2. + $be - 1]
layer straight $SteelMatTag 7 $Adb8 [expr $thick/2. - $cover - 1] [expr -$length/2. + $cover + 1] [expr $thick/2. - $cover - 1] [expr -$length/2. + $be - 1]
layer straight $SteelMatTag 2 $Adb8 0.0 [expr -$length/2. + $cover + 1] 0.0 [expr -$length/2. + $be - 1]

layer straight $SteelMatTag 7 $Adb8 [expr -$thick/2. + $cover + 1] [expr $length/2. - $be + 1] [expr -$thick/2. + $cover + 1] [expr $length/2. - $cover - 1]
layer straight $SteelMatTag 7 $Adb8 [expr $thick/2. - $cover - 1] [expr $length/2. - $be + 1] [expr $thick/2. - $cover - 1] [expr $length/2. - 1]
layer straight $SteelMatTag 2 $Adb8 0.0 [expr $length/2. - $be + 1] 0.0 [expr $length/2. -$cover - 1]

};

# RIGID LINK SECTION --------------------------------------------------------------------------
set ARigid [expr 1e12];
set JRigid [expr 1e14];
set IyRigid [expr 1e14];
set IzRigid [expr 1e14];