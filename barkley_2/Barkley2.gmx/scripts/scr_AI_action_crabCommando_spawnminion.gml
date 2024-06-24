var _action, _retvar,_obj, conf;

_action = argument0;

if (_action = "config")
{
    conf = ds_map_create();
    ds_map_add(conf, "attackName", "jump");
    ds_map_add(conf, "dist", 160);
    ds_map_add(conf, "distRnd", 80);
    ds_map_add(conf, "amount", 3);
    ds_map_add(conf, "interval", 5);
    ds_map_add(conf, "decayTime", 45);
    ds_map_add(conf, "minionObject", o_enemy_ruinedDrone);
    
    return conf;
}

if(_action == "reset")
{
    conf = argument1;
    I_atk_attackName = ds_map_find_value(conf, "attackName");
    I_atk_count = 0;
    I_atk_timer = conf[? "interval"];
}


if(_action = "execute")
{
    conf = argument1;
    a_attackName = I_atk_attackName;
    
    I_atk_timer += dt();
    if (I_atk_timer >= conf[? "interval"]) {
        // TODO naive first implementation of spawn location choice... need to improve
        var dir = random(360);
        var dist = conf[? "dist"] + conf[? "distRnd"];
        var n = instance_create(x + cos(degtorad(dir)) * dist, y - sin(degtorad(dir)) * dist, o_enemy_crabcommando_minionspawn);
        n.enemyObject = conf[? "minionObject"];
        n.decayTime = conf[? "decayTime"];
        
        I_atk_timer -= conf[? "interval"];
        I_atk_count++;
    }
    
    if (I_atk_count >= conf[? "amount"]) {
        return AI_STATERESULT_REMOVE;
    }
    else {
        return AI_STATERESULT_FALLTHROUGH;
    }
}
