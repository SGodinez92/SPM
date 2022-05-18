
# ###################################################################################################################################################################################################
# ################################################################################ DYNAMIC ANALYSIS RECORDERS #######################################################################################
# ###################################################################################################################################################################################################

# #####SPM Recorders
setMaxOpenFiles 1024

for {set i 1} {$i <= $nStory} {incr i 1} {
	
	set spmTag [expr 100000 + 1000*$i]
	
	if {$i <= 3} {
	
		set spmFileLocal "stringPanel_local_$i.txt"
		set spmFileGlobal "stringPanel_strain_$i.txt"
		#set spmFileInertia "stringPanel_inertia_$i.txt"
		set spmFileFlow "stringPanel_flow_$i.txt"
		
		recorder Element -file $modelScale/$EQlevel/$RSN/$SPMdirectory/$spmFileLocal -eleRange [expr $spmTag + 1] [expr $spmTag + 83] localForce
		recorder Element -file $modelScale/$EQlevel/$RSN/$SPMdirectory/$spmFileGlobal -eleRange [expr $spmTag + 1] [expr $spmTag + 83] strain
		#recorder Element -file $modelScale/$EQlevel/$RSN/$SPMdirectory/$spmFileInertia -eleRange [expr $spmTag + 1] [expr $spmTag + 83] inertialForce
		recorder Element -file $modelScale/$EQlevel/$RSN/$SPMdirectory/$spmFileFlow -eleRange [expr $spmTag + 1] [expr $spmTag + 83] shearFlow
	
	} elseif {$i <= 11} {
	
		set spmFileLocal "stringPanel_local_$i.txt"
		set spmFileGlobal "stringPanel_strain_$i.txt"
		#set spmFileInertia "stringPanel_inertia_$i.txt"
		set spmFileFlow "stringPanel_flow_$i.txt"
		
		set spmFileDisp1 "stringPanel_dispHor_$i.txt"
		set spmFileDisp2 "stringPanel_dispVer_$i.txt"
		
		recorder Element -file $modelScale/$EQlevel/$RSN/$SPMdirectory/$spmFileLocal -eleRange [expr $spmTag + 1] [expr $spmTag + 67] localForce
		recorder Element -file $modelScale/$EQlevel/$RSN/$SPMdirectory/$spmFileGlobal -eleRange [expr $spmTag + 1] [expr $spmTag + 67] strain
		#recorder Element -file $modelScale/$EQlevel/$RSN/$SPMdirectory/$spmFileInertia -eleRange [expr $spmTag + 1] [expr $spmTag + 67] inertialForce
		recorder Element -file $modelScale/$EQlevel/$RSN/$SPMdirectory/$spmFileFlow -eleRange [expr $spmTag + 1] [expr $spmTag + 67] shearFlow
		
		#recorder Element -file $modelScale/$EQlevel/$RSN/$SPMdirectory/$spmFileDisp1 -eleRange [expr $spmTag + 25] [expr $spmTag + 27] dispPanel
		#recorder Element -file $modelScale/$EQlevel/$RSN/$SPMdirectory/$spmFileDisp2 -ele [expr $spmTag + 37] [expr $spmTag + 49] [expr $spmTag + 60] dispPanel
	
	} else {
	
		set spmFileLocal "stringPanel_local_$i.txt"
		set spmFileGlobal "stringPanel_strain_$i.txt"
		#set spmFileInertia "stringPanel_inertia_$i.txt"
		set spmFileFlow "stringPanel_flow_$i.txt"
		
		recorder Element -file $modelScale/$EQlevel/$RSN/$SPMdirectory/$spmFileLocal -eleRange [expr $spmTag + 1] [expr $spmTag + 20] localForce
		recorder Element -file $modelScale/$EQlevel/$RSN/$SPMdirectory/$spmFileGlobal -eleRange [expr $spmTag + 1] [expr $spmTag + 20] strain
		#recorder Element -file $modelScale/$EQlevel/$RSN/$SPMdirectory/$spmFileInertia -eleRange [expr $spmTag + 1] [expr $spmTag + 20] inertialForce
		recorder Element -file $modelScale/$EQlevel/$RSN/$SPMdirectory/$spmFileFlow -eleRange [expr $spmTag + 1] [expr $spmTag + 20] shearFlow
	}
	
}

