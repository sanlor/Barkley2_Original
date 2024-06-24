var _action, _retvar, conf;

_action = argument0;

if(_action == "config")
{
    conf = ds_map_create();
    ds_map_add(conf, "walkSpdMod", 1);
    ds_map_add(conf, "rotDist", 40);
    ds_map_add(conf, "rotDistRand", 40);
    ds_map_add(conf, "time", 99999999);
    return conf;
}

if (_action = "reset")
{
    conf = argument1;
    I_aAI_rotDir = choose(1, -1);
    I_aAI_rotDist = ds_map_find_value(conf, "rotDist") + random(ds_map_find_value(conf, "rotDistRand"));
    I_aAI_walkSpdMod = ds_map_find_value(conf, "walkSpdMod");
    I_aAI_time = ds_map_find_value(conf, "time");
}


if (_action = "execute")
{
    if (!instance_exists(I_AI_target)) {
        // Exit if circling target no longer exists
        return AI_STATERESULT_REMOVE;
    }

    var _retvar = AI_STATERESULT_CONTINUE;
    
    var _tx, _ty;
    conf = argument1;
    _tx = I_AI_target.x;
    _ty = I_AI_target.y;
    
    // Calculate walkspeed
    var walkSpd = I_aAI_walkSpdMod * scr_stats_getEffectiveStat(self, STAT_BASE_SPEED);
    
    // Timer - Babby System only
    I_aAI_time -= dt();
    if (I_aAI_time <= 0)
    {
        a_walking = false;
        scr_AI_stateClearAll();
        return AI_STATERESULT_REMOVE;
    }
    
    if (scr_collision_line(x, y, _tx, _ty, collision_check, ZMAX-1))
    {
        // Something intersected line toward player, abort circling
        // TODO: Make this abortion less strict...
        _retvar = AI_STATERESULT_REMOVE;
        scr_entity_setMoveXY(0, 0);
    }
    else
    {
        /// ==== Circle around player ====
        var _dir, _dir_target, _xtarget, _ytarget, walkspd;
        
        // Turn to face toward player
        scr_AI_util_turnTowards(I_AI_target.x, I_AI_target.y, 18);
        
        // Determine a spot around the player to move to to make a circling effect
        _dir_target = point_direction(_tx, _ty, x, y);
        _dir_target += 10 * I_aAI_rotDir;
        _xtarget = _tx + cos(degtorad(_dir_target)) * I_aAI_rotDist;
        _ytarget = _ty - sin(degtorad(_dir_target)) * I_aAI_rotDist;
        
        _dir = point_direction(x, y, _xtarget, _ytarget);
        scr_entity_setDirSpd(_dir, walkSpd);   
    }
    
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
