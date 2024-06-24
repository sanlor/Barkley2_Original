/// enemy_hitfx_catfish(attackerId, attackDir)
var attackerId = argument0;
var attackDir = argument1;

ob = scr_fx_simple(attackerId.x, attackerId.y, attackerId.z, s_catfish_bloodsmall);
with(ob)
{
    scr_entity_setMoveXY(0,0);
    scr_entity_animation_setSpeed(ANIMATION_DEFAULT, 3+random(2));
}
ob.image_angle = choose(0,90,180,270);