recorder Node -file $modelScale/$EQlevel/$RSN/$SPMdirectory/$AccelDir/accel_1_x.txt -timeSeries $tsTag_L -node 1801 1813 1894 1882 -dof 1 accel
recorder Node -file $modelScale/$EQlevel/$RSN/$SPMdirectory/$AccelDir/accel_2_x.txt -timeSeries $tsTag_L -node 2801 2813 2894 2882 -dof 1 accel
recorder Node -file $modelScale/$EQlevel/$RSN/$SPMdirectory/$AccelDir/accel_3_x.txt -timeSeries $tsTag_L -node 3801 3813 3894 3882 -dof 1 accel
recorder Node -file $modelScale/$EQlevel/$RSN/$SPMdirectory/$AccelDir/accel_4_x.txt -timeSeries $tsTag_L -node 4825 4813 4894 4882 -dof 1 accel
recorder Node -file $modelScale/$EQlevel/$RSN/$SPMdirectory/$AccelDir/accel_5_x.txt -timeSeries $tsTag_L -node 5825 5813 5894 5882 -dof 1 accel
recorder Node -file $modelScale/$EQlevel/$RSN/$SPMdirectory/$AccelDir/accel_6_x.txt -timeSeries $tsTag_L -node 6825 6813 6894 6882 -dof 1 accel
recorder Node -file $modelScale/$EQlevel/$RSN/$SPMdirectory/$AccelDir/accel_7_x.txt -timeSeries $tsTag_L -node 7825 7813 7894 7882 -dof 1 accel
recorder Node -file $modelScale/$EQlevel/$RSN/$SPMdirectory/$AccelDir/accel_8_x.txt -timeSeries $tsTag_L -node 8825 8813 8894 8882 -dof 1 accel
recorder Node -file $modelScale/$EQlevel/$RSN/$SPMdirectory/$AccelDir/accel_9_x.txt -timeSeries $tsTag_L -node 9825 9813 9894 9882 -dof 1 accel
recorder Node -file $modelScale/$EQlevel/$RSN/$SPMdirectory/$AccelDir/accel_10_x.txt -timeSeries $tsTag_L -node 10825 10813 10894 10882 -dof 1 accel
recorder Node -file $modelScale/$EQlevel/$RSN/$SPMdirectory/$AccelDir/accel_11_x.txt -timeSeries $tsTag_L -node 11825 11813 11894 11882 -dof 1 accel
recorder Node -file $modelScale/$EQlevel/$RSN/$SPMdirectory/$AccelDir/accel_12_x.txt -timeSeries $tsTag_L -node 12843 12846 12892 12886 -dof 1 accel
recorder Node -file $modelScale/$EQlevel/$RSN/$SPMdirectory/$AccelDir/accel_13_x.txt -timeSeries $tsTag_L -node 13843 13846 13892 13886 -dof 1 accel
recorder Node -file $modelScale/$EQlevel/$RSN/$SPMdirectory/$AccelDir/accel_14_x.txt -timeSeries $tsTag_L -node 14843 14846 14892 14886 -dof 1 accel
recorder Node -file $modelScale/$EQlevel/$RSN/$SPMdirectory/$AccelDir/accel_15_x.txt -timeSeries $tsTag_L -node 15843 15846 15892 15886 -dof 1 accel
recorder Node -file $modelScale/$EQlevel/$RSN/$SPMdirectory/$AccelDir/accel_16_x.txt -timeSeries $tsTag_L -node 16843 16846 16892 16886 -dof 1 accel
recorder Node -file $modelScale/$EQlevel/$RSN/$SPMdirectory/$AccelDir/accel_17_x.txt -timeSeries $tsTag_L -node 17843 17846 17892 17886 -dof 1 accel
recorder Node -file $modelScale/$EQlevel/$RSN/$SPMdirectory/$AccelDir/accel_18_x.txt -timeSeries $tsTag_L -node 18843 18846 18892 18886 -dof 1 accel
recorder Node -file $modelScale/$EQlevel/$RSN/$SPMdirectory/$AccelDir/accel_19_x.txt -timeSeries $tsTag_L -node 19843 19846 19892 19886 -dof 1 accel
recorder Node -file $modelScale/$EQlevel/$RSN/$SPMdirectory/$AccelDir/accel_20_x.txt -timeSeries $tsTag_L -node 20843 20846 20892 20886 -dof 1 accel
recorder Node -file $modelScale/$EQlevel/$RSN/$SPMdirectory/$AccelDir/accel_21_x.txt -timeSeries $tsTag_L -node 21843 21846 21892 21886 -dof 1 accel
recorder Node -file $modelScale/$EQlevel/$RSN/$SPMdirectory/$AccelDir/accel_22_x.txt -timeSeries $tsTag_L -node 22843 22846 22892 22886 -dof 1 accel
recorder Node -file $modelScale/$EQlevel/$RSN/$SPMdirectory/$AccelDir/accel_23_x.txt -timeSeries $tsTag_L -node 23843 23846 23892 23886 -dof 1 accel
recorder Node -file $modelScale/$EQlevel/$RSN/$SPMdirectory/$AccelDir/accel_24_x.txt -timeSeries $tsTag_L -node 24843 24846 24892 24886 -dof 1 accel
recorder Node -file $modelScale/$EQlevel/$RSN/$SPMdirectory/$AccelDir/accel_25_x.txt -timeSeries $tsTag_L -node 25843 25846 25892 25886 -dof 1 accel
recorder Node -file $modelScale/$EQlevel/$RSN/$SPMdirectory/$AccelDir/accel_26_x.txt -timeSeries $tsTag_L -node 26843 26846 26892 26886 -dof 1 accel
recorder Node -file $modelScale/$EQlevel/$RSN/$SPMdirectory/$AccelDir/accel_27_x.txt -timeSeries $tsTag_L -node 27843 27846 27892 27886 -dof 1 accel
recorder Node -file $modelScale/$EQlevel/$RSN/$SPMdirectory/$AccelDir/accel_28_x.txt -timeSeries $tsTag_L -node 28843 28846 28892 28886 -dof 1 accel
recorder Node -file $modelScale/$EQlevel/$RSN/$SPMdirectory/$AccelDir/accel_29_x.txt -timeSeries $tsTag_L -node 29843 29846 29892 29886 -dof 1 accel
recorder Node -file $modelScale/$EQlevel/$RSN/$SPMdirectory/$AccelDir/accel_30_x.txt -timeSeries $tsTag_L -node 30843 30846 30892 30886 -dof 1 accel
recorder Node -file $modelScale/$EQlevel/$RSN/$SPMdirectory/$AccelDir/accel_31_x.txt -timeSeries $tsTag_L -node 31843 31846 31892 31886 -dof 1 accel
recorder Node -file $modelScale/$EQlevel/$RSN/$SPMdirectory/$AccelDir/accel_32_x.txt -timeSeries $tsTag_L -node 32843 32846 32892 32886 -dof 1 accel
recorder Node -file $modelScale/$EQlevel/$RSN/$SPMdirectory/$AccelDir/accel_33_x.txt -timeSeries $tsTag_L -node 33843 33846 33892 33886 -dof 1 accel
recorder Node -file $modelScale/$EQlevel/$RSN/$SPMdirectory/$AccelDir/accel_34_x.txt -timeSeries $tsTag_L -node 34843 34846 34892 34886 -dof 1 accel
recorder Node -file $modelScale/$EQlevel/$RSN/$SPMdirectory/$AccelDir/accel_35_x.txt -timeSeries $tsTag_L -node 35843 35846 35892 35886 -dof 1 accel
recorder Node -file $modelScale/$EQlevel/$RSN/$SPMdirectory/$AccelDir/accel_36_x.txt -timeSeries $tsTag_L -node 36843 36846 36892 36886 -dof 1 accel

