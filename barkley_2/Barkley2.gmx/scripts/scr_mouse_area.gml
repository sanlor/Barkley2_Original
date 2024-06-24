///scr_mouse_area(x1, y1, x2, y2);
//Different than mouse rect, for debug stuff
var _mox = window_mouse_get_x();
var _moy = window_mouse_get_y();
return (_mox >= argument0 && _moy >= argument1 && _mox <= argument2 && _moy <= argument3);
