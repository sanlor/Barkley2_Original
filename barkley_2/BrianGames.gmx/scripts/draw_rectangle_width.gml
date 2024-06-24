///
_x0 = argument[0];
_y0 = argument[1];
_x1 = argument[2];
_y1 = argument[3];
_w = argument[4];
draw_line_width(_x0, _y0, _x1, _y0, _w);
draw_line_width(_x1, _y0, _x1, _y1, _w);
draw_line_width(_x1, _y1, _x0, _y1, _w);
draw_line_width(_x0, _y1, _x0, _y0, _w);
