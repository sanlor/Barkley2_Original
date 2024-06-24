/// scr_stats_statusEffectsOnStat(stat)
/* Iterates through all the status effects to apply them
   (if applicable) to the specified stat */
   
var stat = argument0;

for (i = 0; i < ds_list_size(list_status_effect); i++) {
    var map = ds_list_find_value(list_status_effect, i);
    var scr = ds_map_find_value(map, "script");
    script_execute(scr, map, id, "changestat", stat);
}

