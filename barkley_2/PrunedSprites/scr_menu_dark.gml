/// scr_menu_dark()
/// Draws a dark menu overlay.

draw_set_color(c_black);
draw_set_alpha(0.6);
    draw_rectangle(view_xview-2,view_yview-2,view_xview+view_wview+2,view_yview+view_hview+2,0)
draw_set_color(c_white);
draw_set_alpha(1);
