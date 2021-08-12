
# ###################################################################################################################################################################################################
# ################################################################################ DYNAMIC ANALYSIS RECORDERS #######################################################################################
# ###################################################################################################################################################################################################

# #####SPM Recorders
setMaxOpenFiles 1024

for {set i 1} {$i <= $nStory} {incr i 1} {
	
	set spmTag [expr 100000 + 1000*$i]
	
	if {$i <= 3} {
	
		set spmFileLocal "stringPanel_local_$i.txt"
		set spmFileGlobal "stringPanel_global_$i.txt"
		set spmFileInertia "stringPanel_inertia_$i.txt"
		set spmFileFlow "stringPanel_flow_$i.txt"
		
		recorder Element -file $modelScale/$EQlevel/$RSN/$SPMdirectory/$spmFileLocal -eleRange [expr $spmTag + 1] [expr $spmTag + 82] localForce
		recorder Element -file $modelScale/$EQlevel/$RSN/$SPMdirectory/$spmFileGlobal -eleRange [expr $spmTag + 1] [expr $spmTag + 82] globalForce
		recorder Element -file $modelScale/$EQlevel/$RSN/$SPMdirectory/$spmFileInertia -eleRange [expr $spmTag + 1] [expr $spmTag + 82] inertialForce
		recorder Element -file $modelScale/$EQlevel/$RSN/$SPMdirectory/$spmFileFlow -eleRange [expr $spmTag + 1] [expr $spmTag + 82] shearFlow
	
	} elseif {$i <= 11} {
	
		set spmFileLocal "stringPanel_local_$i.txt"
		set spmFileGlobal "stringPanel_global_$i.txt"
		set spmFileInertia "stringPanel_inertia_$i.txt"
		set spmFileFlow "stringPanel_flow_$i.txt"
		
		recorder Element -file $modelScale/$EQlevel/$RSN/$SPMdirectory/$spmFileLocal -eleRange [expr $spmTag + 1] [expr $spmTag + 65] localForce
		recorder Element -file $modelScale/$EQlevel/$RSN/$SPMdirectory/$spmFileGlobal -eleRange [expr $spmTag + 1] [expr $spmTag + 65] globalForce
		recorder Element -file $modelScale/$EQlevel/$RSN/$SPMdirectory/$spmFileInertia -eleRange [expr $spmTag + 1] [expr $spmTag + 65] inertialForce
		recorder Element -file $modelScale/$EQlevel/$RSN/$SPMdirectory/$spmFileFlow -eleRange [expr $spmTag + 1] [expr $spmTag + 65] shearFlow
	
	} else {
	
		set spmFileLocal "stringPanel_local_$i.txt"
		set spmFileGlobal "stringPanel_global_$i.txt"
		set spmFileInertia "stringPanel_inertia_$i.txt"
		set spmFileFlow "stringPanel_flow_$i.txt"
		
		recorder Element -file $modelScale/$EQlevel/$RSN/$SPMdirectory/$spmFileLocal -eleRange [expr $spmTag + 1] [expr $spmTag + 37] localForce
		recorder Element -file $modelScale/$EQlevel/$RSN/$SPMdirectory/$spmFileGlobal -eleRange [expr $spmTag + 1] [expr $spmTag + 37] globalForce
		recorder Element -file $modelScale/$EQlevel/$RSN/$SPMdirectory/$spmFileInertia -eleRange [expr $spmTag + 1] [expr $spmTag + 37] inertialForce
		recorder Element -file $modelScale/$EQlevel/$RSN/$SPMdirectory/$spmFileFlow -eleRange [expr $spmTag + 1] [expr $spmTag + 37] shearFlow
	}
	
}

recorder Node -file $modelScale/$EQlevel/$RSN/$SPMdirectory/accel_1.txt -node 1815 1824 1876 1871 -dof 1 2 accel
recorder Node -file $modelScale/$EQlevel/$RSN/$SPMdirectory/accel_2.txt -node 2815 2824 2876 2871 -dof 1 2 accel
recorder Node -file $modelScale/$EQlevel/$RSN/$SPMdirectory/accel_3.txt -node 3815 3824 3876 3871 -dof 1 2 accel

