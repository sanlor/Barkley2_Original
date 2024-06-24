/// ustation_action_scan(menu, button)

var menu = argument0;
var button = argument1;

var indexVar = button[? "indexVar"];
var index = menu[? indexVar];
var schem = scr_schematics_candy_get(index);

// Check if space left
if (Jerkin("pockets free") <= 0) {
    return false;
}

// Check if enough smelt points
var smeltpts = schem[? "smeltpts"]
var smelt = scr_savedata_get("ustation.smelt");
if (smelt < smeltpts) {
    return false;
}

// Print it
var name = schem[? "name"];
var item = scr_items_db_getCopyOfItem(name);
var add = scr_items_add(item);
if (add) {
    scr_savedata_put("ustation.smelt", smelt - smeltpts);
} else {
    ds_map_destroy(item);
}
