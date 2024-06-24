////SHOOTER AI script
///script in 3 phases:
///1-"hangback" -enemy hangs back, moving around the player at a specified distance, possibly flanking/surrounding
///2-"prep burst" -enemy prepares the attack: stays in place, starts takes out a gun and aims while rotating towards the player
///3-"burst shot" -enemy initiates an attack several times while staying in place.

///good AI for simple projectile shooter enemies.

var _action,_retvar, conf;

_action = argument0;

if(_action == "config")
{
    conf = ds_map_create();
    ds_map_add(conf, "action", NULL);
    ds_map_add(conf, "prepTime", 1.5); //time aiming before shooting a burst
    ds_map_add(conf, "unwindTime", 5); ///rest time after the attack
    ds_map_add(conf, "distMax", 0); // GZ MAX
    return conf;
}

if(_action == "reset") /////prepares some variables for the script use.
{
    conf = argument1;
    scr_AI_util_aimTarget("prep", NULL);
    
    ////Internal variables the script uses. you shouldnt need to fiddle with these.------------
    ////Resetting this should loop the AI script back to the beginning.
    I_aAI_aiState = "prep shoot";
    I_aAI_trackingLeft = 0;
    I_aAI_stateTimer = 0;
    if (scr_path_active()) { scr_path_delete(); }
}



if(_action == "execute")
{   
    conf = argument1;
    scr_entity_setMoveXY(0, 0);
    
    if (instance_exists(I_AI_target)) {
        switch(I_aAI_aiState)
        {
            case "prep shoot": ////The monster prepares his attack, aiming at the target and running in place
                scr_AI_util_aimTarget("execute", I_AI_target);
                // Only shoot if you have a clear shot
                I_clearPath = 0;
                if (conf[? "distMax"] != 0)
                {
                    _dr = point_direction(x, y, I_AI_target.x, I_AI_target.y);
                    _sx = x;
                    _sy = y;
                    _lx = x + lengthdir_x(conf[? "distMax"], _dr);
                    _ly = y + lengthdir_y(conf[? "distMax"], _dr);
                    _ds = point_distance(_sx, _sy, _lx, _ly);
                    _hd = point_distance(x, y, I_AI_target.x, I_AI_target.y);
                    x -= 9999;
                    _cm = scr_enemy_collision_line(_sx, _sy, _lx, _ly, z, EnemyCombatActor);
                    x += 9999;
                    if (_cm == _ds) I_clearPath = 1;
                    if (_cm >= _hd - 10) I_clearPath = 1;
                }
                // Execute shot if clear path OTHERWISE exit this state
                if (conf[? "distMax"] == 0 || I_clearPath)
                {
                    a_walking = false;
                    I_aAI_stateTimer += dt();
                    if(I_aAI_stateTimer>ds_map_find_value(conf, "prepTime"))
                    {
                        if (ds_map_find_value(conf, "action") != NULL) {
                            scr_AI_statePush(ds_map_find_value(conf, "action"));
                        }
                        I_aAI_aiState = "unwind";
                        I_aAI_stateTimer = 0;
                    }
                }
                else 
                {
                    show_debug_message("scr_AI_active_aimandshoot - enemy blocking fire, exit");
                    return AI_STATERESULT_REMOVE;
                }
                break;
                
            case "unwind":
                if(I_aAI_stateTimer < ds_map_find_value(conf, "unwindTime"))
                {
                    I_aAI_stateTimer += dt();
                }
                else
                {
                    return AI_STATERESULT_REMOVE;
                }
                break;
        }
        return AI_STATERESULT_CONTINUE;
    } else {
        return AI_STATERESULT_REMOVE;
    }
}
