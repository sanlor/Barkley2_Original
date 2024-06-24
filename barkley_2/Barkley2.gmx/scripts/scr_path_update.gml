/// scr_path_update()


if path_exists(path_walk) {
    var len = path_get_length(path_walk);
    var dist_to_current = point_distance(x, y, path_targetx, path_targety);
    //if (path_pos >= len && dist_to_current <= (path_spd * dt() + path_lookahead)) { //Old line
    //GZ NOTE: Changed this line so InteractiveActors in cinemas don't skip ahead on the end of their path.
    if (point_distance(path_get_x(path_walk, 1), path_get_y(path_walk, 1), x, y) <= (path_spd * dt() + 2)) {
        scr_path_delete();
    }
    else {
        var dist_to_next = path_spd * dt() + path_lookahead;
        if (dist_to_current < dist_to_next) {
            path_pos += dist_to_next - dist_to_current;
        }
        if (path_pos > len) {
            path_pos = len;
        }
        var point = scr_path_getPoint(path_pos, path_walldist);
        path_targetx = point[@ 0];
        path_targety = point[@ 1];
        point = 0;
    }
}
