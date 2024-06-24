///scr_draw_line(x1,y1,x2,y2,width);
var _x1 = argument0;
var _y1 = argument1;
var _x2 = argument2;
var _y2 = argument3;
var _width = argument4;

var _col = draw_get_color();
var _alpha = draw_get_alpha();

var hscl = point_distance(_x1,_y1,_x2,_y2);
var dr = point_direction(_x1,_y1,_x2,_y2);

var _shiftx = lengthdir_x(_width/2,dr+90);
var _shifty = lengthdir_y(_width/2,dr+90);

draw_sprite_ext(s_pixel,image_index,_x1+_shiftx,_y1+_shifty,hscl,_width,dr,_col,_alpha);
