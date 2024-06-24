var action, conf;
action = argument0;

///Simplest passive AI: becomes active on hero proximity. Ignores walls and direction

if(action == "config")
{
    conf = ds_map_create();
    ds_map_add(conf, "checkFreq", 2);
    ds_map_add(conf, "waitTime", 0);
    ds_map_add(conf, "visionRange", 120);
    ds_map_add(conf, "alertAmount", 1200);
    ds_map_add(conf, "alertState", -1);
    ds_map_add(conf, "sndAlertSound", NULL);
    return conf;
}

if(action == "reset")
{
    conf = argument1;
    I_pAI_checkTmr = random(conf[? "checkFreq"]); ///starts randomly to avoid many objects checking for the hero simultaneously
    I_pAI_waitTimer = conf[? "waitTime"];
}

if(action == "execute")
{
    conf = argument1;
    var closest;
    closest = scr_actor_getNearestOfTypeList(target_list, x, y);
    
    ///If not currently alerted
    ///the AI looks for the hero at regular intervals.
    if (instance_exists(closest))
    {
        if(I_pAI_checkTmr>0){I_pAI_checkTmr-=dt();}
        else
        {
            ///check for distance away from hero first
            var _tx,_ty,_pDist,_diff;
            
            _tx = closest.x;
            _ty = closest.y;
            
            _pDist = point_distance(x,y,_tx,_ty);
            
            if(_pDist<=ds_map_find_value(conf, "visionRange"))
            {
                // Enemy waits for the specified time if there is a wait condition
                // (if the player is within the proximity range)
                if(I_pAI_waitTimer > 0) { I_pAI_waitTimer -= dt(); }
                else
                {
                    scr_AI_aggro_addAggro(closest, ds_map_find_value(conf, "alertAmount"));
                    
                    audio_play_sound_AI(ds_map_find_value(conf, "sndAlertSound"));
                    
                    // Push next state if applicable
                    var state = ds_map_find_value(conf, "alertState");
                    if (state != -1) {
                        scr_AI_stateClearAll();
                        scr_AI_statePush(state);
                    }
                }
            }
            else
            {
                // if the player isn't in range, idle for scan
                I_pAI_checkTmr = ds_map_find_value(conf, "checkFreq");
                I_pAI_waitTimer = ds_map_find_value(conf, "waitTime");
            }
        }
    }
    return AI_STATERESULT_CONTINUE;
}
