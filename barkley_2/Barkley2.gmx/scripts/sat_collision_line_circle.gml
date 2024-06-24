/// sat_collision_line_circle(lx0, ly0, lx1, ly1, cx, cy, crad)

var lx0 = argument0;
var ly0 = argument1;
var lx1 = argument2;
var ly1 = argument3;
var cx = argument4;
var cy = argument5;
var crad = argument6;

// First check if start point in circle
if point_in_circle(lx0, ly0, cx, cy, crad) {
    return true;
}
// or end point
if point_in_circle(lx1, ly1, cx, cy, crad) {
    return true;
}



// Line vector
var line_vx = lx1-lx0;
var line_vy = ly1-ly0;

// To circle center vector
var tocent_vx = cx - lx0;
var tocent_vy = cy - ly0;

// If circle on wrong end of startpoint, no collision
if (vector_dot(line_vx, line_vy, tocent_vx, tocent_vy) < 0) {
    return false;
}

// Line length
var line_len = vector_magnitude(line_vx, line_vy);
if (line_len = 0) return false;

// Line-perpendicular distance
var line_vx_unit = line_vx / line_len
var line_vy_unit = line_vy / line_len
var lineperp = vector_projection(tocent_vx, tocent_vy, -line_vy_unit, line_vx_unit)

if (vector_magnitude(lineperp[0], lineperp[1]) >= crad) {
    return false; // Circle to far away from line
}
lineperp = 0; //cleanup

// Line parallel distance
var lineparal = vector_projection(tocent_vx, tocent_vy, line_vx_unit, line_vy_unit);
if (vector_magnitude(lineparal[0], lineparal[1]) > line_len) {
    return false; // Circle beyond line endpoint
}

return true;
