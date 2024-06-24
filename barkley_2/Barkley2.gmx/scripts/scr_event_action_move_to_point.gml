/// scr_event_action_move_to_point(list)
/// An action to move an object to a specific point!
/// The list contains entity id, x, y, and speed.
/// If speed is NULL, use normal speed.

var object = ds_list_find_value(argument0, 1);
var move_x = ds_list_find_value(argument0, 2);
var move_y = ds_list_find_value(argument0, 3);
var pds = point_distance(object.x, object.y, move_x, move_y);
var move_object = -999;
//show_debug_message("scr_event_action_move_to_point(): Point to destination is > " + string(pds));
if (pds < 0) // Will never happen, was test measure.
{
    show_debug_message("scr_event_action_move_to_point(): Actor is close enough to end point, skipping there.");
    object.x = move_x;
    object.y = move_y;
}
else
{
    move_object = instance_create(0, 0, o_move);
    var move_speed = ds_list_find_value(argument0, 4);
    if (move_speed == NULL) {
        move_speed = MOVE_NORMAL;
    }
    
    
    move_object._event = id;
    move_object._object = object;
    move_object._aa = object._automatic_animation;
    move_object._rigid = object.actor_rigid;
    
    var path_created;
    with object {
        scr_actor_unsetRigid(id);
        scr_actor_instantRigid(id);
        _automatic_animation = true;
        path_created = scr_path_set(x, y, move_x, move_y, move_speed, 0, NULL);
        if (path_created) {
            //show_debug_message("scr_event_action_move_to_point(): Path generated fine.");
            move_object._move_x = move_x; // path_get_x(scr_path_get(), 1); // May 11 2016
            move_object._move_y = move_y; // path_get_y(scr_path_get(), 1); // May 11 2016
        } else {
            show_debug_message("scr_event_action_move_to_point(): Unable to move to this spot: " + string(move_x) + " " + string(move_y) + "!");
        }
    }
    if (path_created) {
        _events_active++;
    } else {
        with move_object {
            instance_destroy();
        }
    }
}
scr_event_advance(id);
if (move_object != -999) return move_object;

