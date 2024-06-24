/// scr_event_choice_add(choice_text, event_related_to_choice)
/// Adds a choice to the choice box, and links it to an event.

ds_list_add(_choices, argument0);
ds_list_add(_choice_lines, string_count(DIALOGUE_CARRY, argument0) + 1);
ds_list_add(_choice_events, argument1);
_choice_number++;
