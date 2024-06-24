/// enemy_hitfx_cgremlins(attackerId, attackDir)

var attackerId = argument0;
var attackDir = argument1;

var ob = scr_fx_simple(attackerId.x, attackerId.y, attackerId.z, s_fx_bloodBurst);
with(ob)
{
    scr_entity_setMoveXY(0,0);
    scr_entity_animation_setSpeed(ANIMATION_DEFAULT, 2+random(1));
}
ob.image_angle = choose(0,90,180,270);
ob.image_xscale = 0.3 + random(0.1);
ob.image_yscale = ob.image_xscale;

