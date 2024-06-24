/// scr_quest_get_state(variable)
var val = ds_map_find_value(global.qstVar, argument0);
if (is_undefined(val)) return 0;
else return val;
