var command = argument0;

if(command == "config") {
    var conf = ds_map_create();
    conf[? "stopAtDistance"] = 16;
    conf[? "stateAfterStop"] = NULL;
    conf[? "walkScript"] = NULL;
    ds_map_add(conf, "time", 99999999);
    return conf;
}

if (command = "reset") {
    var conf = argument1;
    if (conf[? "walkScript"] == NULL) {
        conf[? "walkScript"] = scr_AI_movement_init(scr_AI_movementType_standard);
    }
    I_aAI_time = ds_map_find_value(conf, "time");
}

if (command = "execute") {
    var conf = argument1;
    
    // Timer
    I_aAI_time -= dt();
    if (I_aAI_time <= 0)
    {
        scr_AI_stateClearAll();
        scr_AI_statePush(conf[? "stateAfterStop"]);
        return AI_STATERESULT_CONTINUE;
    }
    
    if (instance_exists(I_AI_target)) {
        scr_AI_movement_doMove(conf[? "walkScript"], I_AI_target.x, I_AI_target.y);
        
        // Stop if close and can see target
        if (point_distance(x, y, I_AI_target.x, I_AI_target.y) < conf[? "stopAtDistance"] and
                !scr_collision_line(x, y, I_AI_target.x, I_AI_target.y, collision_check, ZMAX-1)) {
            
            scr_AI_movement_doStop(conf[? "walkScript"]);
            if (conf[? "stateAfterStop"] != NULL) {
                // Do specified action
                scr_AI_stateClearAll();
                scr_AI_statePush(conf[? "stateAfterStop"]);
            }
        }
    }
    else {
        scr_AI_movement_doStop(conf[? "walkScript"]);
    }
    
    return AI_STATERESULT_CONTINUE;
}
