/// scr_stats_levelUp(levelCount,ratioMight,ratioGuts,ratioAcro,ratioLuck,ratioPiety)
/* This script will level up a CombatActor by increasing his level and base stats. */

// How many levels to increase with (6 points per level)
var lvlup_levels = argument0;

// How many percentage of points will end up in each category (The rest are distributed randomly)
var lvlup_might = argument1;
var lvlup_guts = argument2;
var lvlup_agile = argument3;
var lvlup_luck = argument4;
var lvlup_piety = argument5;



var pointsTotal = lvlup_levels * 6;
var pointsLeft = pointsTotal;

var pointsAdd;

// Increase LEVEL
scr_stats_setBaseStat(self, STAT_BASE_LEVEL, scr_stats_getBaseStat(self, STAT_BASE_LEVEL) + lvlup_levels);

// MIGHT
pointsAdd = floor(pointsTotal * lvlup_might);
scr_stats_setBaseStat(self, STAT_BASE_MIGHT, scr_stats_getBaseStat(self, STAT_BASE_MIGHT) + pointsAdd);
pointsLeft -= pointsAdd;

// GUTS
pointsAdd = floor(pointsTotal * lvlup_guts);
scr_stats_setBaseStat(self, STAT_BASE_GUTS, scr_stats_getBaseStat(self, STAT_BASE_GUTS) + pointsAdd);
pointsLeft -= pointsAdd;

// AGILE
pointsAdd = floor(pointsTotal * lvlup_agile);
scr_stats_setBaseStat(self, STAT_BASE_AGILE, scr_stats_getBaseStat(self, STAT_BASE_AGILE) + pointsAdd);
pointsLeft -= pointsAdd;

// LUCK
pointsAdd = floor(pointsTotal * lvlup_luck);
scr_stats_setBaseStat(self, STAT_BASE_LUCK, scr_stats_getBaseStat(self, STAT_BASE_LUCK) + pointsAdd);
pointsLeft -= pointsAdd;

// PIETY
pointsAdd = floor(pointsTotal * lvlup_piety);
scr_stats_setBaseStat(self, STAT_BASE_PIETY, scr_stats_getBaseStat(self, STAT_BASE_PIETY) + pointsAdd);
pointsLeft -= pointsAdd;

// Distribute rest randomly
while (pointsLeft > 0) {
    var stat = choose(STAT_BASE_MIGHT, STAT_BASE_GUTS, STAT_BASE_AGILE, STAT_BASE_LUCK, STAT_BASE_PIETY);
    scr_stats_setBaseStat(self, stat, scr_stats_getBaseStat(self, stat) + 1);
    pointsLeft--;
}

// Reset current and effective stats to take new stats into account
scr_stats_genEffectiveStats();
scr_stats_resetCurrentStats();
