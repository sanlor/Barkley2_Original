#define scr_items_swap
/// scr_items_swap(itemType, itemPos1, itemPos2)

var type = argument0;
var pos1 = argument1;
var pos2 = argument2;

var realPos1 = realPos(type, pos1);
var realPos2 = realPos(type, pos2);

var items = scr_items_getAll();
var item1 = items[| realPos1];
var item2 = items[| realPos2];
items[| realPos1] = item2;
items[| realPos2] = item1;
ds_list_mark_as_map(items, realPos1);
ds_list_mark_as_map(items, realPos2);

#define realPos
var type = argument0;
var pos = argument1;

var count = scr_items_count(type);
if (count == 0) return NULL;

pos = pos mod count;

var posAt = 0;
var items = scr_items_getAll();
for (var i = 0; i < ds_list_size(items); i++) {
    var item = items[| i];
    if (item[? "type"] == type) {
        if (posAt == pos) {
            return i;
        }
        posAt++;
    }
}

return NULL;