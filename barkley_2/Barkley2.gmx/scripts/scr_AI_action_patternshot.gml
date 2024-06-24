var _action, _retvar,_obj, conf;

_action = argument0;

if (_action = "config")
{
    conf = scr_AI_action_shot("config",-1);

    ds_map_add(conf, "shotCount", 3); /////amount of bullets flying out for each shot
    ds_map_add(conf, "shotSpread",40); /////angle of bullet spread
    ds_map_add(conf, "shotAngle",0); ////direction of shot
    ds_map_add(conf, "angle_isAbsolute", false); ///if false, direction uses characters facing angle as 0degrees

    ds_map_add(conf, "shotCountMod" , 0);///modifier to shotcount after each burst
    ds_map_add(conf, "shotSpreadMod" , 0);///modifier to spread count after each burst
    ds_map_add(conf, "shotAngleMod" , 0);///modifier to angle after each burst

    ds_map_add(conf, "dmg" , 1); // tempfix

    return conf;
}

if(_action == "reset")
{
    conf = argument1;
    scr_AI_action_shot("reset",conf);
    //I_atk_shot_timer = 0;
    //I_atk_shot_state = "before";
    //I_atk_shot_burstShots = ds_map_find_value(conf, "burst") + irandom(ds_map_find_value(conf, "burstRnd"));
    //I_atk_attackName = ds_map_find_value(conf, "attackName");
    //scr_AI_util_aimTarget("prep", NULL);
    //aAI_tracking = 360;
    //aAI_trackSpeed = ds_map_find_value(conf, "trackingSpd");

    I_atk_shot_angleAbs = ds_map_find_value(conf, "angle_isAbsolute");
    I_atk_shot_shotcount = ds_map_find_value(conf, "shotCount");
    I_atk_shot_shotspread = ds_map_find_value(conf, "shotSpread");
    I_atk_shot_angle = ds_map_find_value(conf, "shotAngle");

    I_atk_shot_shotcountMod = ds_map_find_value(conf, "shotCountMod");
    I_atk_shot_shotspreadMod = ds_map_find_value(conf, "shotSpreadMod");
    I_atk_shot_angleMod = ds_map_find_value(conf, "shotAngleMod");
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
            //show_debug_message("scr_AI_action_patternshot(): before");
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
            var _blt, dir, spd, rng, precision;
            //show_debug_message("scr_AI_action_patternshot(): attack");
            if (I_atk_shot_timer == 0) {
                audio_play_sound_AI(ds_map_find_value(conf, "sndAttackStrike"));
            }

            var pattern = ds_map_find_value(conf,"shotAimPattern"); ///patterns: circle, cross, x, 8dir, horiz, vert
            var patternAngle = ds_map_find_value(conf, "shotAimWiggleRoom");

            var pickedAngle;

            var angle = I_atk_shot_angle;//-I_atk_shot_shotspread/2;
            if(!I_atk_shot_angleAbs){angle += faceDir;}

            switch(pattern)
            {
                case "circle": ///circle pattern is not limited
                    pickedAngle = angle;
                    break;
                case "cross":
                    pickedAngle = round(angle / 90) * 90;
                    break;
                case "x":
                    var xAngle = ds_map_find_value(conf, "xpatternAngle");
                    pickedAngle = floor(angle / 90) * 90;
                    switch(pickedAngle)
                    {
                        case 0: pickedAngle = xAngle; break;
                        case 90: pickedAngle = 180-xAngle; break;
                        case 180: pickedAngle = 180+xAngle; break;
                        case 270: pickedAngle = 360-xAngle; break;
                    }
                    break;
                case "8dir":
                    pickedAngle = round(angle / 45) * 45;
                    break;
                case "horiz":
                    pickedAngle = round(angle / 180) * 180;
                    break;
                case "vert":
                    pickedAngle = round((angle+90) / 180) * 180 -90;
                    break;
            }

            angle = median(pickedAngle,pickedAngle+patternAngle,pickedAngle-patternAngle);

            angle = angle-I_atk_shot_shotspread/2;
            var angleadd = I_atk_shot_shotspread/I_atk_shot_shotcount;

            if(I_atk_shot_shotcount>0)
            {
                ///read confs
                rng = ds_map_find_value(conf, "gunRange");
                precision = ds_map_find_value(conf, "precision");
                spd = ds_map_find_value(conf, "motion");

                repeat(I_atk_shot_shotcount)
                {
                    //show_debug_message("scr_AI_action_patternshot(): shooting a bullet");
                    dir = angle - precision/2+ random(precision);

                    // Create bullet
                    var tx = x + p_bulletOx + (cos(degtorad(dir))*rng);
                    var ty = y + p_bulletOy - (sin(degtorad(dir))*rng);
                    _blt = instance_create(tx,ty,ds_map_find_value(conf, "bulletObject"));
                    _blt.z = p_bulletOz;

                    ////direct bullet
                    with _blt scr_entity_setDirSpd(dir, spd);
                    _blt.shotEffect = ds_map_find_value(conf, "flashObject");
                    _blt.life = 1 + ds_map_find_value(conf, "range")/ds_map_find_value(conf, "motion");
                    ds_list_copy(_blt.target_list, target_list);
                    if (instance_exists(I_AI_target)) ds_list_add(_blt.target_list, I_AI_target.object_index);

                    ////attack stats
                    var dmg;
                    dmg = ds_map_find_value(conf, "dmg") * (0.9 + random(0.2));
                    scr_stats_setAttackStat(_blt, STAT_ATTACK_DMG_NORMAL, dmg);
            
                    scr_stats_setAttackStat(_blt, STAT_ATTACK_KNOCKBACK, conf[? "knockback"]);

                    _blt.dmg_dir = angle;

                    angle+=angleadd;
                }
            }

            // Create gun flash
            if (ds_map_find_value(conf, "gunFlashShow")) {
                _flash = instance_create(tx, ty, o_flash);
                _flash.sprite_index = ds_map_find_value(conf, "gunFlash");
                _flash.image_angle = dir;
                _flash.z = p_bulletOz;
            }

            I_atk_shot_state = "after";
            break;

        case "after":
            //show_debug_message("scr_AI_action_patternshot(): after");
            if(I_atk_shot_timer<I_atk_shot_intAfter)
            {I_atk_shot_timer += dt();}
            else
            {
                I_atk_shot_burstShots -=1;

                I_atk_shot_shotcount += I_atk_shot_shotcountMod;
                I_atk_shot_shotspread += I_atk_shot_shotspreadMod;
                I_atk_shot_angle += I_atk_shot_angleMod;

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
