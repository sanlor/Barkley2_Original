/// scr_entity_setMoveXY(move_x,move_y)
/// Sets the direction and speed of an Entity.

var mx = argument0;
var my = argument1;

move_x = mx;
move_y = my;
move_dir = point_direction(0, 0, mx, my);
move_dist = point_distance(0, 0, mx, my);
if (path_support) scr_path_delete();
