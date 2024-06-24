// Event variable.
global.event = false;

// Debug toggles
global.enemyPlacementMode = false; ////currently placing enemies
global.SPAWN_ENABLED = true; ////enables enemy spawning.
global.SPAWN_ALL = false; ////ignores spawn chance, all enemies spawn.
global.cursor_visible = true; ////cursor is shown on screen, toggled off for some specific events, that is why it is there. //

with o_world 
{
    // Initiate game controls handler
    with o_control instance_destroy();
    instance_create(0, 0, o_control);
    // Initialize input system
    with o_input instance_destroy();
    instance_create(0, 0, o_input); 
    
    // Destroy some persistent objects
    global.first_room = scr_map_initialise_load_room(r_debugGreets01, 128, 96);
}

// Reset audio
audio_stop_all();
audio_bgm_reset();

global.gunPacify = false; // allows gun free zones

global.hudStick = 0; // When 1, hoopz went through a door light
global.hoopzKeepX = -999;
global.hoopzKeepY = -999;
global.dialogY = -1; // -1 is default

// Launch logo room
room_goto(r_title);

global.fadeBlack = 0;
global.fadeTime = 0;
