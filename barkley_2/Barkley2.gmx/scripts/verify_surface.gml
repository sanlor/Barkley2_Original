/// verify_surface(surface, width, height)

var surface = argument0;
var width = argument1;
var height = argument2;

if (surface_exists(surface)) {
    if (surface_get_width(surface) != width or surface_get_height(surface) != height) {
        surface_resize(surface, width, height);
    }
    return surface;
} else {
    return surface_create(width, height);
}
