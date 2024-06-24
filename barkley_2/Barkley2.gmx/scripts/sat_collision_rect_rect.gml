/// sat_collision_rect_rect(x1, y1, wh1, wv1, x2, y2, wh1, wv1)

var x1 = argument0;
var y1 = argument1;
var wh1 = argument2;
var wv1 = argument3;
var x2 = argument4;
var y2 = argument5;
var wh2 = argument6;
var wv2 = argument7;

return (x1-wh1 < x2+wh2 and x1+wh1 > x2-wh2 and y1-wv1 < y2+wv2 and y1+wv1 > y2-wv2);
