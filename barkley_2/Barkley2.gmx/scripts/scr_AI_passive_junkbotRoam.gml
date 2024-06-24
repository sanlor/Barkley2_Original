////no passive AI: always active
var action, conf;
action = argument0;

if (action = "config") {
    var conf = ds_map_create();
    conf[? "pickupDist"] = 70;
    conf[? "pauseTime"] = 30;
    conf[? "walkScript"] = NULL;
    conf[? "pickupAction"] = NULL; // Required: Put part pickup action here
    return conf;
}

if (action = "reset") {
    var conf = argument1;
    conf[? "targetPart"] = noone;
    if (conf[? "walkScript"] == NULL) {
        conf[? "walkScript"] = scr_AI_movement_init(scr_AI_movementType_standard);
    }
    conf[? "pause"] = conf[? "pauseTime"];
    return conf;
}

if (action = "execute") {
    var conf = argument1;
    
    if (conf[? "pause"] > 0) {
        // Pause for a moment
        scr_AI_movement_doStop(conf[? "walkScript"]);
        conf[? "pause"] -= dt();
    } else {
    
        if (conf[? "targetPart"] == noone or !instance_exists(conf[? "targetPart"])) {
            // Find new target part
            var parts = ds_list_create();
            with (o_wasteland_junk_enemypart) {
                if (pickupCooldown <= 0) {
                    ds_list_add(parts, id);
                }
            }
            
            if (ds_list_size(parts) == 0) {
                // Found no part. Stand still and do nothing.
                conf[? "targetPart"] = noone;
                scr_AI_movement_doStop(conf[? "walkScript"]);
                return AI_STATERESULT_CONTINUE;
                
            } else {
                conf[? "targetPart"] = ds_list_choose(parts);
            }
        }
        
        // Pickup part if close to it
        var part = conf[? "targetPart"];
        var dist = point_distance(x, y, part.x, part.y);
        if (dist < conf[? "pickupDist"]) {
            // Pickup part
            conf[? "targetPart"] = noone;
            conf[? "pause"] = conf[? "pauseTime"];
            scr_AI_movement_doStop(conf[? "walkScript"]);
            scr_AI_statePush(conf[? "pickupAction"]);
        } else {
            scr_AI_movement_doMove(conf[? "walkScript"], part.x, part.y);
        }
    }

    return AI_STATERESULT_CONTINUE;
}
