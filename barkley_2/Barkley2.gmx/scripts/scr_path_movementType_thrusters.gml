/// Thrust in direction of path

var command = argument0;

if (command == "reset") {
}

if (command == "step") {
    var path_dir = point_direction(x, y, path_targetx, path_targety);
    move_x += lengthdir_x(path_spd * dt(), path_dir);
    move_y += lengthdir_y(path_spd * dt(), path_dir);
    move_dir = point_direction(0, 0, move_x, move_y);
    move_dist = point_distance(0, 0, move_x, move_y);
}
