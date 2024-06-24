/// scr_entity_addDirSpd(direction,speed)
/// Sets the direction and speed of an Entity.

var dir = argument0;
var spd = argument1;

move_x += lengthdir_x(spd, dir);
move_y += lengthdir_y(spd, dir);
move_dir = point_direction(0, 0, move_x, move_y);
move_dist = point_distance(0, 0, move_x, move_y);
if (path_support) scr_path_delete();
