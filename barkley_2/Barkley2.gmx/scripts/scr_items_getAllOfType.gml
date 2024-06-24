/// scr_items_getAllOfType(item_type)

var type = argument0;

var ret = ds_list_create();
var itemList = scr_items_getAll();
for (var i = 0; i < ds_list_size(itemList); i++) {
    var item = itemList[| i];
    if (type == item[? "type"]) {
        ds_list_add(ret, item);
    }
}

return ret;
