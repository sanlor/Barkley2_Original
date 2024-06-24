/// sat_collision_line_line(ax0, ay0, ax1, ay1, bx0, by0, bx1, by1)
/// According to http://stackoverflow.com/questions/563198/how-do-you-detect-where-two-line-segments-intersect

var s1_x = argument2 - argument0;     var s1_y = argument3 - argument1;
var s2_x = argument6 - argument4;     var s2_y = argument7 - argument5;

var dividend = (-s2_x * s1_y + s1_x * s2_y); // Optimization
if dividend == 0 {
    return false; // Prevent division by zero
}

var z1, z2; //-- Optimization
z1 = argument0 - argument4;
z2 = argument1 - argument5;

var s, t;
s = (-s1_y * z1 + s1_x * z2) / dividend;
t = ( s2_x * z2 - s2_y * z1) / dividend;

return (s >= 0 && s <= 1 && t >= 0 && t <= 1);
