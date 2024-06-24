/// scr_entity_animation_getFrame(name)
/// Get current animation frame

var name = argument0;

var anim = ds_map_find_value(__anims, name);
return anim[ENTITY_ANIMATION_FRAME];
