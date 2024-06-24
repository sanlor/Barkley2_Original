///scr_statusEffect_getFromCombatActor(actorId,statusScript)

/* Checks if the CombatActor has the specified status effect.
If so, returns its configuration map, otherwise NULL.

arg0 - Actor
arg1 - Status effect script */

var actor = argument0;
var scr = argument1;

if (isCombatActor(actor)) {
    var list = actor.list_status_effect;
    var i;
    for (i = 0; i < ds_list_size(list); i++) {
        var map = ds_list_find_value(list, i);
        if (scr == ds_map_find_value(map, "script")) {
            return map;
        }
    }
}

return NULL;
