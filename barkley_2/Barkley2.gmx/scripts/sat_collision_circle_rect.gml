/// sat_collision_circle_rect(x1, y1, rad1, x2, y2, wh2, wv2)


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
    var cx;
    var cy;
    
    if (voroni == 1) {
        cx = x2-wh2;
        cy = y2-wv2;
    }
    else if (voroni == 3) {
        cx = x2+wh2;
        cy = y2-wv2;
    }
    else if (voroni == 7) {
        cx = x2-wh2;
        cy = y2+wv2;
    }
    else if (voroni == 9) {
        cx = x2+wh2;
        cy = y2+wv2;
    }
    else if (voroni == 2) {
        return ((y2-wv2) - (y1 + rad1) < 0);
    }
    else if (voroni == 8) {
        return ((y2+wv2) - (y1 - rad1) > 0);
    }
    else if (voroni == 4) {
        return ((x2-wh2) - (x1 + rad1)< 0);
    }
    else if (voroni == 6) {
        return ((x2+wh2) - (x1 - rad1) > 0);
    } else { // 5
        return true;
    }
    
    // Corner check
    var cdist = point_distance(cx, cy, x1, y1);
    cdist += 0.001 // (Hackily) fix a collision detection error due to floatingpoint imprecision
    return (cdist < rad1);
//}

return false;
