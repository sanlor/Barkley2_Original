var _action, _retvar,_obj, conf;

_action = argument0;

if (_action = "config")
{
    conf = ds_map_create();
    ds_map_add(conf, "attackName", "shot");
    ds_map_add(conf, "beforeTime", 1); ////time before each
    ds_map_add(conf, "duringTime", 15); ////time after each shot
    ds_map_add(conf, "afterTime", 2); ////time after each shot

    ds_map_add(conf, "dmg", 1);
    ds_map_add(conf, "knockback", 5);
    ds_map_add(conf, "stagger", 100);
    ds_map_add(conf, "attackObject", o_enemyAttack_aoe_ruinedDrone_electricalField);

    ds_map_add(conf, "sndAttackWarn",NULL);
    ds_map_add(conf, "sndAttackStrike",NULL);

    return conf;
}

if(_action == "reset")
{
    conf = argument1;
    I_atk_shot_timer = 0;
    I_atk_shot_intBefore = ds_map_find_value(conf, "beforeTime");
    I_atk_shot_intDuring = ds_map_find_value(conf, "duringTime");
    I_atk_shot_intAfter = ds_map_find_value(conf, "afterTime");
    I_atk_shot_state = "before";
    I_atk_attackName = ds_map_find_value(conf, "attackName");
}


if(_action = "execute")
{
    var _retvar = AI_STATERESULT_CONTINUE;

    conf = argument1;
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
            if (I_atk_shot_timer == 0) {
                audio_play_sound_AI(ds_map_find_value(conf, "sndAttackStrike"));
            }

            // Create bullet
            I_aAI_blt = instance_create(x, y, ds_map_find_value(conf, "attackObject"));
            I_aAI_blt.z = p_bulletOz + z;
            I_aAI_blt.parent = id;
            I_aAI_blt.lifetime = I_atk_shot_intDuring;

            // target list
            ds_list_copy(I_aAI_blt.target_list, target_list);
            if (instance_exists(I_AI_target)) ds_list_add(I_aAI_blt.target_list, I_AI_target.object_index);

            //attack stats
            var dmg;
            dmg = ds_map_find_value(conf, "dmg") * (0.9 + random(0.2));
            scr_stats_setAttackStat(I_aAI_blt, STAT_ATTACK_DMG_NORMAL, dmg);

            scr_stats_setAttackStat(I_aAI_blt, STAT_ATTACK_KNOCKBACK, conf[? "knockback"]);
            I_aAI_blt.knockback_type = KNOCKBACKTYPE_FROM_CENTER;

            var stagger;
            stagger = conf[? "stagger"];
            scr_stats_setAttackStat(I_aAI_blt, STAT_ATTACK_STAGGER, stagger);

            I_atk_shot_state = "during";
            break;

        case "during":
            if(I_atk_shot_timer<I_atk_shot_intDuring)
            {I_atk_shot_timer+= dt();}
            else
            {
                I_atk_shot_state = "after";
                if (instance_exists(I_aAI_blt)) with I_aAI_blt instance_destroy();
            }
            break;

        case "after":
            if(I_atk_shot_timer<I_atk_shot_intAfter)
            {I_atk_shot_timer+= dt();}
            else
            {
                _retvar = AI_STATERESULT_REMOVE;
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
