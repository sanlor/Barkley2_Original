var _action, ret,_obj, conf;

_action = argument0;

if (_action = "config")
{
    conf = ds_map_create();
    conf[? "attackName"] = "jump";
    conf[? "mask"] = mask_crescent_24_12;
    conf[? "maskDirs"] = 4;
    
    conf[? "beforeTime"] = 3;
    conf[? "duringTimeBase"] = 5;
    conf[? "duringTimePerPixel"] = 0.05;
    conf[? "afterTime"] = 0.05;
    conf[? "screenshake"] = 20;
    
    conf[? "jumpDistMax"] = 240;
    conf[? "jumpHeightBase"] = 30;
    conf[? "jumpHeightPerPixel"] = 0.1;
    
    conf[? "soundReady"] = "sn_debug_one";
    conf[? "soundJump"] = "sn_debug_two";
    conf[? "soundLand"] = "sn_debug_three";
    
    AI_util_action_addDefaultDamage(conf);
    
    return conf;
}

if(_action == "reset")
{
    conf = argument1;
    I_atk_jump_state = "before";
    I_atk_jump_time = 0;
    I_atk_prevCollisionCheck = collision_check;
    
    I_atk_jump_timebefore = conf[? "beforeTime"];
    I_atk_jump_timeafter = conf[? "afterTime"];
    
    
    if (instance_exists(I_AI_target)) {
        var target = scr_collision_eject_from_solid(I_AI_target.x, I_AI_target.y, COLLISION_ONLY_SOLID);
        I_atk_jump_tox = target[0];
        I_atk_jump_toy = target[1];
        I_atk_jump_fromx = x;
        I_atk_jump_fromy = y;
        target = 0;
        
        var jumpdir = point_direction(I_atk_jump_fromx, I_atk_jump_fromy, I_atk_jump_tox, I_atk_jump_toy);
        var jumpdist = point_distance(I_atk_jump_fromx, I_atk_jump_fromy, I_atk_jump_tox, I_atk_jump_toy);
        if (jumpdist > conf[? "jumpDistMax"]) {
            jumpdist = conf[? "jumpDistMax"];
            I_atk_jump_tox = I_atk_jump_fromx + lengthdir_x(jumpdist, jumpdir);
            I_atk_jump_toy = I_atk_jump_fromy + lengthdir_y(jumpdist, jumpdir);
        }
        I_atk_jump_timetotal = conf[? "duringTimeBase"] + (jumpdist * conf[? "duringTimePerPixel"]);
        I_atk_jump_height = conf[? "jumpHeightBase"] + jumpdist * conf[? "jumpHeightPerPixel"];
    }
    
    if (scr_path_active()) {
        scr_path_delete();
    }
}


if(_action = "execute")
{   
    conf = argument1;
    a_attackName = conf[? "attackName"];
    
    if (!instance_exists(I_AI_target)) {
        a_attackName = "";
        scr_entity_setCollisionType(I_atk_prevCollisionCheck);
        return AI_STATERESULT_FALLTHROUGH;
    }
    
    var ret = AI_STATERESULT_CONTINUE;
    
    switch(I_atk_jump_state)
    {
        case "before":
            scr_entity_setMoveXYZ(0, 0, 0);
            I_atk_jump_time += dt();
            if (I_atk_jump_time > I_atk_jump_timebefore) {
                I_atk_jump_state = "jump";
                scr_entity_setDirSpd(move_dir, move_dist);
                scr_entity_setCollisionType(COLLISION_NONE);
                I_atk_jump_time = 0;
                
                // Sound
                audio_play_sound_AI(conf[? "soundJump"]);
                
                // Quantized direction
                var qdir = faceDir;
                if (conf[? "maskDirs"] > 0) {
                    qdir = faceDir - (faceDir mod (360 / conf[? "maskDirs"]));
                }
                
                // Create a static attack
                var n, ax, ay, _dist;
                n = instance_create(x, y, o_enemyAttack_melee_static)
                n.parent = id;
                n.attack_from = id;
                n.lifetime = I_atk_jump_timetotal;
                n.mask_index = conf[? "mask"];
                n.image_angle = qdir;
                ds_list_copy(n.target_list, target_list);
                if (instance_exists(I_AI_target)) ds_list_add(n.target_list, I_AI_target.object_index);
                
                AI_util_action_attackEntityDamageFromAction(id, conf, n, STAT_ATTACK_DMG_NORMAL);
                n.knockback_type = KNOCKBACKTYPE_FROM_CENTER;
            }
            break;
            
        case "jump":
            I_atk_jump_time += dt();
            scr_entity_setMoveXYZ(0, 0, 0);
            if (I_atk_jump_time < I_atk_jump_timetotal) {
                var ratio = I_atk_jump_time / I_atk_jump_timetotal;
                x = I_atk_jump_fromx + (I_atk_jump_tox - I_atk_jump_fromx) * ratio;
                y = I_atk_jump_fromy + (I_atk_jump_toy - I_atk_jump_fromy) * ratio;
                z = base_z + sin(ratio * pi) * I_atk_jump_height;
            }
            else {
                // Land
                x = I_atk_jump_tox;
                y = I_atk_jump_toy;
                z = base_z;
                scr_entity_setCollisionType(I_atk_prevCollisionCheck);
                
                I_atk_jump_time = 0;
                I_atk_jump_state = "land";
                
                // Sound
                audio_play_sound_AI(conf[? "soundLand"]);
            }
            break;
            
        case "land":
            scr_entity_setMoveXYZ(0, 0, 0);
            I_atk_jump_time += dt();
            if (I_atk_jump_time > I_atk_jump_timeafter) {
                ret = AI_STATERESULT_REMOVE;
            }
            break;
    }
    
    if (ret != AI_STATERESULT_CONTINUE) {
        a_attackName = "";
        scr_entity_setCollisionType(I_atk_prevCollisionCheck);
    }
    
    return ret;
}
