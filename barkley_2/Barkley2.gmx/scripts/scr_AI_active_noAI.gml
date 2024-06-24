var _action;
_action = argument0;

if (_action == "config")
{
    return ds_map_create();
}

if (_action == "reset") { }

if (_action == "execute")
{
    return AI_STATERESULT_CONTINUE;
}
