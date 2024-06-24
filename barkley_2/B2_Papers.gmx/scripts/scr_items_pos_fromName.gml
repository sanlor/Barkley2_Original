/// scr_items_pos_fromName(itemType, itemName)

var type = argument0;
var name = argument1;

var itemList = scr_items_getAllOfType(type);
for (var i = 0; i < ds_list_size(itemList); i++) {
    var item = itemList[| i];
    if (name == item[? "name"]) {
        ds_list_destroy(itemList);
        return i;
    }
}

ds_list_destroy(itemList);
return NULL;
