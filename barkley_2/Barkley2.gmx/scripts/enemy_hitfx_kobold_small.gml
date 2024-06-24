/// enemy_hitfx_kobold_small(attackerId, attackDir)

var attackerId = argument0;
var attackDir = argument1;

ob = scr_fx_simple(attackerId.x, attackerId.y, attackerId.z, s_koboldBloodburst);
with(ob)
{
    scr_entity_setMoveXY(0,0);
    scr_entity_animation_setSpeed(ANIMATION_DEFAULT, 3+random(2));
}
ob.image_angle = choose(0,90,180,270);
ob.image_xscale = 0.6 + random(0.2);
ob.image_yscale = ob.image_xscale;

