/// MiniSprite9(SPRITE, SUB, X, Y, W, H, SCALE [opt], COLOR [opt], ALPHA [opt])
_spr = argument[0];
_sub = argument[1];
_x = argument[2];
_y = argument[3];
if (argument_count > 6) _scl = argument[6]; else _scl = 1;
_w = floor(argument[4] / _scl) * _scl;
_h = floor(argument[5] / _scl) * _scl;
if (argument_count > 7) _col = argument[7]; else _col = c_white;
if (argument_count > 8) _alp = argument[8]; else _alp = 1;

_bw = sprite_get_width(_spr);
_bh = sprite_get_height(_spr);
_bw3 = _bw / 3;
_bh3 = _bh / 3;
_bw3s = _bw3 * _scl;
_bh3s = _bh3 * _scl;
_s = 1 * _scl;

//do lines
draw_sprite_part_ext(_spr, _sub, _bw3, 0, _bw3, _bh3, _x + _bw3s, _y, (_w - _bw3s - _bw3s) / _bw3, _s, _col, _alp); //top
draw_sprite_part_ext(_spr, _sub, _bw3, _bh3 * 2, _bw3, _bh3, _x + _bw3s, _y + _h - _bh3s, (_w - _bw3s - _bw3s) / _bw3, _s, _col, _alp); //bot

draw_sprite_part_ext(_spr, _sub, 0, _bh3, _bw3, _bh3, _x, _y + _bh3s, _s, (_h - _bh3s - _bh3s) / _bh3, _col, _alp); //left
draw_sprite_part_ext(_spr, _sub, _bw3 * 2, _bh3, _bw3, _bh3, _x + _w - _bw3s, _y + _bh3s, _s, (_h - _bh3s - _bh3s) / _bh3, _col, _alp); //right

//Do all 4 corners
draw_sprite_part_ext(_spr, _sub, 0, 0, _bw3, _bh3, _x, _y, _s, _s, _col, 1); //top left
draw_sprite_part_ext(_spr, _sub, _bw3 * 2, 0, _bw3, _bh3, _x + _w - _bw3s, _y, _s, _s, _col, _alp); //top right
draw_sprite_part_ext(_spr, _sub, 0, _bh3 * 2, _bw3, _bh3, _x, _y + _h - _bh3s, _s, _s, _col, _alp); //bot left
draw_sprite_part_ext(_spr, _sub, _bw3 * 2, _bh3 * 2, _bw3, _bh3, _x + _w - _bw3s, _y + _h - _bh3s, _s, _s, _col, _alp); //bot right

//Do center
draw_sprite_part_ext(_spr, _sub, _bw3, _bh3, _bw3, _bh3, _x + _bw3s, _y + _bh3s, (_w - _bw3s - _bw3s) / _bw3, (_h - _bh3s - _bh3s) / _bh3, _col, _alp);
