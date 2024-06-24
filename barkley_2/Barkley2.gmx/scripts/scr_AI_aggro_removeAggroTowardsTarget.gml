/// scr_AI_aggro_removeAggroTowardsTarget(id)

if ds_map_exists(I_aggro_map, argument0) {
    ds_map_delete(I_aggro_map, argument0);
}
