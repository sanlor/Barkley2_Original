/// Strict movement in path direction

var command = argument0;

if (command == "reset") {
}

if (command == "step") {
    var path_dir = point_direction(x, y, path_targetx, path_targety);
    move_x = lengthdir_x(path_spd,path_dir);
    move_y = lengthdir_y(path_spd,path_dir);
    move_dir = path_dir;
    move_dist = path_spd;
}
