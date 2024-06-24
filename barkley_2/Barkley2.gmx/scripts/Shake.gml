/// Shake("init" / "add" / "remove" / "edit" / "apply" / "clear")
//Shake("init")                                 - Call once in the game (currently resides in scr_game_init()
//Shake("add", strength, radius, x, y, time_in_secs);   - Create a shake point, returns a shake index for editing and removing
//Shake("remove", index)                        - Remove the shake
//Shake("edit", index, strength, radius, x, y); - Edit a shake point with new values
//Shake("apply");                               - Applies shake to view. This is called in o_hud End Step since it's drawn last.
//Shake("clear");                               - Removes all shake points.

if (argument[0] == "init") //Call once in the game (currently resides in scr_game_init()
{
    //global.shakeList = ds_list_create();
    global.shakeX = ds_map_create();
    global.shakeY = ds_map_create();
    global.shakeStrength = ds_map_create();
    global.shakeRadius = ds_map_create();
    global.shakeTime = ds_map_create();
    global.shakeTimeCount = ds_map_create();
    global.shakeMap = ds_map_create();
    global.shakes = 0; //Tells you how many shakes are active
    global.shakeTotal = 0; //Counts total shakes throughout whole game (for making unique keys)
}
else if (argument[0] == "add") //Strength / Strength, Radius, X, Y, Time (Optional) | Returns shake index
{
    if (argument_count == 2)
    {
        ds_map_add(global.shakeStrength, global.shakeTotal, real(argument[1]));
        ds_map_add(global.shakeRadius, global.shakeTotal, 999999999);
        ds_map_add(global.shakeX, global.shakeTotal, o_hoopz.x)
        ds_map_add(global.shakeY, global.shakeTotal, o_hoopz.y);
        ds_map_add(global.shakeTime, global.shakeTotal, 0);
    }
    else 
    {
        ds_map_add(global.shakeStrength, global.shakeTotal, real(argument[1]));
        ds_map_add(global.shakeRadius, global.shakeTotal, real(argument[2]));
        ds_map_add(global.shakeX, global.shakeTotal, real(argument[3]));
        ds_map_add(global.shakeY, global.shakeTotal, real(argument[4]));
        if (argument_count == 5) ds_map_add(global.shakeTime, global.shakeTotal, 0);
        else ds_map_add(global.shakeTime, global.shakeTotal, real(argument[5]));
    }
    ds_map_add(global.shakeTimeCount, global.shakeTotal, 0);
    ds_map_add(global.shakeMap, global.shakeTotal, global.shakes + 1);
    global.shakeTotal += 1;
    //if (global.shakeTotal >= 32000) global.shakeTotal = 0;
    global.shakes += 1;
    return global.shakeTotal - 1; //was shakes
}
else if (argument[0] == "remove") //Arg1 = Index to remove
{
    _ind = ds_map_find_value(global.shakeMap, argument[1]);
    //if (argument[1] < 0 || argument[1] >= global.shakes)
    if (_ind == 0)
    {
        show_debug_message("Shake('remove', " + string(argument[1]) + ") > SHAKE INDEX DOESN'T EXIST IN SHAKE MAP");
        exit;
    }
    //_ind -= 1;
    _ind = argument[1];
    ds_map_delete(global.shakeStrength, _ind);
    ds_map_delete(global.shakeRadius, _ind);
    ds_map_delete(global.shakeX, _ind);
    ds_map_delete(global.shakeY, _ind);
    ds_map_delete(global.shakeMap, _ind);
    global.shakes -= 1;
}
else if (argument[0] == "edit") //IND, Strength, Radius (optional), X (optional), Y (optional)
{
    //_ind = argument[1];
    _ind = ds_map_find_value(global.shakeMap, argument[1]);
    if (_ind == 0)
    {
        show_debug_message("Shake('edit', " + string(argument[1]) + ") > SHAKE INDEX DOESN'T EXIST IN SHAKE MAP");
        exit;
    }
    //_ind -= 1;
    _ind = argument[1];
    if (argument_count >= 3) ds_map_replace(global.shakeStrength, _ind, argument[2]);
    if (argument_count >= 4) ds_map_replace(global.shakeRadius, _ind, argument[3]);
    if (argument_count >= 5) ds_map_replace(global.shakeX, _ind, argument[4]);
    if (argument_count >= 6) ds_map_replace(global.shakeY, _ind, argument[5]);
}
else if (argument[0] == "apply") //This is called in o_hud End Step since it's drawn last
{
    //Get max view shake by getting all shakes in radius
    //Not made yet
    //Cap explosions at the maximum 
    _key = ds_map_find_first(global.shakeMap);
    _delCou = 0;
    _del[0] = -1;
    for (_i = 0; _i < global.shakes; _i += 1)
    {
        _tim = ds_map_find_value(global.shakeTime, _key);
        _dis = point_distance(o_hoopz.x, o_hoopz.y, ds_map_find_value(global.shakeX, _key), ds_map_find_value(global.shakeY, _key));
        _rad = ds_map_find_value(global.shakeRadius, _key);
        if (_rad == -1) _rad = 999999999;
        _pow = ds_map_find_value(global.shakeStrength, _key);
        if (_tim != 0)
        {
            _cou = ds_map_find_value(global.shakeTimeCount, _key);
            _pow -= _pow * (_cou / _tim);
        }
        if (_dis < _rad)
        {
            _pow -= (_pow / _rad) * _dis;
            view_xview[0] += - (_pow / 2) + floor(random(_pow + 1)); //test
            view_yview[0] += - (_pow / 2) + floor(random(_pow + 1)); //test
        }
        if (_tim != 0)
        {
            _cou += dt() / 10;
            ds_map_replace(global.shakeTimeCount, _key, _cou);
            if (_cou >= _tim) { _del[_delCou] = _key; _delCou += 1; }
        }
        _key = ds_map_find_next(global.shakeMap, _key);
    }
    
    for (_i = 0; _i < _delCou; _i += 1) Shake("remove", _del[_i]);
    
    //Make sure view never exceeds room boundaries
    if (instance_exists(o_room_unbound)) 
    {
        view_xview[0] = floor(view_xview[0]);
        view_yview[0] = floor(view_yview[0]);
        exit;
    }
    view_xview[0] = floor(min(max(view_xview[0], 0), room_width - SCREEN_WIDTH));
    var vem;
    if (instance_exists(o_hud) == 0) vem = room_height - SCREEN_HEIGHT;
    else vem = room_height - SCREEN_HEIGHT + (sprite_get_height(s_hud_bar) * abs(o_hud.hudHide));
    view_yview[0] = floor(min(max(view_yview[0], 0), vem));
}
else if (argument[0] == "clear")
{
    ds_map_clear(global.shakeStrength);
    ds_map_clear(global.shakeRadius);
    ds_map_clear(global.shakeX);
    ds_map_clear(global.shakeY);
    ds_map_clear(global.shakeMap);
    global.shakes = 0;
}
