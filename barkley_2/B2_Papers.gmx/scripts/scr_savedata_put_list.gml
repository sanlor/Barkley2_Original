/// scr_savedata_put_list(path, list)

var path = argument0;
var value = argument1;

// Dig down to the field specified by path
var ds = global.savedata;
var field = path;
while (string_pos(".", field) != 0) {
    var pos = string_pos(".", field);
    var f = string_copy(field, 1, pos-1);
    if (!ds_map_exists(ds, f)) {
        var ds_new = ds_map_create();
        ds_map_add_map(ds, f, ds_new);
        ds = ds_new;
    }
    else {
        ds = ds[? f];
    }
    field = string_copy(field, pos + 1, string_length(field) - pos);
}

// Set field
if (ds_map_exists(ds, field)) {
    ds_map_delete(ds, field)   
}
ds_map_add_list(ds, field, value);
