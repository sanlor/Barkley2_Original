var _action,_retvar, conf;

_action = argument0;

if(_action == "config")
{
    conf = ds_map_create();
    conf[? "attackName"] = ""; // Gun to use
    conf[? "gun"] = NULL; // Gun to use
    conf[? "standStill"] = true; /// If true, stands still. Set to false if falling through to a movement state
    conf[? "fallthrough"] = false; /// True if should FALLTHROUGH to another state
    
    conf[? "prepTime"] = 1.5; //time aiming before shooting
    conf[? "shootTime"] = 30; //time shooting
    conf[? "unwindTime"] = 5; ///rest time after the attack
    
    conf[? "sndWarn"] = NULL;
    return conf;
}

if(_action == "reset") /////prepares some variables for the script use.
{
    conf = argument1;
    scr_AI_util_aimTarget("prep", NULL);
    aAI_tracking = 1000;
    
    I_aAI_aiState = "prep";
    I_aAI_stateTimer = 0;
    
    if (scr_path_active()) { scr_path_delete(); }
}

if(_action == "execute")
{   
    conf = argument1;
    scr_entity_setMoveXY(0, 0);
    
    a_attackName = conf[? "attackName"];
    
    if (instance_exists(I_AI_target)) {
        switch(I_aAI_aiState)
        {
            case "prep": ////The monster prepares his attack, aiming at the target and running in place
                scr_AI_util_aimTarget("execute", I_AI_target);
                combat_gunwield_aim(faceDir);
                
                a_walking = false;
                
                if (I_aAI_stateTimer == 0) {
                    audio_play_sound_AI(conf[? "sndWarn"]);
                }
                
                I_aAI_stateTimer += dt();
                
                if (I_aAI_stateTimer > conf[? "prepTime"])
                {
                    I_aAI_aiState = "shoot";
                    I_aAI_stateTimer = 0;
                }
                break;
                
            case "shoot":
                scr_AI_util_aimTarget("execute", I_AI_target);
                combat_gunwield_aim(faceDir);
                
                a_walking = false;
                I_aAI_stateTimer += dt();
                
                var tx = I_AI_target.x;
                var ty = I_AI_target.y;
                var gun = conf[? "gun"];
                var doShoot = false;
                
                if (point_distance(x, y, tx, ty) < 250 and
                    !scr_collision_line(x, y, tx, ty, z, COLLISION_ONLY_SOLID)) {
                    doShoot = true;    
                }
                
                combat_gunwield_attacking(gun, id, doShoot, doShoot);
                
                if(I_aAI_stateTimer > conf[? "shootTime"])
                {
                    I_aAI_aiState = "unwind";
                    I_aAI_stateTimer = 0;
                }            
                break;
                
            case "unwind":
                scr_AI_util_aimTarget("execute", I_AI_target);
                combat_gunwield_aim(faceDir);
                if(I_aAI_stateTimer < conf[? "unwindTime"])
                {
                    I_aAI_stateTimer += dt();
                }
                else
                {
                    a_attackName = "";
                    return AI_STATERESULT_REMOVE;
                }
                break;
        }
        
        return AI_STATERESULT_CONTINUE;
    } else {
        a_attackName = "";
        return AI_STATERESULT_REMOVE;
    }
}
