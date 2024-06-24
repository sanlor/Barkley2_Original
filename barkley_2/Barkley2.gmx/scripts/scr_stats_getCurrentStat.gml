/// scr_stats_getCurrentStat(combatactor_id, stat)

/* Get value of base stat

arg0 - id
arg1 - stat */

var _id, stat;
_id = argument0;
stat = argument1;

var val = ds_map_find_value(_id.stats_current, stat);
if (!is_undefined(val)) {
    return val;
}
else {
    show_debug_message("Current stat could not be found: " + stat);
    return 0;
}
