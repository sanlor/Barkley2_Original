/// scr_entity_animation_getImage(name)
/// Get the sprite image to render

var name = argument0;

var anim = __anims[? name];
var image_first = anim[ENTITY_ANIMATION_IMAGEFIRST];
var offset = anim[ENTITY_ANIMATION_IMAGEOFFSET]
var shift = anim[ENTITY_ANIMATION_IMAGESHIFT];
var frame = anim[ENTITY_ANIMATION_FRAME];

return image_first + shift + (floor(frame) * offset);
