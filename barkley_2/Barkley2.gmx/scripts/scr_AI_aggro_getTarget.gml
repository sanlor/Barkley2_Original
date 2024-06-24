if ds_map_size(I_aggro_map) <= 0 {
    return noone;
}

var key = ds_map_find_first(I_aggro_map);
var size = ds_map_size(I_aggro_map)
var maxaggro = 0;
var target = noone;

for (var i = 0; i < size; i++) {
    var aggro = ds_map_find_value(I_aggro_map, key)
    if (instance_exists(key) and aggro > maxaggro) {
        target = key;
        maxaggro = aggro;
    }
    key = ds_map_find_next(I_aggro_map, key)
}

return target;
