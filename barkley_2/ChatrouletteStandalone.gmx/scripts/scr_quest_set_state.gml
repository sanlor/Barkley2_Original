if (ds_map_exists(global.dsmVar, argument0))
    ds_map_replace(global.dsmVar, argument0, argument1);
else
{
    ds_map_add(global.dsmVar, argument0, argument1);
    //show_debug_message("scr_quest_set_state > ADD > " + string(argument0) + " = " + string(argument1));
}
