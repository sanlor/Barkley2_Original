/// draw_saw(x, y, direction, length, amplitude, repeats)
_x = argument[0];
_y = argument[1];
_dir = argument[2];
_len = argument[3];
_amp = argument[4];
_rep = argument[5];

_prt = _len / (_rep + 1);

_pnt = 2 + _rep + (_rep - 1);

_anm = 0;
_alt = 0;

_dx0 = _x;
_dy0 = _y;
draw_set_color(c_fuchsia);
for (_i = 1; _i < _pnt; _i += 1)
{
    _ds = _i * _prt;
    _dx1 = _x + lengthdir_x(_ds, _dir + (_amp * _alt));
    _dy1 = _y + lengthdir_y(_ds, _dir + (_amp * _alt));
    draw_line(_dx0, _dy0, _dx1, _dy1);
    _dx0 = _dx1;
    _dy0 = _dy1;
    
    _anm += 1;
    if (_anm > 3) _anm = 0;
    if (_anm == 0) _alt = -1;
    else if (_anm == 1) _alt = 0;
    else if (_anm == 2) _alt = 1;
    else if (_anm == 3) _alt = 0;
}
