/// scr_zauberGroup_putTargetDecals(zauberGroup, currentCharge, caster, target_list, target_x, target_y, target_z)

var group = argument0;
var charge = argument1;
var caster = argument2;
var target_list = argument3;
var tx = argument4;
var ty = argument5;
var tz = argument6;

scr_fx_decal_transient(s_zauberCasting_aim, 0, tx, ty, tz, 1, 1, 0, c_white, 1);

// Draw zauber targetting shenanigans if charged to at least LVL1
if (charge >= 1) {

    // Draw all potential targets
    var potential_targets = scr_zauber_getPotentialTargets(caster, target_list, targetType);
    for (var i = 0; i < array_length_1d(potential_targets); i++) {
        var target = potential_targets[@ i];
        if instance_exists(target) {
            var enemy_w = sat_util_shapemaxwidth(scr_entity_getMovementCollisionShape(id));
            scr_fx_decal_transient(s_zauberCasting_circle, 0, target.x, target.y, target.z,
                                                    ((enemy_w*2) + 8) / 128.0, (((enemy_w*2) + 8) / 128.0) * 0.7,
                                                    0, c_white, 0.5);
            scr_fx_decal_transient(s_zauberCasting_target, 0, target.x, target.y, target.z + (enemy_w * 0.9), 1, 1, 0, c_white, 1);
        }
    }
    potential_targets = 0; // Free array
    
    // Get targets
    var target_data = scr_zauber_getTargets(caster, tx, ty, tz, target_list, targetType, targetWidth);
    
    switch (targetType) {
        case ZAUBER_TARGETTING_SELF:
            var self_w = sat_util_shapemaxwidth(scr_entity_getMovementCollisionShape(id));
            scr_fx_decal_transient(s_zauberCasting_circle, 1, x, y, z,
                                                    ((self_w*2) + 8) / 128.0, (((self_w*2) + 8) / 128.0) * 0.7,
                                                    0, c_white, 0.5);
            scr_fx_decal_transient(s_zauberCasting_target, 1, x, y + (self_w * 0.9), z, 1, 1, 0, c_white, 1)
            break;
            
        case ZAUBER_TARGETTING_POINT:
            scr_fx_decal_transient(s_zauberCasting_circle, 1, target_data[@ 0], target_data[@ 1], target_data[@ 2],
                                                    ((targetWidth*2) + 8) / 128.0, (((targetWidth*2) + 8) / 128.0) * 0.7,
                                                    0, c_white, 0.5);
            scr_fx_decal_transient(s_zauberCasting_target, 1, target_data[@ 0], target_data[@ 1] + (targetWidth * 0.9), target_data[@ 2], 1, 1, 0, c_white, 1)
            break;
            
        case ZAUBER_TARGETTING_SINGLE:
            if (target_data != noone && instance_exists(target_data)) {
                var enemy_w = sat_util_shapemaxwidth(scr_entity_getMovementCollisionShape(id));
                scr_fx_decal_transient(s_zauberCasting_circle, 1, target_data.x, target_data.y, target_data.z,
                                                        ((enemy_w*2) + 8) / 128.0, (((enemy_w*2) + 8) / 128.0) * 0.7,
                                                        0, c_white, 0.5);
                scr_fx_decal_transient(s_zauberCasting_target, 1, target_data.x, target_data.y + (enemy_w * 0.9), target_data.z, 1, 1, 0, c_white, 1)
            }
            break;
        
        default: break;
    }
    
    target_data = 0; // free array
}
