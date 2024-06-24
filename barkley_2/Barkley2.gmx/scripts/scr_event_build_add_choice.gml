/// scr_event_build_add_choice(choice_box,choice_text)
/// Adds a choice to the current choice box.
/// Returns the new event to create a path for the added choice.

// Create a new event to go down this event choice.
var event = id; //scr_event_create_child(id);

var choice_and_event = ds_list_create();
ds_list_add(choice_and_event, argument1); // the text for the choice
ds_list_add(choice_and_event, event); // the event related to this choice
ds_list_add(ds_list_find_value(argument0, 4), choice_and_event); // add the action to the list

// Log the event and list to delete at the end.
ds_list_add(scr_event_find_root(id)._lists, choice_and_event);

return event;

