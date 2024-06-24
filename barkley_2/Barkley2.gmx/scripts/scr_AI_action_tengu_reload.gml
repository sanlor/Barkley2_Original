var _action, _retvar,_obj, conf;

_action = argument0;

if (_action = "config")
{
    conf = ds_map_create();
    ds_map_add(conf, "attackName", "clone");
    ds_map_add(conf, "range", 120); ////range in pixels of the attack
    ds_map_add(conf, "motion", 30);
    ds_map_add(conf, "aim", true); // If true, changes dir to aim toward target

    ds_map_add(conf, "beforeTime", 8); ////time before each shot
    ds_map_add(conf, "afterTime", 8); ////time after each shot
    ds_map_add(conf, "precision", 4); ///precision in degrees. 0= precise, 360 = shoots randomly in all directions

    ////gun flash
    ds_map_add(conf, "gunRange", 10); // range of gunbarrel
    ds_map_add(conf, "gunFlash", s_Flash);
    ds_map_add(conf, "gunFlashShow", true);

    ds_map_add(conf, "burst", 1);
    ds_map_add(conf, "burstRnd", 0);

    ds_map_add(conf, "trackingSpd", 4); /// Speed the enemy rotates at to aim at player

    ds_map_add(conf, "dmg", 1);
    ds_map_add(conf, "knockback", 5);
    ds_map_add(conf, "bulletObject", o_enemy_koboldShot);
    ds_map_add(conf, "flashObject", s_Flash6);

    ds_map_add(conf, "sndAttackWarn",NULL);
    ds_map_add(conf, "sndAttackStrike",NULL);

    return conf;
}

if(_action == "reset")
{
    conf = argument1;
    I_atk_shot_timer = 0;
    I_atk_shot_intBefore = ds_map_find_value(conf, "beforeTime");
    I_atk_shot_intAfter = ds_map_find_value(conf, "afterTime");
    I_atk_shot_state = "before";
    I_atk_shot_burstShots = ds_map_find_value(conf, "burst") + irandom(ds_map_find_value(conf, "burstRnd"));
    I_atk_attackName = ds_map_find_value(conf, "attackName");
    I_atk_shot_process = 0;
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

            I_atk_shot_timer+= dt();

            if (I_atk_shot_timer == 0) {
                audio_play_sound_AI(ds_map_find_value(conf, "sndAttackStrike"));
            }

            // Read confs
            rng = ds_map_find_value(conf, "gunRange");
            precision = ds_map_find_value(conf, "precision");
            dir = faceDir - precision/2+ random(precision);
            spd = ds_map_find_value(conf, "motion");
            var direcSprite = ((faceDir+360)mod 360) div 90;

            if(I_atk_shot_timer>=2 && I_atk_shot_process==0)
            {
                I_atk_shot_process = 1;
                switch(direcSprite)
                {
                    case 4:
                    case 0: var tx = x+25; var ty = y-14; var dir = 20; break;
                    case 1: var tx = x-25; var ty = y-14; var dir = 140; break;
                    case 2: var tx = x-25; var ty = y+14; var dir = 200; break;
                    case 3: var tx = x+25; var ty = y+14; var dir = 330; break;
                }
            }

            if(I_atk_shot_timer>=3 && I_atk_shot_process==1)
            {
                I_atk_shot_process = 2;
                switch(direcSprite)
                {
                    case 4:
                    case 0: var tx = x-25; var ty = y+14; dir = 200; break;
                    case 1: var tx = x+25; var ty = y+14; dir = 330; break;
                    case 2: var tx = x+26; var ty = y-14; dir = 20; break;
                    case 3: var tx = x-26; var ty = y-14; dir = 140; break;
                }
                scr_AI_ammo_set("bolt", 2)
            }

            if(I_atk_shot_timer>=7)
            {
                I_atk_shot_timer = 0;
                I_atk_shot_state = "after";
            }
            break;

        case "after":
            I_atk_shot_process = 0;
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
