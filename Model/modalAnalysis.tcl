
# ##############################################################################################################################
# ###################################################### MODAL ANALYSIS ########################################################
# ##############################################################################################################################

set omega {};
set F {};
set T {};
set lambda [eigen $modes];

foreach lam $lambda {
	lappend omega [expr sqrt($lam)];
	lappend F [expr sqrt($lam)/(2.*$pi)];
	lappend T [expr (2.0*$pi)/sqrt($lam)];
}

# ##########################################################################################################
# ####################################### SAVE TIME PERIODS ################################################
# ##########################################################################################################

if {$GravityAnalysisDone == "No" || $GravityAnalysisDone == "no"} {
	set PeriodFile [open "$modelScale/$EQlevel/$RSN/$ModalAnalysisDirectory/$ModalAnalysisPreGravDirectory/periods.txt" "w"];
	puts $PeriodFile "$T";
} else {
	set PeriodFile [open "$modelScale/$EQlevel/$RSN/$ModalAnalysisDirectory/$ModalAnalysisPostGravDirectory/periods.txt" "w"];
	puts $PeriodFile "$T";
}
close $PeriodFile;

# ###########################################################################################################

for {set iMode 1} {$iMode <= $modes} {incr iMode} {

	if {$GravityAnalysisDone == "No" || $GravityAnalysisDone == "no"} {
		set modeFile [open "$modelScale/$EQlevel/$RSN/$ModalAnalysisDirectory/$ModalAnalysisPreGravDirectory/modeShape_$iMode.txt" "w"];
	} else {
		set modeFile [open "$modelScale/$EQlevel/$RSN/$ModalAnalysisDirectory/$ModalAnalysisPostGravDirectory/modeShape_$iMode.txt" "w"];	
	}
    
	for {set i 1} {$i <= [llength $Nodes]} {incr i} {
		puts $modeFile "[lindex $Nodes [expr $i - 1]] [nodeEigenvector [lindex $Nodes [expr $i - 1]] $iMode]";
	}
	close $modeFile;
}

puts "----------------------"
puts "Modal Analysis Results"
puts "----------------------"
for {set i 1} {$i <= $modes} {incr i 1} {
	puts "T$i = [lindex $T [expr $i-1]]";
}


