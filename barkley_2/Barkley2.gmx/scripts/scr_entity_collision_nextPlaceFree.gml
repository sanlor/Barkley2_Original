/// scr_entity_collision_nextPlaceFree(object)
/// Check if place of next step is free for an entity or not.

var entity = argument0

var check;
with (entity) {
    check = scr_collision_place_free(x + (move_x * dt()),
                                     y + (move_y * dt()),
                                     collision_check);
}
return check;
