var command = argument0;

if(command == "config") {
    var conf = ds_map_create();
    conf[? "stopAtDistance"] = 20;
    conf[? "spotFound"] = false;
    conf[? "jumpAction"] = NULL;
    conf[? "walkScript"] = NULL;
    return conf;
}

if (command = "reset") {
    var conf = argument1;
    if (conf[? "walkScript"] == NULL) {
        conf[? "walkScript"] = scr_AI_movement_init(scr_AI_movementType_standard);
    }
}

if (command = "execute") {
    var conf = argument1;
    
    if (!conf[? "spotFound"]) {
        conf[? "spotFound"] = AI_util_getJumpPoints_toLand();
    }
    
    if (conf[? "spotFound"]) {
        scr_AI_movement_doMove(conf[? "walkScript"], jumpPoint_from_x, jumpPoint_from_y);
        
        // Stop if close
        if (point_distance(x, y, jumpPoint_from_x, jumpPoint_from_y) < conf[? "stopAtDistance"]) {
            
            scr_AI_movement_doStop(conf[? "walkScript"]);
            if (conf[? "jumpAction"] != NULL) {
                // Jump to target location
                var jumpAction = conf[? "jumpAction"];
                jumpAction[? "targetx"] = jumpPoint_to_x;
                jumpAction[? "targety"] = jumpPoint_to_y;
                scr_AI_stateClearAll();
                scr_AI_statePush(jumpAction);
            }
        }
    }
    else {
        scr_AI_movement_doStop(conf[? "walkScript"]);
    }
    
    return AI_STATERESULT_CONTINUE;
}
