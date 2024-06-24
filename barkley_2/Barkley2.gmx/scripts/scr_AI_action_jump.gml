var _action, ret,_obj, conf;

_action = argument0;

if (_action = "config")
{
    conf = ds_map_create();
    
    conf[? "targetx"] = x;
    conf[? "targety"] = y;
    
    conf[? "attackName"] = "jump";
    
    conf[? "beforeTime"] = 3;
    conf[? "duringTimeBase"] = 5;
    conf[? "duringTimePerPixel"] = 0.05;
    conf[? "afterTime"] = 0.05;
    conf[? "screenshake"] = 10;
    
    conf[? "jumpHeightBase"] = 30;
    conf[? "jumpHeightPerPixel"] = 0.1;
    
    conf[? "smokeCount"] = 0;
    conf[? "smokeObject"] = o_effect_rubble;
    conf[? "smokeRadius"] = 24;
    
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
    
    I_atk_jump_tox = conf[? "targetx"];
    I_atk_jump_toy = conf[? "targety"];
    I_atk_jump_toz = scr_collision_zheight(I_atk_jump_tox,I_atk_jump_toy);
    if (is_undefined(I_atk_jump_toz)) {
        I_atk_jump_toz = base_z;
    }
    I_atk_jump_fromx = x;
    I_atk_jump_fromy = y;
    I_atk_jump_fromz = z;
        
    var jumpdist = point_distance(I_atk_jump_fromx, I_atk_jump_fromy, I_atk_jump_tox, I_atk_jump_toy);
    I_atk_jump_timetotal = conf[? "duringTimeBase"] + (jumpdist * conf[? "duringTimePerPixel"]);
    I_atk_jump_height = conf[? "jumpHeightBase"] + jumpdist * conf[? "jumpHeightPerPixel"];
    
    if (scr_path_active()) {
        scr_path_delete();
    }
    scr_entity_setMoveXYZ(0, 0, 0);
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
            }
            break;
            
        case "jump":
            I_atk_jump_time += dt();
            scr_entity_setMoveXYZ(0, 0, 0);
            if (I_atk_jump_time < I_atk_jump_timetotal) {
                var ratio = I_atk_jump_time / I_atk_jump_timetotal;
                x = I_atk_jump_fromx + (I_atk_jump_tox - I_atk_jump_fromx) * ratio;
                y = I_atk_jump_fromy + (I_atk_jump_toy - I_atk_jump_fromy) * ratio;
                z = I_atk_jump_fromz + (I_atk_jump_toz - I_atk_jump_fromz) * ratio + sin(ratio * pi) * I_atk_jump_height;
            }
            else {
                // Land
                x = I_atk_jump_tox;
                y = I_atk_jump_toy;
                z = I_atk_jump_toz;
                scr_entity_setCollisionType(I_atk_prevCollisionCheck);
                
                I_atk_jump_time = 0;
                I_atk_jump_state = "land";
                
                // Sound
                audio_play_sound_AI(conf[? "soundLand"]);
                
                // Can hurt now
                invulnerable = 0;
                
                // Landing smoke
                repeat(conf[? "smokeCount"]) {
                    var i = random(360);
                    var l = random(conf[? "smokeRadius"]);
                    var n = instance_create(x + lengthdir_x(l, i), y + lengthdir_y(l, i), conf[? "smokeObject"]);
                    n.z = z;
                }
                
                // Screenshake
                // if (conf[? "screenshake"] > 0) {
                //    Shake("add", conf[? "screenshake"], 300, x, y, .3)
                //}
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
