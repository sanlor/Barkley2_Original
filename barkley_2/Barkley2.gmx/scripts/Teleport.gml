/// Teleport(room, x, y, fade_out?)
// Manually do fade ins for DSL
var new_room;
if (is_string(argument[0])) argument[0] = asset_get_index(argument[0]); // DSL
with (o_world) 
{
    show_debug_message("Teleport() - Loading room from teleporter")
    new_room = scr_map_initialise_load_room(argument[0], argument[1], argument[2]);
}
if (argument_count > 3) global.fadeBlack = real(argument[3]); // global.fadeRoomTemp
//GZ NOTE: I set the event to false here because camera framing causes it to create
//a build event that traps it in an event that can't execute when teleporting
//However it should end, as all events are destroyed on room change
global.event = false; //May 14 2015 edit
with (o_world) 
{
    show_debug_message("Teleport() - Room goto")
    room_goto(new_room);
}


