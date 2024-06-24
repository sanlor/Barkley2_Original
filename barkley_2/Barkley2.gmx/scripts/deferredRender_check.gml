/// deferredRender_check(entity)
/* Checks if entity should have its renderring deferred.
   If so, returns true and queues it for later rendering.
   If not, returns false */
if (global.settingDeferred == 0) return 0;
var entity = argument0;

// Don't defer if currently rendering deferred entities
if (global.deferredRender_performing) {
    return false;
}

// Don't defer if no high-Z tile layers
if (ds_list_empty(global.deferredRender_depths)) {
    return false;
}

// Defer rendering if high-Z tile layer with lower-or-equal Z position than mine exists
var doDefer = false;
var deferTo = NULL;
for (var i = 0; i < ds_list_size(global.deferredRender_depths); i++) {
    var zdepth = global.deferredRender_depths[| i];
    if (zdepth <= entity.z) {
        doDefer = true;
        deferTo = zdepth;
    } else {
        break;
    }
}

if (doDefer) {
    var deferQueue = global.deferredRender_entities[? deferTo];
    ds_priority_add(deferQueue, entity.id, entity.depth);
}

return doDefer;

