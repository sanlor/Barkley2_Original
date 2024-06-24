/// Draw Prison Hoopz
var spr, sub, xsl;
spr = sHoopzPrison;
if (move_dist > 0)
{
    if (facing == 0 || facing == 1) sub = 0;
    if (facing == 2 || facing == 3) sub = 5;
    if (facing == 4 || facing == 5) sub = 10;
    if (facing == 6 || facing == 7) sub = 15;
    //sub += (scr_entity_animation_getImage(ANIMATION_DEFAULT) / 4) * 5;
    sub += scr_entity_animation_getImage(ANIMATION_DEFAULT) mod 5;
}
else
{
    sub = 0;
    if (facing == 0 || facing == 1) sub = 0;
    if (facing == 2 || facing == 3) sub = 5;
    if (facing == 4 || facing == 5) sub = 10;
    if (facing == 6 || facing == 7) sub = 15;
}
//  - yoff
draw_sprite_ext(spr, sub, dx, dy, 1, 1, 0, c_white, 1);
