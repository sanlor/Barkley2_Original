/// scr_AI_destroy()

while (ds_list_size(AI_states_global) > 0) {
    var m = ds_list_find_value(AI_states_global, 0);
    ds_map_destroy(m);
    ds_list_delete(AI_states_global, 0);
}
ds_list_destroy(AI_states_global);

while (ds_list_size(AI_states_passive) > 0) {
    var m = ds_list_find_value(AI_states_passive, 0);
    ds_map_destroy(m);
    ds_list_delete(AI_states_passive, 0);
}
ds_list_destroy(AI_states_passive);

while (ds_list_size(AI_states_active) > 0) {
    var m = ds_list_find_value(AI_states_active, 0);
    ds_map_destroy(m);
    ds_list_delete(AI_states_active, 0);
}
ds_list_destroy(AI_states_active);

while (ds_list_size(AI_actions) > 0) {
    var m = ds_list_find_value(AI_actions, 0);
    ds_map_destroy(m);
    ds_list_delete(AI_actions, 0);
}
ds_list_destroy(AI_actions);

while (ds_list_size(AI_movement_scripts) > 0) {
    var m = ds_list_find_value(AI_movement_scripts, 0);
    ds_map_destroy(m);
    ds_list_delete(AI_movement_scripts, 0);
}
ds_list_destroy(AI_movement_scripts);

if (AI_switch != NULL) {
    script_execute(AI_switchScript, "destroy", AI_switch);
    ds_map_destroy(AI_switch);
    AI_switch = NULL;
}

if (AI_globalState_stagger != NULL) {
    ds_map_destroy(AI_globalState_stagger);
    AI_globalState_stagger = NULL;
}

ds_list_destroy(AI_statestack);

