/// scr_entity_animation_step_all()
/// Steps all animations once

//swapped by bhroom during fix 110816
//if (__anims == NULL or __anims_names == NULL) 
if (__anims == NULL or __anims_names == NULL or !ds_exists(__anims, ds_type_map) or !ds_exists(__anims_names, ds_type_list)) {
    exit;
}

var anims_size = ds_list_size(__anims_names);
for (var i = 0; i < anims_size; i++) {
    var anim_name = __anims_names[| i];
    var anim = __anims[? anim_name];
    
    var anim_frame = anim[ENTITY_ANIMATION_FRAME];
    var anim_speed = anim[ENTITY_ANIMATION_SPEED];
    var anim_speedpp = anim[ENTITY_ANIMATION_SPEEDPERPIXEL];
    anim[@ ENTITY_ANIMATION_FRAMEPREVIOUS] = anim_frame;
    anim[@ ENTITY_ANIMATION_FRAME] += (anim_speed + anim_speedpp * move_dist) * dt();
    
    scr_entity_animation_clamp(anim_name);
    
    // Clamp can call the end animation event, which can call instance_destroy, which destroys __anims.
    if (__anims == NULL) {
        exit;
    }
}
