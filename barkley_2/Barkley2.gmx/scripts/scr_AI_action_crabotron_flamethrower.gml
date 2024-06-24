var _action, _retvar,_obj, conf;

_action = argument0;

if (_action = "config")
{
    conf = ds_map_create();
    conf[? "attackName"] = "flame";    
    conf[? "beforeTime"] = 7; ////time before each 
    conf[? "duringTime"] = .5; ////time during each shot
    conf[? "afterTime"] = 3; ////time after each shot
    conf[? "endburst"] = 4; ////time after each shot
    conf[? "streamlength"] = 6; ////number of bullets for each flametrow stream
    conf[? "streamspd"] = 35; ////number of bullets for each flametrow stream
    conf[? "streamwidth"] = 5; ///number of flames wide
    conf[? "repeats"] = 3; ////flamethrower repeats
    
    conf[? "soundFlare"] = "crab_furnace_flare";
    conf[? "soundBreath"] = "crab_furnace_breath";
    
    AI_util_action_addDefaultDamage(conf);
    
    return conf;
}

if(_action == "reset")
{
    conf = argument1;
    I_atk_shot_timer = 0;
    I_atk_shot_intBefore = ds_map_find_value(conf, "beforeTime");
    I_atk_shot_intDuring = ds_map_find_value(conf, "duringTime");
    I_atk_shot_intAfter = ds_map_find_value(conf, "afterTime");
    
    I_atk_shot_streamlength = ds_map_find_value(conf, "streamlength");
    
    I_atk_shot_streamspd = ds_map_find_value(conf, "streamspd");
    
    I_atk_shot_swidth =  ds_map_find_value(conf, "streamwidth");
    
    I_atk_shot_repeats = ds_map_find_value(conf, "repeats");
    I_atk_shot_endBurst =  ds_map_find_value(conf, "endburst");
    I_atk_shot_state = "before";
    I_atk_shot_smokeTimer = 1;
    I_atk_attackName = ds_map_find_value(conf, "attackName");
    
    var aimDir = 0;
    if (instance_exists(I_AI_target)) {
        aimDir = point_direction(x, y, I_AI_target.x, I_AI_target.y);
    }
    I_atk_shot_dir = round(aimDir / 90) * 90;
    
    audio_play_sound_AI(conf[? "crab_furnace_flare"]);
}


