/// scr_items_db_getAllItemsOfType(item_type)

var type = argument0;

var ret = ds_list_create();
var key = ds_map_find_first(global.items_db);
for (var i = 0; i < ds_map_size(global.items_db); i++) {
    var item = global.items_db[? key];
    if (type == item[? "type"]) {
        ds_list_add(ret, item);
    }
    key = ds_map_find_next(global.items_db, key);
}

return ret;
