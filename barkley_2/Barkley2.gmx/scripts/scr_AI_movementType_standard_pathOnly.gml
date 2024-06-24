/// scr_AI_movement_standard(command, conf, target_x, target_y)

var command = argument0;

if (command == "init") {
    var conf = ds_map_create();
    conf[? "walkSpdMod"] = 1;
    return conf;
}

if (command = "reset") {
    var conf = argument1;
    return conf;
}

if (command == "move") {

    var conf = argument1;
    var targetX = argument2;
    var targetY = argument3;
    
    var walkSpd = conf[? "walkSpdMod"] * scr_stats_getEffectiveStat(self, STAT_BASE_SPEED);
    
    // Disable path if target point has moved
    if (scr_path_active() and
           (abs(path_get_x(scr_path_get(), 1) - targetX) > 4 or 
            abs(path_get_y(scr_path_get(), 1) - targetY) > 4)) {
        scr_path_delete();
    }
    
    // Animation variables
    a_walking = true;
    
    // Move towards point
    var moveThisFrame = dt() * walkSpd;
    if (point_distance(x, y, targetX, targetY) <= moveThisFrame + 1) {
        // If reached point, no movement.
        scr_path_delete();
    }
    else if(scr_path_active()) {
        // If on a path, follow path until you reach it
        scr_path_setSpeed(walkSpd);
    }
    else {
        scr_path_set(x, y, targetX, targetY, walkSpd, 8, NULL)
    }
}

if (command == "stop") {
    var conf = argument1;
    a_walking = false;
    scr_path_delete();
}
