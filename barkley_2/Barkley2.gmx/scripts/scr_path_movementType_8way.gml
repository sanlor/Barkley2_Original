/// Strict movement in path direction, quantized to 8 directions

var command = argument0;

if (command == "reset") {
}

if (command == "step") {
    var path_dir = point_direction(x, y, path_targetx, path_targety);
    
    // Quantize to 8 directions
    path_dir = floor(path_dir / (360/8)) * (360/8)
    path_dir = (path_dir + 360) mod 360;
    
    move_x = lengthdir_x(path_spd,path_dir);
    move_y = lengthdir_y(path_spd,path_dir);
    move_dir = path_dir;
    move_dist = path_spd;
}
