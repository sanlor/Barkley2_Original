/// scr_entity_animation_setFrame(name, animation_frame)
/// Set current animation frame

var name = argument0;
var animation_frame = argument1;

var anim = ds_map_find_value(__anims, name);
anim[@ ENTITY_ANIMATION_FRAME] = animation_frame;
anim[@ ENTITY_ANIMATION_FRAMEPREVIOUS] = animation_frame;

scr_entity_animation_clamp(name);
