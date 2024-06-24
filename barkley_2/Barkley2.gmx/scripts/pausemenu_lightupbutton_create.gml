/// pausemenu_lightupbutton_create(x, y, w, h, text, font, action)

var item = menu_item_create(argument0, argument1, argument2, argument3,
        pausemenu_lightupbutton_draw,
        ustation_button_selected);

item[? "text"] = argument4;
item[? "font"] = argument5; 
item[? "action"] = argument6;

item[? "sndSelect"] = scr_soundbank_pickSound("pausemenu_click");
item[? "sndBuzz"] = scr_soundbank_pickSound("pausemenu_click");

return item;
