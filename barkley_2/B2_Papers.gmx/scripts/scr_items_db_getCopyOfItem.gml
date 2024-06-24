/// scr_items_db_getCopyOfItem(item_name)

var name = argument0;

var copy = ds_map_create();
ds_map_copy(copy, global.items_db[? name]);
return copy;
