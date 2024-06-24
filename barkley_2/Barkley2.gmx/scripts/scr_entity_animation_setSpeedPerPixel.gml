/// scr_entity_animation_setSpeedPerPixel(name, animation_speed_per_pixel)
/// Sets the amount of animation per moved pixel

var name = argument0;
var animation_speed = argument1;

var anim = ds_map_find_value(__anims, name);
anim[@ ENTITY_ANIMATION_SPEEDPERPIXEL] = animation_speed;
