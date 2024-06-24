/// FOLLOWFRAME(cameraSpeed, object1, object2?, object3?)
var ob0, ob1, ob2;
var camSpd;
if (argument[0] == "CAMERA_NORMAL") camSpd = CAMERA_NORMAL;
else if (argument[0] == "CAMERA_FAST") camSpd = CAMERA_FAST;
else if (argument[0] == "CAMERA_SLOW") camSpd = CAMERA_SLOW;
else camSpd = real(argument[0]);
camSpd = clamp(camSpd, 1, 32);

if (argument_count >= 2) { if (asset_get_index(argument[1]) > -1) ob0 = asset_get_index(argument[1]); }
if (argument_count >= 3) { if (asset_get_index(argument[2]) > -1) ob1 = asset_get_index(argument[2]); }
if (argument_count >= 4) { if (asset_get_index(argument[3]) > -1) ob2 = asset_get_index(argument[3]); }

// Follow frame
var current_camera = Camera();
if (current_camera.object_index == o_camera_hoopz) 
{
    current_camera = Camera("create", current_camera.x, current_camera.y, NULL);
    Camera("enable", current_camera);
}
var object_count = argument_count - 1;
with (current_camera) 
{
    _move_x = NULL; 
    _move_y = NULL;
    _camera_speed = camSpd;
    _frame_objects = object_count;
    if (_frame_objects > 0) _frame_object[0] = real(ob0);
    if (_frame_objects > 1) _frame_object[1] = real(ob1);
    if (_frame_objects > 2) _frame_object[2] = real(ob2);
}
