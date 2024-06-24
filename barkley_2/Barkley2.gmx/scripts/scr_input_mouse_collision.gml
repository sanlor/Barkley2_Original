///scr_input_mouse_collision(real x1, real y1, real x2, real y2)
var x1, y1, x2, y2;

x1 = argument[0];
y1 = argument[1];
x2 = argument[2];
y2 = argument[3];

var mx = device_mouse_x(0) - view_xview[0];
var my = device_mouse_y(0) - view_yview[0];

return (mx >= x1 && mx <= x2 && my >= y1 && my <= y2);
