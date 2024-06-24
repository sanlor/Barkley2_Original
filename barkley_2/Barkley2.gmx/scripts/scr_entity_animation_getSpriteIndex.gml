/// scr_entity_animation_getSpriteIndex(name)
/// Get the sprite index for this animation.
/// This is only used for InteractiveActors.

var name = argument0;

var anim = ds_map_find_value(__anims, name);
return anim[ENTITY_ANIMATION_SPRITE_INDEX];
