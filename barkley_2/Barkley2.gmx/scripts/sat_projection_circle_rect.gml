/// sat_projection_circle_rect(x1, y1, rad1, x2, y2, wh2, wv2)

var x1 = argument0;
var y1 = argument1;
var rad1 = argument2;
var x2 = argument3;
var y2 = argument4;
var wh2 = argument5;
var wv2 = argument6;

// Fastest exclusion check
/* COMMENTED OUT DYE TO BUG WITH rectangle_in_circle */
//if (rectangle_in_circle(x2-wh2, y2-wv2, x2+wh2, y2+wv2, x1, y1, rad1) != 0) {

    // Check Voroni region:
    // 1 2 3
    //  ---
    // 4|5|6
    //  ---
    // 7 8 9
    
    var voroni;
    if (y1 <= y2-wv2) {
        // 1 2 3
        voroni = 1;
    }
    else if (y1 >= y2+wv2) {
        // 7 8 9
        voroni = 7;
    }
    else {
        // 4 5 6
        voroni = 4;
    }
    if (x1 >= x2+wh2) {
        voroni += 2;
    }
    else if (x1 > x2-wh2) {
        voroni += 1;
    }
    
    // Do check based on voroni region
    var corner = false;
    var cx;
    var cy;
    
    if (voroni == 1) {
        corner = true;
        cx = x2-wh2;
        cy = y2-wv2;
    }
    else if (voroni == 3) {
        corner = true;
        cx = x2+wh2;
        cy = y2-wv2;
    }
    else if (voroni == 7) {
        corner = true;
        cx = x2-wh2;
        cy = y2+wv2;
    }
    else if (voroni == 9) {
        corner = true;
        cx = x2+wh2;
        cy = y2+wv2;
    }
    else if (voroni == 2) {
        __vx = 0;
        __vy = (y2-wv2) - (y1 + rad1);
        return (__vy < 0);
    }
    else if (voroni == 8) {
        __vx = 0;
        __vy = (y2+wv2) - (y1 - rad1);
        return (__vy > 0);
    }
    else if (voroni == 4) {
        __vx = (x2-wh2) - (x1 + rad1);
        __vy = 0;
        return (__vx < 0);
    }
    else if (voroni == 6) {
        __vx = (x2+wh2) - (x1 - rad1);
        __vy = 0;
        return (__vx > 0);
    } else { // 5
        // Check ejection vectors
        if (x1 > x2) {
            __vx = (x2+wh2) - (x1-rad1);
        }
        else {
            __vx = (x2-wh2) - (x1+rad1);
        }
        if (y1 > y2) {
            __vy = (y2+wv2) - (y1-rad1);
        }
        else {
            __vy = (y2-wv2) - (y1+rad1);
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
    
    if (corner) {
        var cdist = point_distance(cx, cy, x1, y1);
        cdist += 0.0001 // (Hackily) fix a collision detection error due to floatingpoint imprecision
        if (cdist < rad1) {
            var cdir = point_direction(cx, cy, x1, y1);
            cdist -= rad1;
            __vx = -lengthdir_x(cdist,cdir);
            __vy = -lengthdir_y(cdist,cdir);
            return true;
        }
    }
//}
return false;
