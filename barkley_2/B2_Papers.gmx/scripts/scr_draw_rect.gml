//X, Y, W, H, Color, Alpha
if (argument_count == 4)
{
    draw_sprite_ext(s_1, 0, argument[0], argument[1], argument[2], argument[3], 0, draw_get_color(), draw_get_alpha());
}
else if (argument_count == 5)
{
    draw_sprite_ext(s_1, 0, argument[0], argument[1], argument[2], argument[3], 0, argument[4], draw_get_alpha());
}
else if (argument_count == 6)
{
    draw_sprite_ext(s_1, 0, argument[0], argument[1], argument[2], argument[3], 0, argument[4], argument[5]);
}
