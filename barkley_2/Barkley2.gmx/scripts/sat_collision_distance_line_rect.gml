/// sat_collision_distance_line_line(lx0, ly0, lx1, ly1, rx, ry, rw, rh)
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
    return -1;    
}

// Check if start point in rectangle
if (lx0 >= lft && lx0 <= rgt && ly0 >= top && ly0 <= btm) {
    return 0; 
}

var res;
var mindist = -1;

res = sat_collision_distance_line_line(lx0, ly0, lx1, ly1, lft, top, rgt, top);
if (res != -1) { mindist = res }

res = sat_collision_distance_line_line(lx0, ly0, lx1, ly1, lft, btm, rgt, btm);
if (res != -1 and (res < mindist or mindist = -1) ) { mindist = res }

res = sat_collision_distance_line_line(lx0, ly0, lx1, ly1, lft, top, lft, btm);
if (res != -1 and (res < mindist or mindist = -1) ) { mindist = res }

res = sat_collision_distance_line_line(lx0, ly0, lx1, ly1, rgt, top, rgt, btm);
if (res != -1 and (res < mindist or mindist = -1) ) { mindist = res }

return mindist;
