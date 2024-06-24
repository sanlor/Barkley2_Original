/// sat_util_minprojection_circle(cx, cy, px_unit, py_unit, sx, sy, srad)
/// Calculates minimum projection of the shape on the (unit vector) projection vector

var cx = argument0;
var cy = argument1;
var px = argument2;
var py = argument3;
var sx = argument4;
var sy = argument5;
var srad = argument6;

var sx_vec = sx - cx;
var sy_vec = sy - cy;

/* -- OPTIMIZATION --
   origin_dist = Magnitude of vector projection.
   If a vector is being projected onto a unit vector then magnitude == vector_projection_scalar
   However vector_projection_scalar with a unit vector is:
   vector_dot / length_squared == vector_dot / 1 = vector_dot */
var origin_dist = vector_dot(sx_vec, sy_vec, px, py)

// Calculate minimum projection
return origin_dist - srad;