recorder Node -file $modelScale/$EQlevel/$RSN/$SPMdirectory/$AccelDir/accel_1_y.txt -timeSeries $tsTag_T -node 1801 1813 1894 1882 -dof 2 accel
recorder Node -file $modelScale/$EQlevel/$RSN/$SPMdirectory/$AccelDir/accel_2_y.txt -timeSeries $tsTag_T -node 2801 2813 2894 2882 -dof 2 accel
recorder Node -file $modelScale/$EQlevel/$RSN/$SPMdirectory/$AccelDir/accel_3_y.txt -timeSeries $tsTag_T -node 3801 3813 3894 3882 -dof 2 accel
recorder Node -file $modelScale/$EQlevel/$RSN/$SPMdirectory/$AccelDir/accel_4_y.txt -timeSeries $tsTag_T -node 4825 4813 4894 4882 -dof 2 accel
recorder Node -file $modelScale/$EQlevel/$RSN/$SPMdirectory/$AccelDir/accel_5_y.txt -timeSeries $tsTag_T -node 5825 5813 5894 5882 -dof 2 accel
recorder Node -file $modelScale/$EQlevel/$RSN/$SPMdirectory/$AccelDir/accel_6_y.txt -timeSeries $tsTag_T -node 6825 6813 6894 6882 -dof 2 accel
recorder Node -file $modelScale/$EQlevel/$RSN/$SPMdirectory/$AccelDir/accel_7_y.txt -timeSeries $tsTag_T -node 7825 7813 7894 7882 -dof 2 accel
recorder Node -file $modelScale/$EQlevel/$RSN/$SPMdirectory/$AccelDir/accel_8_y.txt -timeSeries $tsTag_T -node 8825 8813 8894 8882 -dof 2 accel
recorder Node -file $modelScale/$EQlevel/$RSN/$SPMdirectory/$AccelDir/accel_9_y.txt -timeSeries $tsTag_T -node 9825 9813 9894 9882 -dof 2 accel
recorder Node -file $modelScale/$EQlevel/$RSN/$SPMdirectory/$AccelDir/accel_10_y.txt -timeSeries $tsTag_T -node 10825 10813 10894 10882 -dof 2 accel
recorder Node -file $modelScale/$EQlevel/$RSN/$SPMdirectory/$AccelDir/accel_11_y.txt -timeSeries $tsTag_T -node 11825 11813 11894 11882 -dof 2 accel
recorder Node -file $modelScale/$EQlevel/$RSN/$SPMdirectory/$AccelDir/accel_12_y.txt -timeSeries $tsTag_T -node 12843 12846 12892 12886 -dof 2 accel
recorder Node -file $modelScale/$EQlevel/$RSN/$SPMdirectory/$AccelDir/accel_13_y.txt -timeSeries $tsTag_T -node 13843 13846 13892 13886 -dof 2 accel
recorder Node -file $modelScale/$EQlevel/$RSN/$SPMdirectory/$AccelDir/accel_14_y.txt -timeSeries $tsTag_T -node 14843 14846 14892 14886 -dof 2 accel
recorder Node -file $modelScale/$EQlevel/$RSN/$SPMdirectory/$AccelDir/accel_15_y.txt -timeSeries $tsTag_T -node 15843 15846 15892 15886 -dof 2 accel
recorder Node -file $modelScale/$EQlevel/$RSN/$SPMdirectory/$AccelDir/accel_16_y.txt -timeSeries $tsTag_T -node 16843 16846 16892 16886 -dof 2 accel
recorder Node -file $modelScale/$EQlevel/$RSN/$SPMdirectory/$AccelDir/accel_17_y.txt -timeSeries $tsTag_T -node 17843 17846 17892 17886 -dof 2 accel
recorder Node -file $modelScale/$EQlevel/$RSN/$SPMdirectory/$AccelDir/accel_18_y.txt -timeSeries $tsTag_T -node 18843 18846 18892 18886 -dof 2 accel
recorder Node -file $modelScale/$EQlevel/$RSN/$SPMdirectory/$AccelDir/accel_19_y.txt -timeSeries $tsTag_T -node 19843 19846 19892 19886 -dof 2 accel
recorder Node -file $modelScale/$EQlevel/$RSN/$SPMdirectory/$AccelDir/accel_20_y.txt -timeSeries $tsTag_T -node 20843 20846 20892 20886 -dof 2 accel
recorder Node -file $modelScale/$EQlevel/$RSN/$SPMdirectory/$AccelDir/accel_21_y.txt -timeSeries $tsTag_T -node 21843 21846 21892 21886 -dof 2 accel
recorder Node -file $modelScale/$EQlevel/$RSN/$SPMdirectory/$AccelDir/accel_22_y.txt -timeSeries $tsTag_T -node 22843 22846 22892 22886 -dof 2 accel
recorder Node -file $modelScale/$EQlevel/$RSN/$SPMdirectory/$AccelDir/accel_23_y.txt -timeSeries $tsTag_T -node 23843 23846 23892 23886 -dof 2 accel
recorder Node -file $modelScale/$EQlevel/$RSN/$SPMdirectory/$AccelDir/accel_24_y.txt -timeSeries $tsTag_T -node 24843 24846 24892 24886 -dof 2 accel
recorder Node -file $modelScale/$EQlevel/$RSN/$SPMdirectory/$AccelDir/accel_25_y.txt -timeSeries $tsTag_T -node 25843 25846 25892 25886 -dof 2 accel
recorder Node -file $modelScale/$EQlevel/$RSN/$SPMdirectory/$AccelDir/accel_26_y.txt -timeSeries $tsTag_T -node 26843 26846 26892 26886 -dof 2 accel
recorder Node -file $modelScale/$EQlevel/$RSN/$SPMdirectory/$AccelDir/accel_27_y.txt -timeSeries $tsTag_T -node 27843 27846 27892 27886 -dof 2 accel
recorder Node -file $modelScale/$EQlevel/$RSN/$SPMdirectory/$AccelDir/accel_28_y.txt -timeSeries $tsTag_T -node 28843 28846 28892 28886 -dof 2 accel
recorder Node -file $modelScale/$EQlevel/$RSN/$SPMdirectory/$AccelDir/accel_29_y.txt -timeSeries $tsTag_T -node 29843 29846 29892 29886 -dof 2 accel
recorder Node -file $modelScale/$EQlevel/$RSN/$SPMdirectory/$AccelDir/accel_30_y.txt -timeSeries $tsTag_T -node 30843 30846 30892 30886 -dof 2 accel
recorder Node -file $modelScale/$EQlevel/$RSN/$SPMdirectory/$AccelDir/accel_31_y.txt -timeSeries $tsTag_T -node 31843 31846 31892 31886 -dof 2 accel
recorder Node -file $modelScale/$EQlevel/$RSN/$SPMdirectory/$AccelDir/accel_32_y.txt -timeSeries $tsTag_T -node 32843 32846 32892 32886 -dof 2 accel
recorder Node -file $modelScale/$EQlevel/$RSN/$SPMdirectory/$AccelDir/accel_33_y.txt -timeSeries $tsTag_T -node 33843 33846 33892 33886 -dof 2 accel
recorder Node -file $modelScale/$EQlevel/$RSN/$SPMdirectory/$AccelDir/accel_34_y.txt -timeSeries $tsTag_T -node 34843 34846 34892 34886 -dof 2 accel
recorder Node -file $modelScale/$EQlevel/$RSN/$SPMdirectory/$AccelDir/accel_35_y.txt -timeSeries $tsTag_T -node 35843 35846 35892 35886 -dof 2 accel
recorder Node -file $modelScale/$EQlevel/$RSN/$SPMdirectory/$AccelDir/accel_36_y.txt -timeSeries $tsTag_T -node 36843 36846 36892 36886 -dof 2 accel


