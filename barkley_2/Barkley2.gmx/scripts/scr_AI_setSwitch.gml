/// scr_AI_setSwitch(switchScript)

var script = argument0;

if (AI_switch != NULL) {
    script_execute(AI_switchScript, "destroy", AI_switch);
    ds_map_destroy(AI_switch);
    AI_switch = NULL;
}

var conf = script_execute(script, "config");
ds_map_add(conf, "script", script);

AI_switch = conf;
AI_switchScript = script;

return conf;
