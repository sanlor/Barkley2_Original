// Press buton to skip yo //
if phase[0] <= 0 and phase[2] <= 0 and o_cc_pax_debug.debug_menu = false then
    {
    //if scr_input_check_pressed(KEYID_ACTION, PLAYER1) then 
    if mouse_check_button_pressed(mb_left) then    
        {
        if string_length(textbox_written) < string_length(textbox_goal) then textbox_written = textbox_goal;
        else if textbox_skip = true then
            {
            // Wizard animation //
            o_cc_wizard.wizard_talk = false;
            o_cc_wizard.image_index_head = 0;
            o_cc_wizard.wizard_talk_interval = 0.16;
            
            // Textbox //
            alpha_textbox_timer = 1;
            alpha_textbox_goal = 0;
            textbox_skip = false;
            
            // Next phase //
            phase[0] = 0.8;
            phase[1] += 1;
            }
        }
    }
