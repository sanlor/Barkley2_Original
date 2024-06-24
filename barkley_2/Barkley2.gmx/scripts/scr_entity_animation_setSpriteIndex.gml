/// scr_entity_animation_setSpriteIndex(name, sprite_index)
/// Sets the sprite index for the animation.
/// This is only used for InteractiveActors.

var name = argument0;
var new_sprite_index = argument1;

var anim = ds_map_find_value(__anims, name);
anim[@ ENTITY_ANIMATION_SPRITE_INDEX] = new_sprite_index;
