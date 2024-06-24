/// sat_collision_circle_circle(x1, y1, rad1, x2, y2, rad2)

var x1 = argument0;
var y1 = argument1;
var rad1 = argument2;
var x2 = argument3;
var y2 = argument4;
var rad2 = argument5;

return ((point_distance(x1, y1, x2, y2) + 0.001) < (rad1+rad2));
