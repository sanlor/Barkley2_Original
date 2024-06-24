/// sat_collision_line_rect(lx0, ly0, lx1, ly1, rx, ry, rw, rh)

var lx0 = argument0;
var ly0 = argument1;
var lx1 = argument2;
var ly1 = argument3;
var rx = argument4;
var ry = argument5;
var rw = argument6;
var rh = argument7;

var lft = rx-rw;
var rgt = rx+rw;
var top = ry-rh;
var btm = ry+rh;

// Fastest exclusion
if ((lx0 < lft && lx1 < lft) ||
    (lx0 > rgt && lx1 > rgt) ||
    (ly0 < top && ly1 < top) ||
    (ly0 < top && ly1 < top)) {
    return false;    
}

// Check if either end point in rectangle
if (lx0 >= lft && lx0 <= rgt && ly0 >= top && ly0 <= btm) {
    return true;   
}

// Check if end point in rectangle
if (lx1 >= lft && lx1 <= rgt && ly1 >= top && ly1 <= btm) {
    return true; 
}

// Check if intersects rectangle
/* OPTIMIZATION: Since we check above if any end point is inside the rectangle,
   we know here that they are not - so if they intersect the rectangle,
   they will intersect one or both of the below two lines. This saves us two
   line checks, compared to checking against each of the 4 borders. */
var res;

if sat_collision_line_line(lx0, ly0, lx1, ly1, lft, top, rgt, btm) return true;
if sat_collision_distance_line_line(lx0, ly0, lx1, ly1, lft, btm, rgt, top) return true;

// No collision
return false;
