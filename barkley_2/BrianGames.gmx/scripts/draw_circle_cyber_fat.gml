/// draw_circle_cyber(x, y, radius, width, offset, stage)
//no change so far
//Atypical arc
//0 = x, 1 = y, 2 = radius, 3 = dir, 4 = dis
//Get first x
_stg = argument[5];
_dir = argument[4];//argument[3] - (argument[2] / 2);
_rad = argument[2];
_dx0 = argument[0] + lengthdir_x(_rad, _dir);
_dy0 = argument[1] + lengthdir_y(_rad, _dir);

_wid = argument[3];
_prt = 18; //was 10
_dv = 360 / _prt; //_rad / 10;
_dir += _dv;

_alp0 = draw_get_alpha() * .33;
_alp1 = draw_get_alpha() * .5;
_alp2 = draw_get_alpha();
_rcl = 0.1 + (_rad / 200); //was flat .33 before
_rcl = 0.25;
//_rcl = 0.1;
//hoopz head
//draw_sprite_ext(s_sine64, 0, argument[0], argument[1], .25, .25, 0, c_fuchsia, (0.4 + random(0.2)) * draw_get_alpha());
for (_i = 0; _i < _prt; _i += 1)
{
    _dx1 = argument[0] + lengthdir_x(_rad, _dir);
    _dy1 = argument[1] + lengthdir_y(_rad, _dir);
    _dr = point_direction(_dx0, _dy0, _dx1, _dy1);
    _ds = point_distance(_dx0, _dy0, _dx1, _dy1);
    draw_sprite_ext(s_sine_line64, 0, _dx0, _dy0, (1.0 / 64) * _ds, _rcl, _dr, draw_get_color(), _alp2 + random(_alp2 / 2));
    draw_sprite_ext(s_sine64, 0, _dx0, _dy0, _rcl, _rcl, 0, draw_get_color(), _alp2 + random(_alp2 / 2));
    //'draw_set_alpha(_alp0);
    //'draw_line_width(_dx0, _dy0, argument[0], argument[1], _wid + (_stg - 1));
    draw_set_alpha(_alp0);
    //if (_stg >= 3) draw_line_width(_dx0, _dy0, _dx1, _dy1, _wid + 2);
    draw_set_alpha(_alp1);
    //if (_stg >= 2) draw_line_width(_dx0, _dy0, _dx1, _dy1, _wid + 1);
    draw_set_alpha(_alp2);
    draw_line_width(_dx0, _dy0, _dx1, _dy1, _wid);
    _dx0 = _dx1;
    _dy0 = _dy1;
    _dir += _dv;
}
//draw_sprite_ext(s_sine64, 0, _dx0, _dy0, .33, .33, 0, draw_get_color(), (0.33 + random(0.1)) * draw_get_alpha());
