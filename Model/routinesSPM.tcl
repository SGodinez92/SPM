
#              ================================

# GEOMETRY/MATERIAL/SECTIONS --------------------------------------------------------------------------
set ModelFile [open "$modelScale/$EQlevel/$RSN/$ModelDirectory/modelData.txt" "w"];
set ModelFileSPM [open "$modelScale/$EQlevel/$RSN/$ModelDirectory/modelDataSPM.txt" "w"];

source "INPUT_nodes_cw.tcl" 
puts "NODES CORE WALLS OK"

source "INPUT_nodes_recWall.tcl"
puts "NODES REC WALLS OK"

source "INPUT_nodes_col.tcl"
puts "NODES COLS OK"

source "INPUT_mat.tcl"
puts "MATERIALS OK"

source "INPUT_sec_updated.tcl"
puts "SECTIONS OK"

if {$PT == "Yes"} {

source "INPUT_sec_spm_PT.tcl"
puts "SECTIONS STRINGERS WITH PT OK"

} elseif {$PT == "No"} {

source "INPUT_sec_spm_NoPT.tcl"
puts "SECTIONS STRINGERS NO PT OK"

} else {

puts "PT must be Yes or No"
end

}

# GEOMETRIC TRANSFORMATIONS --------------------------------------------------------------------------
source "TRANSF.tcl"
puts "TRANSFORMATIONS OK"

# ELEMENTS --------------------------------------------------------------------------
source "INPUT_elem_cw.tcl"
puts "ELEMENTS CORE WALLS OK"

source "INPUT_elem_recw.tcl"
puts "ELEMENTS REC WALLS OK"

source "INPUT_elem_cols.tcl"
puts "ELEMENTS COLS OK"

source "INPUT_elem_retwalls.tcl"
puts "ELEMENTS RETAINING WALLS OK"

if {$PT == "Yes"} {

source "INPUT_spm_PT.tcl"
#source "INPUT_spm_elastic.tcl"
puts "STRINGER-PANEL WITH PT OK"

} elseif {$PT == "No"} {

source "INPUT_spm_NoPT.tcl"
#source "INPUT_spm_elastic.tcl"
puts "STRINGER-PANEL WITH NO PT OK"

} else {

puts "PT must be Yes or No"
end

}


close $ModelFile

if {$analysisType == "dynamic"} {
    source "INPUT_mass.tcl"
    puts "MASS OK"
}