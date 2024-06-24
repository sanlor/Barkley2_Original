var _action, _retvar,_obj, conf;

_action = argument0;

if (_action = "config")
{
    conf = ds_map_create();
    ds_map_add(conf, "attackName", "photonvolcano");    
    ds_map_add(conf, "beforeTime", 8); ////time after each shot
    ds_map_add(conf, "afterTime", 3); ////time after each shot
    ds_map_add(conf, "closeTime", 4); ////time at the end of burst
    ds_map_add(conf, "shots", 8); ////photon shots repeats
    ds_map_add(conf, "speed", 12); 
    ds_map_add(conf, "speedRnd", 10); 
    ds_map_add(conf, "speedZ", 12); 
    ds_map_add(conf, "speedZRnd", 6); 
    ds_map_add(conf, "soundShot", "crab_photon_spawnhead");
    
    AI_util_action_addDefaultDamage(conf);
    
    return conf;
}

if(_action == "reset")
{
    conf = argument1;
    I_atk_shot_timer = 0;
    I_atk_shot_intBefore = ds_map_find_value(conf, "beforeTime");
    I_atk_shot_intAfter = ds_map_find_value(conf, "afterTime");
    I_atk_shot_intClose = ds_map_find_value(conf, "closeTime");
    I_atk_shot_shots = ds_map_find_value(conf, "shots");
    I_atk_attackState = "before";
    I_atk_attackName = ds_map_find_value(conf, "attackName");
    I_atk_directions = ds_list_create();
    
    var dir = random(360);
    repeat (I_atk_shot_shots) {
        ds_list_add(I_atk_directions, dir + 45 - random(90));
        dir += 360 / I_atk_shot_shots;
    }
    ds_list_shuffle(I_atk_directions);
}

if(_action = "execute")
{
    var _retvar = AI_STATERESULT_FALLTHROUGH;
    
    conf = argument1;
    a_attackName = I_atk_attackName;
    a_attackAnim = I_atk_shot_timer;
    
    switch(I_atk_attackState)
    {
        case "before":
            I_atk_shot_timer += dt();
            if(I_atk_shot_timer>I_atk_shot_intBefore){I_atk_shot_timer = 0; I_atk_attackState = "attack";}
            break;
            
        case "attack":
            I_atk_shot_timer += dt();
            while (I_atk_shot_timer > I_atk_shot_intAfter)
            {
                // Create shot
                var shot = instance_create(x,y-8, o_enemyAttack_bullet_photon);
                shot.z = z + 32;
                var shotdir = I_atk_directions[| 0];
                ds_list_delete(I_atk_directions, 0);
                with (shot) {
                    scr_entity_setDirSpd(shotdir, conf[? "speed"] + random(conf[? "speedRnd"]));
                    move_z = conf[? "speedZ"] + random(conf[? "speedZRnd"]);
                }
                ds_list_copy(shot.target_list, target_list);
                if (instance_exists(I_AI_target)) ds_list_add(shot.target_list, I_AI_target.object_index);
                
                AI_util_action_attackEntityDamageFromAction(id, conf, shot, STAT_ATTACK_DMG_CYBER);
                
                // Sound
                audio_play_sound_AI(conf[? "soundShot"]);
        
                I_atk_shot_shots--;
                I_atk_shot_timer -= I_atk_shot_intAfter;
                if (I_atk_shot_shots <= 0)
                {
                    I_atk_attackState = "after";
                    I_atk_shot_timer = 0; 
                }
            }
            break;
            
        case "after":
            I_atk_shot_timer += dt();
            if(I_atk_shot_timer>I_atk_shot_intClose){ I_atk_shot_timer = 0; _retvar = AI_STATERESULT_FALLTHROUGH_REMOVE;}
            break;
    }
    
    a_attackState = I_atk_attackState;
    
    if (_retvar != AI_STATERESULT_FALLTHROUGH) {
        a_attackName = "";
    }
    
    return _retvar;
}
