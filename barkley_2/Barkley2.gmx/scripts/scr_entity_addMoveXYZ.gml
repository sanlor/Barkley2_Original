/// scr_entity_addMoveXYZ(x_offset,y_offset,z_offset)
/// Adds the vector to the movement vector of the object.

var mx = argument0;
var my = argument1;
var mz = argument2;

move_x += mx;
move_y += my;
move_z += mz;
move_dir = point_direction(0, 0, move_x, move_y);
move_dist = point_distance(0, 0, move_x, move_y);
if (path_support) scr_path_delete();
