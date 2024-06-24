/*
Map an input key ID to a keyboard key
arg0 - Input key ID
arg0 - KEYINPUT type constant
arg2 - Keyboard/Mouse/Gamepad key (should be a KEY_ constant, or e.g. ord('W'))
*/

var keyid = argument0
var type = argument1
var key = argument2

if (type == KEYINPUT_KEYBOARD_MOUSE) {
    global.key_km[keyid] = key;
}
else if (type == KEYINPUT_KEYBOARD) {
    global.key_kb[keyid] = key;
}
else if (type == KEYINPUT_GAMEPAD) {
    global.key_gp[keyid] = key;
}
else {
    show_debug_message("Invalid KEYINPUT type to scr_input_keymap_bind");
}
