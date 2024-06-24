var _action, _retvar, conf;

_action = argument0;

if(_action == "config")
{
    conf = ds_map_create();
    ds_map_add(conf, "walkSpdMod", 1);
    ds_map_add(conf, "thrustStr", .5);
    ds_map_add(conf, "stopAtDistance", 16);
    ds_map_add(conf, "stateAfterStop", NULL);
    ds_map_add(conf, "animWalkSpd", 1.2);
    ds_map_add(conf, "turnSpd", 18);
    ds_map_add(conf, "friction", .15);
    ds_map_add(conf, "frictionPerSpd", .02);
    ds_map_add(conf, "maxSpeed", 14);
    ds_map_add(conf, "maxSpeedPath", 10);
    ds_map_add(conf, "targetDeviate", 0); // Distance it can deviate from target when approaching
    return conf;
}

if (_action = "reset")
{
    conf = argument1;
    I_aAI_oldx = x;
    I_aAI_oldy = y;
    I_aAI_stopDist = ds_map_find_value(conf, "stopAtDistance");
    I_aAI_walkSpdMod = ds_map_find_value(conf, "walkSpdMod");
    I_aAI_animWalkSpd = ds_map_find_value(conf, "animWalkSpd");
    I_aAI_turnSpd = ds_map_find_value(conf, "turnSpd");
    if (scr_path_active()) { scr_path_delete(); }
}

if (_action = "execute")
{
    var _retvar = AI_STATERESULT_CONTINUE;
    
    var _tx, _ty, _canseetarget, target;
    conf = argument1;
    var _dv = ds_map_find_value(conf, "targetDeviate");
    _tx = I_AI_target.x - (_dv / 2) + random(_dv);
    _ty = I_AI_target.y - (_dv / 2) + random(_dv);
    
    _canseetarget = !scr_collision_line(x, y, _tx, _ty, collision_check, ZMAX-1)
    
    // Calculate walkspeedar
    var walkSpd = I_aAI_walkSpdMod * scr_stats_getEffectiveStat(self, STAT_BASE_SPEED);
    
    // Calculate friction
    move_friction = conf[? "friction"] + (conf[? "frictionPerSpd"] * move_dist);
     
    // Check which action to take
    if (point_distance(x, y, _tx, _ty) < I_aAI_stopDist and _canseetarget)
    {
        // I have reached my destination
        scr_path_delete();
        if (conf[? "stateAfterStop"] != NULL) {
            // Do specified action
            scr_AI_stateClearAll();
            scr_AI_statePush(conf[? "stateAfterStop"]);
        }
        else {
            // Rotate toward target
            scr_AI_util_turnTowards(_tx, _ty, I_aAI_turnSpd);
        }
    }
    else if (!_canseetarget)
    {
        /// ==== Thrust along a path ====
        
        if(!scr_path_active())
        {
            // I need a new path
            I_aAI_path = scr_path_set(x,y,_tx,_ty, walkSpd, 8, NULL);
        }
        // I am now walking towards my target
        if (x != I_aAI_oldx or y != I_aAI_oldy) {
            var _dx, _dy;
            _dx = x - I_aAI_oldx;
            _dy = y - I_aAI_oldy;
            faceDir = point_direction(0, 0, _dx, _dy);
        }
        if (move_dist >= conf[? "maxSpeedPath"]) {
            scr_path_setSpeed(0);
        } else {
            scr_path_setSpeed(conf[? "thrustStr"]);
        }
    }
    else
    {
        /// ==== Thrust towards player ====
        var diff;
        move_friction = conf[? "friction"];
        
        if (scr_path_active()) { scr_path_delete(); }
        
        scr_AI_util_turnTowards(_tx, _ty, I_aAI_turnSpd);
        
        if (move_dist < conf[? "maxSpeed"]) {
            diff = scr_math_rdif(faceDir, point_direction(x, y, _tx, _ty));
            var thrustStrMod = 1 - (diff / 180)
            var thrustStr = conf[? "thrustStr"] * thrustStrMod
            scr_entity_addDirSpd(faceDir, thrustStr * dt())
        }
    }
    
    // Update vars
    I_aAI_oldx = x;
    I_aAI_oldy = y;
        
    
    if (_retvar != AI_STATERESULT_CONTINUE)
    {
        // Stance quit, stop animation
        a_walking = false;
    }
    else
    {
        // Do animation
        a_walking = true;
    }
    
    return _retvar;
}
