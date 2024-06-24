/// scr_stats_rollBaseStats(diceSize,minGuts,minLuck,minAcro,minMight,minPiety)

/* This script rolls the base stats and resets level to 1 */

// Swapping these to G-L-A-M-P to save myself some confusion - Bhroom
var diceSize =  argument0;
var statGuts = argument1;
var statLuck =  argument2;
var statAgile = argument3;
var statMight =  argument4;
var statPiety = argument5;

// Reset level
scr_stats_setBaseStat(self, STAT_BASE_LEVEL, 1);

// Roll stats!
scr_stats_setBaseStat(self, STAT_BASE_MIGHT, statMight + irandom(diceSize));
scr_stats_setBaseStat(self, STAT_BASE_GUTS,  statGuts  + irandom(diceSize));
scr_stats_setBaseStat(self, STAT_BASE_AGILE, statAgile + irandom(diceSize));
scr_stats_setBaseStat(self, STAT_BASE_LUCK,  statLuck  + irandom(diceSize));
scr_stats_setBaseStat(self, STAT_BASE_PIETY, statPiety + irandom(diceSize));
