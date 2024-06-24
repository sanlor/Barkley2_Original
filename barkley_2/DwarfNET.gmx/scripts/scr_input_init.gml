//The game should use keyboard and mouse until input is found on a valid gamepad. First input will likely 
//happen at the title screen, so this pad will be assigned to player 1. Likewise, in setup menus, the game 
//will know to assign input on a different controller to player 2 if keyinput_gp_player[0] != NULL.

global.keyinput_type = KEYINPUT_KEYBOARD_MOUSE;

for(var i = 0; i < KEYIDS; i++)
{
    // global NULL is taken by KEY_MOUSE_LEFT
    global.key_km[i] = KEY_NULL;
    global.key_kb[i] = KEY_NULL;
    global.key_gp[i] = KEY_NULL; 
}

// Hardware slots

global.keyinput_gp_slot[0] = NULL;
global.keyinput_gp_slot[1] = NULL;
global.keyinput_gp_slot[2] = NULL;
global.keyinput_gp_slot[3] = NULL;

// Player inputs (player 1 and player 2)

global.keyinput_gp_player[0] = NULL;
global.keyinput_gp_player[1] = NULL;

// Key processing can be disabled for specific instances

global.keyinput_disabled = ds_list_create();
