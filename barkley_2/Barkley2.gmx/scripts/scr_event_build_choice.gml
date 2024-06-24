/// scr_event_build_choice(title,portrait)
/// This script is used to build a choice action.
/// For no title, put NULL_STRING.
/// For no portrait, put NULL.
/// Returns a list to add choices to (pass it into the add choice script).

var action = ds_list_create();
ds_list_add(action, scr_event_action_choice);
ds_list_add(action, argument0); // title
ds_list_add(action, argument1); // portrait
ds_list_add(action, NULL); // extras
// List for adding the choices to.
var choice_list = ds_list_create();
ds_list_add(action, choice_list);
ds_list_add(_event_list, action); // add the action to the list

// Log the list to delete at the end.
var root = scr_event_find_root(id);
ds_list_add(root._lists, choice_list);

return action;