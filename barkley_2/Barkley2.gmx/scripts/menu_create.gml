/// menu_create()

var menu = ds_map_create();
menu[? "items"] = ds_list_create();
menu[? "decals"] = ds_list_create();
menu[? "selected"] = NULL;
menu[? "keyBindings"] = ds_map_create();

menu_selectMethodGamepad_nearestToEdge_stickdpad_set(menu);
menu_selectMethodMouse_mouseover_set(menu);
menu[? "focused"] = true;
menu[? "stepScript"] = NULL;

return menu;
