/// sat_make_shape_fromSprite(sprite_index, x, y)

var spr = argument0
var sx = argument1
var sy = argument2

var lft = sprite_get_bbox_left(spr)
var rgt = sprite_get_bbox_right(spr)
var top = sprite_get_bbox_top(spr)
var btm = sprite_get_bbox_bottom(spr)
var origx = sprite_get_xoffset(spr)
var origy = sprite_get_yoffset(spr)

var cx = (lft+rgt)/2 + sx - origx
var cy = (top+btm)/2 + sy - origy
var cw = (rgt-lft)/2
var ch = (btm-top)/2

return sat_make_shape_rect(cx, cy, cw, ch)
