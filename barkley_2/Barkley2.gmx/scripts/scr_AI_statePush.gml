/// scr_AI_statePush(state)

var _newstate;
_newstate = argument0;

if (_newstate >= 0)
{
    var script;
    
    // Push the state onto top of the stack
    ds_list_add(AI_statestack, _newstate);
    
    // Clear paths
    scr_path_delete();
    
    // Prepare the state for execution
    script = ds_map_find_value(_newstate, "script");
    script_execute(script, "reset", _newstate);
    
    // Save to variables (for performance reasons)
    AI_stateTop = _newstate;
    AI_stateTopScript = script;
    AI_stateTopType = scr_AI_checkStateType(AI_stateTop);
    AI_stateCount = ds_list_size(AI_statestack);
}
