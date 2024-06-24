/// sat_projection_polygon_polygon(polygon, polygon_rigid)

var p = argument0;
var q = argument1;

var p_normals = p[@ 1];
var p_x = p[@ 2];
var p_y = p[@ 3];
var p_x1 = p[@ 4];
var p_y1 = p[@ 5];
var p_x2 = p[@ 6];
var p_y2 = p[@ 7];
var p_x3 = p[@ 8];
var p_y3 = p[@ 9];

var q_normals = q[@ 1];
var q_x = q[@ 2];
var q_y = q[@ 3];
var q_x1 = q[@ 4];
var q_y1 = q[@ 5];
var q_x2 = q[@ 6];
var q_y2 = q[@ 7];
var q_x3 = q[@ 8];
var q_y3 = q[@ 9];

var min_proj = 0;
var proj_vx;
var proj_vy;

var i, j;
var nx, ny, nxc, nyc;
var proj;

// Iterate over polygon P normals
i = 0;
j = 4;
while (i < 6) {
    // Use the normal of each of the polygon's sides.
    // For normal origin, we use any of the corner points of the side
    // since the exact point doesnt matter as long as its on the line.
    nx = p_normals[@ i++];
    ny = p_normals[@ i++];
    nxc = p[@ j++] + p_x;
    nyc = p[@ j++] + p_y;
    proj = sat_util_minprojection_polygon(nxc, nyc, nx, ny, q_x, q_y, q_x1, q_y1, q_x2, q_y2, q_x3, q_y3);
    if (proj >= 0) { return false; }
    if (proj > min_proj or i == 2) { min_proj = proj; proj_vx = -nx; proj_vy = -ny; }
}

// Iterate over polygon Q normals
i = 0;
j = 4;
while (i < 6) {
    // Use the normal of each of the polygon's sides.
    // For normal origin, we use any of the corner points of the side
    // since the exact point doesnt matter as long as its on the line.
    nx = q_normals[@ i++];
    ny = q_normals[@ i++];
    nxc = q[@ j++] + q_x;
    nyc = q[@ j++] + q_y;
    proj = sat_util_minprojection_polygon(nxc, nyc, nx, ny, p_x, p_y, p_x1, p_y1, p_x2, p_y2, p_x3, p_y3);
    if (proj >= 0) { return false; }
    if (proj > min_proj) { min_proj = proj; proj_vx = nx; proj_vy = ny; } // Notice the normal inversion
}


__vx = proj_vx * (-min_proj);
__vy = proj_vy * (-min_proj);
return true;
