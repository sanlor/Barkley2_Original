/// scr_actor_getNearestOfTypeList(typelist,x,y)
/// Gets the nearest actor matching any of the object types from a given list, or 'noone'.
/// Empty list = any actor

var __typelist = argument0
var __x = argument1
var __y = argument2

var __nearest = noone;
var __nearestDist = 999999


if (ds_list_empty(__typelist)) {
    return instance_nearest(x, y, Actor);
} else {
    for (var i = 0; i < ds_list_size(__typelist); i++) {
        var type = __typelist[| i];
        var nearest = instance_nearest(__x, __y, type);
        if (nearest != noone) {
            var dist = point_distance(nearest.x, nearest.y, __x,  __y);
            if (dist < __nearestDist) {
                __nearest = nearest;
                __nearestDist = dist;
            }
        }
    }
    return __nearest;
}

