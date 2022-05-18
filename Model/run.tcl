# ##############################################################################################
# 						       STRINGER-PANEL METHOD RESEARCH                                  #
# ##############################################################################################

# Don't forget to
wipe;

set tStart [clock seconds]

# DEFINE MODEL ----------------------------------------------------------------------
set modelScale "NoPT_100%tensile_inc50";			# Folder name to save all data
set RSN 1605;						# RSN of ground motion

set EQlevel "MCEr";					# MCEr or SLE

if {$EQlevel != "MCEr" && $EQlevel != "SLE"} {
	
	puts "Choose either MCEr or SLE"
	end

}


set PT "No";		# "Yes" or "No" to include or not include PT forces

source model.tcl;
source routinesSPM.tcl

 #ANALYSIS --------------------------------------------------------------------------
if {$analysisType == "static"} {

    source loadControlStaticAnalysis.tcl;
    source dispControlStaticAnalysis.tcl;
	
} elseif {$analysisType == "dynamic"} {
    
	#source modalAnalysis.tcl
	source loadControlStaticAnalysis.tcl;
    source modalAnalysis.tcl
	
    source timeHistoryAnalysis.tcl;
}

puts "A N A L Y S I S   C O M P L E T E" 
set tFinish [clock seconds]
set analysisDuration [expr {$tFinish - $tStart}]
puts "analysis duration: $analysisDuration sec"
#puts "Press enter to exit..."
#set end [gets stdin line]

# Don't forget to
wipe;