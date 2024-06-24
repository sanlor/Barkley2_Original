/// sat_projection_rect_polygon(rx, ry, rw, rh, polygon)

var rx = argument0;
var ry = argument1;
var rw = argument2;
var rh = argument3;
var polygon = argument4;

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
    proj = sat_util_minprojection_rect(nxc, nyc, nx, ny, rx, ry, rw, rh);
    if (proj >= 0) { return false; }
    if (proj > min_proj or i == 2) { min_proj = proj; proj_vx = nx; proj_vy = ny; }
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
if (proj >= 0) { return false; }
if (proj > min_proj) { min_proj = proj; proj_vx = 1; proj_vy = 0; } // NOTE: Pushing Rect out from Poly, normal inverted!

// Right side
proj = sat_util_minprojection_polygon(rx + rw, ry, 1, 0, px, py, px1, py1, px2, py2, px3, py3)
if (proj >= 0) { return false; }
if (proj > min_proj) { min_proj = proj; proj_vx = -1; proj_vy = 0; } // NOTE: Pushing Rect out from Poly, normal inverted!

// Top side
proj = sat_util_minprojection_polygon(rx, ry - rh, 0, -1, px, py, px1, py1, px2, py2, px3, py3)
if (proj >= 0) { return false; }
if (proj > min_proj) { min_proj = proj; proj_vx = 0; proj_vy = 1; } // NOTE: Pushing Rect out from Poly, normal inverted!

// Left side
proj = sat_util_minprojection_polygon(rx, ry + rh, 0, 1, px, py, px1, py1, px2, py2, px3, py3)
if (proj >= 0) { return false; }
if (proj > min_proj) { min_proj = proj; proj_vx = 0; proj_vy = -1; } // NOTE: Pushing Rect out from Poly, normal inverted!

__vx = proj_vx * (-min_proj);
__vy = proj_vy * (-min_proj);
return true;
