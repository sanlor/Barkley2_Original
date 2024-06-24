var _action, _retvar,_obj, conf;

_action = argument0;

if (_action = "config")
{
    conf = ds_map_create();
    ds_map_add(conf, "attackName", "shot");
    ds_map_add(conf, "range", 120); ////range in pixels of the attack
    ds_map_add(conf, "motion", 15);
    ds_map_add(conf, "aim", true); // If true, changes dir to aim toward target

    ds_map_add(conf, "beforeTime", 1.3); ////time before each shot
    ds_map_add(conf, "afterTime", .6); ////time after each shot
    ds_map_add(conf, "precision", 4); ///precision in degrees. 0= precise, 360 = shoots randomly in all directions

    ////gun flash
    ds_map_add(conf, "gunRange", 10); // range of gunbarrel
    ds_map_add(conf, "gunFlash", s_Flash);
    ds_map_add(conf, "gunFlashShow", true);
    ds_map_add(conf, "bulletZ", 0);

    ds_map_add(conf, "burst", 1);
    ds_map_add(conf, "burstRnd", 0);

    ds_map_add(conf, "trackingSpd", 4); /// Speed the enemy rotates at to aim at player

    ds_map_add(conf, "tri_progress", 0); ////range in pixels of the attack
    ds_map_add(conf, "dmg", 1);
    ds_map_add(conf, "knockback", 5);
    ds_map_add(conf, "bulletObject", o_enemyAttack_bulletNormal);
    ds_map_add(conf, "bulletSprite", NULL);
    ds_map_add(conf, "flashObject", s_Flash6);

    ds_map_add(conf, "sndAttackWarn",NULL);
    ds_map_add(conf, "sndAttackStrike",NULL);

    return conf;
}

if(_action == "reset")
{
    conf = argument1;
    conf[? "tri_progress"]=0;
    I_atk_shot_timer = 0;
    I_atk_shot_intBefore = ds_map_find_value(conf, "beforeTime");
    I_atk_shot_intAfter = ds_map_find_value(conf, "afterTime");
    I_atk_shot_state = "before";
    I_atk_shot_burstShots = ds_map_find_value(conf, "burst") + irandom(ds_map_find_value(conf, "burstRnd"));
    I_atk_attackName = ds_map_find_value(conf, "attackName");
    scr_AI_util_aimTarget("prep", NULL);
    aAI_tracking = 360;
    aAI_trackSpeed = ds_map_find_value(conf, "trackingSpd");
}


if(_action = "execute")
{
    var _retvar = AI_STATERESULT_CONTINUE;

    conf = argument1;
    scr_entity_setMoveXY(0, 0);
    a_attackName = I_atk_attackName;
    if (ds_map_find_value(conf, "aim"))
    {
        if (instance_exists(I_AI_target)) {
          scr_AI_util_aimTarget("execute", I_AI_target);
        }
    }

    switch(I_atk_shot_state)
    {
        case "before":
            if(I_atk_shot_timer<I_atk_shot_intBefore)
            {
                if(I_atk_shot_timer==0){audio_play_sound_AI(ds_map_find_value(conf, "sndAttackWarn"));}
                I_atk_shot_timer += dt();
            }
            else
            {
                I_atk_shot_timer = 0;
                I_atk_shot_state = "attack";
            }
            break;

        case "attack":
            var _blt, _flash, dir, spd, precision, rng;

            if (I_atk_shot_timer == 0) {
                audio_play_sound_AI(ds_map_find_value(conf, "sndAttackStrike"));
            }

            // Read confs
            rng = ds_map_find_value(conf, "gunRange");
            precision = ds_map_find_value(conf, "precision");
            if conf[? "tri_progress"] ==0 {var dir_tamper=0;}
            else if conf[? "tri_progress"] ==1 {var dir_tamper=-25;}
            else if conf[? "tri_progress"] ==2 {var dir_tamper=25;}
            dir = faceDir - precision/2+ random(precision) +dir_tamper;
            spd = (ds_map_find_value(conf, "motion"));

            // Create bullet
            var tx = x + p_bulletOx + (cos(degtorad(dir))*rng);
            var ty = y + p_bulletOy - (sin(degtorad(dir))*rng);
            _blt = instance_create(tx, ty, ds_map_find_value(conf, "bulletObject"));
            _blt.z = p_bulletOz + ds_map_find_value(conf, "bulletZ");
            _blt.move_z = -12;
            _blt.boom=false;
            if (ds_map_find_value(conf,"bulletSprite") != NULL) {
                _blt.sprite_index = ds_map_find_value(conf,"bulletSprite");
            }

            ////direct bullet
            with _blt scr_entity_setDirSpd(dir, spd);
            _blt.shotEffect = ds_map_find_value(conf, "flashObject");
            _blt.life = 1 + ds_map_find_value(conf, "range")/ds_map_find_value(conf, "motion");
            ds_list_copy(_blt.target_list, target_list);
            if (instance_exists(I_AI_target)) ds_list_add(_blt.target_list, I_AI_target.object_index);
            ds_list_add(_blt.target_list, DestructibleCombatActor); //GZ Added for hitting barrels etc
            ds_list_add(_blt.target_list, BlockingCombatActor); //GZ Added for hitting barrels etc

            //attack stats
            var dmg;
            dmg = ds_map_find_value(conf, "dmg") * (0.9 + random(0.2));
            scr_stats_setAttackStat(_blt, STAT_ATTACK_DMG_NORMAL, dmg);

            scr_stats_setAttackStat(_blt, STAT_ATTACK_KNOCKBACK, conf[? "knockback"]);

            _blt.dmg_dir = faceDir;
            if conf[? "tri_progress"] <2
            {
            conf[? "tri_progress"]+=1;
            I_atk_shot_state = "before";
            I_atk_shot_timer = 0;
            }
            else
            {
            I_atk_shot_state = "after";
            }
            break;

        case "after":
            if(I_atk_shot_timer<I_atk_shot_intAfter)
            {I_atk_shot_timer+= dt();}
            else
            {
                I_atk_shot_burstShots -=1;
                if(I_atk_shot_burstShots>0){I_atk_shot_state = "before";}
                else{_retvar = AI_STATERESULT_REMOVE;}
            }
            break;
    }

    a_attackState = I_atk_shot_state;
    a_attackAnim = I_atk_shot_timer;

    if (_retvar != AI_STATERESULT_CONTINUE) {
        a_attackName = "";
    }

    return _retvar;
}
