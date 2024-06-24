///scr_statusEffect_getFromCombatActor(actorId,statusScript)

/* Checks if the CombatActor has the specified status effect.
If so, returns its configuration map, otherwise -1.

arg0 - Actor
arg1 - Status effect script */

var attack = argument0;
var scr = argument1;

if (instance_exists(attack) and object_is_ancestor(attack.object_index, CombatAttackEntity)) {
    var list = attack.status_effects;
    for (var i = 0; i < ds_list_size(list); i++) {
        var map = ds_list_find_value(list, i);
        if (scr == ds_map_find_value(map, "script")) {
            return map;
        }
    }
}

return NULL;
