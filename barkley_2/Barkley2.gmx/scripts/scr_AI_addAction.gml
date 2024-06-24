var conf, script;
script = argument0;
conf = script_execute(script, "config");
ds_map_add(conf, "script", script);
ds_list_add(AI_actions, conf);
return conf;
