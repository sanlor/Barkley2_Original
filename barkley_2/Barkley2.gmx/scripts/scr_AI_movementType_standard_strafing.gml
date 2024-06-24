/// scr_AI_movementType_standard_strafing(command, conf, target_x, target_y)
// Standard walking script but always facing player, unless on a path.

var command = argument0;

if (command == "init") {
    var conf = ds_map_create();
    conf[? "walkSpdMod"] = 1;
    conf[? "turnSpeed"] = 30;
    conf[? "animWalkSpd"] = 1.2;
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
        scr_entity_setDirSpd(move_dir, 0);
        if (instance_exists(I_AI_target)) {
            scr_AI_util_turnTowards(I_AI_target.x, I_AI_target.y, conf[? "turnSpeed"]);
        }
    }
    else if(scr_path_active()) {
        scr_path_setSpeed(walkSpd);
        // Turn towards where I am walking
        scr_AI_util_turnTowards(x + lengthdir_x(10, move_dir), y + lengthdir_y(10, move_dir), conf[? "turnSpeed"]);
    }
    else if(scr_collision_line(x, y, targetX, targetY, z, collision_check)) {
        // If wall is in the way, set a path
        scr_path_set(x, y, targetX, targetY, walkSpd, 8, NULL)
    }
    else {
        // Freewalk / strafe
        scr_entity_setDirSpd(point_direction(x, y, targetX, targetY), walkSpd);
        if (instance_exists(I_AI_target)) {
            scr_AI_util_turnTowards(I_AI_target.x, I_AI_target.y, conf[? "turnSpeed"]);
        }
    }
}

if (command == "stop") {
    var conf = argument1;
    a_walking = false;
    scr_path_delete();
    scr_entity_setDirSpd(move_dir, 0);
    if (instance_exists(I_AI_target)) {
        scr_AI_util_turnTowards(I_AI_target.x, I_AI_target.y, conf[? "turnSpeed"]);
    }
}
