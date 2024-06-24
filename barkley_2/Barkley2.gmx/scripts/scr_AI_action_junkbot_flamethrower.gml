var action = argument0;

if (action = "config")
{
    var conf = ds_map_create();
    conf[? "part"] = noone;
    conf[? "beforeTime"] = 7; ////time before each 
    conf[? "duringTime"] = .5; ////time during each shot
    conf[? "afterTime"] = 3; ////time after each shot
    conf[? "endburst"] = 4; ////time after each shot
    conf[? "streamlength"] = 6; ////number of bullets for each flametrow stream
    conf[? "streamspd"] = 43; ////number of bullets for each flametrow stream
    conf[? "repeats"] = 3; ////flamethrower repeats
    
    conf[? "soundFlare"] = "junkbot_flamethrower_flare";
    conf[? "soundBreath"] = "junkbot_flamethrower_breath";
    
    AI_util_action_addDefaultDamage(conf);
    
    return conf; 
}

if(action == "reset")
{
    var conf = argument1;
    I_atk_shot_state = "before";
    I_atk_shot_timer = 0;
    I_atk_shot_smokeTimer = 1;
    I_atk_shot_repeats = conf[? "repeats"];
}


if(action = "execute")
{    
    var conf = argument1;
    
    var part = conf[? "part"];
    
    if (part == noone or !instance_exists(part)) {
        return AI_STATERESULT_FALLTHROUGH_REMOVE;
    }
    
    var _retvar = AI_STATERESULT_FALLTHROUGH;
    
    switch(I_atk_shot_state)
    {
        case "before":
            // Create smoke puff
            I_atk_shot_smokeTimer -= dt();
            while (I_atk_shot_smokeTimer <= 0) {
                var spawnx = part.shotx;
                var spawny = part.shoty;
                var spawnz = part.shotz;
                var spawndir = part.shotdir;
                
                var effect = instance_create(spawnx, spawny, o_effect_generic_animateOnce);
                effect.z = spawnz;
                with effect {
                    //sprite_index = s_enemy_crabotron_smokepuff;
                    sprite_index = s_effect_jetpackSmoke;
                    gravity_x = -1.5;
                    move_z = -3;
                    scr_entity_setDirSpd(spawndir - 5 + random(10), 4);
                    scr_entity_setFriction(1);
                    scr_entity_animation_setSpeed(ANIMATION_DEFAULT, .5);
                }
                
                I_atk_shot_smokeTimer += 1;
            }
        
            if(I_atk_shot_timer<conf[? "beforeTime"])
            {
                I_atk_shot_timer += dt();
            }
            else
            {
                I_atk_shot_timer = 0;
                I_atk_shot_state = "attack";
                I_atk_shot_fire = conf[? "streamlength"];
                
                audio_play_sound_AI(conf[? "soundBreath"]);
            }
            break;
            
        case "attack":
            // Create bullet
            var spawnx = part.shotx;
            var spawny = part.shoty;
            var spawnz = part.shotz;
            var spawndir = part.shotdir;
            
            var bullet = instance_create(spawnx, spawny, o_enemyAttack_bullet_flamethrower);
            bullet.z = p_bulletOz + z;
            bullet.attack_from = id;
            
            var me = id;
            with bullet
            {
                move_z = .5 - random(.5);
                scr_entity_setDirSpd(spawndir - 5 + random(10),conf[? "streamspd"] + random(conf[? "streamspd"]/3));
                scr_entity_setFriction(6);
                
                var burn = scr_statusEffect_getFromAttack(self.id, statusEffect_burning);
                if (burn != NULL) {
                    AI_util_action_attackDamageFromAction(me, conf, burn, STAT_ATTACK_DMG_NORMAL);
                }
            }
            
            // target list
            ds_list_copy(bullet.target_list, target_list);
            
            audio_play_sound_AI(conf[? "soundFlare"]);
            
            if (instance_exists(I_AI_target)) ds_list_add(bullet.target_list, I_AI_target.object_index);
            
            I_atk_shot_state = "during";
            I_atk_shot_fire--;
            I_atk_shot_timer = 0;
            break;
            
        case "during":
            if(I_atk_shot_timer<conf[? "duringTime"])
            {I_atk_shot_timer+= dt();}
            else
            {
                I_atk_shot_timer = 0;
                if (I_atk_shot_fire <= 0) {
                    I_atk_shot_state = "after";
                    I_atk_shot_timer = 0;
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
                var spawnx = part.shotx;
                var spawny = part.shoty;
                var spawnz = part.shotz;
                var spawndir = part.shotdir;
                
                var effect = instance_create(spawnx, spawny, o_effect_generic_animateOnce);
                effect.z = spawnz;
                with effect {
                    //sprite_index = s_enemy_crabotron_smokepuff;
                    sprite_index = s_effect_jetpackSmoke;
                    gravity_x = -1.5;
                    move_z = -3;
                    scr_entity_setDirSpd(spawndir - 5 + random(10), 4);
                    scr_entity_setFriction(1);
                    scr_entity_animation_setSpeed(ANIMATION_DEFAULT, .5);
                }
                
                I_atk_shot_smokeTimer += 1;
            }
        
            if(I_atk_shot_timer<conf[? "afterTime"])
            {I_atk_shot_timer+= dt();}
            else
            {
                I_atk_shot_repeats -= 1;
                if (I_atk_shot_repeats > 0) {
                    I_atk_shot_timer = 0;
                    I_atk_shot_state = "attack";
                    I_atk_shot_fire = conf[? "streamlength"];
                    
                    audio_play_sound_AI(conf[? "soundBreath"]);
                }
                else {
                    I_atk_shot_state = "endBurst";
                    I_atk_shot_timer = 0;
                }
            }
            break;
            
        case "endBurst":
            if(I_atk_shot_timer<conf[? "endburst"]){I_atk_shot_timer+= dt();}
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
