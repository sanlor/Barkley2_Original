/// scr_items_pos_fromMap(itemType, itemMap)

var type = argument0;
var map = argument1;

var itemList = scr_items_getAllOfType(type);
for (var i = 0; i < ds_list_size(itemList); i++) {
    var item = itemList[| i];
    if (map == item) {
        ds_list_destroy(itemList);
        return i;
    }
}

ds_list_destroy(itemList);
return NULL;
