if (argument0 == KEYID_ACTION) return mouse_check_button_pressed(mb_left);
if (keyboard_check_pressed(argument0)) return 1;
return 0;
