/// scr_entity_animation_setSpeed(name, animation_speed)
/// Sets the speed of the animation

var name = argument0;
var animation_speed = argument1;

var anim = ds_map_find_value(__anims, name);
anim[@ ENTITY_ANIMATION_SPEED] = animation_speed;
