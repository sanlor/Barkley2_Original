/// spawn_state_get(spawnId)

var spawnId = argument0;

var states = scr_savedata_get("spawn");
if (ds_map_exists(states, spawnId)) {
    return states[? spawnId];
} else {
    return NULL;
}
