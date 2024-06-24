var _action, _retvar,_obj, conf;

_action = argument0;

if (_action = "config")
{
    conf = ds_map_create();
    ds_map_add(conf, "attackName", "laser_whip");
    ds_map_add(conf, "range", 5); ////logic is different here, range is how long the beam lasts
    ds_map_add(conf, "motion", 1); //Starting speed
    ds_map_add(conf, "motionacc", 0); //Acceleration speed

    ds_map_add(conf, "aim", true); // If true, changes dir to aim toward target
    ds_map_add(conf, "type", 0); // If true, changes dir to aim toward target

    ds_map_add(conf, "chargeTime", 5); ////time it takes to charge up and start motion of laser
    ds_map_add(conf, "coolTime", 5); ////cooldown period after beam is depleted
    ds_map_add(conf, "precision", 0); ///precision in degrees. 0= precise, 360 = shoots randomly in all directions

    ds_map_add(conf, "trackingSpd", 24);

    // If true, will fire double lazers in an X pattern
    ds_map_add(conf, "dualLazer", false);

    ds_map_add(conf, "bulletObject", o_enemyAttack_areaLaserWhip);
    ds_map_add(conf, "gunRange", 12);
    ds_map_add(conf, "sndAttackWarn","skirmisher_laser_warn");
    ds_map_add(conf, "sndAttackStrike","skirmisher_laser_active");
    ds_map_add(conf, "sndAttackEnd","skirmisher_laser_end");

    AI_util_action_addDefaultDamage(conf);

    return conf;
}

if(_action == "reset")
{
    conf = argument1;
    I_atk_shot_timer = 0;
    I_atk_shot_intBefore = ds_map_find_value(conf, "chargeTime");
    I_atk_shot_intAfter = ds_map_find_value(conf, "coolTime");
    I_atk_shot_state = "before";
    I_atk_attackName = ds_map_find_value(conf, "attackName");

    faceDir = faceDir;

    scr_AI_util_aimTarget("prep", NULL);
    aAI_tracking = 360;
    aAI_trackSpeed = ds_map_find_value(conf, "trackingSpd");
}


if(_action = "execute")
{
    var _retvar = AI_STATERESULT_FALLTHROUGH;

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
            dir = faceDir - precision/2+ random(precision);
            spd = ds_map_find_value(conf, "motion");

            //Set up look towards bullet dealio

            if (!conf[? "dualLazer"]) {
                // Single lazer
                // Create bullet
                var tx = x + p_bulletOx + (cos(degtorad(dir))*rng);
                var ty = y + p_bulletOy - (sin(degtorad(dir))*rng);
                _blt = instance_create(tx, ty, ds_map_find_value(conf, "bulletObject"));
                _blt.type =ds_map_find_value(conf, "type"); //0 for Lash, 1 for Circle
                _blt.z = p_bulletOz;

                // Store in local variable for rendering lazer beam toward target
                _beam=_blt;



                ////direct bullet
                with _blt scr_entity_setDirSpd(dir, spd);
                _blt.spd=spd;
                _blt.dir=dir;
                _blt._origin = id;
                _blt.acc = ds_map_find_value(conf, "motionacc");
                _blt.life = 1 + ds_map_find_value(conf, "range"); //logic for this bullet is different
                ds_list_copy(_blt.target_list, target_list);
                if (instance_exists(I_AI_target)) ds_list_add(_blt.target_list, I_AI_target.object_index);

                //attack stats
                AI_util_action_attackEntityDamageFromAction(self.id, conf, _blt, STAT_ATTACK_DMG_ZAUBER);
                _blt.dmg_dir = faceDir;
            } else {
                // Double lazer
                var diverge = 12 + random(40);
                var joinDist = 40 + random(80);

                var tx = x + p_bulletOx + (cos(degtorad(dir))*rng);
                var ty = y + p_bulletOy - (sin(degtorad(dir))*rng);
                var dx =  cos(degtorad(dir + 90)) * diverge;
                var dy = -sin(degtorad(dir + 90)) * diverge;
                var joinx = tx + (cos(degtorad(dir)) * joinDist);
                var joiny = ty - (sin(degtorad(dir)) * joinDist);

                // Create bullet -1-
                _blt = instance_create(tx+dx, ty+dy, ds_map_find_value(conf, "bulletObject"));
                _blt.type =ds_map_find_value(conf, "type"); //0 for Lash, 1 for Circle
                _blt.z = p_bulletOz;

                // Store in local variable for rendering lazer beam toward target
                _beam=_blt;

                ////direct bullet
                var bltdir = point_direction(tx+dx, ty+dy, joinx, joiny);
                with _blt scr_entity_setDirSpd(bltdir, spd);
                _blt.spd=spd;
                _blt.dir=bltdir;
                _blt._origin = id;
                _blt.acc = ds_map_find_value(conf, "motionacc");
                _blt.life = 1 + ds_map_find_value(conf, "range"); //logic for this bullet is different
                ds_list_copy(_blt.target_list, target_list);
                if (instance_exists(I_AI_target)) ds_list_add(_blt.target_list, I_AI_target.object_index);

                //attack stats
                AI_util_action_attackEntityDamageFromAction(self.id, conf, _blt, STAT_ATTACK_DMG_ZAUBER);
                _blt.dmg_dir = faceDir;


                // Create bullet -2-
                _blt = instance_create(tx-dx, ty-dy, ds_map_find_value(conf, "bulletObject"));
                _blt.type =ds_map_find_value(conf, "type"); //0 for Lash, 1 for Circle
                _blt.z = p_bulletOz;

                // Store in local variable for rendering lazer beam toward target
                _beam2=_blt;

                ////direct bullet
                var bltdir = point_direction(tx-dx, ty-dy, joinx, joiny);
                with _blt scr_entity_setDirSpd(bltdir, spd);
                _blt.spd=spd;
                _blt.dir=bltdir;
                _blt._origin = id;
                _blt.acc = ds_map_find_value(conf, "motionacc");
                _blt.life = 1 + ds_map_find_value(conf, "range"); //logic for this bullet is different
                ds_list_copy(_blt.target_list, target_list);
                if (instance_exists(I_AI_target)) ds_list_add(_blt.target_list, I_AI_target.object_index);

                //attack stats
                AI_util_action_attackEntityDamageFromAction(self.id, conf, _blt, STAT_ATTACK_DMG_ZAUBER);
                _blt.dmg_dir = faceDir;
            }

            I_atk_shot_state = "after";
            break;

        case "after":
            if (I_atk_shot_timer<I_atk_shot_intAfter) {
                if (I_atk_shot_timer == 0)
                { audio_play_sound_AI(ds_map_find_value(conf, "sndAttackEnd")); }
                I_atk_shot_timer+= dt();
            }
            else {
                 _retvar = AI_STATERESULT_FALLTHROUGH_REMOVE;
            }
            break;
    }

    a_attackState = I_atk_shot_state;
    a_attackAnim = I_atk_shot_timer;

    if (_retvar != AI_STATERESULT_FALLTHROUGH) {
       a_attackName = "";
    }

    return _retvar;
}