# #####Node recorders
recorder Node -file $modelScale/$EQlevel/$RSN/$ResultsDirectory/NW_disp.txt -node 886 1886 2886 3886 4886 5886 6886 7886 8886 9886 10886 11886 12886 13886 14886 15886 16886 17886 18886 19886 20886 21886 22886 23886 24886 25886 26886 27886 28886 29886 30886 31886 32886 33886 34886 35886 36886 -dof 1 2 disp
recorder Node -file $modelScale/$EQlevel/$RSN/$ResultsDirectory/NE_disp.txt -node 892 1892 2892 3892 4892 5892 6892 7892 8892 9892 10892 11892 12892 13892 14892 15892 16892 17892 18892 19892 20892 21892 22892 23892 24892 25892 26892 27892 28892 29892 30892 31892 32892 33892 34892 35892 36892 -dof 1 2 disp
recorder Node -file $modelScale/$EQlevel/$RSN/$ResultsDirectory/SW_disp.txt -node 843 1843 2843 3843 4843 5843 6843 7843 8843 9843 10843 11843 12843 13843 14843 15843 16843 17843 18843 19843 20843 21843 22843 23843 24843 25843 26843 27843 28843 29843 30843 31843 32843 33843 34843 35843 36843 -dof 1 2 disp
recorder Node -file $modelScale/$EQlevel/$RSN/$ResultsDirectory/SE_disp.txt -node 846 1846 2846 3846 4846 5846 6846 7846 8846 9846 10846 11846 12846 13846 14846 15846 16846 17846 18846 19846 20846 21846 22846 23846 24846 25846 26846 27846 28846 29846 30846 31846 32846 33846 34846 35846 36846 -dof 1 2 disp

