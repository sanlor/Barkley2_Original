/// statusHelper_statMultiply(actor, resist, multiplier)
var mul = argument2 - 1;
var gul = 1 - argument2;
if (argument2 > 1)
{
    scr_stats_setEffectiveStat(argument0, argument1, 
        scr_stats_getEffectiveStat(argument0, argument1) + abs(scr_stats_getEffectiveStat(argument0, argument1) * mul));
}
else
{
    scr_stats_setEffectiveStat(argument0, argument1, 
        scr_stats_getEffectiveStat(argument0, argument1) - abs(scr_stats_getEffectiveStat(argument0, argument1) * gul));
}
