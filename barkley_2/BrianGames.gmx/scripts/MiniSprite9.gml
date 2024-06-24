///Draw dialog box
//SPRITE, X, Y, W, H, SCL, COL
_spr = argument[0];
_x = argument[1];
_y = argument[2];
_scl = argument[5];
_w = floor(argument[3] / _scl) * _scl;
_h = floor(argument[4] / _scl) * _scl;
_col = argument[6];

_bw = 30;
_bh = 30;
_bw3 = _bw / 3;
_bh3 = _bh / 3;
_bw3s = _bw3 * _scl;
_bh3s = _bh3 * _scl;
_s = 1 * _scl;

//do lines
draw_sprite_part_ext(_spr, 0, _bw3, 0, _bw3, _bh3, _x + _bw3s, _y, (_w - _bw3s - _bw3s) / _bw3, _s, _col, 1); //top
draw_sprite_part_ext(_spr, 0, _bw3, _bh3 * 2, _bw3, _bh3, _x + _bw3s, _y + _h - _bh3s, (_w - _bw3s - _bw3s) / _bw3, _s, _col, 1); //bot

draw_sprite_part_ext(_spr, 0, 0, _bh3, _bw3, _bh3, _x, _y + _bh3s, _s, (_h - _bh3s - _bh3s) / _bh3, _col, 1); //left
draw_sprite_part_ext(_spr, 0, _bw3 * 2, _bh3, _bw3, _bh3, _x + _w - _bw3s, _y + _bh3s, _s, (_h - _bh3s - _bh3s) / _bh3, _col, 1); //right

//Do all 4 corners
draw_sprite_part_ext(_spr, 0, 0, 0, _bw3, _bh3, _x, _y, _s, _s, _col, 1); //top left
draw_sprite_part_ext(_spr, 0, _bw3 * 2, 0, _bw3, _bh3, _x + _w - _bw3s, _y, _s, _s, _col, 1); //top right
draw_sprite_part_ext(_spr, 0, 0, _bh3 * 2, _bw3, _bh3, _x, _y + _h - _bh3s, _s, _s, _col, 1); //bot left
draw_sprite_part_ext(_spr, 0, _bw3 * 2, _bh3 * 2, _bw3, _bh3, _x + _w - _bw3s, _y + _h - _bh3s, _s, _s, _col, 1); //bot right

//Do center
draw_sprite_part_ext(_spr, 0, _bw3, _bh3, _bw3, _bh3, _x + _bw3s, _y + _bh3s, (_w - _bw3s - _bw3s) / _bw3, (_h - _bh3s - _bh3s) / _bh3, _col, 1);
