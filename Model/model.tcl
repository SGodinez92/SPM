
#              ================================
# 				  Global Coordinate System
#              ================================
#           ____________		 _____________		   ^ Y-axis
#          |  __________|=======|___________  |		   |        
#          | |                              | |		   |        
#          | |                              | |		   |          
#          | |                              | |        o-------->  X-axis
#          | | x                          x | |        
#          | |                              | |        
#          | |                              | |        
#          | |__________          __________| |        
#          |____________|========|____________|
#          

# INITIALIZATION --------------------------------------------------------------------
model BasicBuilder -ndm 3 -ndf 6;		# define the model builder, ndm=#dimension, ndf=#dofs
set analysisType "dynamic";             # Choose between static and dynamic 

set ModelDirectory "Model";
set ModelDirectorySPM "ModelSPM";
set DeflectedShapeDirectory "DeflectedShape";
set ModalAnalysisDirectory "ModalAnalysis";
set ModalAnalysisPreGravDirectory "Pre-gravity"
set ModalAnalysisPostGravDirectory "Post-gravity"
set MPCOdirectory "MPCO"
set ResultsDirectory "Results_$analysisType";
set SPMdirectory "SPM_Results"
set AccelDir "Accelerations"

file mkdir $modelScale/$EQlevel/$RSN/$ModelDirectory
file mkdir $modelScale/$EQlevel/$RSN/$ModelDirectorySPM
file mkdir $modelScale/$EQlevel/$RSN/$ModalAnalysisDirectory/$ModalAnalysisPreGravDirectory
file mkdir $modelScale/$EQlevel/$RSN/$ModalAnalysisDirectory/$ModalAnalysisPostGravDirectory
file mkdir $modelScale/$EQlevel/$RSN/$ResultsDirectory
file mkdir $modelScale/$EQlevel/$RSN/$SPMdirectory/$AccelDir

source UNITS.tcl;

# SET MODEL PARAMETERS ----------------------------------------------------------------------------------------------------------------------------------
set nBaseStory 3;							# number of basement stories
set nPodiumStory 3;							# number of podiums
set nPodiumStory2 5;						# number of stories above podium
set nTypStory 25;							# number of typical stories
set baseH [expr 10.5*$ft];					# Height of basements		
set podiumH [expr 16.0*$ft];				# Height of podiums
set offStoryH [expr 12.5*$ft];				# Height of office stories
set typStoryH [expr 9.75*$ft];				# Height of office stories

set nStory [expr {$nBaseStory + $nPodiumStory + $nPodiumStory2 + $nTypStory}];													# Total number of stories
set buildingHeight	[expr {$nBaseStory*$baseH + $nPodiumStory*$podiumH + $nPodiumStory2*$offStoryH + $nTypStory*$typStoryH}];	# Total building height
set buildingHeight [expr {$buildingHeight + $offStoryH - $typStoryH}];		# Correction for amenities height

set eleTypeWall "forceBeamColumn";   		# "forceBeamColumn" or "dispBeamColumn"                                                         
set numIntgrPts 2;							# number of integration points
set nEleFloor 1;							# number of column elements per floor (CHANGE RECORDERS ACCORDINGLY)

# Basement walls
set C_dim1 		[expr 144.0*$in];		# Dimensions of Core Wall
set C_dim2 		[expr  97.0*$in];		# Dimensions of Core Wall
set C_dim3_b	[expr 5.5*$in];			# Dimensions of Core Wall
set C_dim4_b	[expr 25.5*$in];		# Dimensions of Core Wall
set C_dim5 		[expr 278.0*$in];		# Dimensions of Core Wall
set C_dim6 		[expr  84.0*$in];		# Dimensions of Core Wall
set Centr		[expr 29.0*$in];		# Centroid of section with respect to corner of wall

# Podium walls
set C_dim3_p	[expr 9.5*$in];			# Dimensions of Core Wall
set C_dim4_p	[expr 42.5*$in];		# Dimensions of Core Wall

# Office walls
set C_dim3_o	[expr 9.5*$in];			# Dimensions of Core Wall
set C_dim4_o	[expr 25.5*$in];		# Dimensions of Core Wall

# Typical walls
set C_dim3_t	[expr 6.0*$in];			# Dimensions of Core Wall
set C_dim4_t	[expr 17.5*$in];		# Dimensions of Core Wall

# Rectangular walls
set RecW_Y1	[expr 24.*$ft];				# Total length of RecWallY-1 
set RecW_Y2	[expr 24.*$ft];				# Total length of RecWallY-2 
set RecW_X	[expr 24.*$ft];				# Total length of RecWallX 

set GravityAnalysisDone "No";
set gT "PDelta";						# Choose between Linear, PDelta, and Corotational
set pushDir "EW";						# Specify push direction, EW, or NS
set maxIters 100;
set fbtol 1e-8;
set modes 8;

set storyH {StoryHeights $baseH};
for {set i 1} {$i < $nBaseStory} {incr i 1} {
	lappend storyH $baseH; 
}

for {set i 1} {$i <= $nPodiumStory} {incr i 1} {
	lappend storyH $podiumH; 
}

for {set i 1} {$i <= [expr $nPodiumStory2 + 1]} {incr i 1} {
	lappend storyH $offStoryH; 
}

for {set i 1} {$i <= [expr $nTypStory]} {incr i 1} {
	lappend storyH $typStoryH; 
}

set Nodes {}; # This will be used to store all nodeTags created. This is useful if displacement recorders for all nodes are to be set in order to plot deflected shapes.