# Following code obtained from https://asdeasoft.net/forum/viewtopic.php?t=1513
if {0} {
# begin
	puts "\nRunning modal analyis ..."
	
	# get all node tags
	set nodes [getNodeTags]
	if {[llength $nodes] == 0} {
		error "modal - Error: no node in model"
	}
	
	# check problem size (2D or 3D) from the first node, we do not support mixed dimesions!!
	set ndm [llength [nodeCoord [lindex $nodes 0]]]
	
	# compute total masses
	if {$ndm == 3} { 
		set ndf_max 6 
		set total_mass {0.0 0.0 0.0 0.0 0.0 0.0}
		set mass_labels {"MX" "MY" "MZ" "MRX" "MRY" "MRZ"}
		set mass_labels1 {"MODE" "MX" "MY" "MZ" "MRX" "MRY" "MRZ"}
	} else {
		set ndf_max 3
		set total_mass {0.0 0.0 0.0}
		set mass_labels {"MX" "MY" "MRZ"}
		set mass_labels1 {"MODE" "MX" "MY" "MRZ"}
	}
	foreach node $nodes {
		set indf [llength [nodeDisp $node]]
		for {set i 0} {$i < $indf} {incr i} {
			set imass [nodeMass $node [expr $i+1]]
			set imass_total [lindex $total_mass $i]
			lset total_mass $i [expr $imass_total + $imass]
		}
	}
	
	# some constants
	set pi [expr acos(-1.0)]
	
	set eig_solver -genBandArpack
	
	# solve the eigenvalue problem
	set lambdas [eigen $eig_solver $modes]
	if {[llength $lambdas] != $modes} {
		error "modal - Error: something went wrong in the eigen analysis"
	}
	
	# results for each mode
	set mode_data [lrepeat $modes [lrepeat 4 0.0]]
	set mode_MPM [lrepeat $modes [lrepeat $ndf_max 0.0]]
	
	# process each mode of vibration
	for {set imode 0} {$imode < $modes} {incr imode} {
		
		# compute i-mode data
		set lambda [lindex $lambdas $imode]
		set omega [expr {sqrt($lambda)}]
		set frequency [expr $omega / 2.0 / $pi]
		set period [expr 1.0 / $frequency]
		lset mode_data $imode [list $lambda $omega $frequency $period]
		
		# M = mass matrix
		# V = eigen vector matrix
		# gm = V'* M * V = generalized mass matrix
		# R = influence vector
		# L = V' * M * R = coefficient vector
		# MPMi = L(i)^2 / gm(i,i) / total_mass * 100.0 = modal participation mass ratio (%)
		
		# compute L and gm
		set L [lrepeat $ndf_max 0.0]
		set gm 0.0
		foreach node $nodes {
			# get eigenvector
			set V [nodeEigenvector $node [expr $imode+1]]
			set indf [llength [nodeDisp $node]]
			# for each dof
			for {set i 0} {$i < $indf} {incr i} {
				set Mi [nodeMass $node [expr $i+1]]
				set Vi [lindex $V $i]
				set Li [expr $Mi * $Vi]
				set gm [expr $gm + $Vi * $Vi * $Mi]
				lset L $i [expr [lindex $L $i]+ $Li]
			}
		}
		
		# compute MPM
		set MPM [lrepeat $ndf_max 0.0]
		for {set i 0} {$i < $ndf_max} {incr i} {
			set Li [lindex $L $i]
			set TMi [lindex $total_mass $i]
			set MPMi [expr $Li * $Li]
			if {$gm > 0.0} {set MPMi [expr $MPMi / $gm]}
			if {$TMi > 0.0} {set MPMi [expr $MPMi / $TMi * 100.0]}
			lset MPM $i $MPMi
		}
		lset mode_MPM $imode $MPM
	}
	
	# print results to both stdout and file
	proc multiputs {args} {
		if { [llength $args] == 0 } {
			error "Usage: multiputs ?channel ...? string"
		} elseif { [llength $args] == 1 } {
			set channels stdout
		} else {
			set channels [lrange $args 0 end-1]
		}
		set str [lindex $args end]
		foreach ch $channels {
			puts $ch $str
		}
	}
	
	# open file for output
	
	set filename "$modelScale/$EQlevel/$RSN/$ModelDirectory/modalAnalysis.txt"
	
	set fp [open $filename w]
	
	multiputs stdout $fp "MODAL ANALYSIS REPORT"
	multiputs stdout $fp "\nPROBELM SIZE IS ${ndm}D"
	
	# print mode data
	multiputs stdout $fp "\nEIGENVALUE ANALYSIS"
	set format_string [string repeat "%16s" 5]
	set format_double [string repeat "%16g" 5]
	multiputs stdout $fp [format $format_string "MODE" "LAMBDA" "OMEGA" "FREQUENCY" "PERIOD"]
	for {set i 0} {$i < $modes} {incr i} {
		multiputs stdout $fp [format $format_double [expr $i+1] {*}[lindex $mode_data $i]]
	}
	
	multiputs stdout $fp "\nTOTAL MASS OF THE STRUCTURE"
	set format_string [string repeat "%16s" $ndf_max]
	set format_double [string repeat "%16g" $ndf_max]
	multiputs stdout $fp [format $format_string {*}$mass_labels]
	multiputs stdout $fp [format $format_double {*}$total_mass]
	
	# print modal participation masses ratio
	multiputs stdout $fp "\nMODAL PARTICIPATION MASSES (%)"
	set format_string [string repeat "%16s" [expr $ndf_max+1]]
	set format_double [string repeat "%16g" [expr $ndf_max+1]]
	multiputs stdout $fp [format $format_string {*}$mass_labels1]
	for {set i 0} {$i < $modes} {incr i} {
		multiputs stdout $fp [format $format_double [expr $i+1] {*}[lindex $mode_MPM $i]]
	}
	
	# print modal participation masses ratio
	multiputs stdout $fp "\nCUMULATIVE MODAL PARTICIPATION MASSES (%)"
	set format_string [string repeat "%16s" [expr $ndf_max+1]]
	set format_double [string repeat "%16g" [expr $ndf_max+1]]
	multiputs stdout $fp [format $format_string {*}$mass_labels1]
	set MPMsum [lrepeat $ndf_max 0.0]
	for {set i 0} {$i < $modes} {incr i} {
		set MPMi [lindex $mode_MPM $i]
		for {set j 0} {$j < $ndf_max} {incr j} {
			lset MPMsum $j [expr [lindex $MPMsum $j] + [lindex $MPMi $j]]
		}
		multiputs stdout $fp [format $format_double [expr $i+1] {*}$MPMsum]
	}
	
	# done
	close $fp
	puts "\nModal Analysis done\n"
}