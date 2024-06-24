/// scr_AI_movement_standard(command, conf, target_x, target_y)

var command = argument0;

if (command == "init") {
    var conf = ds_map_create();
    conf[? "walkSpdMod"] = 1;
    conf[? "turnSpeed"] = 30;
    conf[? "lookSpeed"] = 10;
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
    }
    else if(scr_path_active()) {
        // If on a path, follow path until you reach it
        scr_path_setSpeed(walkSpd);
        // Turn and look towards where I am walking
        faceDir = move_dir;
        scr_AI_util_lookTowards(x + lengthdir_x(10, move_dir),  + lengthdir_y(10, move_dir), conf[? "lookSpeed"]);
    }
    else if(scr_collision_line(x, y, targetX, targetY, z, collision_check)) {
        // If wall is in the way, set a path
        scr_path_set(x, y, targetX, targetY, walkSpd, 8, NULL)
    }
    else {// Freewalk / strafe
        
        // Get target direction - quantize to 8 directions
        var dir = round(point_direction(x, y, targetX, targetY) / (360/8)) * (360/8)
        dir = (dir + 360) mod 360;
        
        // Turn and look towards walk direction
        scr_AI_util_turnTowards(x + lengthdir_x(10, dir), y + lengthdir_y(10, dir), conf[? "turnSpeed"]);
        scr_AI_util_lookTowards(x + lengthdir_x(10, dir), y + lengthdir_y(10, dir), conf[? "lookSpeed"]);
    
        // Move IF legs pointing towards direction
        var faceDirQuant = round(faceDir / (360/8)) * (360/8)
        if (abs(scr_math_rdif(dir, faceDirQuant)) <= 45) {
            scr_entity_setDirSpd(faceDirQuant, walkSpd);
        } else {
            scr_entity_setDirSpd(faceDirQuant, 0);
        }
    }
}


if (command == "stop") {
    var conf = argument1;
    a_walking = false;
    scr_path_delete();
    scr_entity_setDirSpd(move_dir, 0);
    if (instance_exists(I_AI_target)) {
        scr_AI_util_lookTowards(I_AI_target.x, I_AI_target.y, conf[? "turnSpeed"]);
    }
}
