/// scr_event_hoopz_switch_control()
/// Reactivates Hoopz and spawns / destroys a cutscene version of him. Call this when you
/// want to end a cutscene.

if (instance_exists(o_hoopz)) { // Safety Check in case Hoopz is not on screen at this time
    if (instance_exists(o_cts_hoopz)) {
        // Assign o_hoopz coordinates and facing of o_cts_hoopz
        o_hoopz.x = o_cts_hoopz.x;
        o_hoopz.y = o_cts_hoopz.y;
        with (o_cts_hoopz) { o_hoopz.facing = scr_entity_animation_getImage(_current_animation); }
        
        with (o_cts_hoopz) {
            instance_destroy(); // Destroy the cutscene hoopz.
        }
        with (o_hoopz) {
            scr_event_interactive_activate(); // Reactivate Hoopz to grant control.
        }
        with (o_camera_hoopz) {
            _follow = o_hoopz; // Make sure the camera is following hoopz again!
        }
    }
}
