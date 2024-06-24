/// scr_entity_animation_clamp(name)
/// Clamps the animation frame to the image range

var name = argument0;

var anim = ds_map_find_value(__anims, name);
var range = scr_entity_animation_getRange(name);
if (range == NULL) {
    anim[@ ENTITY_ANIMATION_FRAME] = 0;
}
else {
    var anim_frame = anim[ENTITY_ANIMATION_FRAME];
    if (anim_frame < 0 or anim_frame >= range) {
        anim[@ ENTITY_ANIMATION_FRAME] = scr_math_mod(anim_frame, range);
        
        //To make sure it only loops once
        if (_animation_object != NULL)
        {
            if (instance_exists(_animation_object))
            {
                if (_animation_object_name == name)
                {
                    _animation_object.looped = 1;
                    _animation_object = NULL;
                }
            }
        }
        
        // If wrapping around, call animation_end event
        event_perform(ev_other, ev_animation_end);
    }
}
