var _action, _retvar,_obj, conf;

_action = argument0;

if (_action = "config")
{
    conf = ds_map_create();
    ds_map_add(conf, "attackName", "photoncannon");    
    ds_map_add(conf, "afterTime", 3); ////time after each shot
    ds_map_add(conf, "shots", 5); ////flamethrower repeats
    
    ds_map_add(conf, "speed", 8);
    ds_map_add(conf, "speedRnd", 2);
    ds_map_add(conf, "speedZ", 4); 
    ds_map_add(conf, "speedZRnd", 1);
    ds_map_add(conf, "zOffset", 28);
    ds_map_add(conf, "spread", 40);
    ds_map_add(conf, "allLegs", false);
    ds_map_add(conf, "soundShot", "crab_photon_spawnleg");
    
    ds_map_add(conf, "areaSpeed", 0.8); 
    ds_map_add(conf, "scale", 1); 
    
    AI_util_action_addDefaultDamage(conf);
    
    return conf;
}

if(_action == "reset")
{
    conf = argument1;
    I_atk_shot_timer = 0;
    I_atk_shot_intAfter = ds_map_find_value(conf, "afterTime");
    I_atk_shot_shots = ds_map_find_value(conf, "shots");
    I_atk_attackName = ds_map_find_value(conf, "attackName");
    
    var aimDir = 0;
    if (instance_exists(I_AI_target)) {
        aimDir = point_direction(x, y, I_AI_target.x, I_AI_target.y);
    }
    
    // Pick leg
    if (aimDir < 90) {
        I_atk_shootDir = 45;
    }
    else if (aimDir < 180) {
        I_atk_shootDir = 135;
    }
    else if (aimDir < 270) {
        I_atk_shootDir = 225;
    }
    else {
        I_atk_shootDir = 315;
    }
}


if(_action = "execute")
{
    var _retvar = AI_STATERESULT_FALLTHROUGH;
    
    conf = argument1;
    a_attackName = I_atk_attackName;
    
    I_atk_shot_timer += dt();
    
    while (I_atk_shot_timer > I_atk_shot_intAfter) {
        // Shoot!
        var start, stop, leg;
        if (conf[? "allLegs"]) {
            // Shoot from all four legs
            start = 45;
            stop = 315;
        }
        else {
            // Shoot from just one leg
            start = I_atk_shootDir;
            stop = I_atk_shootDir;
        }
        
        while (start <= stop) {
            // Create shot
            var dir = start;
            var legId;
            if (start < 90) {
                legId = leg_id[2];
            }
            else if (start < 180) {
                legId = leg_id[0];
            }
            else if (start < 270) {
                legId = leg_id[1];
            }
            else {
                legId = leg_id[3];
            }
            var shot = instance_create(legId.x, legId.y, o_enemyAttack_bullet_photon);
            shot.z = legId.z + conf[? "zOffset"];
            var spread = conf[? "spread"];
            with (shot) {
                scr_entity_setDirSpd(dir - (spread/2) + random(spread), conf[? "speed"] + random(conf[? "speedRnd"]));
                move_z = conf[? "speedZ"] + random(conf[? "speedZRnd"]);
                area_speed = conf[? "areaSpeed"];
                scaleMax = conf[? "scale"];
            }
            
            ds_list_copy(shot.target_list, target_list);
            if (instance_exists(I_AI_target)) ds_list_add(shot.target_list, I_AI_target.object_index);

            AI_util_action_attackEntityDamageFromAction(id, conf, shot, STAT_ATTACK_DMG_CYBER);
            
            // Sound
            audio_play_sound_AI(conf[? "soundShot"]);
            
            start += 90;
        }
           
        I_atk_shot_shots--;
        I_atk_shot_timer -= I_atk_shot_intAfter;
        if (I_atk_shot_shots <= 0) {
            _retvar = AI_STATERESULT_FALLTHROUGH_REMOVE;
        }
    }
    
    if (_retvar != AI_STATERESULT_FALLTHROUGH) {
        a_attackName = "";
    }
    
    return _retvar;
}
