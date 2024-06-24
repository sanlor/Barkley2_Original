var _action, _retvar, conf, _obj;

////debug action. just has timing, doesnt do anything. Use this to test AI Switch config on an enemy
////without having to deal with the specifics of the attacks themselves

_action = argument0;
_retvar = false;

if(_action=="config")
{
    conf = ds_map_create();
    ds_map_add(conf, "attackName", "debug");
    ds_map_add(conf, "beforeTime", 2);
    ds_map_add(conf, "damageTime", .5);
    ds_map_add(conf, "afterTime", 1.5);
    return conf;
}

if(_action=="reset")
{
    conf = argument1;
    I_atk_slsh_timer = 0;
    I_atk_slsh_state = "before";
    I_atk_slsh_didAttack = false;
    I_atk_slsh_intBefore = ds_map_find_value(conf, "beforeTime");
    I_atk_slsh_intAfter = ds_map_find_value(conf, "afterTime");
    return 0;
}

if(_action = "execute")
{
    conf = argument1;
    a_attackName = ds_map_find_value(conf, "attackName");
    scr_entity_setMoveXY(0, 0);
    
    switch(I_atk_slsh_state)
    {
        case "before":
            if(I_atk_slsh_timer<I_atk_slsh_intBefore)
            {
                I_atk_slsh_timer+= dt();
                
            }
            else
            {
                I_atk_slsh_timer = 0;
                I_atk_slsh_state = "damage";
            }
            break;
            
        case "damage":
            if(I_atk_slsh_timer < ds_map_find_value(conf, "damageTime"))
            {
                if(I_atk_slsh_timer==0){}
                I_atk_slsh_timer+= dt();
                if (!I_atk_slsh_didAttack)
                {
                    I_atk_slsh_didAttack = true;
                }
            }
            else
            {
                I_atk_slsh_timer = 0;
                I_atk_slsh_state = "after";
            }
            break;
            
        case "after":
            if (I_atk_slsh_timer < I_atk_slsh_intAfter)
            {
                I_atk_slsh_timer += dt();
            }
            else
            {
                _retvar = true;
            }
            break;
    }

    a_attackState = I_atk_slsh_state;
    a_attackAnim = I_atk_slsh_timer;
    if(_retvar){a_attackName = "";}
}

return _retvar;
