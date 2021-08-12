# ##############################################################################################
# 						       STRINGER-PANEL METHOD RESEARCH                                  #
#						                Spring 2021                                            #
# ##############################################################################################

# Don't forget to
wipe;

# DEFINE MODEL ----------------------------------------------------------------------
set RSN 6927;						# RSN of ground motion

set EQlevel "MCEr";					# MCEr or SLE

if {$EQlevel != "MCEr" && $EQlevel != "SLE"} {
	
	puts "Choose either MCEr or SLE"
	end

}

source model.tcl;
source routines.tcl

# ANALYSIS --------------------------------------------------------------------------
if {$analysisType == "static"} {

    source loadControlStaticAnalysis.tcl;
    source dispControlStaticAnalysis.tcl;
	
} elseif {$analysisType == "dynamic"} {
    
	source modalAnalysis.tcl
    source loadControlStaticAnalysis.tcl;
    source modalAnalysis.tcl
	
    source timeHistoryAnalysis.tcl;
}

# Don't forget to
wipe;