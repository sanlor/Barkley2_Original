var action, conf;
action = argument0;

///Simplest passive AI: becomes active on hero proximity. Ignores walls and direction

if(action == "config")
{
    conf = ds_map_create();
    conf[? "checkFreq"] = 10;
    conf[? "alertAmount"] = 99999;
    conf[? "alertState"] = -1;
    conf[? "sndAlertSound"] = NULL;
    return conf;
}

if(action == "reset")
{
    scr_AI_aggro_configure(99999, 99999, 99999); // Endless aggro distance (never de-aggros)
}

if(action == "execute")
{
    conf = argument1;
    var closest;
    closest = scr_actor_getNearestOfTypeList(target_list, x, y);
    
    ///If not currently alerted
    ///the AI looks for the hero at regular intervals.
    if (instance_exists(closest))
    {
        scr_AI_aggro_addAggro(closest, conf[? "alertAmount"]);
        
        audio_play_sound_AI(conf[? "sndAlertSound"]);
        
        // Push next state if applicable
        var state = conf[? "alertState"];
        if (state != -1) {
            scr_AI_stateClearAll();
            scr_AI_statePush(state);
        }
    }
    return AI_STATERESULT_CONTINUE;
}
