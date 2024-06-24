/// scr_entity_animation_setOffset(name, offset_frames)
/// Sets the value to offset in between each frame with

var name = argument0;
var anim_offset = argument1;

var anim = ds_map_find_value(__anims, name);
anim[@ ENTITY_ANIMATION_IMAGEOFFSET] = anim_offset;
