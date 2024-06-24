if (!surface_exists(global.screen_buffer)) {
    global.screen_buffer = surface_create(SCREEN_WIDTH, SCREEN_HEIGHT);
}
if (!surface_exists(global.screen_buffer_nohud)) {
    global.screen_buffer_nohud = surface_create(SCREEN_WIDTH, SCREEN_HEIGHT);
}

if ( !surface_exists(global.screen_buffer) or !surface_exists(global.screen_buffer_nohud)) {
    // One of the screen buffers has failed for some reason
    if (surface_exists(global.screen_buffer)) {
        surface_free(global.screen_buffer)
    }
    if (surface_exists(global.screen_buffer_nohud)) {
        surface_free(global.screen_buffer_nohud)
    }
    return false;
}
else {
    // Both buffers are fine
    return true;
}
