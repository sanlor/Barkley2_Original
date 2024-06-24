//WIP SCRIPT NOT DOING ANYTHING OF THE SORT

var conf, script;
script = argument0;
conf = script_execute(script, "config");
ds_map_add(conf, "script", script);
ds_list_add(AI_states_active, conf);
return conf;
