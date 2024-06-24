/// scr_stats_getAttackStat(combatattackentity_id, stat)
/* Get value of base stat

arg0 - id
arg1 - stat */

var _id, stat;
_id = argument0;
stat = argument1;

//if (ds_exists(ds_type_map, _id.stats_attack) == 0) 
//{
//    show_debug_message("scr_stats_getAttackStat() - Attack map doesn't exist");
//    return -1;
//}

var val = ds_map_find_value(_id.stats_attack, stat);
if (!is_undefined(val)) {
    return val;
}
else {
    show_debug_message("scr_stats_getAttackStat() - Attack stat could not be found: " + stat);
    return 0;
}
