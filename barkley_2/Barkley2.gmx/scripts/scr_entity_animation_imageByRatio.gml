/// scr_entity_animation_imageByRatio(name, value, value_max)
/// Get the sprite image to render, based on the ratio between the two provided values

var name = argument0;
var value = argument1;
var value_max = argument2;

var anim = ds_map_find_value(__anims, name);
var image_first = anim[ENTITY_ANIMATION_IMAGEFIRST];
var range = anim[ENTITY_ANIMATION_RANGE];
var offset = anim[ENTITY_ANIMATION_IMAGEOFFSET]
var shift = anim[ENTITY_ANIMATION_IMAGESHIFT];

var frame;
if (value < 0) { frame = 0; }
else if (value >= value_max) { frame = range - 1; }
else if (value_max <= 0) { frame = 0; } // Avoid division-by-zero
else {
    frame = floor((value / value_max) * range);
}

return image_first + shift + (frame * offset);
