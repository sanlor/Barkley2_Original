/// scr_entity_animation_resetRange(name)
var name = argument0;

var anim = ds_map_find_value(__anims, name);
anim[@ ENTITY_ANIMATION_IMAGEFIRST] = 0;
anim[@ ENTITY_ANIMATION_RANGE] = NULL;

scr_entity_animation_clamp(name);
