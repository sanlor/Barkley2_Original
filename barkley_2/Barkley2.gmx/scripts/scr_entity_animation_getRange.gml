/// scr_entity_animation_getRange(name)
/// Get animation range, or -1 if no animation defined

var name = argument0;

var anim = __anims[? name];
var range = anim[ENTITY_ANIMATION_RANGE];
if (range == NULL) {
    var sprite = anim[ENTITY_ANIMATION_SPRITE_INDEX];
    if (sprite == NULL) {
        sprite = sprite_index;
    }
    if (sprite != NULL) {
        range = sprite_get_number(sprite);
    }
}
return range;
