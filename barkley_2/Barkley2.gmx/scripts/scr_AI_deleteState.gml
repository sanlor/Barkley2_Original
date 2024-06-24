/// scr_AI_deleteState(state_confMap)
/// Deletes the state from the AI, including any attacks registered in the switch

var state = argument0;

// Remove from global, passive, active, action state lists
if (ds_list_find_index(AI_states_global, state) != -1) {
    ds_list_delete(AI_states_global, ds_list_find_index(AI_states_global, state))
}

if (ds_list_find_index(AI_states_passive, state) != -1) {
    ds_list_delete(AI_states_passive, ds_list_find_index(AI_states_passive, state))
}

if (ds_list_find_index(AI_states_active, state) != -1) {
    ds_list_delete(AI_states_active, ds_list_find_index(AI_states_active, state))
}

if (ds_list_find_index(AI_actions, state) != -1) {
    ds_list_delete(AI_actions, ds_list_find_index(AI_actions, state))
}

// Remove from attack lists in switches
if (ds_map_exists(AI_switch, "attacks")) {
    var attacks = AI_switch[? "attacks"];
    for (var i = 0; i < ds_list_size(attacks); i++) {
        var attack = attacks[| i];
        if (attack[? "action"] == state) {
            ds_list_delete(attacks, i);
            i--;
        }
    }
}

// Remove from statestack
scr_AI_statePopSpecific(state);
