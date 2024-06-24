/// scr_schematics_candy_add(candyName)

var candyName = argument0;

if (!scr_schematics_candy_has(candyName)) {
    var map = scr_items_db_getCopyOfItem(candyName);
    var list = scr_schematics_candy_getList();
    ds_list_add_map(list, map);
    
    return true;
} else {
    return false;
}
