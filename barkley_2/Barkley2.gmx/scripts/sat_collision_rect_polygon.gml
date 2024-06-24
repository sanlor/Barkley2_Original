/// sat_collision_rect_polygon(rx, ry, rw, rh, polygon_shape)

var rx = argument0;
var ry = argument1;
var rw = argument2;
var rh = argument3;
var polygon = argument4;

var normals = polygon[@ 1];
var px = polygon[@ 2];
var py = polygon[@ 3];

// NOTE: Using -0.001 throughout instead of 0 to (hackishly) fix a collision detection error due to floatingpoint imprecision

// Iterate over polygon normals
var i = 0;
var j = 4;
var nx, ny;
var proj;
while (i < 6) {
    // Use the normal of each of the polygon's sides.
    // For normal origin, we use any of the corner points of the side
    // since the exact point doesnt matter as long as its on the line.
    nx = normals[@ i++];
    ny = normals[@ i++];
    nxc = polygon[@ j++] + px;
    nyc = polygon[@ j++] + py;
    proj = sat_util_minprojection_rect(nxc, nyc, nx, ny, rx, ry, rw, rh);
    if (proj >= -0.001) {
        return false; }
}

// Iterate over rect normals
var px1 = polygon[@ 4]
var py1 = polygon[@ 5]
var px2 = polygon[@ 6]
var py2 = polygon[@ 7]
var px3 = polygon[@ 8]
var py3 = polygon[@ 9]

// Left side
proj = sat_util_minprojection_polygon(rx - rw, ry, -1, 0, px, py, px1, py1, px2, py2, px3, py3)
if (proj >= -0.001) {
    return false; }

// Right side
proj = sat_util_minprojection_polygon(rx + rw, ry, 1, 0, px, py, px1, py1, px2, py2, px3, py3)
if (proj >= -0.001) {
    return false; }

// Top side
proj = sat_util_minprojection_polygon(rx, ry - rh, 0, -1, px, py, px1, py1, px2, py2, px3, py3)
if (proj >= -0.001) {
    return false; }

// Left side
proj = sat_util_minprojection_polygon(rx, ry + rh, 0, 1, px, py, px1, py1, px2, py2, px3, py3)
if (proj >= -0.001) {
    return false; }

return true;
