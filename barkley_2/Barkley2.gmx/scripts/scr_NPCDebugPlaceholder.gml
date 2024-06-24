if (global.DEBUGMODE)
{
    draw_set_font(global.fn_2);
    draw_sprite(s_placeholder,image_index,x,y);
    draw_set_color(c_white);
    //draw_set_alpha(0.7);
    var tx = "";
    tx = object_get_name(object_index);
    xdist = string_length(tx) * 2
    draw_text(x-xdist,y+12,tx);
}
