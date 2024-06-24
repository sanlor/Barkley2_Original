/// deferredRender_cleanup()
if (global.settingDeferred == 0) return 0;
ds_list_destroy(global.deferredRender_depths);

ds_map_destroy(global.deferredRender_layers);

while (ds_map_size(global.deferredRender_entities) > 0) {
    var key = ds_map_find_first(global.deferredRender_entities);
    ds_priority_destroy(ds_map_find_value(global.deferredRender_entities, key));
    ds_map_delete(global.deferredRender_entities, key);
}
ds_map_destroy(global.deferredRender_entities);
