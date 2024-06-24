/// scr_entity_animation_destroy()

if (__anims != NULL) {
    var key = ds_map_find_first(__anims);
    for (var i = 0; i < ds_map_size(__anims); i++) {
        var anim = __anims[? key];
        anim = 0; // Clear anim, which is an array
        
        key = ds_map_find_next(__anims, key);
    }
    
    ds_map_destroy(__anims);
    ds_list_destroy(__anims_names);
    __anims = NULL;
}
