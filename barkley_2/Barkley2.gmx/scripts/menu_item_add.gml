/// menu_item_add(menu, item)

var menu = argument0;
var item = argument1;

ds_list_add(menu[? "items"], item);
item[? "depth"] = 1;

return item;
