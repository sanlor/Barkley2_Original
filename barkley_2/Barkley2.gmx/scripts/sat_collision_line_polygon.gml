/// sat_collision_line_polygon(lx0, ly0, lx1, ly1, t1x, t1y, t2x, t2y, t3x, t3y)
var lx0 = argument0;
var ly0 = argument1;
var lx1 = argument2;
var ly1 = argument3;
var tx1 = argument4;
var ty1 = argument5;
var tx2 = argument6;
var ty2 = argument7;
var tx3 = argument8;
var ty3 = argument9;


// Check if start point in triangle)
if (point_in_triangle(lx0, ly0, tx1, ty1, tx2, ty2, tx3, ty3)) {
    return true; 
}

// Check if intersects triangle borders
if sat_collision_line_line(lx0, ly0, lx1, ly1, tx1, ty1, tx2, ty2) return true;

if sat_collision_line_line(lx0, ly0, lx1, ly1, tx2, ty2, tx3, ty3) return true;

if sat_collision_line_line(lx0, ly0, lx1, ly1, tx3, ty3, tx1, ty1) return true;

// No collision
return false;
