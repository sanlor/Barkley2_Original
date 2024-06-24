/// sat_collision_point_circle(x1, y1, x2, y2, rad2)
var x1 = argument0;
var y1 = argument1;
var x2 = argument2;
var y2 = argument3;
var rad2 = argument4;
return (point_distance(x1, y1, x2, y2) <= rad2);
