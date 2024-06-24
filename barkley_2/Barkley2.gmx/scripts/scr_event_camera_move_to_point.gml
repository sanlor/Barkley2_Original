/// scr_event_camera_move_to_point(x, y, speed, no_advance [optional])
/// An action to move the camera!
/// The list contains x, y, and speed.

Camera("safe check");

var current_camera = Camera();
if (current_camera.object_index == o_camera_hoopz) {
    current_camera = Camera("create", current_camera.x, current_camera.y, NULL);
    Camera("enable", current_camera);
}

var move_x = argument[0];
var move_y = argument[1];
var camera_speed = argument[2];

current_camera._move_x = move_x;
current_camera._move_y = move_y;
current_camera._camera_speed = camera_speed;
current_camera._follow = NULL;
current_camera._frame_objects = NULL;

var event_camera = instance_create(0, 0, o_event_camera_move);
event_camera._event = id;
event_camera._camera = current_camera;
event_camera._move_x = move_x;
event_camera._move_y = move_y;

if (argument_count == 3)
{
    _events_active++;
    scr_event_advance(id);
}
else event_camera._advance = 0;

return event_camera;
