/// statusHelper_glampMultiply(actor, resist, multiplier)
var mul = argument2;
scr_stats_setEffectiveStat(argument0, argument1, scr_stats_getEffectiveStat(argument0, argument1) * mul);
