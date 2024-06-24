/// The 'tackle' differs from the charge in that it does
/// not stop when it reaches an enemy, it keeps moving.

var _action, conf;

_action = argument0;

if(_action == "config")
{
    conf = ds_map_create();
    
    ds_map_add(conf, "attackSystem", "old");
    ds_map_add(conf, "attackName", "charge");
    ds_map_add(conf, "walkSpdMod", 1.7);
    ds_map_add(conf, "mask", mask_disk_16by16); //// Collision mask of the attack
    
    ds_map_add(conf, "windupTime", 6.5);
    ds_map_add(conf, "tackleTime", 3.5);
    ds_map_add(conf, "damageTime", 3.5);
    ds_map_add(conf, "afterTime", 1.5);

    ds_map_add(conf, "doRetreat", false);

    ds_map_add(conf, "sndAttackWarn",NULL);
    ds_map_add(conf, "sndAttackStrike",NULL);
    
    AI_util_action_addDefaultDamage(conf);
    
    return conf;
}

if (_action = "reset")
{
    conf = argument1;
    I_atk_chargeDistanceLeft = 100;

    I_atk_chrg_timer = 0;
    I_atk_chrg_state = "windup";
    I_atk_chrg_intWindup = ds_map_find_value(conf, "windupTime");
    I_atk_chrg_intTackle = ds_map_find_value(conf, "tackleTime");
    I_atk_chrg_intAfter = ds_map_find_value(conf, "afterTime");
    I_atk_doRetreat = ds_map_find_value(conf, "doRetreat");
    I_atk_didAttack = false;
    I_atk_walkSpdMod = ds_map_find_value(conf, "walkSpdMod");

    scr_AI_util_aimTarget("prep", NULL);
}


if (_action = "execute")
{
    if (!instance_exists(I_AI_target)) {
        // Quit the attack if target disappeared
        return AI_STATERESULT_REMOVE;
    }

    scr_entity_setMoveXY(0, 0);

    var _tx, _ty, walkspd;
    conf = argument1;
    a_attackName = ds_map_find_value(conf, "attackName");
    _tx = I_AI_target.x;
    _ty = I_AI_target.y;

    // Calculate walkspeed
    var walkSpd = I_atk_walkSpdMod * scr_stats_getEffectiveStat(self, STAT_BASE_SPEED);


    switch(I_atk_chrg_state)
    {
        case "windup":
            scr_AI_util_aimTarget("execute", I_AI_target);
            if(I_atk_chrg_timer == 0) {
                audio_play_sound_AI(ds_map_find_value(conf, "sndAttackWarn"));
            }
            I_atk_chrg_timer += dt();
            a_walking = false;

            if (I_atk_chrg_timer >= ds_map_find_value(conf, "windupTime"))
            {
                // Begin tackle
                I_atk_chrg_state = "tackle";
                I_atk_chrg_timer = 0;

                // Create damage when tackle begins!
                // Create a static attack in the direction I am facing!
                var n, ax, ay;
                ax = cos(degtorad(faceDir)) * 20;
                ay = -sin(degtorad(faceDir)) * 20;
                n = instance_create(x + ax, y + ay, o_enemyAttack_melee_static)
                n.parent = id;
                n.attack_from = id;
                n.offset_x = ax;
                n.offset_y = ay;
                n.lifetime = ds_map_find_value(conf, "damageTime");
                n.mask_index = ds_map_find_value(conf, "mask");
                ds_list_copy(n.target_list, target_list);
                if (instance_exists(I_AI_target)) ds_list_add(n.target_list, I_AI_target.object_index);

                if (ds_map_find_value(conf, "attackSystem") == "new") Attack("damage", id, conf, n);
                else AI_util_action_attackEntityDamageFromAction(self.id, conf, n, STAT_ATTACK_DMG_NORMAL);

                n.knockback_dir = faceDir;
            }
            break;


        case "tackle":
            if (I_atk_chrg_timer < ds_map_find_value(conf, "tackleTime"))
            {
                if (a_walking == false) {
                    audio_play_sound_AI(ds_map_find_value(conf, "sndAttackStrike"));
                }
                a_walking = true;
                scr_entity_setDirSpd(faceDir, walkSpd);

                I_atk_chrg_timer += dt();
            }
            else
            {
                I_atk_chrg_timer = 0;
                I_atk_chrg_state = "after";
            }
            break;



        case "after":
            if (I_atk_chrg_timer < ds_map_find_value(conf, "afterTime"))
            {
                I_atk_chrg_timer += dt();
            }
            else
            {
                a_attackName = "";
                a_attackState = "";
                if (I_atk_doRetreat)
                {
                    var state, queue;
                    // Pick action with preference to rush-in actions
                    queue = ds_queue_create();
                    ds_queue_enqueue(queue, scr_AI_active_retreat);
                    ds_queue_enqueue(queue, scr_AI_active_circle);
                    ds_queue_enqueue(queue, scr_AI_active_approach);
                    scr_AI_statePush(scr_AI_getPreferredState(queue));
                }
                return AI_STATERESULT_REMOVE;
            }
            break;

    }

    a_attackState = I_atk_chrg_state;
    a_attackAnim = I_atk_chrg_timer;

    return AI_STATERESULT_CONTINUE;
}
