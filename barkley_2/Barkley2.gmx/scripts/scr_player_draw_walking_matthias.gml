///Draw matthias
var spr;
if (move_dist > 0)
{
    if (facing < 4) spr = s_matthias_walk_up;
    else spr = s_matthias_walk_down;
}
else
{
    if (facing < 4) spr = s_matthias_idle_up;
    else spr = s_matthias_idle_down;
}

scr_draw_spr(spr, scr_entity_animation_getImage("matthias"), dx, dy - yoff); //+swimmove);
