// Draw textbox //

/*draw_set_alpha(alpha_textbox);
draw_set_color(o_cc_data.color_textbox);
draw_rectangle(12, 170, 372, 228, false);*/

draw_sprite_ext(s_cc_textbox_backdrop, 0, view_xview + 12, view_yview + 170, 1, 1, 0, o_cc_data.color_textbox, alpha_textbox);
draw_sprite_ext(s_cc_textbox_frames, 0, 192, 198, 1, 1, 0, c_white, alpha_textbox * 2);

// Text for texboxes //
draw_set_color(c_white);
draw_set_alpha(alpha_textbox * 2);
draw_set_font(global.fn_2);
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_text(21, 176, textbox_written);
