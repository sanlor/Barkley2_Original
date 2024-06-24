/// scr_entity_setMoveXYZ(move_x,move_y,move_z)
/// Sets the direction and speed of an Entity.

var mx = argument0;
var my = argument1;
var mz = argument2;

move_x = mx;
move_y = my;
move_z = mz;
move_dir = point_direction(0, 0, mx, my);
move_dist = point_distance(0, 0, mx, my);
if (path_support) scr_path_delete();
