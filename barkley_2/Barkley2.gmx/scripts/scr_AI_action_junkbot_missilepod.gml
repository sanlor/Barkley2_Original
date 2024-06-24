var action = argument0;

if (action = "config")
{
    var conf = ds_map_create();
    conf[? "part"] = noone;
    conf[? "shotDelay"] = 3.3; 
    conf[? "shotCount"] = 9; 
    conf[? "shotSpdStart"] = 5; 
    conf[? "shotAcc"] = 4;  
    conf[? "shotAccCutoff"] = .7;  
    conf[? "shotDist"] = 90;  
    conf[? "shotDistRand"] = 250;
    conf[? "shotAngle"] = 110;
    conf[? "soundShoot"] = "junkbot_missile_fire";
    conf[? "soundImpact"] = "junkbot_missile_impact";
    AI_util_action_addDefaultDamage(conf);
    return conf; 
}

if(action == "reset")
{
    var conf = argument1;
    I_atk_shot_timer = 0;
    I_atk_shot_count = 0;
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
        var spawnX = part.shotx + 3 - random(6);
        var spawnY = part.shoty + 3 - random(6);
        var spawnZ = part.shotz + 3 - random(6);
        var spawnDir = part.shotdir + (conf[? "shotAngle"]/2) - random(conf[? "shotAngle"]);
        var targetDist = conf[? "shotDist"] + random(conf[? "shotDistRand"]);
        
        var shot = instance_create(spawnX, spawnY, o_enemyAttack_junkbot_missile);
        shot.targetX = spawnX + lengthdir_x(targetDist, spawnDir);
        shot.targetY = spawnY + lengthdir_y(targetDist, spawnDir);
        shot.z = spawnZ;
        shot.arcspd = conf[? "shotSpdStart"];
        shot.arcacc = conf[? "shotAcc"];
        shot.arcaccCutoff = conf[? "shotAccCutoff"]; 
        shot.move_dir = spawnDir;
        shot.soundImpact = conf[? "soundImpact"];
        AI_util_action_attackEntityDamageFromAction(self.id, conf, shot, STAT_ATTACK_DMG_NORMAL);        
        ds_list_copy(shot.target_list, target_list);
        
        audio_play_sound_AI(conf[? "soundShoot"]);
        
        I_atk_shot_count += 1;
        I_atk_shot_timer += conf[? "shotDelay"];
    }

    if(I_atk_shot_count >= conf[? "shotCount"]) {
        return AI_STATERESULT_FALLTHROUGH_REMOVE;
    } else {
        return AI_STATERESULT_FALLTHROUGH;
    }
}
