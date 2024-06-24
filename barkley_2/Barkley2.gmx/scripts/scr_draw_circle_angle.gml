///scr_draw_circle_angle(x, y, startangle, stopangle, stepangle, innerradius, outerradius);
var centerx, centery, startangle, stopangle, stepangle, innerradius, outerradius;

centerx  = argument0;
centery  = argument1;
startangle  = degtorad(argument2);
stopangle   = degtorad(argument3);
stepangle   = degtorad(argument4);
innerradius = argument5;
outerradius = argument6;

var rad, sr, cr;
draw_primitive_begin(pr_trianglestrip);
for (rad=startangle; rad<stopangle; rad+=stepangle) 
{
    sr = sin(rad);
    cr = cos(rad);
    draw_vertex(centerx+innerradius*cr, centery-innerradius*sr);
    draw_vertex(centerx+outerradius*cr, centery-outerradius*sr);
}
sr = sin(stopangle);
cr = cos(stopangle);
draw_vertex(centerx+innerradius*cr, centery-innerradius*sr);
draw_vertex(centerx+outerradius*cr, centery-outerradius*sr);
draw_primitive_end();
