/// scr_zauber_getPotentialTargets(caster_actor, target_object_list, targetting_type)
/// Return value depends on target type.

var caster = argument0;
var targetsList = argument1;
var targetType = argument2;

var res = 0;
var targets = 0;
switch (targetType) {
    
    case ZAUBER_TARGETTING_SINGLE:
        // Find targets within visible area
        var areaW = (SCREEN_WIDTH/2) + 24;
        var areaH = (SCREEN_WIDTH/2) + 40;
        for (var i = 0; i < ds_list_size(targetsList); i++) {
            if (instance_exists(targetsList[| i])) {
                // Iterate over all objects of target type
                with (targetsList[| i]) {
                    if(targetable)
                    {
                         var xdiff = x - caster.x;
                         var ydiff = y - caster.y;
                         if (abs(xdiff) <= areaW && abs(ydiff) <= areaH) {
                             res[targets] = id;
                             targets++;
                         }
                    }
                }
            }
        }
        return res;
        break;    
        
    case ZAUBER_TARGETTING_SELF:
        // Return self
        targets[0] = caster;
        return targets;
        break;    
       
    case ZAUBER_TARGETTING_POINT:
    case ZAUBER_TARGETTING_AREA:
        // No individual targets!
        return NULL;
        break;
}
