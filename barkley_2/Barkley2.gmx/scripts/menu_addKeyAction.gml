/// menu_addKeyAction(menu, keyid, action, associatedButtonOrNull, soundIdOrNull)

var menu = argument0;
var keyid = argument1;
var action = argument2;
var button = argument3;
var soundId = argument4;

var keyBindings = menu[? "keyBindings"];
var list = ds_list_create();
list[| 0] = action;
list[| 1] = button;
list[| 2] = soundId;
ds_map_add(keyBindings, keyid, list);
