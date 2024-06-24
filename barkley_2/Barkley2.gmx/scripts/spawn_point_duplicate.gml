/// spawn_point_duplicate(spawnPoint)

var new = ds_map_create();
ds_map_copy(new, argument0);
new[? "uuid"] = uuid_generate();
return new;
