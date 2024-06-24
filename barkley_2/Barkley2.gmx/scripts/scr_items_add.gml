#define scr_items_add
/// scr_items_add(item_map)
/// Attempts to add the item. Returns true, or false if could not add

var item = argument0;

var canAdd = true;

// Check pockets are not full
var pocketItems = scr_items_countAll();
var pocketSize = Jerkin("pockets");
if (pocketItems >= pocketSize) {
    canAdd = false;
}

// Check unique item does not already exist
if (scr_items_isUnique(item)) {
    if (scr_items_has(ITEMTYPE_ZAUBER, item[? "name"])) {
        canAdd = false;
    }
}

if (!canAdd) return false;

// Can add item. Do it!
var itemList = scr_items_getAll();
ds_list_add(itemList, item);
ds_list_mark_as_map(itemList, ds_list_size(itemList) - 1);
return true;


#define scr_items_isUnique
/// scr_items_isUnique(item)
var item = argument0;
var type = item[? "type"];
return type == ITEMTYPE_ZAUBER;