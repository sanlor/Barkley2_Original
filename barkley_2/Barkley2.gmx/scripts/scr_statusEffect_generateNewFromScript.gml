/// scr_statusEffect_generateNewFromScript(script)

var conf = ds_map_create();
script_execute(argument0, conf, NULL, "generate", NULL);
return conf;
