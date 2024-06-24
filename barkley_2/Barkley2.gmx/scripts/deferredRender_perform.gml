/// deferredRender_perform()
if (global.settingDeferred == 0) return 0;
global.deferredRender_performing = true;

// Iterate through layers
for (var i = 0; i < ds_list_size(global.deferredRender_depths); i++) {
    var zdepth = global.deferredRender_depths[| i];
    
    // Render tile layer
    var layer = global.deferredRender_layers[? zdepth];
    with (layer) {
        event_perform(ev_draw, 0);
    }
    
    // Render entities in order
    var renderQueue = global.deferredRender_entities[? zdepth];
    while (!ds_priority_empty(renderQueue)) {
        var entity = ds_priority_delete_max(renderQueue);
        if (instance_exists(entity)) {
            with (entity) {
                visible = true;
                event_perform(ev_draw, 0);
            }
        }
    }
}

global.deferredRender_performing = false;
