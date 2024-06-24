// Draw legs

var current = scr_statusEffect_getFromCombatActor(id, statusEffect_wading);
var swimmove = 0;
if(current > 0)
{
    swimmove = ds_map_find_value(current, "wadingDepthCurrent");
}

// Draw standard walking animation
if (move_dist > 0 or shuffle > 0)
{   
    if(swimmove == 0) {
        scr_draw_spr(aLegsS[facing],scr_entity_animation_getImage(ANIMATION_DEFAULT),dx,dy);
    } else if (swimmove <= 10) {
        draw_sprite_part_ext(aLegsS[facing],scr_entity_animation_getImage(ANIMATION_DEFAULT),
                             0, 0, 44, 41 - swimmove,
                             dx-22, dy-41 + swimmove,
                             1, 1, image_blend, image_alpha);
    }
    scr_draw_spr(aWalkS[facing],scr_entity_animation_getImage(ANIMATION_DEFAULT),dx,dy+swimmove);
}
else
{
    if(swimmove == 0) {
        scr_draw_spr(s_HoopzLegs,facing,dx,dy);
    } else if (swimmove <= 10) {
        draw_sprite_part_ext(s_HoopzLegs,facing,
                             0, 0, 44, 41 - swimmove,
                             dx-22, dy-41 + swimmove,
                             1, 1, image_blend, image_alpha);
    }
    scr_draw_spr(s_HoopzTorsoSlack,facing,dx,dy - yoff+swimmove);
}
