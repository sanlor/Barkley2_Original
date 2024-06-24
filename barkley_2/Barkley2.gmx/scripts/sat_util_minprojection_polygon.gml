/// sat_util_minprojection_polygon(cx, cy, px_unit, py_unit, sx, sy, x1, y1, x2, y2, x3, y3)
/// Calculates minimum projection of the shape on the (unit vector) projection vector

var cx = argument0;
var cy = argument1;
var px = argument2;
var py = argument3;
var sx = argument4;
var sy = argument5;
var x1 = argument6;
var y1 = argument7;
var x2 = argument8;
var y2 = argument9;
var x3 = argument10;
var y3 = argument11;

var sx_vec = sx - cx;
var sy_vec = sy - cy;

/* -- OPTIMIZATION --
   origin_dist = Magnitude of vector projection.
   If a vector is being projected onto a unit vector then magnitude == vector_projection_scalar
   However vector_projection_scalar with a unit vector is:
   vector_dot / length_squared == vector_dot / 1 = vector_dot
   The same applies for the min_proj*/
   
var origin_dist = vector_dot(sx_vec, sy_vec, px, py)

var min_proj = vector_dot(x1, y1, px, py)
min_proj = min(min_proj, vector_dot(x2, y2, px, py))
min_proj = min(min_proj, vector_dot(x3, y3, px, py))

return origin_dist + min_proj; // min_proj is negative
