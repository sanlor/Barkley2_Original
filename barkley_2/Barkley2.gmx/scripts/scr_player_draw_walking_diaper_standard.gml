// Draw legs

var current = scr_statusEffect_getFromCombatActor(id, statusEffect_wading);
var swimmove = 0;
if(current > 0)
{
    swimmove = ds_map_find_value(current, "wadingDepthCurrent");
}

// Get proper sprite
var spr = s_cts_hoopzDiaperN;
if (facing == 0) spr = s_cts_hoopzDiaperE;
if (facing == 1) spr = s_cts_hoopzDiaperNE;
if (facing == 2) spr = s_cts_hoopzDiaperN;
if (facing == 3) spr = s_cts_hoopzDiaperNW;
if (facing == 4) spr = s_cts_hoopzDiaperW;
if (facing == 5) spr = s_cts_hoopzDiaperSW;
if (facing == 6) spr = s_cts_hoopzDiaperS;
if (facing == 7) spr = s_cts_hoopzDiaperSE;

// Draw standard walking animation
if (move_dist > 0 or shuffle > 0)
{   
    scr_draw_spr(spr, scr_entity_animation_getImage(ANIMATION_DEFAULT), dx, dy + swimmove);
}
else
{
    scr_draw_spr(s_cts_hoopz_diaper_stand, facing, dx, dy - yoff + swimmove);
}
