/* Checks the type of the provided state.
This is done by comparing it to the internal list of
passive, active, and action states.

Arugments:
arg0 - State map

Returns
0 - Unknown state type
1 - Passive
2 - Active
3 - Action */

var _state;
_state = argument0;

if (_state == NULL) return 0;
if (ds_list_find_index(AI_states_passive, _state) != -1) return AI_STATETYPE_PASSIVE;
if (ds_list_find_index(AI_states_active, _state) != -1) return AI_STATETYPE_ACTIVE;
if (ds_list_find_index(AI_actions, _state) != -1) return AI_STATETYPE_ACTION;
if (AI_globalState_stagger == _state) return AI_STATETYPE_GLOBAL;
return 0;
