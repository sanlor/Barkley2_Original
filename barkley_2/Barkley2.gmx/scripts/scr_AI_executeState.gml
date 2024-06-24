/// scr_AI_executeState(depth)

var dpt = argument0;

if (dpt >= AI_stateCount) {
    return AI_STATERESULT_CONTINUE; // No such state - do nothing
}
else {
    var state = ds_list_find_value(AI_statestack, AI_stateCount - 1 - dpt);
    var state_script = ds_map_find_value(state, "script");
    return script_execute(state_script, "execute", state);
}
