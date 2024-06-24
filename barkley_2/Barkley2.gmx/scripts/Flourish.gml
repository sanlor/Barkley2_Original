/// Flourish("build", string_portrait, 0_to_1_time)

if (argument_count == 2) // DSL invoke
{
    global.flourishPortrait = argument[0];
    global.flourishTime = real(argument[1]);
}
else if (is_real(argument[0])) // ds_list containing actions
{
    global.flourishPortrait = ds_list_find_value(argument[0], 1);
    global.flourishTime = ds_list_find_value(argument[0], 2);
    scr_event_advance(id);
}
else if (argument[0] == "build")
{
    var act = ds_list_create();
    ds_list_add(act, Flourish);
    ds_list_add(act, argument[1]); // Portrait
    ds_list_add(act, argument[2]); // 0 to 1 Time
    ds_list_add(_event_list, act);
    return ds_list_size(_event_list) - 1;
}
else if (argument[0] == "init")
{
    global.flourishPortrait = s_port_hoopz;
    global.flourishSpeed = 7; // 6 frames a second
    global.flourishTime = -1;
}
