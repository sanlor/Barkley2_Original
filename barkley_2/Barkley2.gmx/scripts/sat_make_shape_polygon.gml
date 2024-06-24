/// sat_make_shape_polygon(cx, cy, x1, y1, x2, y2, x3, y3)

var cx = argument0;
var cy = argument1;
var x1 = argument2;
var y1 = argument3;
var x2 = argument4;
var y2 = argument5;
var x3 = argument6;
var y3 = argument7;

// Check if polygon is clockwise defined
var leftface;
// Vector from x1,y1 to x2,y2
var vx = x2 - x1;
var vy = y2 - y1;
// Leftfacing normal of this vector
var v1_normal = vector_normal_left(vx, vy)
// Vector from x1,y1 to x3,y3
vx = x3 - x1;
vy = y3 - y1;
// If clockwise defined, this dot product is < 0
leftface = (vector_dot(v1_normal[0], v1_normal[1], vx, vy) < 0)
v1_normal = 0 // cleanup

// Calculate normals (left-facing)
var normals = 0;
var normal;

if (leftface) {
    normal = vector_normal_left(x2-x1, y2-y1);
    normals[0] = normal[0];
    normals[1] = normal[1];
    normal = 0;
    
    normal = vector_normal_left(x3-x2, y3-y2);
    normals[2] = normal[0];
    normals[3] = normal[1];
    normal = 0;
    
    normal = vector_normal_left(x1-x3, y1-y3);
    normals[4] = normal[0];
    normals[5] = normal[1];
    normal = 0;
}
else {
    normal = vector_normal_right(x2-x1, y2-y1);
    normals[0] = normal[0];
    normals[1] = normal[1];
    normal = 0;
    
    normal = vector_normal_right(x3-x2, y3-y2);
    normals[2] = normal[0];
    normals[3] = normal[1];
    normal = 0;
    
    normal = vector_normal_right(x1-x3, y1-y3);
    normals[4] = normal[0];
    normals[5] = normal[1];
    normal = 0;
}
        
var shape = 0;
// Shape type
shape[0] = SAT_SHAPE_POLYGON;
// Normals
shape[1] = normals;
// Origin
shape[2] = cx;
shape[3] = cy;
// Shape data
shape[4] = x1;
shape[5] = y1;
shape[6] = x2;
shape[7] = y2;
shape[8] = x3;
shape[9] = y3;

return shape;
