var _action, _retvar,_obj, conf;

_action = argument0;
_retvar = false;

if (_action = "config")
{
    conf = ds_map_create();
    ds_map_add(conf, "attackName", "net");
    ds_map_add(conf, "range", 128); ////range in pixels of the attack
    ds_map_add(conf, "motion", 16); // Speed of Projectile
    ds_map_add(conf, "aim", true); // If true, changes dir to aim toward target

    ds_map_add(conf, "beforeTime", 1); ////time before each shot
    ds_map_add(conf, "afterTime", 1); ////time after each shot
    ds_map_add(conf, "precision", 8); ///precision in degrees. 0= precise, 360 = shoots randomly in all directions

    ////gun flash
    ds_map_add(conf, "gunRange", 10); // range of gunbarrel
    ds_map_add(conf, "gunFlash", s_Flash);
    ds_map_add(conf, "gunFlashShow", true);

    ds_map_add(conf, "burst", 1);
    ds_map_add(conf, "burstRnd", 0);

    ds_map_add(conf, "trackingSpd", 8); /// Speed the enemy rotates at to aim at player

    ds_map_add(conf, "dmg", 2);
    ds_map_add(conf, "knockback", 0);

    ds_map_add(conf, "lockdown", 480); //How long Lockdown lasts for if you don't shoot out these pegs
    ds_map_add(conf, "pegs", 6); //How many pegs/tags/nails you want for this net type bullet
    ds_map_add(conf, "pegsdistribution", true); //True = Perfect Circle, False = Randomized all over
    ds_map_add(conf, "pegsdistance", 48); //How far the radius is. For False, this is the max value in the circle the peg can be

    ds_map_add(conf, "bulletObject", o_enemyAttack_bulletNet);
    ds_map_add(conf, "flashObject", s_Flash6);

    ds_map_add(conf, "sndAttackWarn",NULL);
    ds_map_add(conf, "sndAttackStrike",NULL);

    return conf;
}

if(_action == "reset")
{
    conf = argument1;
    I_atk_warn_sound = noone;
    I_atk_shot_timer = 0;
    I_atk_shot_intBefore = ds_map_find_value(conf, "beforeTime");
    I_atk_shot_intAfter = ds_map_find_value(conf, "afterTime");
    I_atk_shot_state = "before";
    I_atk_shot_burstShots = ds_map_find_value(conf, "burst") + irandom(ds_map_find_value(conf, "burstRnd"));
    I_atk_attackName = ds_map_find_value(conf, "attackName");
    scr_AI_util_aimTarget("prep", NULL);
    aAI_tracking = 360;
    aAI_trackSpeed = ds_map_find_value(conf, "trackingSpd");
    return 0;
}


if(_action = "execute")
{
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
                if(I_atk_shot_timer==0){I_atk_warn_sound = audio_play_sound_AI(ds_map_find_value(conf, "sndAttackWarn"));}
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
                if (I_atk_warn_sound != noone) audio_stop_sound(I_atk_warn_sound);
                audio_play_sound_AI(ds_map_find_value(conf, "sndAttackStrike"));
            }

            // Read confs
            rng = ds_map_find_value(conf, "gunRange");
            precision = ds_map_find_value(conf, "precision");
            dir = faceDir - precision/2+ random(precision);
            spd = ds_map_find_value(conf, "motion");
            lock = ds_map_find_value(conf, "lockdown");
            pegs = ds_map_find_value(conf, "pegs");
            pegsdistribution = ds_map_find_value(conf, "pegsdistribution");
            pegsdistance = ds_map_find_value(conf, "pegsdistance");

            // Create bullet & SET NET
            var tx = x + p_bulletOx + (cos(degtorad(dir))*rng);
            var ty = y + p_bulletOy - (sin(degtorad(dir))*rng);
            _blt = instance_create(tx, ty, ds_map_find_value(conf, "bulletObject"));
            _blt.z = p_bulletOz;
            _blt.lockdown = lock;
            _blt.pegs = pegs;
            _blt.defAngle = random(360);
            _blt.pegsdistribution = pegsdistribution;
            _blt.pegsdistance = pegsdistance;

            ////direct bullet
            with _blt scr_entity_setDirSpd(dir, spd);
            _blt.shotEffect = ds_map_find_value(conf, "flashObject");
            _blt.life = 1 + ds_map_find_value(conf, "range")/ds_map_find_value(conf, "motion");
            ds_list_copy(_blt.target_list, target_list);
            if (instance_exists(I_AI_target)) ds_list_add(_blt.target_list, I_AI_target.object_index);

            //attack stats
            var dmg;
            dmg = ds_map_find_value(conf, "dmg") * (0.9 + random(0.2));
            scr_stats_setAttackStat(_blt, STAT_ATTACK_DMG_NORMAL, dmg);

            scr_stats_setAttackStat(_blt, STAT_ATTACK_KNOCKBACK, conf[? "knockback"]);

            _blt.dmg_dir = faceDir;

            I_atk_shot_state = "after";
            break;

        case "after":
            if(I_atk_shot_timer<I_atk_shot_intAfter)
            {I_atk_shot_timer+= dt();}
            else
            {
                I_atk_shot_burstShots -=1;
                if(I_atk_shot_burstShots>0){I_atk_shot_state = "before";}
                else{_retvar = true;}
            }
            break;
    }

    a_attackState = I_atk_shot_state;
    a_attackAnim = I_atk_shot_timer;
    if(_retvar){a_attackName = "";}
}

return _retvar;
