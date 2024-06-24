/// scr_entity_animation_setShift(name, shift_frames)
/// Sets the image shift to offset the entire animation with.

var name = argument0;
var anim_shift = argument1;

var anim = ds_map_find_value(__anims, name);
anim[@ ENTITY_ANIMATION_IMAGESHIFT] = anim_shift;
