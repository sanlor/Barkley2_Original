/// scr_mg_dimmer(mode)
// DIMMERS //
var mode = argument0;
if mode = "step" then
    {
    if dimmer_position > dimmer_goal then dimmer_position -= 0.02;
    else if dimmer_position < dimmer_goal then dimmer_position += 0.02;
    }
else if mode = "draw" then
    {
    draw_sprite_ext(s_mg_dimGradient, 0, view_xview, view_yview - sprite_height * dimmer_position, 384, 1, 0, c_white, alpha);
    draw_sprite_ext(s_mg_dimGradient, 1, view_xview, view_yview + 215 + sprite_height * dimmer_position, 384, 1, 0, c_white, alpha);
    }

