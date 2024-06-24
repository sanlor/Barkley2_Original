// Accept button //
button_accept_hover = scr_cc_button_xy(button_accept_x - 31, button_accept_x + 31, button_accept_y - 7, button_accept_y + 7);

// Press button //
if button_accept_hover = true and button_accept_clickable = true then
    {
    if MiniKeyPress("action") then   
        {
        event_user(0);
        button_accept_click_effect = 0.75;
        }
    }
    
// Timer //
if button_accept_click_effect > 0 then button_accept_click_effect -= dt();
