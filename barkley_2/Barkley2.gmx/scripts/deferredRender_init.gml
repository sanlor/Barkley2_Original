/// deferredRender_init()
if (global.settingDeferred == 0) return 0;
global.deferredRender_depths = ds_list_create();
global.deferredRender_layers = ds_map_create();
global.deferredRender_entities = ds_map_create();
global.deferredRender_performing = false;

with (o_tile_renderer) {
    if (depth <= 64 and depth > -1000) {
        var d = -depth;
        ds_list_add(global.deferredRender_depths, d);
        ds_map_add(global.deferredRender_layers, d, id);
        ds_map_add(global.deferredRender_entities, d, ds_priority_create());
    }
}

ds_list_sort(global.deferredRender_depths, true);

