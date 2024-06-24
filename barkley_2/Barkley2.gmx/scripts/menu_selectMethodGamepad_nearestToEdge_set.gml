/// menu_selectMethodGamepad_nearestToEdge_set(menu, keyUpOrNull, keyDownOrNull, keyLeftOrNull, keyRightOrNull)

var menu = argument0;

menu_setSelectMethodGamepad(menu, menu_selectMethodGamepad_nearestToEdge);
menu[? "keyUp"] = argument1;
menu[? "keyDown"] = argument2;
menu[? "keyLeft"] = argument3;
menu[? "keyRight"] = argument4;

return menu;
