/// scr_AI_movement_init(movementScript)
var conf = script_execute(argument0, "init", NULL, NULL, NULL);
conf[? "script"] = argument0;
ds_list_add(AI_movement_scripts, conf);

scr_AI_movement_reset(conf);

return conf;
