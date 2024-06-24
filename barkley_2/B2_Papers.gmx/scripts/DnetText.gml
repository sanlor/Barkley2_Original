/// DnetText(x, y, string, width, color, alpha, halign, valign)
draw_set_alpha(1);
draw_set_color(c_white);
draw_set_halign(fa_left);
draw_set_valign(fa_top);
if argument_count >= 6 then draw_set_alpha(argument[5]);
if argument_count >= 5 then draw_set_color(argument[4]);
if argument_count >= 7 then draw_set_halign(argument[6]);
if argument_count >= 8 then draw_set_valign(argument[7]);
draw_text_ext(argument[0], argument[1], argument[2], -1, argument[3]);
draw_set_halign(fa_left);
draw_set_valign(fa_top);

