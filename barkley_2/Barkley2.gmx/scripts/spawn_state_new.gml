/// spawn_state_new(spawnPoint)

var spawnPoint = argument0;

var state = ds_map_create();
state[? "resources"] = spawnPoint[? "resources"];
ds_map_add_list(state, "enemies", ds_list_create());

var states = scr_savedata_get("spawn");
var uuid = spawnPoint[? "uuid"];
ds_map_add_map(states, uuid, state);

return state;
