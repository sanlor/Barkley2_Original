/// scr_savedata_contains(path)

var path = argument0;

var ds = global.savedata;
var field = path;

while (string_pos(".", field) != 0) {
    var pos = string_pos(".", field);
    var f = string_copy(field, 1, pos-1);
    if (!ds_map_exists(ds, f)) {
        return false;
    }
    else {
        ds = ds[? f];
    }
    field = string_copy(field, pos + 1, string_length(field) - pos);
}

return ds_map_exists(ds, field);
