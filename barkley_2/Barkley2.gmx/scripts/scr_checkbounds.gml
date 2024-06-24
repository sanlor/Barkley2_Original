/// scr_checkbounds(check_x,check_y,left_bounds,top_bound,right_bounds,bottom_bounds)

var _bx,_by,_retvar;

_bx = argument0;
_by = argument1;

_retvar = false;

if(_bx>=argument2 && _bx <= argument4)
{
    if(_by>=argument3 && _by<= argument5)
    {
        _retvar = true;
    }
}

return _retvar;
