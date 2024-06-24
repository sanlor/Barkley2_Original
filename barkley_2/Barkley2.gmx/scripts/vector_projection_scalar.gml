/// vector_projection_scalar(ux, uy, vx, vy)
/// Returns the scalar of the projection of U on V

var ux = argument0;
var uy = argument1;
var vx = argument2;
var vy = argument3;

var length_squared = (vx*vx + vy*vy);
if (length_squared == 0) {
    return 0; // Have to handle this case somehow...
}

var dot = vector_dot(ux, uy, vx, vy);
return dot / length_squared;
