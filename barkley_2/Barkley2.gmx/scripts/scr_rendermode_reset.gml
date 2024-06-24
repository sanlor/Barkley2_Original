// Fullscreen Mode, or Windowed mode with Scaling
show_debug_message("RESETTING RENDER MODE"); 

display_reset(0, global.vsync);
texture_set_interpolation(false);

if (!global.fullscreen) {
    // Windowed mode
    if (window_get_fullscreen()) {
        window_set_fullscreen(false);
    }
    // ...with scaling
    window_set_size( SCREEN_WIDTH * global.screen_scale, SCREEN_HEIGHT * global.screen_scale)
    window_center();
}
else if (!window_get_fullscreen()) { // Fullscreen mode
    window_set_fullscreen(true);
}
