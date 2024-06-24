/// scr_AI_targetList_hasTarget(object_index_or_instance_id)

var obj = argument0;

if (!object_exists(obj)) {
    // Is an instance - get instance object type
    if (instance_exists(obj)) {
        obj = obj.object_index;
    } else {
        return false;
    }
}


for (var i = 0; i < ds_list_size(target_list); i++) {
    var target = target_list[| i];
    if (object_is_ancestor(obj, target)) {
        return true;
    }
}

return false;
