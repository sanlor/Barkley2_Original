/// Camera(snap / transition / create / enable / safe check)

// Camera() - Returns current camera
// Camera("enable", camera) - Set camera as current
// Camera("create", x, y, object_to_follow) - Creates camera, initially disabled
// Camera("transition", new_camera)
// Camera("snap", object) - Instantly moves camera to spot
// Camera("snap", x, y) - Instantly moves camera to spot
// Camera("safe check") - Deletes other camera move / transition events

// Camera()
// Returns current camera
if (argument_count == 0)
{
    with (o_camera) { if (_enabled) return id; }
    return NULL;
}

// Camera("enable", camera)
if (argument[0] == "enable")
{
    with (o_camera) _enabled = false;
    argument[1]._enabled = true;
    return 1;
}



// Creates a new camera to be used. Initially disabled.
// Objects must have camera_target_x, camera_target_y, camera_speed
// Camera("create", x, y, object_to_follow)
if (argument[0] == "create")
{
    var camera = instance_create(argument[1], argument[2], o_camera);
    if (argument[3] != NULL) camera._follow = argument[3];
    return camera;
}



// Camera("transition", new_camera)
if (argument[0] == "transition")
{
    var camera = Camera();
    var transition_camera = instance_create(camera.x, camera.y, o_camera_transition);
    transition_camera._camera = argument[1];
    with (o_camera) _enabled = false;
    return transition_camera;
}



// Camera("snap", object) - Instantly moves camera to spot
// Camera("snap", x, y) - Instantly moves camera to spot
if (argument[0] == "snap")
{
    var camCur = Camera();
    if (argument_count == 2)
    {
        if (is_string(argument[1])) argument[1] = asset_get_index(argument[1]);
        camCur.x = argument[1].x;
        camCur.y = argument[1].y;
    }
    else
    {
        camCur.x = real(argument[1]);
        camCur.y = real(argument[2]);
    }
    return 1;
}



// Deletes other camera move events
// Camera("safe check")
if (argument[0] == "safe check")
{
    with (o_event_camera_move) instance_destroy();
    with (o_event_camera_transition) instance_destroy();
    return 1;
}



show_debug_message("Camera() - Unknown command >" + string(argument[0]) + "<");
return 0;
