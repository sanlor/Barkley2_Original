///scr_drawRect(x1,y1,x2,y2,outline?)
var x1 = argument0;
var y1 = argument1;
var x2 = argument2;
var y2 = argument3;
var outline = argument4;

if(outline)
{
    draw_sprite_ext(s1x1,0,x1,y1,1,y2-y1,0,draw_get_color(),draw_get_alpha());
    draw_sprite_ext(s1x1,0,x2-1,y1,1,y2-y1,0,draw_get_color(),draw_get_alpha());
    draw_sprite_ext(s1x1,0,x1,y1,x2-x1,1,0,draw_get_color(),draw_get_alpha());
    draw_sprite_ext(s1x1,0,x1,y2-1,x2-x1,1,0,draw_get_color(),draw_get_alpha());
}
else
{
    draw_sprite_ext(s1x1,0,x1,y1,x2-x1,y2-y1,0,draw_get_color(),draw_get_alpha());
}
