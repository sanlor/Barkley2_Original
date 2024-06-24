/// ustation_button_selected(action, menu, button)

var menu = argument0;
var button = argument1;

var action = button[? "action"];
var sndSelect = button[? "sndSelect"];
var sndBuzz = button[? "sndBuzz"];

var trigger = false;
if (scr_input_getInputType() == KEYINPUT_KEYBOARD_MOUSE) {
    if (scr_input_check_pressed(KEYID_CONFIRM, PLAYER1) or mouse_check_button_pressed(mb_left)) {
        trigger = true;
    }
} else {
    if (scr_input_check_pressed(KEYID_CONFIRM, PLAYER1)) {
        trigger = true;
    }
}

if (trigger) {
    if (button[? "disabled"]) {
        audio_play_sound_fresh(sndBuzz, 0, false);
    } else {
        audio_play_sound_fresh(sndSelect, 0, false);
        script_execute(action, menu, button);
    }
}
