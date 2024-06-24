/// draw_arc(x, y, radius, dir, dis)
//Atypical arc
//0 = x, 1 = y, 2 = radius, 3 = dir, 4 = dis
//Get first x
_dir = argument[3] - (argument[2] / 2);
_dx0 = argument[0] + lengthdir_x(argument[4], _dir);
_dy0 = argument[1] + lengthdir_y(argument[4], _dir);
_prt = argument[2] / 10; //was 10
_dv = argument[2] / 10;
_dir += _dv;
//hoopz head
//draw_sprite_ext(s_sine64, 0, argument[0], argument[1], .25, .25, 0, c_fuchsia, (0.4 + random(0.2)) * draw_get_alpha());
for (_i = 0; _i < _prt; _i += 1)
{
    _dx1 = argument[0] + lengthdir_x(argument[4], _dir);
    _dy1 = argument[1] + lengthdir_y(argument[4], _dir);
    _dr = point_direction(_dx0, _dy0, _dx1, _dy1);
    _ds = point_distance(_dx0, _dy0, _dx1, _dy1);
    //draw_sprite_ext(s_sine_line64, 0, _dx0, _dy0, .25, (1.0 / 64) * _ds, _dr, draw_get_color(), 0.4 + random(0.2));
    draw_sprite_ext(s_sine64, 0, _dx0, _dy0, .33, .33, 0, draw_get_color(), (0.33 + random(0.1)) * draw_get_alpha());
    draw_set_alpha(draw_get_alpha() * .33);
    draw_line_width(_dx0, _dy0, _dx1, _dy1, 5);
    draw_set_alpha(draw_get_alpha() * 3);
    draw_set_alpha(draw_get_alpha() / 2);
    draw_line_width(_dx0, _dy0, _dx1, _dy1, 3);
    draw_set_alpha(draw_get_alpha() * 2);
    draw_line(_dx0, _dy0, _dx1, _dy1);
    _dx0 = _dx1;
    _dy0 = _dy1;
    _dir += _dv;
}
draw_sprite_ext(s_sine64, 0, _dx0, _dy0, .33, .33, 0, draw_get_color(), (0.33 + random(0.1)) * draw_get_alpha());
