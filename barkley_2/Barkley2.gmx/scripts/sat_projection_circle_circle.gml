/// sat_projection_rect_rect(x1, y1, rad1, x2, y2, rad2)

var x1 = argument0;
var y1 = argument1;
var rad1 = argument2;
var x2 = argument3;
var y2 = argument4;
var rad2 = argument5;

// Fastest exclusion check
if sat_collision_rect_rect(x1, y1, rad1, rad1, x2, y2, rad2, rad2) {

    // Collision check
    var dist = point_distance(x1, y1, x2, y2);
    if (dist < rad1 + rad2) {
        var len = (rad1 + rad2) - dist;
        var angle = point_direction(x2, y2, x1, y1);
        __vx = lengthdir_x(len, angle);
        __vy = lengthdir_y(len, angle);
        return true;
    }
}
return false;
