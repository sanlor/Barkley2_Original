/// scr_event_action_dialogue(list)
/// An action to display a dialogue box.
/// The list contains title, portrait, dialogue, and extras.
var dialogue = instance_create(0, 0, o_dialogue);

dialogue._event = id;

with dialogue {
    // GZ FIX for ticket 854
    draw_set_font(global.fn_2);
    
    // Parse any of the extras.
    //scr_event_dialogue_parse_extras(ds_list_find_value(argument0, 4));
    
    var text = ds_list_find_value(argument0, 3);
    
    // Do parse
    //_text_width -= 40;
    _portrait = Portrait(ds_list_find_value(argument0, 2));
    if (ds_list_find_value(argument0, 2) == "s_port_hoopz")
    {
        if (BodySwap() == "prison") _portrait = Portrait("s_port_hoopzPrison");
    }
    if (_portrait != NULL) 
    {
        _text_width -= 50;
        _portrait_frames = sprite_get_number(_portrait);
    }
    text = TextProcessor(text);
    TextSpecial("load", global.fn_2, _text_width, text);
    Quest("yapWords", Quest("yapWords") + string_count(" ", text) + 1);
    //text = TextSpecial("normal"); // Obsolete
    //show_debug_message("FULL TEXT = " + text);
    
    // Set the title and portrait.
    _title = ds_list_find_value(argument0, 1);
    if (_title == NULL_STRING) //GZ Addition May 14 2015
    {
        //dialogue._lines = 5;
    }
    else
    {
        _title = string_replace_all(_title, DIALOGUE_QUOTE, '"');
        _title = _title; // used to parse variables
    }
    
    // Change the title / name text.
    _title = TextProcessor(_title);

    // If Al Bhed translation is on, change the dialogue.
    // if (global.AlBhed) text = TextProcessor(text); // Stored in array
    // NOTE!!! New text system would bonk up albehd
}

return dialogue;
