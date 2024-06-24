/// scr_collision_tri(point_x, point_y, ri_x1, tri_y1, tri_x2, tri_y2, tri_x3, tri_y3);

var px,py,x1,x2,y2,x3,y3;
px = argument0;
py = argument1;
x1 = argument2;
y1 = argument3;
x2 = argument4;
y2 = argument5;
x3 = argument6;
y3 = argument7;

b1 = ((y2-y3)*(px-x3)+(x3-x2)*(py-y3)) / ((y2-y3)*(x1-x3)+(x3-x2)*(y1-y3));
b2 = ((y3-y1)*(px-x3)+(x1-x3)*(py-y3)) / ((y3-y1)*(x2-x3)+(x1-x3)*(y2-y3));
b3 = 1 - b1 - b2;

return (b1 > 0 && b2 > 0 && b3 > 0);