# #####Structural Wall recorders
recorder Element -file $modelScale/$EQlevel/$RSN/$ResultsDirectory/CW1_W_F.txt -ele 1101 2101 3101 4101 5101 6101 7101 8101 9101 10101 11101 12101 13101 14101 15101 16101 17101 18101 19101 20101 21101 22101 23101 24101 25101 26101 27101 28101 29101 30101 31101 32101 33101 34101 35101 36101 globalForce
recorder Element -file $modelScale/$EQlevel/$RSN/$ResultsDirectory/CW1_E_F.txt -ele 1201 2201 3201 4201 5201 6201 7201 8201 9201 10201 11201 12201 13201 14201 15201 16201 17201 18201 19201 20201 21201 22201 23201 24201 25201 26201 27201 28201 29201 30201 31201 32201 33201 34201 35201 36201 globalForce
recorder Element -file $modelScale/$EQlevel/$RSN/$ResultsDirectory/recX_F.txt  -ele 1301 2301 3301 4301 5301 6301 7301 8301 9301 10301 11301 globalForce
recorder Element -file $modelScale/$EQlevel/$RSN/$ResultsDirectory/recY1_F.txt -ele 1401 2401 3401 4401 5401 6401 7401 8401 9401 10401 11401 globalForce
recorder Element -file $modelScale/$EQlevel/$RSN/$ResultsDirectory/recY2_F.txt -ele 1501 2501 3501 4501 5501 6501 7501 8501 9501 10501 11501 globalForce

