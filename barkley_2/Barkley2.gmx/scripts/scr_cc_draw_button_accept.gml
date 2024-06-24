// Draw button to accept things //
// Activated or Hover // 
draw_set_alpha(alpha_event * 0.5);
if button_accept_click_effect > 0 then draw_set_color(make_color_rgb(250, 0, 40));
else
    {
    if button_accept_hover = true then draw_set_color(make_color_rgb(40, 190, 250)); 
    else draw_set_color(o_cc_data.color_event);
    }
draw_rectangle(button_accept_x - 30, button_accept_y - 7, button_accept_x + 30, button_accept_y + 6, false);

// Frames //
draw_sprite_ext(s_cc_button_accept, 0, button_accept_x, button_accept_y, 1, 1, 0, c_white, alpha_event);

// Text //
draw_set_alpha(alpha_event);
draw_set_color(c_white);
draw_set_halign(fa_center);
draw_set_font(global.fn_2);
draw_text(button_accept_x, button_accept_y - 5, string(button_accept_text));
