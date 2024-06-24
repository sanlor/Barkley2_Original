if (global.controlType == "pc") return 0;
if (argument[0] == "dpad right") { if (scr_input_check_pressed(KEYID_QUICKMENU_RIGHT, PLAYER1)) return 1; else return 0; }
else if (argument[0] == "dpad up") { if (scr_input_check_pressed(KEYID_QUICKMENU_UP, PLAYER1)) return 1; else return 0; }
else if (argument[0] == "dpad left") { if (scr_input_check_pressed(KEYID_QUICKMENU_LEFT, PLAYER1)) return 1; else return 0; }
else if (argument[0] == "dpad down") { if (scr_input_check_pressed(KEYID_QUICKMENU_DOWN, PLAYER1)) return 1; else return 0; }
else if (argument[0] == "a") { if (scr_input_check_pressed(KEYID_ACTION, PLAYER1)) return 1; else return 0; }
else if (argument[0] == "b") { if (scr_input_check_pressed(KEYID_RUN, PLAYER1)) return 1; else return 0; }

return 0;
