/// Charge runs forwards and triggers when it reaches an enemy.
var _action, conf;
_action = argument0;

if(_action == "config")
{
    conf = ds_map_create();
    ds_map_add(conf, "attackSystem", "old");
    ds_map_add(conf, "attackName", "charge");
    ds_map_add(conf, "walkSpdMod", 1.7);
    ds_map_add(conf, "maskDirs", 4);
    ds_map_add(conf, "mask", mask_crescent_24_12); //// Collision mask of the attack
    ds_map_add(conf, "range", 0);
    ds_map_add(conf, "doRetreat", false);
    ds_map_add(conf, "sndAttackWarn",NULL);
    ds_map_add(conf, "sndAttackRun",NULL);
    ds_map_add(conf, "sndAttackStrike",NULL);
    ds_map_add(conf, "beforeTime", 4.5);
    ds_map_add(conf, "damageTime", 0.2);
    ds_map_add(conf, "afterTime", 2);
    ds_map_add(conf, "chargeDistance", 100);
    ds_map_add(conf, "approachDistance", 20);
    ds_map_add(conf, "damageTimer", 0); // Time static damage box stays
    AI_util_action_addDefaultDamage(conf);
    return conf;
}

if (_action = "reset")
{
    conf = argument1;
    I_atk_damageTimer = ds_map_find_value(conf, "damageTimer");
    I_atk_chargeDistanceLeft = ds_map_find_value(conf, "chargeDistance");
    I_atk_approachDistance = ds_map_find_value(conf, "approachDistance");
    I_atk_windupTimer = ds_map_find_value(conf, "beforeTime");
    I_atk_attackDuring = ds_map_find_value(conf, "damageTime");
    I_atk_attackAfter = ds_map_find_value(conf, "afterTime");
    I_atk_doRetreat = ds_map_find_value(conf, "doRetreat");
    I_atk_didAttack = false;
    I_atk_walkSpdMod = ds_map_find_value(conf, "walkSpdMod");
    scr_AI_util_aimTarget("prep", NULL);
}


if (_action = "execute")
{
    if (!instance_exists(I_AI_target)) {
        // Quit the attack if target disappea
        return AI_STATERESULT_REMOVE;
    }

    scr_entity_setMoveXY(0, 0);
    var _tx, _ty, walkspd;
    conf = argument1;
    _tx = I_AI_target.x;
    _ty = I_AI_target.y;

    a_attackName = ds_map_find_value(conf, "attackName");

    // Calculate walkspeed
    var walkSpd = I_atk_walkSpdMod * scr_stats_getEffectiveStat(self, STAT_BASE_SPEED);

    if (I_atk_windupTimer > 0)
    {
        scr_AI_util_aimTarget("execute", I_AI_target);
        I_atk_windupTimer -= dt();
        a_walking = false;
        if(a_attackState != "before"){audio_play_sound_AI(ds_map_find_value(conf, "sndAttackWarn"));}
        a_attackState = "before";
    }
    else if (I_atk_chargeDistanceLeft > 0)
    {
        if(a_walking == false){audio_play_sound_AI(ds_map_find_value(conf, "sndAttackRun"));}
        a_walking = true;

        scr_entity_setDirSpd(faceDir, walkSpd);

        I_atk_chargeDistanceLeft -= walkSpd * dt();

        if irandom(100) <= 55 then Smoke("puff", x + choose(0, 1, -1) * random(5), y + choose(0, 1, -1) * random(5), 0, 6 + random(2));
        
        
        a_attackState = "approach";
        if (point_distance(x, y, I_AI_target.x, I_AI_target.y) < I_atk_approachDistance)
        {
            // Trigger attack
            I_atk_chargeDistanceLeft = 0;
        }
    }
    else
    {
        // Attack! No movement
        if (I_atk_attackDuring > 0)
        {
            if(a_attackState != "attack"){audio_play_sound_AI(ds_map_find_value(conf, "sndAttackStrike"));}
            a_attackState = "attack";

            if (!I_atk_didAttack) {
                // Quantized direction
                var qdir = faceDir;
                if (conf[? "maskDirs"] > 0) {
                    qdir = faceDir - (faceDir mod (360 / conf[? "maskDirs"]));
                }

                // Create a static attack in the direction I am facing!
                var n, ax, ay, _dist;
                _dist = ds_map_find_value(conf, "range");
                ax = cos(degtorad(qdir)) * _dist;
                ay = -sin(degtorad(qdir)) * _dist;
                n = instance_create(x + ax, y + ay, o_enemyAttack_melee_static)
                n.parent = id;
                n.attack_from = id;
                n.offset_x = ax;
                n.offset_y = ay;
                if (I_atk_damageTimer == 0) n.lifetime = I_atk_attackDuring;
                else n.lifetime = I_atk_damageTimer;
                n.mask_index = ds_map_find_value(conf, "mask");
                n.image_angle = qdir;
                ds_list_copy(n.target_list, target_list);
                if (instance_exists(I_AI_target)) ds_list_add(n.target_list, I_AI_target.object_index);

                if (ds_map_find_value(conf, "attackSystem") == "new") Attack("damage", id, conf, n);
                else AI_util_action_attackEntityDamageFromAction(self.id, conf, n, STAT_ATTACK_DMG_NORMAL);

                n.knockback_dir = qdir;

                I_atk_didAttack = true;
            }

            I_atk_attackDuring -= dt();
        }
        else if (I_atk_attackAfter > 0)
        {
            a_attackState = "after";
            I_atk_attackAfter -= dt();
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
    }
    return AI_STATERESULT_CONTINUE;
}
