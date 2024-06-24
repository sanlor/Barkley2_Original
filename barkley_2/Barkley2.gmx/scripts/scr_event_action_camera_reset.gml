/// scr_event_action_camera_reset(list)
/// An action to reset the camera to hoopz.
/// The list contains NOTHING.
Camera("safe check");
var current_camera = Camera();
var event_camera = -999;
if (current_camera != NULL and current_camera.object_index != o_camera_hoopz) {
    var transition_camera = Camera("transition", o_camera_hoopz);
    event_camera = instance_create(0, 0, o_event_camera_transition);
    event_camera._event = id;
    event_camera._transition_camera = transition_camera;
    with (current_camera) instance_destroy();
    _events_active++;
}
scr_event_advance(id);
return event_camera;
