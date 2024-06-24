/// The charge runs forwards and triggers an action when it STAG
/// reaches an enemy.

var _action, conf;

_action = argument0;

if(_action == "config")
{
    conf = ds_map_create();
    ds_map_add(conf, "attackName", "charge");
    ds_map_add(conf, "windUp", 10);
    ds_map_add(conf, "pantingTime", 25);
    ds_map_add(conf, "chargeDistance", 200);
    ds_map_add(conf, "walkSpdMod", 3);
    ds_map_add(conf, "maskDirs", 4);
    ds_map_add(conf, "mask", mask_crescent_24_12); //// Collision mask of the attack
    ds_map_add(conf, "range", 0);
    ds_map_add(conf, "doRetreat", false);
    ds_map_add(conf, "sndAttackWarn",NULL);
    ds_map_add(conf, "sndAttackRun",NULL);
    ds_map_add(conf, "sndAttackStrike",NULL);
    AI_util_action_addDefaultDamage(conf);
    return conf;
}

if (_action = "reset")
{
    conf = argument1;
    /*
    orbusuck = true;
    orbus[0] = instance_create(x, y, o_enemyAttack_stagCharge);
    orbus[1] = instance_create(x, y, o_enemyAttack_stagCharge);
    orbus[2] = instance_create(x, y, o_enemyAttack_stagCharge);
    orbus[3] = instance_create(x, y, o_enemyAttack_stagCharge);
    orbus[4] = instance_create(x, y, o_enemyAttack_stagCharge);
    orbus[5] = instance_create(x, y, o_enemyAttack_stagCharge);
    orbus[6] = instance_create(x, y, o_enemyAttack_stagCharge);
    orbus[7] = instance_create(x, y, o_enemyAttack_stagCharge);
    */
    I_atk_didAttack = false;
    I_atk_chargeDistance = ds_map_find_value(conf, "chargeDistance");
    I_atk_chargeDistanceLeft = I_atk_chargeDistance;
    I_atk_windupTimer = ds_map_find_value(conf, "windUp");
    I_atk_attackDuring = .2;
    I_atk_attackAfter = ds_map_find_value(conf, "pantingTime");;
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
        if (irandom(100) <= 85) 
            Smoke("puff", x + choose(0, 1, -1) * random(16), y + choose(0, 1, -1) * random(16), 0, 8 + random(4));
    }
    else if (I_atk_chargeDistanceLeft > 0)
    {
        if(a_walking == false){audio_play_sound_AI(ds_map_find_value(conf, "sndAttackRun"));}
        a_walking = true;

        scr_entity_setDirSpd(faceDir, walkSpd);

        I_atk_chargeDistanceLeft -= walkSpd * dt();
        if (I_atk_chargeDistanceLeft <= I_atk_chargeDistance * 0.33)
            I_atk_walkSpdMod *= 1 - dt_sec();
        I_atk_walkSpdMod = max(I_atk_walkSpdMod, 0.5);
        
        

        if irandom(100) <= 85 then Smoke("puff", x + choose(0, 1, -1) * random(16), y + choose(0, 1, -1) * random(16), 0, 8 + random(4));
                
        a_attackState = "approach";
        if (instance_exists(I_AI_target) && point_distance(x, y, I_AI_target.x, I_AI_target.y) < 30)
        {
            // Trigger attack
        //    I_atk_chargeDistanceLeft = 0;
            if (!I_atk_didAttack) {
                // Quantized direction
                //var qdir = faceDir;
                //if (conf[? "maskDirs"] > 0) {
                //    qdir = faceDir - (faceDir mod (360 / conf[? "maskDirs"]));
                //}

                // Create a static attack in the direction I am facing!
                var n, ax, ay, _dist;
                //_dist = ds_map_find_value(conf, "range");
                //ax = cos(degtorad(qdir)) * _dist;
                //ay = -sin(degtorad(qdir)) * _dist;
                n = instance_create(x, y, o_enemyAttack_melee_static)
                n.parent = id;
                n.attack_from = id;
                //n.offset_x = ax;
                //n.offset_y = ay;
                n.lifetime = 2;
                n.mask_index = mask_disk_48by48; //ds_map_find_value(conf, "mask");
                //n.image_angle = qdir;
                ds_list_copy(n.target_list, target_list);
                if (instance_exists(I_AI_target)) ds_list_add(n.target_list, I_AI_target.object_index);

                //AI_util_action_attackEntityDamageFromAction(self.id, conf, n, STAT_ATTACK_DMG_NORMAL);
                scr_stats_setAttackStat(n, STAT_ATTACK_DMG_NORMAL, 50);
                scr_stats_setAttackStat(n, STAT_ATTACK_KNOCKBACK, 100);
                n.knockback_type = KNOCKBACKTYPE_FROM_CENTER;
                n.knockback_dir = faceDir + (90 * choose(1, -1));

                I_atk_didAttack = true;
            }
        }
    }
    else
    {
        // Remove the orbus //
        /*
        if (orbusuck)
            {
            orbusuck = false;
            //audio_play_sound_AI(ds_map_find_value(conf, "sndAttackStrike"));
            for (i=0; i<8; i+=1;) 
                {
                if instance_exists(orbus[i]) then with orbus[i] instance_destroy();
                }
            }
          */ 
        if (I_atk_attackAfter > 0)
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
