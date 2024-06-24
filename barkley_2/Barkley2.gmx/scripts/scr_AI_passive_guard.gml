var action, conf;
////Becomes active if hero enters vision cone. May or may not look through walls based on properties.
action = argument0;

if (action == "config")
{
    conf = ds_map_create();
    ds_map_add(conf, "checkFreq", 10);
    ds_map_add(conf, "visionRange", 265);
    ds_map_add(conf, "visionAngle", 210);
    ds_map_add(conf, "visionXRay", false);
    ds_map_add(conf, "alertAmount", 1200);
    ds_map_add(conf, "waitInterval", 20);
    ds_map_add(conf, "walkbackSpdMod", 0.5);
    ds_map_add(conf, "alertState", -1);
    ds_map_add(conf, "alertAggro", 50);
    ds_map_add(conf, "sndAlertSound", NULL)
    return conf;
}
if(action == "reset")
{
    I_pAI_checkTmr = random(3); ///starts randomly to avoid many objects checking for the hero simultaneously
    I_pAI_waitTimer = 0;
    I_pAI_path = -1;
}

if(action == "execute")
{
    conf = argument1;
    
    var closest = scr_actor_getNearestOfTypeList(target_list, x, y);
    
    ///the AI looks for the hero at regular intervals.
    if(instance_exists(closest))
    {
        if(I_pAI_checkTmr>0) {I_pAI_checkTmr-=dt();}
        else
        {
            I_pAI_checkTmr = ds_map_find_value(conf, "checkFreq");;
        
            ///check for distance away from hero first
            var tx,ty,pDist,diff;
            
            tx = closest.x;
            ty = closest.y;
            
            pDist = point_distance(x,y,tx,ty);
            
            if(pDist <= ds_map_find_value(conf, "visionRange"))
            {
                ///checks for the vision cone angle second
                _pDir = point_direction(x,y,tx,ty);
                diff = abs(scr_math_rdif(_pDir, faceDir));

                if(diff <= ds_map_find_value(conf, "visionAngle") / 2)
                {
                    ///checks for walls between the target and the monster
                    if (not scr_collision_line(x,y,tx,ty,ZMAX-1,collision_check))
                    {
                        AI_alertTimer = ds_map_find_value(conf, "alertAmount");
                        I_pAI_waitTimer = ds_map_find_value(conf, "waitInterval");
                        
                        scr_AI_aggro_addAggro(closest, ds_map_find_value(conf, "alertAggro"));
                        
                        audio_play_sound_AI(ds_map_find_value(conf, "sndAlertSound"));
                        
                        // Push next state if applicable
                        var state = ds_map_find_value(conf, "alertState");
                        if (state != -1)
                        {
                            scr_AI_stateClearAll();
                            scr_AI_statePush(state);
                        }
                        
                    }
                }
            }
        }
    }
    
    ////If not seeing hero for a while, walks back to origin point.
    if(I_pAI_waitTimer>0){I_pAI_waitTimer-=dt();}
    else
    {
        alertState = -1;
        if(x != startPointx && startPointy != y)
        {
            if(I_pAI_path == -1)
            {
                var walkSpd = scr_stats_getEffectiveStat(self, STAT_BASE_SPEED) * ds_map_find_value(conf, "walkbackSpdMod");
                I_pAI_path = scr_path_set(x, y, startPointx, startPointy, walkSpd, 0, NULL);
            }
            else
            {
                if (path_position = 1) {I_pAI_path = -1;}
            }
        }
    }
    
    return AI_STATERESULT_CONTINUE;
}
