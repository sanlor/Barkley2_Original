/* Sets the state that will be triggered when the unit
   is staggered (default is NULL) */

var script = argument0;

if (AI_globalState_stagger != NULL) {
    ds_map_destroy(AI_globalState_stagger);
    AI_globalState_stagger = NULL;
}

var conf = script_execute(script, "config");
ds_map_add(conf, "script", script);

AI_globalState_stagger = conf;

return conf;
   
