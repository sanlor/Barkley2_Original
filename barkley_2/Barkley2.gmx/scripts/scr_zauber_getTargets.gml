/// scr_zauber_getTargets(caster_actor, target_x, target_y, target_object_list, targetting_type, targetting_width_pixels)
/// Return value depends on target type.

var caster = argument0;
var target_x = argument1;
var target_y = argument2;
var target_z = argument3;
var targetsList = argument4;
var targetType = argument5;
var targetWidth = argument6;

switch (targetType) {

    case ZAUBER_TARGETTING_POINT:
        // Targets a point. No individual targets!
        var ret = 0;
        ret[0] = target_x;
        ret[1] = target_y;
        ret[2] = target_z;
        return ret;
        break;
    
    case ZAUBER_TARGETTING_SINGLE:
        // Find nearest target
        var nearest = scr_actor_getNearestTargetableCombatActorOfTypeList(targetsList, target_x, target_y);
        if (nearest != noone &&
                instance_exists(nearest) &&
                object_is_ancestor(nearest.object_index, CombatActor) &&
                nearest.targetable) {
            if (point_distance(nearest.x, nearest.y, target_x, target_y) <= targetWidth) {
                return nearest;
            }
        }
        return noone;
        break;
        
    case ZAUBER_TARGETTING_SELF:
        // Return self
        return caster;
        break;    
       
    case ZAUBER_TARGETTING_AREA:
        // Targets an area - essentially a point with wide effect. No individual targets!
        return NULL;
        break;    
}
