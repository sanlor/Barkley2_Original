/// scr_AI_statePopSpecific(state)

var state = argument0;

var index = ds_list_find_index(AI_statestack, state);
while (index != -1) {
    ds_list_delete(AI_statestack, index);
    index = ds_list_find_index(AI_statestack, state);
}
