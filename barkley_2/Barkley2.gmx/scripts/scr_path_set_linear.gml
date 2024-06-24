/// scr_path_set_linear(start_x,start_y,end_x,end_y,path_speed)
 
var start_x = argument0; // start point
var start_y = argument1;
var end_x = argument2; // end point
var end_y = argument3;
path_spd = argument4;

// pathfind to point
scr_path_delete(); // remove existing path resource
path_walk = path_add(); // create new path resource
path_set_closed(path_walk, 0);
path_add_point(path_walk, start_x, start_y, 100);
path_add_point(path_walk, end_x, end_y, 100);
move_x = 0;
move_y = 0;
move_dist = 0;
path_pos = 0;
path_targetx = start_x;
path_targety = start_y;
scr_path_update();
