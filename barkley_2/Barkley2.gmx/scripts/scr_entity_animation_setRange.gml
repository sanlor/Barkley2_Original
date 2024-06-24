/// scr_entity_animation_setRange(name, start_frame, number_of_frames)
/// Sets the image range to animate within.

var name = argument0;
var anim_range_first = argument1;
var anim_range_count = argument2;

var anim = ds_map_find_value(__anims, name);
anim[@ ENTITY_ANIMATION_IMAGEFIRST] = anim_range_first;
anim[@ ENTITY_ANIMATION_RANGE] = anim_range_count;

scr_entity_animation_clamp(name);
