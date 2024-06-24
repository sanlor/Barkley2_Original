/// scr_items_delete(item_type, pos)

var type = argument0;
var pos = argument1;

var count = scr_items_count(type);
if (count == 0) return false;

pos = pos mod count;

var posAt = 0;
var items = scr_items_getAll();
for (var i = 0; i < ds_list_size(items); i++) {
    var item = items[| i];
    if (item[? "type"] == type) {
        if (posAt == pos) {
            ds_list_delete(items, i);
            return true;
        }
        posAt++;
    }
}

return false; // Should not be possible to make it here but, you know... :)