recorder Node -file $modelScale/$EQlevel/$RSN/$SPMdirectory/accel_4.txt -node 4826 4813 4890 4878 -dof 1 2 accel
recorder Node -file $modelScale/$EQlevel/$RSN/$SPMdirectory/accel_5.txt -node 5826 5813 5890 5878 -dof 1 2 accel
recorder Node -file $modelScale/$EQlevel/$RSN/$SPMdirectory/accel_6.txt -node 6826 6813 6890 6878 -dof 1 2 accel
recorder Node -file $modelScale/$EQlevel/$RSN/$SPMdirectory/accel_7.txt -node 7826 7813 7890 7878 -dof 1 2 accel
recorder Node -file $modelScale/$EQlevel/$RSN/$SPMdirectory/accel_8.txt -node 8826 8813 8890 8878 -dof 1 2 accel
recorder Node -file $modelScale/$EQlevel/$RSN/$SPMdirectory/accel_9.txt -node 9826 9813 9890 9878 -dof 1 2 accel
recorder Node -file $modelScale/$EQlevel/$RSN/$SPMdirectory/accel_10.txt -node 10826 10813 10890 10880 -dof 1 2 accel
recorder Node -file $modelScale/$EQlevel/$RSN/$SPMdirectory/accel_11.txt -node 11826 11813 11890 11880 -dof 1 2 accel
recorder Node -file $modelScale/$EQlevel/$RSN/$SPMdirectory/accel_12.txt -node 12838 12848 12890 12880 -dof 1 2 accel
recorder Node -file $modelScale/$EQlevel/$RSN/$SPMdirectory/accel_13.txt -node 13838 13848 13890 13880 -dof 1 2 accel
recorder Node -file $modelScale/$EQlevel/$RSN/$SPMdirectory/accel_14.txt -node 14838 14848 14890 14880 -dof 1 2 accel
recorder Node -file $modelScale/$EQlevel/$RSN/$SPMdirectory/accel_15.txt -node 15838 15848 15890 15880 -dof 1 2 accel
recorder Node -file $modelScale/$EQlevel/$RSN/$SPMdirectory/accel_16.txt -node 16838 16848 16890 16880 -dof 1 2 accel
recorder Node -file $modelScale/$EQlevel/$RSN/$SPMdirectory/accel_17.txt -node 17838 17848 17890 17880 -dof 1 2 accel
recorder Node -file $modelScale/$EQlevel/$RSN/$SPMdirectory/accel_18.txt -node 18838 18848 18890 18880 -dof 1 2 accel
recorder Node -file $modelScale/$EQlevel/$RSN/$SPMdirectory/accel_19.txt -node 19838 19848 19890 19880 -dof 1 2 accel
recorder Node -file $modelScale/$EQlevel/$RSN/$SPMdirectory/accel_20.txt -node 20838 20848 20890 20880 -dof 1 2 accel
recorder Node -file $modelScale/$EQlevel/$RSN/$SPMdirectory/accel_21.txt -node 21838 21848 21890 21880 -dof 1 2 accel
recorder Node -file $modelScale/$EQlevel/$RSN/$SPMdirectory/accel_22.txt -node 22838 22848 22890 22880 -dof 1 2 accel
recorder Node -file $modelScale/$EQlevel/$RSN/$SPMdirectory/accel_23.txt -node 23838 23848 23890 23880 -dof 1 2 accel
recorder Node -file $modelScale/$EQlevel/$RSN/$SPMdirectory/accel_24.txt -node 24838 24848 24890 24880 -dof 1 2 accel
recorder Node -file $modelScale/$EQlevel/$RSN/$SPMdirectory/accel_25.txt -node 25838 25848 25890 25880 -dof 1 2 accel
recorder Node -file $modelScale/$EQlevel/$RSN/$SPMdirectory/accel_26.txt -node 26838 26848 26890 26880 -dof 1 2 accel
recorder Node -file $modelScale/$EQlevel/$RSN/$SPMdirectory/accel_27.txt -node 27838 27848 27890 27880 -dof 1 2 accel
recorder Node -file $modelScale/$EQlevel/$RSN/$SPMdirectory/accel_28.txt -node 28838 28848 28890 28880 -dof 1 2 accel
recorder Node -file $modelScale/$EQlevel/$RSN/$SPMdirectory/accel_29.txt -node 29838 29848 29890 29880 -dof 1 2 accel
recorder Node -file $modelScale/$EQlevel/$RSN/$SPMdirectory/accel_30.txt -node 30838 30848 30890 20880 -dof 1 2 accel
recorder Node -file $modelScale/$EQlevel/$RSN/$SPMdirectory/accel_31.txt -node 31838 31848 31890 31880 -dof 1 2 accel
recorder Node -file $modelScale/$EQlevel/$RSN/$SPMdirectory/accel_32.txt -node 32838 32848 32890 32880 -dof 1 2 accel
recorder Node -file $modelScale/$EQlevel/$RSN/$SPMdirectory/accel_33.txt -node 33838 33848 33890 33880 -dof 1 2 accel
recorder Node -file $modelScale/$EQlevel/$RSN/$SPMdirectory/accel_34.txt -node 34838 34848 34890 34880 -dof 1 2 accel
recorder Node -file $modelScale/$EQlevel/$RSN/$SPMdirectory/accel_35.txt -node 35838 35848 35890 35880 -dof 1 2 accel
recorder Node -file $modelScale/$EQlevel/$RSN/$SPMdirectory/accel_36.txt -node 36838 36848 36890 36880 -dof 1 2 accel

