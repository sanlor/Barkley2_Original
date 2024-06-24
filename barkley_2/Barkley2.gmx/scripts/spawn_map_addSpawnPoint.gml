/// spawn_map_addSpawnPoint(spawnMap, spawnPoint)

var spawnMap = argument0;
var spawnPoint = argument1;

var uuid = spawnPoint[? "uuid"];
if (ds_map_exists(spawnMap, uuid)) {
    ds_map_delete(spawnMap, uuid);
}

ds_map_add_map(spawnMap, uuid, spawnPoint);
