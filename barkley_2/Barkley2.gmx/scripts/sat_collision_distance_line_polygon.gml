/// sat_collision_distance_line_polygon(lx0, ly0, lx1, ly1, t1x, t1y, t2x, t2y, t3x, t3y)
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
    return 0; 
}

// Check if intersects triangle borders
var res;
var mindist = -1;

res = sat_collision_distance_line_line(lx0, ly0, lx1, ly1, tx1, ty1, tx2, ty2);
if (res != -1) { mindist = res }

res = sat_collision_distance_line_line(lx0, ly0, lx1, ly1, tx2, ty2, tx3, ty3);
if (res != -1 and (res < mindist or mindist = -1) ) { mindist = res }

res = sat_collision_distance_line_line(lx0, ly0, lx1, ly1, tx3, ty3, tx1, ty1);
if (res != -1 and (res < mindist or mindist = -1) ) { mindist = res }

// No collision
return mindist;
