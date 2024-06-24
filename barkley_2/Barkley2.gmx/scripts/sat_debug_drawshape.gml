/// sat_debug_drawshape(shape)
var shape = argument0
if (is_array(shape)) {
    var shape_type = shape[@ 0]
    var cx = shape[@ 2]
    var cy = shape[@ 3]
    
    if (shape_type == SAT_SHAPE_AABB) {
        var w = shape[@ 4];
        var h = shape[@ 5];
        if (cx+w >= view_xview and cx-w < view_xview + SCREEN_WIDTH and
            cy+h >= view_yview and cy-h < view_yview + SCREEN_HEIGHT) {
            draw_rectangle(cx-w,cy-h,cx+w,cy+h, true)
        }
    }
    else if (shape_type == SAT_SHAPE_CIRCLE) {
        var r = shape[@ 4];
        if (cx+r >= view_xview and cx-r < view_xview + SCREEN_WIDTH and
            cy+r >= view_yview and cy-r < view_yview + SCREEN_HEIGHT) {
            draw_circle(cx,cy,r,true);
        }
    }
    else if (shape_type == SAT_SHAPE_POLYGON) {
        var x1 = shape[@ 4] + cx;
        var y1 = shape[@ 5] + cy;
        var x2 = shape[@ 6] + cx;
        var y2 = shape[@ 7] + cy;
        var x3 = shape[@ 8] + cx;
        var y3 = shape[@ 9] + cy;
        
        var lft = min(x1, x2, x3);
        var rgt = max(x1, x2, x3);
        var top = min(y1, y2, y3);
        var btm = max(y1, y2, y3);
        
        if (rgt >= view_xview and lft < view_xview + SCREEN_WIDTH and
            btm >= view_yview and top < view_yview + SCREEN_HEIGHT) {
            draw_line(x1, y1, x2, y2);
            draw_line(x2, y2, x3, y3);
            draw_line(x3, y3, x1, y1);
        }
    }
}
