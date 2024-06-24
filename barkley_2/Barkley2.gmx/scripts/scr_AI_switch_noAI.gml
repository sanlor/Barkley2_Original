// This switch makes sure AI does nothing

var _action;
_action = argument0;

if (_action == "config")
{
    return ds_map_create();
}

if (_action == "reset")
{
    return 0;
}

if (_action == "execute")
{
    scr_AI_stateClearAll();
}
