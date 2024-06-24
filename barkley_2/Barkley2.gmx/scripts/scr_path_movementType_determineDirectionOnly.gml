/// Give me direction to move in only - I will use my own movement behaviour.

var command = argument0;

if (command == "reset") {
}

if (command == "step") {
    path_dir = point_direction(x, y, path_targetx, path_targety);
}
