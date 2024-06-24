/// scr_items_get(item_type, pos)
/// Returns the item at position of selected item type, or NULL

var type = argument0;
var pos = argument1;

var count = scr_items_count(type);
if (count == 0) return NULL;

pos = pos mod count;
var items = scr_items_getAllOfType(type);
var item = items[| pos];
ds_list_destroy(items);
return item;
