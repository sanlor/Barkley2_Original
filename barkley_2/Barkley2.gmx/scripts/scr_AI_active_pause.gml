var _action, conf;

_action = argument0;

if(_action == "config")
{
    conf = ds_map_create();
    ds_map_add(conf, "time", 10);
    return conf;
}

if (_action = "reset")
{
    conf = argument1;
    I_aAI_time = ds_map_find_value(conf, "time") + random(10);
    return 0;
}


if (_action = "execute")
{
    scr_entity_setMoveXY(0, 0);
    I_aAI_time -= dt();
    if (I_aAI_time <= 0)
    {
        a_walking = 1;
        return true;
    }
    
    // Do animation
    a_walking = 2;
    return false;
}
