/// scr_AI_aggro_step()

var key = ds_map_find_first(I_aggro_map);
var size = ds_map_size(I_aggro_map);

scr_actor_forEachInTypeList_arg2(target_list, scr_AI_aggro_addAggroIfCloseAndNew, id, 20); 

for (var i = 0; i < size; i++) {
    var aggro = ds_map_find_value(I_aggro_map, key);
    var target = key;
    var next = ds_map_find_next(I_aggro_map, key);
    if (!instance_exists(target)) {
        // Remove target
        ds_map_delete(I_aggro_map, key);
    }
    else {
        var dist = point_distance(x, y, target.x, target.y)
        
        if (dist <= I_aggro_range_increase) {
            aggro += dt();
        }
        else if (dist <= I_aggro_range_nochange) {
            // Do nothing
        }
        else if (dist <= I_aggro_range_decrease) {
            aggro -= dt();
        }
        else {
            aggro = 0;
        }
        
        if (aggro <= 0) {
            // Remove target
            ds_map_delete(I_aggro_map, key);
        }
        else {
            // Update target
            ds_map_replace(I_aggro_map, key, aggro);
        }
    }
    key = next;
}
