/// spawn_map_getClosestSpawnPoint(spawnMap, x, y, maxDist)

var spawnMap = argument0;
var _x = argument1;
var _y = argument2;
var maxDist = argument3;

var closest = NULL;
var key = ds_map_find_first(spawnMap);
for (var i = 0; i < ds_map_size(spawnMap); i++) {
    var point = spawnMap[? key];
    var uuid = point[? "uuid"];
    var dist = point_distance(_x, _y, point[? "x"], point[? "y"]);
    if (dist <= maxDist and string_char_at(uuid, 1) != "_") {
        closest = point;
        maxDist = dist;
    }

    key = ds_map_find_next(spawnMap, key);
}

return closest;
