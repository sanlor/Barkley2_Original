var val = ds_map_find_value(global.dsmVar, argument0);
if (is_undefined(val)) 
{
    //show_debug_message("scr_quest_get_state > UNDEFINED > " + string(argument0));
    return 0;
}
else 
{
    //show_debug_message("scr_quest_get_state > " + string(argument0) + " = " + string(val));
    return val;
}
