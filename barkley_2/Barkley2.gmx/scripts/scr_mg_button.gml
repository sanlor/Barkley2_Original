/// scr_mg_button(x1, x2, y1, y2)
// Button coordinates //
if instance_exists(o_pointer) then
    {
    if view_xview+ o_pointer.x >= argument0 and view_xview+ o_pointer.x <= argument1 and view_yview+o_pointer.y >= argument2 and view_yview+o_pointer.y <= argument3 then return true;    
    else return false;
    }
else
    {
    if o_curs.x + view_xview >= argument0 and o_curs.x + view_xview <= argument1 and o_curs.y + view_yview >= argument2 and o_curs.y + view_yview <= argument3 then return true;    
    else return false;
    }
