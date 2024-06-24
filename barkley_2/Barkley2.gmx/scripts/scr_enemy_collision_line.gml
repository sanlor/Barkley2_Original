/// scr_enemy_collision_line(x1, y1, x2, y2, z, object_type)
// Returns distance until collides with an enemy, or full line distance if no collision
// OPTIMIZE: Revisit and optimize if performance is ever found to be bad

var x1 = argument0;
var y1 = argument1;
var x2 = argument2;
var y2 = argument3;
var z1 = argument4;
var object_type = argument5;

var me = id;
var dir = point_direction(x1, y1, x2, y2);
var dist = point_distance(x1, y1, x2, y2);

var STEP_PRECISION = 2;

// Check if any targets at all are hit
if (!collision_line(x1, y1, x2, y2, object_type, true, true)) {
    return dist;
}

// Find potential targets
var potentialTargets = ds_list_create();
with (object_type) {
    if (id != me && !invulnerable && z + hitbox_z_bottom <= z1 && z + hitbox_z_top >= z1) { // was hitbox_z_top >= z
        if (collision_line(x1, y1, x2, y2, id, true, false)) {
            ds_list_add(potentialTargets, id);
        }
    }
}
        
// Exit early if no potential targets along path
if (ds_list_size(potentialTargets) == 0) {
    ds_list_destroy(potentialTargets);
    return dist;
}
    
// Step with STEP_PRECISION and look for collisions with potential targets
var delta_x = lengthdir_x(STEP_PRECISION, dir);
var delta_y = lengthdir_y(STEP_PRECISION, dir);

var check_x = x1;
var check_y = y1;
var check_dist = 0;

while (check_dist < dist) {
    for (var i = 0; i < ds_list_size(potentialTargets); i++) {
        var target = potentialTargets[| i];
        if (collision_point(check_x, check_y, target, true, false)) {
            // Encountered enemy, return this distance
            ds_list_destroy(potentialTargets);
            return check_dist;
        }
    }

    check_x += delta_x;
    check_y += delta_y;
    check_dist += STEP_PRECISION;
}

// No enemy encountered, exit
ds_list_destroy(potentialTargets);
return dist;

