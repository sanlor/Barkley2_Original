/// scr_savedata_get(path)

var path = argument0;

var ds = global.savedata;
var field = path;

while (string_pos(".", field) != 0) {
    var pos = string_pos(".", field);
    var f = string_copy(field, 1, pos-1);
    if (!ds_map_exists(ds, f)) {
        show_error("Save-game field does not exist: " + path + "(Digdown failure at " + f + ")", true);
    }
    else {
        ds = ds[? f];
    }
    field = string_copy(field, pos + 1, string_length(field) - pos);
}

if (!ds_map_exists(ds, field)) {
    show_error("Save-game field does not exist: " + path, true);
}

return ds[? field];
