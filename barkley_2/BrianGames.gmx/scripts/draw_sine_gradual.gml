/// draw_sine_gradual(x, y, direction, length, amplitude, repeats)
var _orx = argument0;
var _ory = argument1;
var _dir = argument2;
var _len = argument3;
var _amp = argument4;
var _res = 0.524;
var _g = 0;
var _prx = _orx;
var _pry = _ory;
var _repeats = (argument5 * 2) * pi;

for (_i = 0; _i <= _repeats; _i += _res)
{
    var _sin = ((_amp / _repeats) * _i) * sin(_i);
    var _dis = (_i / _repeats) * _len;
    var _xx = _orx + lengthdir_x(_dis, _dir) + lengthdir_x(_sin, _dir - 90);
    var _yy = _ory + lengthdir_y(_dis, _dir) + lengthdir_y(_sin, _dir - 90);
    if (_g > 0)
    {
        draw_set_alpha(draw_get_alpha() / 2);
        draw_line_width(_prx, _pry, _xx, _yy, 3);
        draw_set_alpha(draw_get_alpha() * 2);
        draw_set_color(c_fuchsia);
        draw_line(_prx, _pry, _xx, _yy);
        _prx = _xx;
        _pry = _yy;
    }
    _g += 1;
}
