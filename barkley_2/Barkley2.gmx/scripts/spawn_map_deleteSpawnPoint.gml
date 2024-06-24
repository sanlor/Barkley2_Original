/// spawn_map_deleteSpawnPoint(spawnMap, spawnPointUUID)

var spawnMap = argument0;
var spawnPointUUID = argument1;

if (ds_map_exists(spawnMap, spawnPointUUID)) {
    var point = spawnMap[? spawnPointUUID];
    ds_map_delete(spawnMap, spawnPointUUID);
    ds_map_destroy(point);
}
