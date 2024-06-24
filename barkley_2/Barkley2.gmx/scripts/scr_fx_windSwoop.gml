/// scr_fx_windSwoop(dx, dy, dir, len, start, stop, thickness, rotate, bend, perspective)

var STEP = 0.025;

var dx = argument0;
var dy = argument1;
var dir = argument2;
var len = argument3;
var start = argument4;
var stop = argument5;
var thickness = argument6;
var rotate = argument7;
var bend = argument8;
var perspective = argument9;

start = min(1, max(0, start));
stop = min(1, max(0, stop));

for (var i = stop; i < start; i += STEP) {
    var j = i + STEP;
    
    var dir1 = dir + rotate*i;
    var dir2 = dir + rotate*j;
    var len1 = len * i;//power(i, bend);
    var len2 = len * j;//power(j, bend);
    var width1 = thickness*i;
    var width2 = thickness*j;
    
    var x1a = dx + lengthdir_x(len1 - width1/2, dir1);
    var y1a = dy + lengthdir_y(len1 - width1/2, dir1) * perspective;
    var x1b = dx + lengthdir_x(len1 + width1/2, dir1);
    var y1b = dy + lengthdir_y(len1 + width1/2, dir1) * perspective;
    var x2a = dx + lengthdir_x(len2 - width2/2, dir2);
    var y2a = dy + lengthdir_y(len2 - width2/2, dir2) * perspective;
    var x2b = dx + lengthdir_x(len2 + width2/2, dir2);
    var y2b = dy + lengthdir_y(len2 + width2/2, dir2) * perspective;
    
    
    draw_set_alpha(1.8-i);
    
    draw_primitive_begin(pr_trianglelist);
    draw_vertex(x1a, y1a);
    draw_vertex(x1b, y1b);
    draw_vertex(x2a, y2a);
    
    draw_vertex(x1b, y1b);
    draw_vertex(x2a, y2a);
    draw_vertex(x2b, y2b);
    draw_primitive_end();
}

draw_set_alpha(1);

