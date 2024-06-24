/// sat_projection_circle_polygon(cx, cy, rad, polygon)

var cx = argument0;
var cy = argument1;
var rad = argument2;
var polygon = argument3;

var normals = polygon[@ 1];
var px = polygon[@ 2];
var py = polygon[@ 3];

var min_proj = 0;
var proj_vx;
var proj_vy;

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
    proj = sat_util_minprojection_circle(nxc, nyc, nx, ny, cx, cy, rad);
    if (proj >= 0) { return false; }
    if (proj > min_proj or i == 2) { min_proj = proj; proj_vx = nx; proj_vy = ny; }
}

// Find closest polygon corner
var px1 = polygon[@ 4] + px;
var py1 = polygon[@ 5] + py;
var px2 = polygon[@ 6] + px;
var py2 = polygon[@ 7] + py;
var px3 = polygon[@ 8] + px;
var py3 = polygon[@ 9] + py;
var dist1, dist2, dist3;
var corner_vx, corner_vy, corner_dist;
var dot1, dot2, in_corner_voroni;

dist1 = point_distance(px1, py1, cx, cy)
dist2 = point_distance(px2, py2, cx, cy)
dist3 = point_distance(px3, py3, cx, cy)


if (dist1 < dist2) {
    if (dist1 < dist3) {
        // Corner 1 is closest
        corner_vx = cx - px1;
        corner_vy = cy - py1;
        corner_dist = dist1;
        dot1 = vector_dot(cx - px1, cy - py1, px2 - px1, py2 - py1);
        dot2 = vector_dot(cx - px1, cy - py1, px3 - px1, py3 - py1);
        in_corner_voroni = (dot1 < 0 and dot2 < 0)
    }
    else {
        // Corner 3 is closest
        corner_vx = cx - px3;
        corner_vy = cy - py3;
        corner_dist = dist3;
        dot1 = vector_dot(cx - px3, cy - py3, px1 - px3, py1 - py3);
        dot2 = vector_dot(cx - px3, cy - py3, px2 - px3, py2 - py3);
        in_corner_voroni = (dot1 < 0 and dot2 < 0)
    }
}
else {
    if (dist2 < dist3) {
        // Corner 2 is closest
        corner_vx = cx - px2;
        corner_vy = cy - py2;
        corner_dist = dist2;
        dot1 = vector_dot(cx - px2, cy - py2, px3 - px2, py3 - py2);
        dot2 = vector_dot(cx - px2, cy - py2, px1 - px2, py1 - py2);
        in_corner_voroni = (dot1 < 0 and dot2 < 0)
    }
    else {
        // Corner 3 is closest
        corner_vx = cx - px3;
        corner_vy = cy - py3;
        corner_dist = dist3;
        dot1 = vector_dot(cx - px3, cy - py3, px1 - px3, py1 - py3);
        dot2 = vector_dot(cx - px3, cy - py3, px2 - px3, py2 - py3);
        in_corner_voroni = (dot1 < 0 and dot2 < 0)
    }
}

if (in_corner_voroni and corner_dist != 0) {
    // Result is based on vector from nearest corner
    if (corner_dist < rad) {
        __vx = (corner_vx * (rad - corner_dist)) / corner_dist;
        __vy = (corner_vy * (rad - corner_dist)) / corner_dist;
        return true;
    }
    else {
        return false;
    }
}
else {
    __vx = proj_vx * (-min_proj);
    __vy = proj_vy * (-min_proj);
    return true;
}
