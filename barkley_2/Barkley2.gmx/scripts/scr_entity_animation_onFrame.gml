/// scr_entity_animation_onFrame(name, frame)
/// Returns true if the frame was entered this step

var name = argument0;
var fr = argument1;

var anim = ds_map_find_value(__anims, name);
var anim_frame_prev = anim[ENTITY_ANIMATION_FRAMEPREVIOUS];
var anim_frame = anim[ENTITY_ANIMATION_FRAME];

if (anim_frame_prev > anim_frame and anim_frame >= fr) {
    // Animation looped and now entered this frame
    return true;
}

if (anim_frame_prev < fr and fr <= anim_frame) {
    // Animation proceeded normally and encountered this frame
    return true;
}

return false;
