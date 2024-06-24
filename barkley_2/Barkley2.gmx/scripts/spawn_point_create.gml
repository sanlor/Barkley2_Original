/// spawn_point_create(x, y, objectIndex)

var spawnPoint = ds_map_create();
spawnPoint[? "uuid"] = uuid_generate();
spawnPoint[? "x"] = argument0;
spawnPoint[? "y"] = argument1;
spawnPoint[? "objectName"] = object_get_name(argument2);
spawnPoint[? "resources"] = 1;
spawnPoint[? "hue"] = c_red;
spawnPoint[? "level"] = 1;
spawnPoint[? "build"] = "default";
return spawnPoint;
