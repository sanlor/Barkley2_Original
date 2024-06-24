/// scr_map_initialise_load_room(room,x,y)
/// Initializes everything about a room.
/// Returns the room that is initialised.
/// X and Y refer to where hoopz should spawn at.

var new_room = argument0;
var new_x = argument1;
var new_y = argument2;

// Load the level.
show_debug_message("Loading room")
//a//udio_set_bgm(scr_audio_getRoomBGM(new_room));
// COMMENTED FOR A AUDIO TEST

// Check to see if this is the first time loading the map.
show_debug_message("Checking Loaded")
var loaded = ds_list_find_index(global.rooms_loaded, new_room) != -1;
if (!loaded) {
    show_debug_message("Not loaded")
    ds_list_add(global.rooms_loaded, new_room);
}
show_debug_message("Set teleport XY")
o_world._teleport_x = new_x;
o_world._teleport_y = new_y;

// Return the new room!
return new_room;
