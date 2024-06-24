/// scr_entity_setDirSpd(direction,speed)
/// Sets the direction and speed of an Entity.

var dir = argument0;
var spd = argument1;

scr_math_dirDistToVector(dir, spd);
move_x = __vx;
move_y = __vy;
move_dir = dir;
move_dist = spd;
//if (path_support) scr_path_delete();
