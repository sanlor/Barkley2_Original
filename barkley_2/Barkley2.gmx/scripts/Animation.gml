/// Animation("define", animation_name, sprite_index, frame_start, frame_number, frame_speed)
//

// Animation("play and set", object, play, set)
// Animation("set", object, animation_name)
// Animation("define", animation_name, sprite_index, frame_start, frame_number, frame_speed)
// Animation("current", id)

if (argument[0] == "play and set") // 1 = Object, 2 = Play, 3 = Set
{
    var object = argument[1];
    var animation_to_play = argument[2];
    var animation_to_set = argument[3];
    var animation_range, animation_speed;
    with (object)
    {
        animation_range = scr_entity_animation_getRange(animation_to_play);
        animation_speed = scr_entity_animation_getSpeed(animation_to_play);
    }
    //show_debug_message("Animation() - range = " + string(animation_range) + " | speed = " + string(animation_speed));
    var rid = -999;
    if (animation_range > 1 && animation_speed > 0) 
    {
        var animation_object = instance_create(0, 0, o_animation);
        rid = animation_object;
        animation_object._object = object;
        with (object)
        {
            // Store the previous values.
            animation_object._automatic_animation = false;
            animation_object._previous_animation = animation_to_set;
            // Set the new values.
            _current_animation = animation_to_play;
            _automatic_animation = false;
            scr_entity_animation_setFrame(_current_animation, 0); //Does clamp, paste after
        }
        object._animation_object = animation_object;
        object._animation_object_name = animation_to_play;
    }
    return rid;
}

// Animation("set", object, animation_name)
else if (argument[0] == "set")
{
    with (argument[1])
    {
        _current_animation = argument[2];
        _automatic_animation = false;
        scr_entity_animation_setFrame(_current_animation, 0);
    }
    return 1;
}

// Animation("define", animation_name, sprite_index, frame_start, frame_number, frame_speed)
else if (argument[0] == "define")
{
    scr_entity_animation_define(argument[1], argument[2], argument[3], argument[4], argument[5]);
    return 1;
}

// Animation("current", id)
else if (argument[0] == "current")
{
    return argument[1]._current_animation;
}

show_debug_message("Animation() - No such command > " + string(argument[0]) + " <");
