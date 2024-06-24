/// sat_make_shape_circle(x, y, radius)

var sx = argument0;
var sy = argument1;
var srad = argument2;

var shape = 0;
// Shape type
shape[0] = SAT_SHAPE_CIRCLE;
// Normals
shape[1] = 0; // No normals
// Origin
shape[2] = sx;
shape[3] = sy;
// Shape data
shape[4] = srad;

return shape;
