var cx = round((SCREEN_WIDTH * global.screen_scale) / 2);
var cy = round((SCREEN_HEIGHT * global.screen_scale) / 2);

if (round(window_mouse_get_x()) == cx && round(window_mouse_get_y()) == cy) {
    return true;
}
else {
    show_debug_message("Not cent. (" +
        string(round(window_mouse_get_x())) + "," + 
        string(round(window_mouse_get_y())) + ")vs(" +
        string(cx) + "," + string(cy) + ")");
    return false;
}
