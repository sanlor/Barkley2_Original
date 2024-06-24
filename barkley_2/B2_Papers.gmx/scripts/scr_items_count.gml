/// scr_items_count(item_type)

var type = argument0;

var itemList = scr_items_getAll();
var count = 0;
for (var i = 0; i < ds_list_size(itemList); i++) {
    var item = itemList[| i];
    if (type == item[? "type"]) {
        count++;
    }
}

return count;
