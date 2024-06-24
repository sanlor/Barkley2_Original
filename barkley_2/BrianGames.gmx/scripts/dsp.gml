//Feed in a surface, specify an X and Y point and W / H and get
//draw_surface_part(argument[0], 
//Sur, XM, YM, W, H, X, Y
if (surface_exists(argument[0]) == 0) exit;
var _x, _y, _w, _h, _sw, _sh;
_x = argument[1];
_y = argument[2];
_w = argument[3];
_h = argument[4];
_sw = surface_get_width(argument[0]);
_sh = surface_get_height(argument[0]);

var _minX, _maxX, _minY, _maxY;
_minX = _x - (_w / 2);
_minY = _y - (_h / 2);
_maxX = _x + (_w / 2);
_maxY = _y + (_h / 2);

//if (_minX < 0) { _maxX += abs(_minX); _minX = 0; }
//if (_minY < 0) { _maxY += abs(_minY); _minY = 0; }

//if (_maxX > _sw) { _minX -= abs(_maxX - _sw); _maxX = _sw; }
//if (_maxY > _sh) { _minY -= abs(_maxY - _sh); _maxY = _sh; }

draw_surface_part_ext(argument[0], _minX, _minY, _maxX - _minX, _maxY - _minY, argument[5] - (_w / 2), argument[6] - (_h / 2), 1, 1, col, alp);

if (noise == 1)
{
    nmg = floor(random(10));
    draw_sprite_part_ext(s_noise, nmg, 0, 0, _w, _h, argument[5] - (_w / 2), argument[6] - (_h / 2), 1, 1, col, alp / 4);
}
//if (_minY < 0) { _maxY += abs(_minY); _minY = 0; }
