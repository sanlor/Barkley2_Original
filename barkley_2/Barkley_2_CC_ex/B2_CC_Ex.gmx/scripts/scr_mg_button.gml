/// scr_mg_button(x1, x2, y1, y2)
// Button coordinates //
if instance_exists(o_pointer) then
    {
    if o_pointer.x >= argument0 and o_pointer.x <= argument1 and o_pointer.y >= argument2 and o_pointer.y <= argument3 then return true;    
    else return false;
    }
