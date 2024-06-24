/// Emote(emotetype, target object?, xoffset?, yoffset?)
/// Create an emote at a specific place.

//  Argument0 = Emote Type = ! ? anime
//  Argument1 = Target Object (optional, default hoopz)
//  Argument2 = X Offset (optional, default 0)
//  Argument3 = Y Offset (optional, default 0)

// Put "build" as first argument to use in old GML system

if (is_real(argument[0]))
{
    // Pass to instant command
    Emote(ds_list_find_value(argument[0], 1), ds_list_find_value(argument[0], 2),
                    ds_list_find_value(argument[0], 3), ds_list_find_value(argument[0], 4));
    _events_active += 1;
    scr_event_advance(id);
}
else
{
    if (argument_count == 5) // 0 build, 1 = type, 2 = object, 3 = x, 4 = y
    {
        var action = ds_list_create();
        ds_list_add(action, Emote);
        ds_list_add(action, argument[1]); // emotetype
        ds_list_add(action, argument[2]); // object
        ds_list_add(action, argument[3]); // x offset value
        ds_list_add(action, argument[4]); // y pffset value
        ds_list_add(_event_list, action); // add the action to the list
        return ds_list_size(_event_list) - 1;
    }
    else // Do instantly
    {
        var emote = argument[0];
        
        if (instance_exists(o_cts_hoopz) == 0) { var object_id = o_hoopz.id; }
        else { var object_id = o_cts_hoopz.id; }
        if (argument_count > 1) object_id = argument[1];
        if (is_real(object_id) == 0) object_id = asset_get_index(object_id);
        
        var object_x = 0;
        var object_y = 0;
        if (argument_count > 2) object_x = argument[2];
        if (argument_count > 3) object_y = argument[3];
        
        var object = instance_create(object_id.x + object_x, object_id.y + object_y - object_id.sprite_yoffset - 10, o_effect_emotebubble_event);
        object.evt = id;
        switch (emote)
        {    
            case "exclamation":     object.image_index = 0; break;
            case "!":               object.image_index = 0; break;
            case "question":        object.image_index = 1; break;
            case "?":               object.image_index = 1; break;
            case "anime":           object.image_index = 2; break;
        }
    }
}
