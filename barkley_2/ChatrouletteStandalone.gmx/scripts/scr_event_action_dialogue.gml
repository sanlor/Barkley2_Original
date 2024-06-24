stt = "dialog";
arg[0] = ds_list_find_value(argument0, 1);
arg[1] = ds_list_find_value(argument0, 3);
global.cinAct = 0;
return id;

exit;
var action = ds_list_create();
ds_list_add(action, scr_event_action_dialogue);
//ds_list_add(action, argument0); // title
//ds_list_add(action, argument1); // portrait
//ds_list_add(action, argument2); // dialogue
ds_list_add(action, NULL); // extras
ds_list_add(_event_list, action); // add the action to the list

return ds_list_size(_event_list) - 1;