# #####Node recorders
set regionTag 1

set NW_region $regionTag
incr regionTag

set NE_region $regionTag
incr regionTag

set SW_region $regionTag
incr regionTag

set SE_region $regionTag
incr regionTag

recorder Node -file $modelScale/$EQlevel/$RSN/$ResultsDirectory/NW_disp.txt -node 880 1880 2880 3880 4880 5880 6880 7880 8880 9880 10880 11880 12880 13880 14880 15880 16880 17880 18880 19880 20880 21880 22880 23880 24880 25880 26880 27880 28880 29880 30880 31880 32880 33880 34880 35880 36880 -dof 1 2 disp
recorder Node -file $modelScale/$EQlevel/$RSN/$ResultsDirectory/NE_disp.txt -node 890 1890 2890 3890 4890 5890 6890 7890 8890 9890 10890 11890 12890 13890 14890 15890 16890 17890 18890 19890 20890 21890 22890 23890 24890 25890 26890 27890 28890 29890 30890 31890 32890 33890 34890 35890 36890 -dof 1 2 disp
recorder Node -file $modelScale/$EQlevel/$RSN/$ResultsDirectory/SW_disp.txt -node 838 1838 2838 3838 4838 5838 6838 7838 8838 9838 10838 11838 12838 13838 14838 15838 16838 17838 18838 19838 20838 21838 22838 23838 24838 25838 26838 27838 28838 29838 30838 31838 32838 33838 34838 35838 36838 -dof 1 2 disp
recorder Node -file $modelScale/$EQlevel/$RSN/$ResultsDirectory/SE_disp.txt -node 848 1848 2848 3848 4848 5848 6848 7848 8848 9848 10848 11848 12848 13848 14848 15848 16848 17848 18848 19848 20848 21848 22848 23848 24848 25848 26848 27848 28848 29848 30848 31848 32848 33848 34848 35848 36848 -dof 1 2 disp

# #####Structural Wall recorders
# Create regions (revisit if changing n_eleFloor)

set CW1_W $regionTag
incr regionTag

set CW1_E $regionTag
incr regionTag

set CW2_W $regionTag
incr regionTag

set CW2_E $regionTag
incr regionTag

set recX1 $regionTag
incr regionTag

set recX2 $regionTag
incr regionTag

set recY $regionTag
incr regionTag

recorder Element -file $modelScale/$EQlevel/$RSN/$ResultsDirectory/CW1_W_F.txt -ele 1101 2101 3101 4101 5101 6101 7101 8101 9101 10101 11101 12101 13101 14101 15101 16101 17101 18101 19101 20101 21101 22101 23101 24101 25101 26101 27101 28101 29101 30101 31101 32101 33101 34101 35101 36101 globalForce
recorder Element -file $modelScale/$EQlevel/$RSN/$ResultsDirectory/CW1_E_F.txt -ele 1201 2201 3201 4201 5201 6201 7201 8201 9201 10201 11201 12201 13201 14201 15201 16201 17201 18201 19201 20201 21201 22201 23201 24201 25201 26201 27201 28201 29201 30201 31201 32201 33201 34201 35201 36201 globalForce
recorder Element -file $modelScale/$EQlevel/$RSN/$ResultsDirectory/CW2_W_F.txt -ele 1301 2301 3301 4301 5301 6301 7301 8301 9301 10301 11301 12301 13301 14301 15301 16301 17301 18301 19301 20301 21301 22301 23301 24301 25301 26301 27301 28301 29301 30301 31301 32301 33301 34301 35301 36301 globalForce
recorder Element -file $modelScale/$EQlevel/$RSN/$ResultsDirectory/CW2_E_F.txt -ele 1401 2401 3401 4401 5401 6401 7401 8401 9401 10401 11401 12401 13401 14401 15401 16401 17401 18401 19401 20401 21401 22401 23401 24401 25401 26401 27401 28401 29401 30401 31401 32401 33401 34401 35401 36401 globalForce
recorder Element -file $modelScale/$EQlevel/$RSN/$ResultsDirectory/recX1_F.txt -ele 1501 2501 3501 4501 5501 6501 7501 8501 9501 10501 11501 globalForce
recorder Element -file $modelScale/$EQlevel/$RSN/$ResultsDirectory/recX2_F.txt -ele 1601 2601 3601 4601 5601 6601 7601 8601 9601 10601 11601 globalForce
recorder Element -file $modelScale/$EQlevel/$RSN/$ResultsDirectory/recY_F.txt  -ele 1701 2701 3701 4701 5701 6701 7701 8701 9701 10701 11701 globalForce

