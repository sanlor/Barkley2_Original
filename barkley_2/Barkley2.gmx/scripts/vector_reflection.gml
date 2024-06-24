/// vector_reflection(x1, y1, x2, y2)
/// Reflects vector 1 over vector 2

var x1 = argument0
var y1 = argument1
var x2 = argument2
var y2 = argument3

var nl = vector_normal_left(x2, y2);
var dot = vector_dot(x1, y1, nl[0], nl[1]);

var res = 0;
res[0] = x1 - (2 * dot * nl[0]);
res[1] = y1 - (2 * dot * nl[1]);
return res;
