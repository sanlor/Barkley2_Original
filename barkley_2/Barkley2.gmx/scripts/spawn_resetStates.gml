/// spawn_resetStates()
// Refills resources and resets existing enemies

var states = scr_savedata_get("spawn");

// Get all spawn state keys
var keys = ds_list_create();
var key = ds_map_find_first(states);
for (var i = 0; i < ds_map_size(states); i++) {
    ds_list_add(keys, key);
    key = ds_map_find_next(states, key);
}

// Iterate through keys
for (var i = 0; i < ds_list_size(keys); i++) {
    var uuid = keys[| i];
    
    spawn_state_delete(uuid);
}
ds_list_destroy(keys);
