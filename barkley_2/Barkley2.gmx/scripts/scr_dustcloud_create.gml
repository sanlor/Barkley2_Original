/// scr_dustcloud_create(dustsprite)
/// Creates a new dust cloud

var map = ds_map_create();
map[? "angle"] = 0;
map[? "tiltSin"] = 100;
map[? "sprite"] = argument0;
map[? "particles"] = ds_list_create();

return map;
