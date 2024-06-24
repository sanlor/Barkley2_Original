var _action, _retvar, conf, _obj;

/// Does nothing, has a timer that can be used for animation

_action = argument0;

if(_action=="config")
{
    conf = ds_map_create();
    conf[? "attackName"] = "animation";
    conf[? "time"] = 10;
    conf[? "snd"] = NULL_STRING;
    return conf;
}

if(_action=="reset")
{
    conf = argument1;
    I_atk_anim_timer = 0;
    I_atk_anim_max = ds_map_find_value(conf, "time");
    return 0;
}

if(_action = "execute")
{
    conf = argument1;
    a_attackName = ds_map_find_value(conf, "attackName");
    scr_entity_setMoveXY(0, 0);
    
    // Play sound on start
    if (I_atk_anim_timer == 0 and conf[? "snd"] != NULL_STRING) {
        audio_play_sound_AI(conf[? "snd"]);
    }
    
    // Increment animation
    var res;
    if (I_atk_anim_timer < I_atk_anim_max) {
        I_atk_anim_timer += dt();
        res = AI_STATERESULT_CONTINUE;
    }
    else {
        res = AI_STATERESULT_REMOVE;
        a_attackName = "";
    }

    a_attackAnim = I_atk_anim_timer;
    return res;
}
