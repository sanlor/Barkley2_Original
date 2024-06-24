/// Strict movement in path direction with an offset path_dir_offset managed externally

var command = argument0;

if (command == "reset") {
    path_dir_offset = 0;
}

if (command == "step") {
    var path_dir = point_direction(x, y, path_targetx, path_targety);
    path_dir += path_dir_offset
    
    move_x = lengthdir_x(path_spd,path_dir);
    move_y = lengthdir_y(path_spd,path_dir);
    move_dir = path_dir;
    move_dist = path_spd;
}
