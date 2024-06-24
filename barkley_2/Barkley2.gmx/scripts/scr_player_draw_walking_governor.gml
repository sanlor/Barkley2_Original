///Draw governor
var spr, sub, xscl;
if (facing == 1 || facing == 0 || facing == 6 || facing == 7) xscl = 1; else xscl = -1;
if (move_dist > 0)
{
    if (facing == 1 || facing == 2 || facing == 3) spr = s_governorNE;
    else spr = s_governorSE;
    sub = scr_entity_animation_getImage(ANIMATION_DEFAULT);
}
else
{
    spr = s_governorLook;
    if (facing == 1 || facing == 2 || facing == 3) sub = 1;
    else sub = 0;
    
}

draw_sprite_ext(spr, sub, dx, dy - yoff, xscl, 1, 0, c_white, 1); //+swimmove);