recorder Element -file $modelScale/$EQlevel/$RSN/$ResultsDirectory/CW1_W_D.txt -ele 1101 2101 3101 4101 5101 6101 7101 8101 9101 10101 11101 12101 13101 14101 15101 16101 17101 18101 19101 20101 21101 22101 23101 24101 25101 26101 27101 28101 29101 30101 31101 32101 33101 34101 35101 36101 section 1 deformation
recorder Element -file $modelScale/$EQlevel/$RSN/$ResultsDirectory/CW1_E_D.txt -ele 1201 2201 3201 4201 5201 6201 7201 8201 9201 10201 11201 12201 13201 14201 15201 16201 17201 18201 19201 20201 21201 22201 23201 24201 25201 26201 27201 28201 29201 30201 31201 32201 33201 34201 35201 36201 section 1 deformation
recorder Element -file $modelScale/$EQlevel/$RSN/$ResultsDirectory/recX_D.txt  -ele 1301 2301 3301 4301 5301 6301 7301 8301 9301 10301 11301 section 1 deformation
recorder Element -file $modelScale/$EQlevel/$RSN/$ResultsDirectory/recY1_D.txt -ele 1401 2401 3401 4401 5401 6401 7401 8401 9401 10401 11401 section 1 deformation
recorder Element -file $modelScale/$EQlevel/$RSN/$ResultsDirectory/recY2_D.txt -ele 1501 2501 3501 4501 5501 6501 7501 8501 9501 10501 11501 section 1 deformation

