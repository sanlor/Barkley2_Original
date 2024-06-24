/// statusHelper_applyFresh(actor, statusConfig)
// Removes a status effect if you have it then applies it fresh
if (isCombatActor(argument0)) 
{
    var list = argument0.list_status_effect;
    var i;
    for (i = 0; i < ds_list_size(list); i++) {
        var map = ds_list_find_value(list, i);
        if (statusEffect_this == ds_map_find_value(map, "script")) {
            ds_list_delete(list, i);
            break;
        }
    }
}
scr_statusEffect_applyNewToCombatActor(argument0, argument1);
