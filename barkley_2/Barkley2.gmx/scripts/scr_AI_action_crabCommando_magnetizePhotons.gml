var _action, _retvar,_obj, conf;

_action = argument0;

if (_action = "config")
{
    conf = ds_map_create();
    ds_map_add(conf, "attackName", "magnetize");
    ds_map_add(conf, "speedBoost", 4);
    ds_map_add(conf, "boostTime", 10);
    
    return conf;
}

if(_action == "reset")
{
    conf = argument1;
    I_atk_attackName = ds_map_find_value(conf, "attackName");
    I_atk_magnetize_timer = 0;
}


if(_action = "execute")
{
    conf = argument1;
    a_attackName = I_atk_attackName;
    
    var speedBoost = conf[? "speedBoost"];
    var boostTime = conf[? "boostTime"];
    
    if (I_atk_magnetize_timer < boostTime) {
        with (o_enemyAttack_photonblast_area) {
            scr_entity_addDirSpd(move_dir, (speedBoost / boostTime) * dt());
        }
        I_atk_magnetize_timer += dt();
        return AI_STATERESULT_FALLTHROUGH;
    }
    else {
        return AI_STATERESULT_FALLTHROUGH_REMOVE;
    }
}
