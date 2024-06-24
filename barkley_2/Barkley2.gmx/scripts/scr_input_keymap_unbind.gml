/*
Map an input key ID to a keyboard key
arg0 - Input key ID
arg1 - KEYINPUT type constant
*/

var keyid = argument0
var type = argument1

if (type == KEYINPUT_KEYBOARD_MOUSE) {
    global.key_km[keyid] = KEY_NULL;
}
else if (type == KEYINPUT_KEYBOARD) {
    global.key_kb[keyid] = KEY_NULL;
}
else if (type == KEYINPUT_GAMEPAD) {
    global.key_gp[keyid] = KEY_NULL;
}
else {
    show_debug_message("Invalid KEYINPUT type to scr_input_keymap_bind");
}
