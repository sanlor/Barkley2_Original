/// scr_entity_animation_nextFrameLoop(name)
/// Returns true if the next frame will loop the animation, false otherwise.

var name = argument0;
var anim = ds_map_find_value(__anims, name);
var anim_frame = anim[ENTITY_ANIMATION_FRAME];
var anim_speed = anim[ENTITY_ANIMATION_SPEED];
var anim_speedpp = anim[ENTITY_ANIMATION_SPEEDPERPIXEL];
var next_anim_frame = anim_frame + anim_speed * dt() + (anim_speedpp * move_dist * dt());

var range = scr_entity_animation_getRange(name);

return range != NULL && next_anim_frame >= range;
