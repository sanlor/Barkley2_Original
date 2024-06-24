/// spawn_state_exists(spawnId)

var spawnId = argument0;

var states = scr_savedata_get("spawn");
return ds_map_exists(states, spawnId);
