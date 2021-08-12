
#              ================================

# GEOMETRY/MATERIAL/SECTIONS --------------------------------------------------------------------------
set ModelFile [open "$modelScale/$EQlevel/$RSN/$ModelDirectory/modelData.txt" "w"];

source "INPUT_nodes_cw.tcl" 
puts "NODES CORE WALLS OK"

source "INPUT_nodes_recWall.tcl"
puts "NODES REC WALLS OK"

source "INPUT_nodes_col.tcl"
puts "NODES COLS OK"

source "INPUT_mat.tcl"
puts "MATERIALS OK"

source "INPUT_sec.tcl"
puts "SECTIONS OK"

source "INPUT_sec_spm.tcl"
puts "SECTIONS STRINGERS OK"

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

source "INPUT_spm.tcl"
puts "STRINGER-PANEL OK"

close $ModelFile

if {$analysisType == "dynamic"} {
    source "INPUT_mass.tcl"
    puts "MASS OK"
}