/// sat_collision_point_rect(x1, y1, x2, y2, wh2, wv2)
var x1 = argument0;
var y1 = argument1;
var x2 = argument2;
var y2 = argument3;
var wh2 = argument4;
var wv2 = argument5;
return (x1 <= x2+wh2 and x1 >= x2-wh2 and y1 <= y2+wv2 and y1 >= y2-wv2);
