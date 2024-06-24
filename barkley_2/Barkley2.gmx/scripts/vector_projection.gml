/// vector_projection(ux, uy, vx, vy)
/// Returns the projection of U on V

var ux = argument0;
var uy = argument1;
var vx = argument2;
var vy = argument3;

var p = 0;

var length_squared = (vx*vx + vy*vy);
if (length_squared == 0) {
    p[0] = 0;
    p[1] = 0;
    return p;
}

var dot = vector_dot(ux, uy, vx, vy);
var scalar = dot / length_squared;

p[0] = vx * scalar;
p[1] = vy * scalar;
return p;