# Displacement
recorder Node -file $modelScale/$EQlevel/$RSN/$ResultsDirectory/CW1_W_disp.txt -node 1100 1101 2101 3101 4101 5101 6101 7101 8101 9101 10101 11101 12101 13101 14101 15101 16101 17101 18101 19101 20101 21101 22101 23101 24101 25101 26101 27101 28101 29101 30101 31101 32101 33101 34101 35101 36101 -dof 1 2 disp
recorder Node -file $modelScale/$EQlevel/$RSN/$ResultsDirectory/CW1_E_disp.txt -node 1200 1201 2201 3201 4201 5201 6201 7201 8201 9201 10201 11201 12201 13201 14201 15201 16201 17201 18201 19201 20201 21201 22201 23201 24201 25201 26201 27201 28201 29201 30201 31201 32201 33201 34201 35201 36201 -dof 1 2 disp


# #####Coupling Beam recorders
# Create regions (revisit if changing n_eleFloor)
recorder Element -file $modelScale/$EQlevel/$RSN/$ResultsDirectory/CB1_N_F.txt -ele 1111 1113 2111 2113 3111 3113 4111 4113 5111 5113 6111 6113 7111 7113 8111 8113 9111 9113 10111 10113 11111 11113 12111 12113 13111 13113 14111 14113 15111 15113 16111 16113 17111 17113 18111 18113 19111 19113 20111 20113 21111 21113 22111 22113 23111 23113 24111 24113 25111 25113 26111 26113 27111 27113 28111 28113 29111 29113 30111 30113 31111 31113 32111 32113 33111 33113 34111 34113 35111 35113 36111 36113 globalForce
recorder Element -file $modelScale/$EQlevel/$RSN/$ResultsDirectory/CB1_S_F.txt -ele 1110 1112 2110 2112 3110 3112 4110 4112 5110 5112 6110 6112 7110 7112 8110 8112 9110 9112 10110 10112 11110 11112 12110 12112 13110 13112 14110 14112 15110 15112 16110 16112 17110 17112 18110 18112 19110 19112 20110 20112 21110 21112 22110 22112 23110 23112 24110 24112 25110 25112 26110 26112 27110 27112 28110 28112 29110 29112 30110 30112 31110 31112 32110 32112 33110 33112 34110 34112 35110 35112 36110 36112 globalForce

recorder Element -file $modelScale/$EQlevel/$RSN/$ResultsDirectory/CB1_N_D.txt -ele 1111 1113 2111 2113 3111 3113 4111 4113 5111 5113 6111 6113 7111 7113 8111 8113 9111 9113 10111 10113 11111 11113 12111 12113 13111 13113 14111 14113 15111 15113 16111 16113 17111 17113 18111 18113 19111 19113 20111 20113 21111 21113 22111 22113 23111 23113 24111 24113 25111 25113 26111 26113 27111 27113 28111 28113 29111 29113 30111 30113 31111 31113 32111 32113 33111 33113 34111 34113 35111 35113 36111 36113 deformations
recorder Element -file $modelScale/$EQlevel/$RSN/$ResultsDirectory/CB1_S_D.txt -ele 1110 1112 2110 2112 3110 3112 4110 4112 5110 5112 6110 6112 7110 7112 8110 8112 9110 9112 10110 10112 11110 11112 12110 12112 13110 13112 14110 14112 15110 15112 16110 16112 17110 17112 18110 18112 19110 19112 20110 20112 21110 21112 22110 22112 23110 23112 24110 24112 25110 25112 26110 26112 27110 27112 28110 28112 29110 29112 30110 30112 31110 31112 32110 32112 33110 33112 34110 34112 35110 35112 36110 36112 deformations

#recorder mpco $modelScale/$EQlevel/$RSN/$MPCOdirectory/MPCO -N displacement rotation reactionForce reactionMoment -E globalForce localForce force section.fiber.stressStrain section.force section.deformation
#recorder mpco $modelScale/$EQlevel/$RSN/$MPCOdirectory/MPCO -N displacement -E globalForce localForce section.fiber.stressStrain -T nsteps 20