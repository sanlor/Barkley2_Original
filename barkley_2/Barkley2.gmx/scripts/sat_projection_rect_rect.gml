/// sat_projection_rect_rect(x1, y1, wh1, wv1, x2, y2, wh1, wv1)

var x1 = argument0;
var y1 = argument1;
var wh1 = argument2;
var wv1 = argument3;
var x2 = argument4;
var y2 = argument5;
var wh2 = argument6;
var wv2 = argument7;

var lft1 = x1-wh1;
var top1 = y1-wv1;
var rgt1 = x1+wh1;
var btm1 = y1+wv1;
var lft2 = x2-wh2;
var top2 = y2-wv2;
var rgt2 = x2+wh2;
var btm2 = y2+wv2;

if (lft1 < rgt2 and rgt1 > lft2 and top1 < btm2 and btm1 > top2) {

    // Check ejection vectors
    if (x1 > x2) {
        __vx = rgt2 - lft1;
    }
    else {
        __vx = lft2 - rgt1;
    }
    if (y1 > y2) {
        __vy = btm2 - top1;
    }
    else {
        __vy = top2 - btm1;
    }
    if (abs(__vx) > abs(__vy)) {
        // Vertical vector is smaller
        __vx = 0
    }
    else {
        // Horizontal vector is smaller
        __vy = 0
    }
    return true;
}
return false;
