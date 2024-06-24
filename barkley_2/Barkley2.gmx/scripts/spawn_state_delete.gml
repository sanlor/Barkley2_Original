/// spawn_state_delete(spawnId)

var spawnId = argument0;

var states = scr_savedata_get("spawn");
if (ds_map_exists(states, spawnId)) {
    ds_map_delete(states, spawnId);
}
