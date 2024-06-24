/// scr_event_action_choice(list)
/// An action to display a choice box.
/// The list contains title, portrait, extras, and the choices.

var choice = instance_create(0, 0, o_choice);

choice._event = id;

with choice {
    draw_set_font(global.fn_2);
    // Set the title and portrait.
    _title = ds_list_find_value(argument0, 1);
    _title = string_replace_all(_title, DIALOGUE_QUOTE, '"');
    _title = _title; // used to parse variables
    
    // Change the "What to do?" text
    _title = TextProcessor(_title);
    _title = TextSpecial("strip", _title);
    
    _portrait = Portrait(ds_list_find_value(argument0, 2));
    if (ds_list_find_value(argument0, 2) == "s_port_hoopz")
    {
        if (BodySwap() == "prison") _portrait = Portrait("s_port_hoopzPrison");
    }
    if (_portrait != NULL) {
        _text_width -= sprite_get_width(s_diag_frame);
    }
    // Parse any of the extras.
    //scr_event_choice_parse_extras(ds_list_find_value(argument0, 3));
    
    _choices = ds_list_create();
    _choice_events = ds_list_create();
    _choice_lines = ds_list_create();
    
    // Add all of the choices to this choice box.
    var choices = ds_list_find_value(argument0, 4);
    var choice_length = ds_list_size(choices);
    for (var i = 0; i < choice_length; i++) {
        var choice = ds_list_find_value(choices, i);
        var choice_text = ds_list_find_value(choice, 0);
        // Put in quotes.
        choice_text = string_replace_all(choice_text, DIALOGUE_QUOTE, '"');
        // Replace all variables with the correct variables.
        choice_text = choice_text; // used to parse variables
        // Remove some whitespace.
        choice_text = string_replace_all(choice_text, chr(10), "");
        choice_text = string_replace_all(choice_text, chr(13), "");
        var event = ds_list_find_value(choice, 1);
        event._event_cursor = 0;
        
        // Change the choice text.
        choice_text = TextProcessor(choice_text);
        choice_text = TextSpecial("strip", choice_text);
        
        // Wrap the string around.
        var draw_width = _text_width + string_width("   ");
        var text_length = string_length(choice_text);
        var current_line = "";
        var text_out = "";
        var last_space = 0;
        // Adjusts the position of the last space based on how many carrys have been inserted.
        var carry_adjust = 0;
        for (var j = 1; j <= text_length; j++) {
            // Grab the current character and add it to the current and out string.
            var current_char = string_char_at(choice_text, j);
            text_out += current_char;
            current_line += current_char;
            // If the character is a carry, make the current line nothing.
            if (current_char == DIALOGUE_CARRY) {
                current_line = "";
            }
            // If the character is a space, remember where it was.
            if (current_char == " ") {
               last_space = j + carry_adjust;
            }
            // If this line is full, insert a carry and go to the next one.
            if (string_width(current_line) > draw_width and last_space != 0) {
                text_out = string_insert(DIALOGUE_CARRY, text_out, last_space);
                carry_adjust++;
                current_line = string_copy(text_out, last_space, string_length(text_out) - last_space + 1);
                last_space = 0;
            }
        }

        scr_event_choice_add(string_replace_all(text_out, DIALOGUE_CARRY + " ", DIALOGUE_CARRY), event);
    }
    
    // Figure out the start of each of the pages.
    var next_lines = 0;
    var next_page_start = 0;
    ds_list_add(_page_starts, 0);
    while (next_page_start < _choice_number) {
        // Add the start of a new page!
        ds_list_add(_page_starts, next_page_start);
        next_lines = 0;
        while (next_lines < _lines and next_page_start < _choice_number) {
            next_lines += ds_list_find_value(_choice_lines, next_page_start);
            // If the last choice in the page is too many lines, don't count it, put it in the next page!
            if (next_lines > _lines) {
                break;
            }
            next_page_start++;
        }
    }
}
return choice;
