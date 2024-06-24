/// scr_tile_importall

// 320 x 320 grid is support for 5120 by 5120 map

// By iteration
var tile_ids = tile_get_ids();
var tile_count = array_length_1d(tile_ids);
var tile_id, tile_depth, renderer;
for (var i = 0; i < tile_count; i++) {
    tile_id = tile_ids[i];
    var tile_depth = tile_get_depth(tile_id);
    
    var renderer = NULL;
    with o_tile_renderer {
        if depth == tile_depth
            renderer = id
    }
    
    if (renderer == NULL) {
        renderer = instance_create(0, 0, o_tile_renderer)
        renderer.depth = tile_depth
    }
    
    scr_tile_renderer_add(renderer, tile_id); //GZ code for footsteps inside this script
    tile_delete(tile_id);
}
tile_ids = 0;

with o_tile_renderer {
    tile_layer_delete(depth)
}
