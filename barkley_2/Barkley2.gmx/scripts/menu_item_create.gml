/// menu_item_create(x, y, w, h, draw_script, selected_script)

var item = ds_map_create();
item[? "x"] = argument0;
item[? "y"] = argument1;
item[? "width"] = argument2;
item[? "height"] = argument3;
item[? "draw_script"] = argument4;
item[? "selected_script"] = argument5;

item[? "selectable"] = true;
item[? "disabled"] = false;
item[? "stepScript"] = NULL;

return item;
