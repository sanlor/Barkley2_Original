/// scr_stats_stagger_timeForHardness(stagger_hardness)

var hardness = argument0;

if hardness == STAGGER_HARDNESS_SOFT return global.settingStaggerSoft * 10;
else if hardness == STAGGER_HARDNESS_MEDIUM return global.settingStaggerMedium * 10;
else if hardness == STAGGER_HARDNESS_HARD return global.settingStaggerHard * 10;
else show_error("Invalid stagger hardness value: " + string(hardness), true);
    
