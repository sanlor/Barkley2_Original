var conf, script;
script = argument0;

// Create script config
conf = script_execute(script, "config");
conf[? "script"] = script;

// Initialize switch-conditional variables.
conf[? "switchAddMaxDist"] = 100000;    // Max distance from target at which to add state
conf[? "switchAddMinDist"] = 0;         // Min distance from target at which to add state
conf[? "switchRemoveMaxDist"] = 100000;    // Max distance from target at which to remove state
conf[? "switchRemoveMinDist"] = 0;         // Min distance from target at which to remove state
conf[? "switchPriority"] = 0;        // Priority (0 to 100). Highest currently-valid active state will be picked.
conf[? "switchPredicate"] = NULL;    // Predicate script that must be true for switch to push state
conf[? "switchDisablePush"] = false; // If true, state cannot be pushed by switch, only by other states.


ds_list_add(AI_states_active, conf);
return conf;
