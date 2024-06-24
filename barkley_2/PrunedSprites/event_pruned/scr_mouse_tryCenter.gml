/// Attempt to center the cursor
// Return true on success, false on failure

if window_get_fullscreen() {
    return false;
}
else {
    var cx = round((SCREEN_WIDTH * global.screen_scale) / 2);
    var cy = round((SCREEN_HEIGHT * global.screen_scale) / 2);
    window_mouse_set(cx, cy);
}
