///scr_drawLine(x1,y1,x2,y2)
var x1 = argument0;
var y1 = argument1;
var x2 = argument2;
var y2 = argument3;

var linel = point_distance(x1, y1, x2, y2);
var lined = point_direction(x1, y1, x2, y2);

draw_sprite_ext(s1x1,0,x1,y1,1,linel,lined,draw_get_color(),draw_get_alpha());
