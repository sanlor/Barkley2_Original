draw_set_halign(fa_center);
draw_set_font(font0);
draw_set_color(c_red);

draw_rectangle(0, 0, 16, 16, false);
draw_rectangle(0, gui_height - 16, 16, gui_height, false);
draw_rectangle(gui_width - 16, 0, gui_width, 16, false);
draw_rectangle(gui_width - 16, gui_height - 16, gui_width, gui_height, false);

//In order to draw elements on a changing GUI like this, you need to use an offset.
//Just subtract gui_offset from the x position of every element, and all your GUI elements will be consistently drawn across window changes.

if(drawprims)
{
    draw_set_color(c_lime);
    draw_set_alpha(0.5);
    draw_rectangle(111-gui_offset,145,175-gui_offset,208, false);
    draw_circle(216-gui_offset, 177, 32, false);
    draw_triangle(248-gui_offset,145,312-gui_offset,145,280-gui_offset,209,false);
}

draw_set_color(c_white);
draw_set_alpha(1);

draw_text((gui_width / 2), 218, idstring);
