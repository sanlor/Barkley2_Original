/// draw_saw(x, y, direction, length, amplitude, repeats)
_x = argument[0];
_y = argument[1];
_dir = argument[2];
_len = argument[3];
_amp = argument[4];
_rep = argument[5];

_prt = _len / (_rep + 1);

_pnt = 2 + _rep;// + (_rep - 1);

_anm = 0;
_alt = -1;

_dx0 = _x;
_dy0 = _y;
//draw_set_color(c_fuchsia);
for (_i = 0.5; _i < _pnt; _i += 1) //was _i = 1
{
    if (_i + 1 < _pnt) x = x; else _alt = 0;
    _ds = _i * _prt;
    _ds = min(_ds, _len);
    _dx1 = _x + lengthdir_x(_ds, _dir) + lengthdir_x(_amp * _alt, _dir - 90);
    _dy1 = _y + lengthdir_y(_ds, _dir) + lengthdir_y(_amp * _alt, _dir - 90);
    draw_set_alpha(0.2); //draw_get_alpha());
    draw_line(_dx0, _dy0, _dx1, _dy1);
    //draw_sprite_ext(s1x1, 0, _dx0, _dy0, point_distance(_dx0, _dy0, _dx1, _dy1), 1, point_direction(_dx0, _dy0, _dx1, _dy1), draw_get_color(), 0.08);
    _dx0 = _dx1;
    _dy0 = _dy1;
    
    if (_alt == -1) _alt = 1; else _alt = -1;   
}
draw_set_alpha(1);
