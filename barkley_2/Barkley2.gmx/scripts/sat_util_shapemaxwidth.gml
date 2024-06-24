/// sat_util_shapemaxwidth(shape)

var shape = argument0;

var shape_type = shape[0];
var wh1, wv1;
if (shape_type == SAT_SHAPE_AABB) {
    wh1 = shape[4];
    wv1 = shape[5];
    return max(wh1, wv1);
}
else if (shape_type == SAT_SHAPE_CIRCLE) {
    return shape[4];
}
else if (shape_type == SAT_SHAPE_POLYGON) {
    // Make copy of shape with new XY coords
    // NOTE: No @ in brackets means a new copy is made on write
    shape[2] = x1
    shape[3] = y1
    var px1 = shape[4]
    var py1 = shape[5]
    var px2 = shape[6]
    var py2 = shape[7]
    var px3 = shape[8]
    var py3 = shape[9]
    var poly_lft = min(px1, px2, px3)
    var poly_rgt = max(px1, px2, px3)
    var poly_top = min(py1, py2, py3)
    var poly_btm = max(py1, py2, py3)
    wh1 = (poly_rgt - poly_lft) / 2
    wv1 = (poly_btm - poly_top) / 2
    return max(wh1, wv1);
}
