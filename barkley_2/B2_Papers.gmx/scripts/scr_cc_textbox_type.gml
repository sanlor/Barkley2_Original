// Type the text //
if string_length(textbox_written) < string_length(textbox_goal) then
    {
    // Wizard animation //
    o_cc_wizard.wizard_talk = true;
    
    // Text pause //
    if textbox_pause > 0 then
        {
        // Tick down //
        textbox_pause -= dt();
        
        // Typing event //
        if textbox_pause <= 0 then
            {
            // Type it out //
            textbox_written = string_copy(textbox_goal, 0, textbox_position);
            
            // Move forward //
            textbox_position += 1;
            
            // Move wizards mouth //
            if string_char_at(textbox_goal, textbox_position) = "." or string_char_at(textbox_goal, textbox_position) = "," or string_char_at(textbox_goal, textbox_position - 1) = "." or string_char_at(textbox_goal, textbox_position - 1) = "," then o_cc_wizard.image_index_head = 0; 
            else if o_cc_wizard.wizard_talk = true then 
                {
                if textbox_wizard_cooldown > 0 then
                    {
                    textbox_wizard_cooldown -= dt();
                    if textbox_wizard_cooldown <= 0 then
                        {
                        o_cc_wizard.image_index_head += irandom(1) + 1;
                        textbox_wizard_cooldown = irandom(0.3) + 0.5;
                        }
                    }
                }
                
            // End //
            if string_length(textbox_written) = string_length(textbox_goal) then
                {
                // Clear the text //
                textbox_position = 0;
                textbox_pause = 0;
                }
            else 
                {
                // Set the length of pause for next typing //
                if mouse_check_button(mb_right) then 
                    {
                    if string_char_at(textbox_goal, textbox_position - 1) = "." then textbox_pause = 2.2;
                    else if string_char_at(textbox_goal, textbox_position - 1) = "," then textbox_pause = 0.8;
                    else if string_char_at(textbox_goal, textbox_position - 1) = "-" then textbox_pause = 0.8;
                    else 
                        {
                        // Normal pause //
                        textbox_pause = 0.16;
                        
                        // Sound //
                        if !audio_is_playing(sn_cc_wizard_talk01) and !audio_is_playing(sn_cc_wizard_talk02) and !audio_is_playing(sn_cc_wizard_talk03) then 
                            {
                            sound = irandom(2);
                            if sound = 0 then audio_play_sound_at_xy(sn_cc_wizard_talk01, false, 1, x, y);
                            else if sound = 1 then audio_play_sound_at_xy(sn_cc_wizard_talk02, false, 1, x, y);
                            else if sound = 2 then audio_play_sound_at_xy(sn_cc_wizard_talk02, false, 1, x, y);
                            }
                        }
                    }
                else
                    {
                    if string_char_at(textbox_goal, textbox_position - 1) = "." then textbox_pause = 5;
                    else if string_char_at(textbox_goal, textbox_position - 1) = "," then textbox_pause = 2.2;
                    else if string_char_at(textbox_goal, textbox_position - 1) = "-" then textbox_pause = 0.8;
                    else 
                        {
                        // Normal pause //
                        textbox_pause = 0.3;
                        
                        // Sound //
                        if !audio_is_playing(sn_cc_wizard_talk01) and !audio_is_playing(sn_cc_wizard_talk02) and !audio_is_playing(sn_cc_wizard_talk03) then 
                            {
                            sound = irandom(2);
                            if sound = 0 then audio_play_sound_at_xy(sn_cc_wizard_talk01, false, 1, x, y);
                            else if sound = 1 then audio_play_sound_at_xy(sn_cc_wizard_talk02, false, 1, x, y);
                            else if sound = 2 then audio_play_sound_at_xy(sn_cc_wizard_talk02, false, 1, x, y);
                            }
                        }
                    }
                }
            }
        else
            {
            if textbox_pause > 0.3 then o_cc_wizard.image_index_head = 0;
            }
        }
    }
else
    {
    // Wizard animation //
    o_cc_wizard.wizard_talk = false;
    o_cc_wizard.image_index_head = 0;
    o_cc_wizard.wizard_talk_interval = 0.16;
    }
