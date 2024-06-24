/// scr_font(Name, Color, Halign, Valign)
if (argument_count >= 1) if (argument[0] != -1) { draw_set_font(argument[0]); }
if (argument_count >= 2) if (argument[1] != -1) { draw_set_color(argument[1]); }
if (argument_count >= 3) if (argument[2] != -1) { draw_set_halign(argument[2]); }
if (argument_count >= 4) if (argument[3] != -1) { draw_set_valign(argument[3]); }