recorder Element -file $modelScale/$EQlevel/$RSN/$ResultsDirectory/CW1_W_D.txt -ele 1101 2101 3101 4101 5101 6101 7101 8101 9101 10101 11101 12101 13101 14101 15101 16101 17101 18101 19101 20101 21101 22101 23101 24101 25101 26101 27101 28101 29101 30101 31101 32101 33101 34101 35101 36101 section 1 deformation
recorder Element -file $modelScale/$EQlevel/$RSN/$ResultsDirectory/CW1_E_D.txt -ele 1201 2201 3201 4201 5201 6201 7201 8201 9201 10201 11201 12201 13201 14201 15201 16201 17201 18201 19201 20201 21201 22201 23201 24201 25201 26201 27201 28201 29201 30201 31201 32201 33201 34201 35201 36201 section 1 deformation
recorder Element -file $modelScale/$EQlevel/$RSN/$ResultsDirectory/CW2_W_D.txt -ele 1301 2301 3301 4301 5301 6301 7301 8301 9301 10301 11301 12301 13301 14301 15301 16301 17301 18301 19301 20301 21301 22301 23301 24301 25301 26301 27301 28301 29301 30301 31301 32301 33301 34301 35301 36301 section 1 deformation
recorder Element -file $modelScale/$EQlevel/$RSN/$ResultsDirectory/CW2_E_D.txt -ele 1401 2401 3401 4401 5401 6401 7401 8401 9401 10401 11401 12401 13401 14401 15401 16401 17401 18401 19401 20401 21401 22401 23401 24401 25401 26401 27401 28401 29401 30401 31401 32401 33401 34401 35401 36401 section 1 deformation
recorder Element -file $modelScale/$EQlevel/$RSN/$ResultsDirectory/recX1_D.txt -ele 1501 2501 3501 4501 5501 6501 7501 8501 9501 10501 11501 section 1 deformation
recorder Element -file $modelScale/$EQlevel/$RSN/$ResultsDirectory/recX2_D.txt -ele 1601 2601 3601 4601 5601 6601 7601 8601 9601 10601 11601 section 1 deformation
recorder Element -file $modelScale/$EQlevel/$RSN/$ResultsDirectory/recY_D.txt  -ele 1701 2701 3701 4701 5701 6701 7701 8701 9701 10701 11701 section 1 deformation

# #####Coupling Beam recorders
# Create regions (revisit if changing n_eleFloor)

set CB1_N $regionTag
incr regionTag

set CB1_S $regionTag
incr regionTag

set CB2_N $regionTag
incr regionTag

set CB2_S $regionTag
incr regionTag

