/// menu_selectMethodMouse_mouseover_set(menu)

var menu = argument0;

menu_setSelectMethodMouse(menu, menu_selectMethodMouse_mouseover);
menu[? "mxprev"] = 0;
menu[? "myprev"] = 0;

return menu;
