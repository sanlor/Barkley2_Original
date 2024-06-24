/// scr_AI_movement_standard(command, conf, target_x, target_y)

var command = argument0;

if (command == "init") {
    var conf = ds_map_create();
    conf[? "walkSpdMod"] = 2;
    conf[? "walkSpdModRand"] = 0;
    conf[? "jumpTime"] = 5;
    conf[? "jumpTimeRand"] = 0;
    conf[? "jumpGravity"] = 7;
    conf[? "jumpWait"] = 6;
    conf[? "jumpAngle"] = 45;
    conf[? "stopDist"] = 16;
    conf[? "turnSpeed"] = 90;
    conf[? "lookSpeed"] = 10;
    conf[? "soundHop"] = "";
    conf[? "soundLand"] = "";
    conf[? "eventOnLand"] = NULL;
    conf[? "eventOnHop"] = NULL;
    return conf;
}

if (command = "reset") {
    var conf = argument1;
    I_mAI_jumping = false;
    I_mAI_timerJump = 0;
    I_mAI_jumpDir = 0;
    I_mAI_jumpSpd = 0;
    return conf;
}

if (command == "move") {

    var conf = argument1;
    var targetX = argument2;
    var targetY = argument3;
    
    var walkSpd = conf[? "walkSpdMod"] * scr_stats_getEffectiveStat(self, STAT_BASE_SPEED);
    
    // This movement type is a bit special - it needs to override the path movement as well.
    // So, it sets path speed to 0, and does its movement manually instead.
    scr_entity_setDirSpd(move_dir, 0);
    
    // Disable path if target point has moved
    if (scr_path_active() and
           (abs(path_get_x(scr_path_get(), 1) - targetX) > 4 or 
            abs(path_get_y(scr_path_get(), 1) - targetY) > 4)) {
        scr_path_delete();
    }
    
    // Animation variables
    a_walking = true;
    
    // Move towards point
    var doMove = false;
    if (point_distance(x, y, targetX, targetY) <= conf[? "stopDist"]) {
        // If reached point, no movement.
        scr_path_delete();
        
        // Turn towards target
        if (instance_exists(I_AI_target)) {
            scr_AI_util_turnTowards(I_AI_target.x, I_AI_target.y, conf[? "turnSpeed"]);
        }
    }
    else if(scr_path_active()) {
        doMove = true;
        scr_path_setSpeed(0);
        faceDir = move_dir;
    }
    else if(scr_collision_line(x, y, targetX, targetY, z, collision_check)) {
        doMove = true;
        // If wall is in the way, set a path
        scr_path_set(x, y, targetX, targetY, 0, 8, NULL)
    }
    else {
        doMove = true;
        // Turn towards movement point
        var dir = point_direction(x, y, targetX, targetY);
        if (instance_exists(I_AI_target)) {
            scr_AI_util_turnTowards(x + lengthdir_x(10, dir), y + lengthdir_y(10, dir), conf[? "turnSpeed"]);
        }
    }
    
    if (doMove and I_mAI_jumping = false and I_mAI_timerJump <= 0) {
        I_mAI_jumping = true;
        I_mAI_timerJump = conf[? "jumpWait"];
        var jumpTime = conf[? "jumpTime"] + random(conf[? "jumpTimeRand"]);
        
        gravity_z = conf[? "jumpGravity"];
        move_z = conf[? "jumpGravity"] * jumpTime/2;
        z -= 1;
        
        I_mAI_jumpDir = faceDir + conf[? "jumpAngle"] - random(conf[? "jumpAngle"]*2);
        I_mAI_jumpSpd = walkSpd + (random(conf[? "walkSpdModRand"]) * scr_stats_getEffectiveStat(self, STAT_BASE_SPEED));
        audio_play_sound_AI(conf[? "soundHop"]);
        
        if (conf[? "eventOnHop"] != NULL) {
            event_user(conf[? "eventOnHop"]);
        }
    }
    
    if (I_mAI_jumping) {
        scr_collision_move_contact_solid(
                lengthdir_x(I_mAI_jumpSpd * dt(), I_mAI_jumpDir),
                lengthdir_y(I_mAI_jumpSpd * dt(), I_mAI_jumpDir),
                collision_check);
        if (z <= base_z and move_z < 0) {
            I_mAI_jumping = false;
            audio_play_sound_AI(conf[? "soundLand"]);
            if (conf[? "eventOnLand"] != NULL) {
                event_user(conf[? "eventOnLand"]);
            }
        }
    } else {
        I_mAI_timerJump = max(0, I_mAI_timerJump - dt());
    }
}

if (command == "stop") {
    var conf = argument1;
    a_walking = false;
    scr_path_delete();
    
    if (instance_exists(I_AI_target)) {
        scr_AI_util_turnTowards(I_AI_target.x, I_AI_target.y, conf[? "turnSpeed"]);
    }
    
    if (I_mAI_jumping) {
        scr_collision_move_contact_solid(
                lengthdir_x(I_mAI_jumpSpd * dt(), I_mAI_jumpDir),
                lengthdir_y(I_mAI_jumpSpd * dt(), I_mAI_jumpDir),
                collision_check);
        if (z <= base_z and move_z < 0) {
            I_mAI_jumping = false;
            audio_play_sound_AI(conf[? "soundLand"]);
        }
    } else {
        I_mAI_timerJump = max(0, I_mAI_timerJump - dt());
    }
}
