/// scr_actor_getNearestTargetableCombatActorOfTypeList(typelist,x,y)
/// Gets the nearest actor matching any of the object types from a given list, or 'noone'.
/// Empty list = any actor

var __typelist = argument0
var __x = argument1
var __y = argument2

var __nearest = noone;
var __nearestDist = 999999


if (ds_list_empty(__typelist)) {
    with (type) {
        if (targetable) {
            var dist = point_distance(x, y, __x,  __y);
            if (dist < __nearestDist) {
                __nearest = nearest;
                __nearestDist = dist;
            }
        }
    }
} else {    
    for (var i = 0; i < ds_list_size(__typelist); i++) {
        var type = __typelist[| i];
        if (object_is_ancestor(type, CombatActor)) {
            with (type) {
                var dist = point_distance(x, y, __x,  __y);
                if (targetable && dist < __nearestDist) {
                    __nearest = id;
                    __nearestDist = dist;
                }
            }
        }
    }
}

return __nearest;

