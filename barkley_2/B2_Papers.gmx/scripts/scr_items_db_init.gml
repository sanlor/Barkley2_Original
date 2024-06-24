#define scr_items_db_init
/// This script loads all items into the item DB

global.items_db = ds_map_create();

readItemType("candy.json", ITEMTYPE_CANDY);
//readItemType("zaubers.json", ITEMTYPE_ZAUBER);
//readItemType("items.json", ITEMTYPE_OTHER);

#define readItemType
/// readItemType(filename, itemtype)

var filename = argument0;
var itemtype = argument1;

// Read file to map
var f = file_text_open_read(working_directory + "\" + filename);
var str = "";
while (!file_text_eof(f)) {
    str += file_text_readln(f);
}
file_text_close(f);
var toMap = json_decode(str);

if (toMap == NULL) show_error("Invalid JSON in file " + filename + ", use jsonlint.com to find the error", true)

// Iterate over items and add each one
var key = ds_map_find_first(toMap);
for (var i = 0; i < ds_map_size(toMap); i++) {
    var item = toMap[? key];
    item[? "type"] = itemtype;
    item[? "name"] = key;
    ds_map_add(global.items_db, key, item);
    key = ds_map_find_next(toMap, key);
}