if(_action = "execute")
{
    var _retvar = AI_STATERESULT_FALLTHROUGH;
    
    conf = argument1;
    a_attackName = I_atk_attackName;
    a_attackAnim = I_atk_shot_timer;
    
    switch(I_atk_shot_state)
    {
        case "before":
            // Create smoke puffs
            I_atk_shot_smokeTimer -= dt();
            while (I_atk_shot_smokeTimer <= 0) {
                var calcpos = 6*(I_atk_shot_swidth-1)/2
                var spawnx = x + lengthdir_x(16, I_atk_shot_dir) + lengthdir_x(calcpos, I_atk_shot_dir + 90);
                var spawny = y + lengthdir_y(16, I_atk_shot_dir) + lengthdir_y(calcpos, I_atk_shot_dir + 90);
                var dx = lengthdir_x(6, I_atk_shot_dir - 90);
                var dy = lengthdir_y(6, I_atk_shot_dir - 90);
                repeat(I_atk_shot_swidth) {
                    bullet = instance_create(spawnx, spawny, o_effect_generic_animateOnce);
                    bullet.z = p_bulletOz + z;
                    var sd = I_atk_shot_dir;
                    with bullet {
                        //sprite_index = s_enemy_crabotron_smokepuff;
                        sprite_index = s_effect_jetpackSmoke;
                        gravity_x = -1.5;
                        move_z = -3;
                        scr_entity_setDirSpd(sd - 5 + random(10), 4);
                        scr_entity_setFriction(1);
                        scr_entity_animation_setSpeed(ANIMATION_DEFAULT, .5);
                    }
                    spawnx += dx;
                    spawny += dy;
                }
                
                I_atk_shot_smokeTimer += 1;
            }
        
            if(I_atk_shot_timer<I_atk_shot_intBefore)
            {
                I_atk_shot_timer += dt();
            }
            else
            {
                I_atk_shot_timer = 0;
                I_atk_shot_state = "attack";
                I_atk_shot_fire = I_atk_shot_streamlength;
                I_atk_shot_intDuring = ds_map_find_value(conf, "duringTime");
                
                audio_play_sound_AI(conf[? "crab_furnace_breath"]);
            }
            break;
            
        case "attack":
            // Create bullets
            var calcpos = 6*(I_atk_shot_swidth-1)/2
            var spawnx = x + lengthdir_x(16, I_atk_shot_dir) + lengthdir_x(calcpos, I_atk_shot_dir + 90);
            var spawny = y + lengthdir_y(16, I_atk_shot_dir) + lengthdir_y(calcpos, I_atk_shot_dir + 90);
            var dx = lengthdir_x(6, I_atk_shot_dir - 90);
            var dy = lengthdir_y(6, I_atk_shot_dir - 90);
            repeat(I_atk_shot_swidth)
            {
                bullet = instance_create(spawnx, spawny, o_enemyAttack_bullet_flamethrower);
                bullet.z = p_bulletOz + z;
                bullet.attack_from = id;
                
                var me = id;
                var sd = I_atk_shot_dir;
                with bullet
                {
                    move_z = .5 - random(.5);
                    scr_entity_setDirSpd(sd - 5 + random(10),other.I_atk_shot_streamspd + random(other.I_atk_shot_streamspd/3));
                    scr_entity_setFriction(6);
                    
                    var burn = scr_statusEffect_getFromAttack(self.id, statusEffect_burning);
                    if (burn != NULL) {
                        AI_util_action_attackDamageFromAction(me, conf, burn, STAT_ATTACK_DMG_NORMAL);
                    }
                }
                
                // target list
                ds_list_copy(bullet.target_list, target_list);
                if (instance_exists(I_AI_target)) ds_list_add(bullet.target_list, I_AI_target.object_index);
                
                spawnx += dx;
                spawny += dy;
            }
            
            I_atk_shot_state = "during";
            I_atk_shot_fire--;
            I_atk_shot_timer = 0;
            I_atk_shot_intDuring = ds_map_find_value(conf, "duringTime");
            break;
            
        case "during":
            if(I_atk_shot_timer<I_atk_shot_intDuring)
            {I_atk_shot_timer+= dt();}
            else
            {
                I_atk_shot_timer = 0;
                if (I_atk_shot_fire <= 0) {
                    I_atk_shot_state = "after";
                    I_atk_shot_timer = 0;
                    I_atk_shot_intAfter = ds_map_find_value(conf, "afterTime");
                }
                else {
                    I_atk_shot_state = "attack";
                }
                    
            }
            break;
            
        case "after":
            // Create smoke puffs
            I_atk_shot_smokeTimer -= dt();
            while (I_atk_shot_smokeTimer <= 0) {
                var calcpos = 6*(I_atk_shot_swidth-1)/2
                var spawnx = x + lengthdir_x(16, I_atk_shot_dir) + lengthdir_x(calcpos, I_atk_shot_dir + 90);
                var spawny = y + lengthdir_y(16, I_atk_shot_dir) + lengthdir_y(calcpos, I_atk_shot_dir + 90);
                var dx = lengthdir_x(6, I_atk_shot_dir - 90);
                var dy = lengthdir_y(6, I_atk_shot_dir - 90);
                repeat(I_atk_shot_swidth) {
                    bullet = instance_create(spawnx, spawny, o_effect_generic_animateOnce);
                    bullet.z = p_bulletOz + z;
                    var sd = I_atk_shot_dir;
                    with bullet {
                        //sprite_index = s_enemy_crabotron_smokepuff;
                        sprite_index = s_effect_jetpackSmoke;
                        gravity_x = -1.5;
                        move_z = -3;
                        scr_entity_setDirSpd(sd - 5 + random(10), 4);
                        scr_entity_setFriction(1);
                        scr_entity_animation_setSpeed(ANIMATION_DEFAULT, 1);
                    }
                    spawnx += dx;
                    spawny += dy;
                }
                
                I_atk_shot_smokeTimer += 1;
            }
        
            if(I_atk_shot_timer<I_atk_shot_intAfter)
            {I_atk_shot_timer+= dt();}
            else
            {
                I_atk_shot_repeats--;
                if (I_atk_shot_repeats > 0) {
                    I_atk_shot_timer = 0;
                    I_atk_shot_state = "attack";
                    I_atk_shot_fire = I_atk_shot_streamlength;
                    I_atk_shot_intDuring = ds_map_find_value(conf, "duringTime");
                    
                    audio_play_sound_AI(conf[? "crab_furnace_breath"]);
                }
                else {
                    I_atk_shot_state = "endBurst";
                    I_atk_shot_timer = 0;
                }
            }
            break;
            
        case "endBurst":
            if(I_atk_shot_timer<I_atk_shot_endBurst){I_atk_shot_timer+= dt();}
            else
            {
                _retvar = AI_STATERESULT_REMOVE;
            }
            break;
    }
    
    a_attackState = I_atk_shot_state;
    
    if (_retvar != AI_STATERESULT_FALLTHROUGH) {
        a_attackName = "";
    }
    
    return _retvar;
}
