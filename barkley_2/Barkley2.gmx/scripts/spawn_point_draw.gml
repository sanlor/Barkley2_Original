/// spawn_point_draw(spawnPoint[, force])

var point = argument[0];
var force = false;
if (argument_count == 2) {
    force = argument[1];
}

var uuid = point[? "uuid"];
if (string_char_at(uuid, 1) != "_" or force) {

    draw_sprite_ext(s_spawn, 0, point[? "x"], point[? "y"], 1, 1, 0, point[? "hue"], 1);    
    
    var objectIndex = assetOrNull(point[? "objectName"], asset_object);
    if (objectIndex != NULL) {
        var objectSprite = object_get_sprite(objectIndex);
        if (objectSprite != NULL) {
            draw_sprite_ext(objectSprite, 0, point[? "x"], point[? "y"], 1, 1, 0, c_white, 0.6);
        }
    }
}
