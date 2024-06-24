var _action, conf;

_action = argument0;

if(_action == "config")
{
    conf = ds_map_create();
    ds_map_add(conf, "walkSpdMod", .5);
    ds_map_add(conf, "distance", 40);
    ds_map_add(conf, "distanceRand", 40);
    ds_map_add(conf, "time", 5);
    return conf;
}

if (_action = "reset")
{
    conf = argument1;
    I_aAI_stopAtDistance = ds_map_find_value(conf, "distance") - random(ds_map_find_value(conf, "distanceRand"));
    I_aAI_walkSpdMod = ds_map_find_value(conf, "walkSpdMod");
    I_aAI_time = ds_map_find_value(conf, "time");
}


if (_action = "execute")
{
    var _tx, _ty, _canseetarget;
    conf = argument1;
    _tx = I_AI_target.x;
    _ty = I_AI_target.y;
    
    _canseetarget = !scr_collision_line(x, y, _tx, _ty, collision_check, ZMAX-1)
    
    // Calculate walkspeed
    var walkSpd = I_aAI_walkSpdMod * scr_stats_getEffectiveStat(self, STAT_BASE_SPEED);
    
    // Check which action to take
    I_aAI_time -= dt();
    if (point_distance(x, y, _tx, _ty) >= I_aAI_stopAtDistance || I_aAI_time <= 0)
    {
        // I have reached my destination
        a_walking = false;
        return AI_STATERESULT_REMOVE;
    }
    else if (_canseetarget)
    {
        /// ==== Walk away from player ====
        scr_AI_util_turnTowards(_tx, _ty, 18);
        
        scr_entity_setDirSpd(faceDir + 180, walkSpd);
    }
    else
    {
        // I believe I have escaped
        a_walking = false;
        return AI_STATERESULT_REMOVE;
    }
    

    // Do animation
    a_walking = true;
    return AI_STATERESULT_CONTINUE;
}
