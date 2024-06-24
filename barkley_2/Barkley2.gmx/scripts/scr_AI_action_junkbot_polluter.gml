var action = argument0;

if (action = "config")
{
    var conf = ds_map_create();
    conf[? "part"] = noone;
    conf[? "shotDelay"] = 1.5; 
    conf[? "streamlength"] = 20; 
    conf[? "streamspd"] = 17; 
    conf[? "soundSpray"] = "junkbot_gas_spray"; 
    AI_util_action_addDefaultDamage(conf);
    return conf; 
}

if(action == "reset")
{
    var conf = argument1;
    I_atk_shot_timer = 0;
    I_atk_shot_count = 0;
    audio_play_sound_AI(conf[? "soundSpray"]);
}


if(action = "execute")
{    
    var conf = argument1;
    
    var part = conf[? "part"];
    if (part == noone or !instance_exists(part)) {
        return AI_STATERESULT_FALLTHROUGH_REMOVE;
    }
    
    I_atk_shot_timer -= dt();
    while (I_atk_shot_timer <= 0) {
        var spawnx = part.shotx;
        var spawny = part.shoty;
        var spawnz = part.shotz;
        var spawndir = part.shotdir;
        
        var shot = instance_create(spawnx, spawny, o_enemyAttack_aoe_junkbot_poisongas);
        shot.z = spawnz;
        var me = id;
        with shot {
            scr_entity_setDirSpd(spawndir - 10 + random(20), conf[? "streamspd"] * (.5+random(.5)));
            
            var poison = scr_statusEffect_getFromAttack(id, statusEffect_poison);
            if (poison != NULL) {
                AI_util_action_attackDamageFromAction(me, conf, poison, STAT_ATTACK_DMG_BIO);
            }
        }
        
        I_atk_shot_count += 1;
        I_atk_shot_timer += conf[? "shotDelay"];
    }

    if(I_atk_shot_count >= conf[? "streamlength"]) {
        return AI_STATERESULT_FALLTHROUGH_REMOVE;
    } else {
        return AI_STATERESULT_FALLTHROUGH;
    }
}
