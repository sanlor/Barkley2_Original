///scr_statusEffect_generateBasicInfo(configMap,statusFxId,defaultTimer)

/* Generate basic info for a status effect, into the given map.

arg0 - Map to populate with info
arg1 - Status effect script
arg2 - Timer
arg3 - Icon sprite */

var map = argument0;
var scr = argument1;
var timer = argument2;
//var icon = argument3; // Deprecated

ds_map_add(map, "script", scr);
ds_map_add(map, "timer", timer);

return map;