recorder Element -file $modelScale/$EQlevel/$RSN/$ResultsDirectory/CB1_N_F.txt -ele 1111 1113 2111 2113 3111 3113 4111 4113 5111 5113 6111 6113 7111 7113 8111 8113 9111 9113 10111 10113 11111 11113 12111 12113 13111 13113 14111 14113 15111 15113 16111 16113 17111 17113 18111 18113 19111 19113 20111 20113 21111 21113 22111 22113 23111 23113 24111 24113 25111 25113 26111 26113 27111 27113 28111 28113 29111 29113 30111 30113 31111 31113 32111 32113 33111 33113 34111 34113 35111 35113 36111 36113 globalForce
recorder Element -file $modelScale/$EQlevel/$RSN/$ResultsDirectory/CB1_S_F.txt -ele 1110 1112 2110 2112 3110 3112 4110 4112 5110 5112 6110 6112 7110 7112 8110 8112 9110 9112 10110 10112 11110 11112 12110 12112 13110 13112 14110 14112 15110 15112 16110 16112 17110 17112 18110 18112 19110 19112 20110 20112 21110 21112 22110 22112 23110 23112 24110 24112 25110 25112 26110 26112 27110 27112 28110 28112 29110 29112 30110 30112 31110 31112 32110 32112 33110 33112 34110 34112 35110 35112 36110 36112 globalForce
recorder Element -file $modelScale/$EQlevel/$RSN/$ResultsDirectory/CB2_N_F.txt -ele 1311 1313 2311 2313 3311 3313 4311 4313 5311 5313 6311 6313 7311 7313 8311 8313 9311 9313 10311 10313 11311 11313 12311 12313 13311 13313 14311 14313 15311 15313 16311 16313 17311 17313 18311 18313 19311 19313 20311 20313 21311 21313 22311 22313 23311 23313 24311 24313 25311 25313 26311 26313 27311 27313 28311 28313 29311 29313 30311 30313 31311 31313 32311 32313 33311 33313 34311 34313 35311 35313 36311 36313 globalForce
recorder Element -file $modelScale/$EQlevel/$RSN/$ResultsDirectory/CB2_S_F.txt -ele 1310 1312 2310 2312 3310 3312 4310 4312 5310 5312 6310 6312 7310 7312 8310 8312 9310 9312 10310 10312 11310 11312 12310 12312 13310 13312 14310 14312 15310 15312 16310 16312 17310 17312 18310 18312 19310 19312 20310 20312 21310 21312 22310 22312 23310 23312 24310 24312 25310 25312 26310 26312 27310 27312 28310 28312 29310 29312 30310 30312 31310 31312 32310 32312 33310 33312 34310 34312 35310 35312 36310 36312 globalForce

recorder Element -file $modelScale/$EQlevel/$RSN/$ResultsDirectory/CB1_N_D.txt -ele 1111 1113 2111 2113 3111 3113 4111 4113 5111 5113 6111 6113 7111 7113 8111 8113 9111 9113 10111 10113 11111 11113 12111 12113 13111 13113 14111 14113 15111 15113 16111 16113 17111 17113 18111 18113 19111 19113 20111 20113 21111 21113 22111 22113 23111 23113 24111 24113 25111 25113 26111 26113 27111 27113 28111 28113 29111 29113 30111 30113 31111 31113 32111 32113 33111 33113 34111 34113 35111 35113 36111 36113 deformations
recorder Element -file $modelScale/$EQlevel/$RSN/$ResultsDirectory/CB1_S_D.txt -ele 1110 1112 2110 2112 3110 3112 4110 4112 5110 5112 6110 6112 7110 7112 8110 8112 9110 9112 10110 10112 11110 11112 12110 12112 13110 13112 14110 14112 15110 15112 16110 16112 17110 17112 18110 18112 19110 19112 20110 20112 21110 21112 22110 22112 23110 23112 24110 24112 25110 25112 26110 26112 27110 27112 28110 28112 29110 29112 30110 30112 31110 31112 32110 32112 33110 33112 34110 34112 35110 35112 36110 36112 deformations
recorder Element -file $modelScale/$EQlevel/$RSN/$ResultsDirectory/CB2_N_D.txt -ele 1311 1313 2311 2313 3311 3313 4311 4313 5311 5313 6311 6313 7311 7313 8311 8313 9311 9313 10311 10313 11311 11313 12311 12313 13311 13313 14311 14313 15311 15313 16311 16313 17311 17313 18311 18313 19311 19313 20311 20313 21311 21313 22311 22313 23311 23313 24311 24313 25311 25313 26311 26313 27311 27313 28311 28313 29311 29313 30311 30313 31311 31313 32311 32313 33311 33313 34311 34313 35311 35313 36311 36313 deformations
recorder Element -file $modelScale/$EQlevel/$RSN/$ResultsDirectory/CB2_S_D.txt -ele 1310 1312 2310 2312 3310 3312 4310 4312 5310 5312 6310 6312 7310 7312 8310 8312 9310 9312 10310 10312 11310 11312 12310 12312 13310 13312 14310 14312 15310 15312 16310 16312 17310 17312 18310 18312 19310 19312 20310 20312 21310 21312 22310 22312 23310 23312 24310 24312 25310 25312 26310 26312 27310 27312 28310 28312 29310 29312 30310 30312 31310 31312 32310 32312 33310 33312 34310 34312 35310 35312 36310 36312 deformations

recorder mpco $modelScale/$EQlevel/$RSN/$MPCOdirectory/MPCO -N displacement -E globalForce localForce section.fiber.stressStrain -T nsteps 20