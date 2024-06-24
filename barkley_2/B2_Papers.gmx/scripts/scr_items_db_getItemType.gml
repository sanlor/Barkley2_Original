/// scr_items_db_getItemType(item_name)

var name = argument0;
var item = global.items_db[? argument0];
return item[? "type"];
