/// foreachMap(map, func, args...)

var map = argument0;
var func = argument1;

var key = ds_map_find_first(map);
for (var i = 0; i < ds_map_size(map); i++) {
    script_execute(func, map[? key]);

    key = ds_map_find_next(map, key);
}
