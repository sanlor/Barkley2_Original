/// draw_square(x, y, direction, length, amplitude, repeats)
_x = argument[0];
_y = argument[1];
_dir = argument[2];
_len = argument[3];
_amp = argument[4];
_rep = argument[5];

_prt = _len / (_rep + 1);

_pnt = 3 + (_rep * 3);
_pnt -= 2; //make it end in center

_anm = 0;
_alt = 0;

_ds = _prt;
_dx0 = _x;
_dy0 = _y;
_alp0 = draw_get_alpha() * .33;
_alp1 = draw_get_alpha() * .66;
_alp2 = draw_get_alpha();
draw_set_color(c_fuchsia);
for (_i = 0; _i < _pnt; _i += 1)
{
    draw_sprite_ext(s_sine64, 0, _dx0, _dy0, .33, .33, 0, draw_get_color(), (0.33 + random(0.1)) * draw_get_alpha());
    _ds = min(_ds, _len);
    _dx1 = _x + lengthdir_x(_ds, _dir) + lengthdir_x(_amp * _alt, _dir - 90);
    _dy1 = _y + lengthdir_y(_ds, _dir) + lengthdir_y(_amp * _alt, _dir - 90);
    draw_set_alpha(_alp0);
    draw_line_width(_dx0, _dy0, _dx1, _dy1, 5);
    draw_set_alpha(_alp1);
    draw_line_width(_dx0, _dy0, _dx1, _dy1, 3);
    draw_set_alpha(_alp2);
    draw_line(_dx0, _dy0, _dx1, _dy1);
    _dx0 = _dx1;
    _dy0 = _dy1;
    
    _anm += 1;
    if (_anm == 0) _alt = 0;
    else if (_anm == 1) _alt = 1;
    else if (_anm == 2) { _alt = 1; _ds += _prt; }
    else if (_anm == 3) _alt = 0;
    else if (_anm == 4) _alt = -1;
    else if (_anm == 5) { _alt = -1; _ds += _prt; _anm = -1; } 
}  
