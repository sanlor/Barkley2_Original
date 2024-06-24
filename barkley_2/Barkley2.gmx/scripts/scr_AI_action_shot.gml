var _action, _retvar,_obj, conf;

_action = argument0;

if (_action = "config")
{
    conf = ds_map_create();
    ds_map_add(conf, "attackSystem", "old");
    ds_map_add(conf, "attackName", "shot");
    ds_map_add(conf, "range", 120); ////range in pixels of the attack
    ds_map_add(conf, "motion", 30);
    ds_map_add(conf, "motionRnd", 2);
    ds_map_add(conf, "aim", true); // If true, changes dir to aim toward target

    ds_map_add(conf, "beforeTime", 4); ////time before each shot
    ds_map_add(conf, "afterTime", 2); ////time after each shot
    ds_map_add(conf, "precision", 4); ///precision in degrees. 0= precise, 360 = shoots randomly in all directions

    ////gun flash
    ds_map_add(conf, "gunRange", 10); // range of gunbarrel
    ds_map_add(conf, "gunFlash", s_Flash);
    ds_map_add(conf, "gunFlashShow", true);
    ds_map_add(conf, "bulletZ", 0);

    ds_map_add(conf, "shotAimPattern", "circle"); ///patterns: circle, cross, x, 8dir, horiz, vert
    ds_map_add(conf, "shotAimWiggleRoom", 360); ///angle it can deviate from the aim pattern
    ds_map_add(conf, "xpatternAngle", 45); ///angle of the X pattern

    ds_map_add(conf, "burst", 1);
    ds_map_add(conf, "burstRnd", 0);

    ds_map_add(conf, "trackingSpd", 4); /// Speed the enemy rotates at to aim at player

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

            var pattern = ds_map_find_value(conf,"shotAimPattern"); ///patterns: circle, cross, x, 8dir, horiz, vert
            var patternAngle = ds_map_find_value(conf, "shotAimWiggleRoom");

            rng = ds_map_find_value(conf, "gunRange");
            precision = ds_map_find_value(conf, "precision");
            spd = ds_map_find_value(conf, "motion") + random(ds_map_find_value(conf, "motionRnd"));

            var pickedAngle;

            switch(pattern)
            {
                case "circle": ///circle pattern is not limited
                    pickedAngle = faceDir;
                    break;
                case "cross":
                    pickedAngle = round(faceDir / 90) * 90;
                    break;
                case "x":
                    var xAngle = ds_map_find_value(conf, "xpatternAngle");
                    pickedAngle = floor(faceDir / 90) * 90;
                    switch(pickedAngle)
                    {
                        case 0: pickedAngle = xAngle; break;
                        case 90: pickedAngle = 180-xAngle; break;
                        case 180: pickedAngle = 180+xAngle; break;
                        case 270: pickedAngle = 360-xAngle; break;
                    }
                    break;
                case "8dir":
                    pickedAngle = round(faceDir / 45) * 45;
                    break;
                case "horiz":
                    pickedAngle = round(faceDir / 180) * 180;
                    break;
                case "vert":
                    pickedAngle = round((faceDir+90) / 180) * 180 -90;
                    break;
            }

            dir = median(faceDir,pickedAngle+patternAngle,pickedAngle-patternAngle)- precision/2+ random(precision);

            // Create bullet
            var tx = x + p_bulletOx + (cos(degtorad(dir))*rng);
            var ty = y + p_bulletOy - (sin(degtorad(dir))*rng);
            _blt = instance_create(tx, ty, ds_map_find_value(conf, "bulletObject"));
            _blt.z = p_bulletOz + ds_map_find_value(conf, "bulletZ");
            _blt.attack_from = id;
            
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
            
            // CGREM bullet fix
            ds_list_add(_blt.target_list, EnemyCombatActor);
            ds_list_add(_blt.hit_list, self.id);
            
            
            if (ds_map_find_value(conf, "attackSystem") == "new") Attack("damage", id, conf, _blt);
            else AI_util_action_attackEntityDamageFromAction(self.id, conf, _blt, STAT_ATTACK_DMG_NORMAL);
            
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
