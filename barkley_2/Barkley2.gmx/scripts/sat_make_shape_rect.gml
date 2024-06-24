/// sat_make_shape_rect(x, y, hori_width, vert_width)

var sx = argument0;
var sy = argument1;
var swh = argument2;
var swv = argument3;

var shape = 0;
// Shape type
shape[0] = SAT_SHAPE_AABB;
// Normals
shape[1] = 0; // Normals are known, they have been hardcoded where appropriate
// Origin
shape[2] = sx;
shape[3] = sy;
// Shape data
shape[4] = swh; // Shape Width Horizontal
shape[5] = swv; // Shape Width Vertical

return shape;
