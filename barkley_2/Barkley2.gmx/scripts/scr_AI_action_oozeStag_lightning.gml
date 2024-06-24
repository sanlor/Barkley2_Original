var _action, _retvar,_obj, conf;

_action = argument0;

if (_action = "config")
{
    conf = ds_map_create();
    ds_map_add(conf, "attackName", "bolt");
    ds_map_add(conf, "castTime", 30); // 3 seconds  
    AI_util_action_addDefaultDamage(conf);
    return conf;
}

if (_action == "reset")
{
    conf = argument1;
    I_atk_bolt_x = -999;
    I_atk_bolt_y = -999;
    I_atk_shot_timer = 0;
    I_atk_shot_charge = ds_map_find_value(conf, "castTime");
    I_atk_attackName = ds_map_find_value(conf, "attackName");
}


if (_action == "execute")
{
    if (instance_exists(I_AI_target)) return AI_STATERESULT_REMOVE;
    var _retvar = AI_STATERESULT_CONTINUE; //FALLTHROUGH;
    
    conf = argument1;
    a_attackName = I_atk_attackName;
    scr_entity_setMoveXY(0, 0);
    I_atk_shot_timer += dt();
    
    if (I_atk_bolt_x == -999 && I_atk_shot_timer > I_atk_shot_charge / 2)
    {
        I_atk_bolt_x = I_AI_target.x;
        I_atk_bolt_y = I_AI_target.y;
    }
    if (I_atk_shot_timer > I_atk_shot_charge)
    {
        obj = instance_create(I_atk_bolt_x, I_atk_bolt_y, oEffectLightning);
        obj.hei = 256;
        with (obj) lid = EffectLightning("generate", -1, 0, hei);
        _retvar = AI_STATERESULT_REMOVE;
    }
    
    if (_retvar != AI_STATERESULT_CONTINUE) a_attackName = ""; //FALLTHROUGH
    
    return _retvar;
}
