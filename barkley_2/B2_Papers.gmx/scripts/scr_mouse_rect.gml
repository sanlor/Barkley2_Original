///scr_mouse_rect(x, y, x, y)
// Mouse Rectangle Collision
// usage: scr_mouse_rect(x1,y1,x2,y2);
var goofster;
if instance_exists(o_pointer) then
    {
    if o_pointer.x >= argument0 and o_pointer.y >= argument1 and o_pointer.x <= argument2 and o_pointer.y <= argument3 then goofster = true;   
    else goofster = false;
    }
else if (o_curs.x>=argument0 and o_curs.y>=argument1 and o_curs.x<=argument2 and o_curs.y<=argument3) then goofster = true;
else goofster = false;
return goofster;
//return (view_xview+o_curs.x>=argument0 and view_yview+o_curs.y>=argument1 and view_xview+o_curs.x<=argument2 and view_yview+o_curs.y<=argument3)
