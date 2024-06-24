/// scr_entity_animation_getSpeed(name)
/// Gets the speed of the animation

var name = argument0;

var anim = ds_map_find_value(__anims, name);
return anim[ENTITY_ANIMATION_SPEED];
