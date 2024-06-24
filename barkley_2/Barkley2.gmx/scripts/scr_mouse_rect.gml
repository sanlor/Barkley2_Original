/// scr_mouse_rect(x1,y1,x2,y2)
// Split this out the seperate script possibly if list gets big enough
if (object_index == oNote || object_index == oMap || object_index == oShop || object_index == oConfirm) return (mouse_x >= argument0 and mouse_y >= argument1 and mouse_x <= argument2 and mouse_y <= argument3)
return (view_xview+o_curs.x>=argument0 and view_yview+o_curs.y>=argument1 and view_xview+o_curs.x<=argument2 and view_yview+o_curs.y<=argument3)
