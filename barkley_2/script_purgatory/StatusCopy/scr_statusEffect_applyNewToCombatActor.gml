////scr_statusEffect_applyNewToCombatActor(combatActorID,statusConfigMap)
/* Applies and returns the new status effect to the Actor.

arg0 - CombatActor
arg1 - Status effect configuration map
*/

var actor = argument0;
var map = argument1;

var statusEffect = map[? "script"];

if (!statusEffect_immunity_isImmune(actor, statusEffect)) {
    var newMap = ds_map_create();
    ds_map_copy(newMap, map);
    ds_list_add(actor.list_status_effect, newMap);
    ds_list_mark_as_map(actor.list_status_effect, ds_list_size(actor.list_status_effect)-1);
    
    return newMap;
} else {
    return NULL;
}
