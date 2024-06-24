var action = argument0;

if (action = "config")
{
    var conf = ds_map_create();
    conf[? "part"] = noone;
    conf[? "duration"] = 10;
    
    AI_util_action_addDefaultDamage(conf);
    
    return conf;
}

if(action == "reset")
{
    var conf = argument1;
}


if(action = "execute")
{    
    // This action simply turns on the chainsaw, the part itself handles damage dealing
    var conf = argument1;
    
    var part = conf[? "part"];
    var duration = conf[? "duration"];
    
    if (part != noone and instance_exists(part)) {
        part.sawTimer = duration;
    }

    return AI_STATERESULT_FALLTHROUGH_REMOVE;   
}
