/// scr_zauberGroup_drawTargettingInfo(zauberGroup, currentCharge, caster, target_list, target_x, target_y)

var group = argument0;
var charge = argument1;
var caster = argument2;
var target_list = argument3;
var tx = argument4;
var ty = argument5;


// Draw aiming reticule
scr_draw_spr(s_zauberCasting_aim, 0, tx, ty);

// Draw zauber targetting shenanigans if charged to at least LVL1
if (charge >= 1) {

    // Draw all potential targets
    var targetType = scr_zauberGroup_current_targetType(group, charge);
    var targetWidth = scr_zauberGroup_current_targetWidth(group, charge);
    var potential_targets = scr_zauber_getPotentialTargets(caster, target_list, targetType);
    for (var i = 0; i < array_length_1d(potential_targets); i++) {
        var target = potential_targets[@ i];
        if instance_exists(target) {
            var enemy_w = sat_util_shapemaxwidth(scr_entity_getMovementCollisionShape(id));
            draw_sprite_ext(s_zauberCasting_circle, 0, target.x, target.y - target.z,
                                                    (enemy_w*2) / 128.0, ((enemy_w*2) / 128.0) * 0.7,
                                                    0, c_white, 0.5);
            draw_sprite(s_zauberCasting_target, 0, target.x, target.y - target.z + (enemy_w * 0.7))
        }
    }
    potential_targets = 0;
    
    // Get targets
    var target_data = scr_zauber_getTargets(caster, tx, ty, target_list, targetType, targetWidth);
    
    switch (targetType) {
        case ZAUBER_TARGETTING_SELF:
            var self_w = sat_util_shapemaxwidth(scr_entity_getMovementCollisionShape(id));
            draw_sprite_ext(s_zauberCasting_circle, 1, dx, dy,
                                                    (self_w*2) / 128.0, ((self_w*2) / 128.0) * 0.7,
                                                    0, c_white, 0.5);
            draw_sprite(s_zauberCasting_target, 1, dx, dy + (self_w * 0.7))
            break;
            
        case ZAUBER_TARGETTING_POINT:
            draw_sprite_ext(s_zauberCasting_circle, 1, target_data[@ 0], target_data[@ 1],
                                                    (targetWidth*2) / 128.0, ((targetWidth*2) / 128.0) * 0.7,
                                                    0, c_white, 0.5);
            draw_sprite(s_zauberCasting_target, 1, target_data[@ 0], target_data[@ 1] + (targetWidth * 0.7))
            break;
            
        case ZAUBER_TARGETTING_SINGLE:
            if (target_data != noone && instance_exists(target_data)) {
                var enemy_w = sat_util_shapemaxwidth(scr_entity_getMovementCollisionShape(id));
                draw_sprite_ext(s_zauberCasting_circle, 1, target_data.x, target_data.y - target_data.z,
                                                        (enemy_w*2) / 128.0, ((enemy_w*2) / 128.0) * 0.7,
                                                        0, c_white, 0.5);
                draw_sprite(s_zauberCasting_target, 1, target_data.x, target_data.y - target_data.z + (enemy_w * 0.7))
            }
            break;
            
        case ZAUBER_TARGETTING_MULTI:
            for (var i = 0; i < array_length_1d(target_data); i++) {
                var target = target_data[@ i];
                if instance_exists(target) {
                    var enemy_w = sat_util_shapemaxwidth(scr_entity_getMovementCollisionShape(id));
                    draw_sprite_ext(s_zauberCasting_circle, 1, target.x, target.y - target.z,
                                                            (enemy_w*2) / 128.0, ((enemy_w*2) / 128.0) * 0.7,
                                                            0, c_white, 0.5);
                    draw_sprite(s_zauberCasting_target, 1, target.x, target.y - target.z + (enemy_w * 0.7))
                }
            }
            break;
        
        default: break;
    }
}
