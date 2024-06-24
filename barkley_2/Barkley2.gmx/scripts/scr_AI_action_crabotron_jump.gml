var _action, _retvar,_obj, conf;

_action = argument0;

if (_action = "config")
{
    conf = ds_map_create();
    ds_map_add(conf, "attackName", "jump");
    ds_map_add(conf, "soundJump", "crab_jump");
    ds_map_add(conf, "soundLand", "crab_land");
    
    AI_util_action_addDefaultDamage(conf);
    
    return conf;
}

if(_action == "reset")
{
    conf = argument1;
    I_atk_jump_state = "before";
    I_atk_attackName = ds_map_find_value(conf, "attackName");
    I_atk_damage = ds_map_find_value(conf, "damage");
    I_atk_knockback = ds_map_find_value(conf, "knockback");
    
    var aimDir = 0;
    if (instance_exists(I_AI_target)) {
        aimDir = point_direction(x, y, I_AI_target.x, I_AI_target.y);
    }
    I_atk_shot_dir = round(aimDir / 90) * 90;
}


if(_action = "execute")
{
    var _retvar = AI_STATERESULT_CONTINUE;
    
    conf = argument1;
    a_attackName = I_atk_attackName;
    
    switch(I_atk_jump_state)
    {
        case "before":
            if (scr_path_active()) {
               scr_path_delete();
            }
            if (prev_dir == -1 and stance == "stand") {
                if (instance_exists(I_AI_target)) {
                    I_atk_jump_state = "jump";
                    stance = "jump"; // Takes control of the crabotron
                    
                    I_atk_prevCollisionCheck = collision_check;
                    scr_entity_setCollisionType(COLLISION_NONE);
                    var target = scr_collision_eject_from_solid(I_AI_target.x, I_AI_target.y, COLLISION_ONLY_SOLID);
                    I_atk_jump_tox = target[0];
                    I_atk_jump_toy = target[1];
                    I_atk_jump_fromx = x;
                    I_atk_jump_fromy = y;
                    target = 0;
                    
                    var jumpdist = point_distance(I_atk_jump_fromx, I_atk_jump_fromy, I_atk_jump_tox, I_atk_jump_toy);
                    I_atk_jump_timetotal = 5 + (jumpdist / 20);
                    I_atk_jump_time = 0;
                    I_atk_jump_height = 50 + jumpdist / 7;
                    
                    // Sound
                    audio_play_sound_AI(conf[? "soundJump"]);
                }
                else {
                    // Target already dead, Abort, Abort
                    _retvar = AI_STATERESULT_REMOVE
                }
            }
            break;
            
        case "jump":
            I_atk_jump_time += dt();
            if (I_atk_jump_time < I_atk_jump_timetotal) {
                var ratio = I_atk_jump_time / I_atk_jump_timetotal;
                x = I_atk_jump_fromx + (I_atk_jump_tox - I_atk_jump_fromx) * ratio;
                y = I_atk_jump_fromy + (I_atk_jump_toy - I_atk_jump_fromy) * ratio;
                z = 12 + sin(ratio * pi) * I_atk_jump_height;
            }
            else {
                // Land
                x = I_atk_jump_tox;
                y = I_atk_jump_toy;
                z = 12;
                scr_entity_setCollisionType(I_atk_prevCollisionCheck);
                I_atk_jump_state = "land";
                
                // Sound
                audio_play_sound_AI(conf[? "soundLand"]);
                
                // Landing smoke
                repeat(50) {
                    var i = random(360);
                    var l = random(50);
                    var n = instance_create(x + lengthdir_x(l, i), y + lengthdir_y(l, i), o_effect_rubble);
                    with (n) {
                        move_z = 4 + random(8);
                        scr_entity_setDirSpd(random(360), random(6));
                        sprite_index = s_effect_rubble_rocks;
                        image_index = floor(random(sprite_get_number(sprite_index)));
                    }
                }
                
                // Create a static attack
                var n, ax, ay, _dist;
                n = instance_create(x, y, o_enemyAttack_melee_static)
                n.parent = id;
                n.attack_from = id;
                n.lifetime = 1;
                n.mask_index = mask_disk_100by100;
                ds_list_copy(n.target_list, target_list);
                if (instance_exists(I_AI_target)) ds_list_add(n.target_list, I_AI_target.object_index);
                
                AI_util_action_attackEntityDamageFromAction(id, conf, n, STAT_ATTACK_DMG_NORMAL);
                n.knockback_type = KNOCKBACKTYPE_FROM_CENTER;
            }
            break;
            
        case "land":
            I_atk_jump_time += dt();
            if (I_atk_jump_time > 5) {
                _retvar = AI_STATERESULT_REMOVE;
                stance = "stand";
            }
            break;
    }
    
    if (_retvar != AI_STATERESULT_CONTINUE) {
        a_attackName = "";
    }
    
    return _retvar;
}
