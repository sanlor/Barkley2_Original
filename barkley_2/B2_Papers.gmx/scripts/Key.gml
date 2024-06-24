if (argument[0] == "init") 
{
    global.keyAmt = 0;
    Key("assign", "Up", KEYID_UP, ord('W'));
    Key("assign", "Down", KEYID_DOWN, ord('S'));
    Key("assign", "Left", KEYID_LEFT, ord('A'));
    Key("assign", "Right", KEYID_RIGHT, ord('D'));
    
    Key("assign", "Action", KEYID_ACTION, KEY_MOUSE_LEFT);
    Key("assign", "Holster", KEYID_HOLSTER, KEY_MOUSE_RIGHT);
    Key("assign", "Roll", KEYID_RUN, vk_space);
    Key("assign", "Weapon >", KEYID_WEAPON_NEXT, KEY_MOUSE_WHEELUP);
    Key("assign", "Weapon <", KEYID_WEAPON_PREV, KEY_MOUSE_WHEELDOWN);
    
    Key("assign", "Gun'sbag", KEYID_GUNBAG, vk_shift);
    Key("assign", "Quickmenu", KEYID_QUICKMENU, ord('Q'));
    
    Key("assign", "Item Next", KEYID_ITEM_NEXT, ord('F'));
    Key("assign", "Item Use", KEYID_ITEM_USE, ord('E'));
    Key("assign", "Zauber Next", KEYID_ABILITY_NEXT, ord('G'));
    Key("assign", "Zauber Use", KEYID_ABILITY_USE, ord('R'));
    
    Key("assign", "Pause", KEYID_PAUSE, vk_escape);
    
    //Key("assign", "Dialog", KEYID_DIALOGUE, vk_enter);
    //Key("assign", "Confirm", KEYID_CONFIRM, vk_enter); // Remove confirm from game
    
    Key("load");
}
else if (argument[0] == "assign") // 1 = Name, 2 = Action, 3 = Keycode
{
    global.keyNam[global.keyAmt] = argument[1];
    global.keyAct[global.keyAmt] = argument[2];
    global.keyCod[global.keyAmt] = argument[3];
    global.keyAmt += 1;
}
else if (argument[0] == "amount")
{
    return global.keyAmt;
}
else if (argument[0] == "name")
{
    return global.keyNam[argument[1]];
}
else if (argument[0] == "code")
{
    return global.keyCod[argument[1]];
}
else if (argument[0] == "human")
{
    return Key("to string", global.keyCod[argument[1]]);
}
else if (argument[0] == "set") // Key Index, Keycode
{
    global.keyCod[argument[1]] = argument[2];
    Key("apply");
}
else if (argument[0] == "apply") // Assigns keys from preference values
{ 
    for (_ii = 0; _ii < global.keyAmt; _ii += 1)
    {
        scr_input_keymap_bind(global.keyAct[_ii], KEYINPUT_KEYBOARD_MOUSE, global.keyCod[_ii])
    }
} 
else if (argument[0] == "save") //Saves the controls to a single file
{ 
    fil = file_text_open_write("controls.txt");
    file_text_write_string(fil, "Do not edit or delete this file.");
    file_text_writeln(fil);
    for (_ii = 0; _ii < global.keyAmt; _ii += 1) 
    {
        file_text_write_string(fil, string(global.keyNam[_ii]));
        file_text_writeln(fil);
        file_text_write_string(fil, string(global.keyAct[_ii]));
        file_text_writeln(fil);
        file_text_write_string(fil, string(global.keyCod[_ii]));
        file_text_writeln(fil);
    }
    file_text_close(fil);
} 
else if (argument[0] == "load") //Loads the controls from the single file
{ 
    if (file_exists('controls.txt')) 
    {
        fil = file_text_open_read('controls.txt');
        if (file_text_read_string(fil) == "Do not edit or delete this file.") 
        {
            file_text_readln(fil);
            for (_ii = 0; _ii < global.keyAmt; _ii += 1) 
            {
                global.keyNam[_ii] = file_text_read_string(fil);
                file_text_readln(fil);
                global.keyAct[_ii] = real(file_text_read_string(fil));
                file_text_readln(fil);
                global.keyCod[_ii] = real(file_text_read_string(fil));
                file_text_readln(fil);
            }
        }
        file_text_close(fil);
    }
    Key("apply");
} 
else if (argument[0] == "check") // If there are any duplicate keys replace with N/A
{
    dd = argument[1];
    for (_ii = 0; _ii < global.keyAmt; _ii += 1) 
    {
        if (_ii != dd) 
        {
            if (global.keyCod[_ii] == argument[2])
            {
                global.keyCod[_ii] = global.keyCod[dd]
                Key("apply");
            }
        }
    }
} 
else if (argument[0] == "to string") // Keycode to Human readable
{
    _ky = argument[1];
    if (_ky == 27) return "ESCAPE";
    if (_ky == KEY_MOUSE_LEFT) return "M Left";
    if (_ky == KEY_MOUSE_RIGHT) return "M Right";
    if (_ky == KEY_MOUSE_MID) return "M Mid";
    if (_ky == KEY_MOUSE_WHEELUP) return "Wheel Up";
    if (_ky == KEY_MOUSE_WHEELDOWN) return "Wheel Dn";
    if (_ky == 09) return 'TAB';
    if (_ky == 13) return 'ENTER';
    if (_ky == 16) return 'SHIFT';
    if (_ky == 17) return 'CONTROL';
    if (_ky == 18) return 'ALT';
    if (_ky == 32) return 'SPACE';
    if (_ky == 37) return 'LEFT';
    if (_ky == 38) return 'UP';
    if (_ky == 39) return 'RIGHT';
    if (_ky == 40) return 'DOWN';
    if (_ky == 48) return '0';
    if (_ky == 49) return '1';
    if (_ky == 50) return '2';
    if (_ky == 51) return '3';
    if (_ky == 52) return '4';
    if (_ky == 53) return '5';
    if (_ky == 54) return '6';
    if (_ky == 55) return '7';
    if (_ky == 56) return '8';
    if (_ky == 57) return '9';
    if (_ky == 65) return 'A';
    if (_ky == 66) return 'B';
    if (_ky == 67) return 'C';
    if (_ky == 68) return 'D';
    if (_ky == 69) return 'E';
    if (_ky == 70) return 'F';
    if (_ky == 71) return 'G';
    if (_ky == 72) return 'H';
    if (_ky == 73) return 'I';
    if (_ky == 74) return 'J';
    if (_ky == 75) return 'K';
    if (_ky == 76) return 'L';
    if (_ky == 77) return 'M';
    if (_ky == 78) return 'N';
    if (_ky == 79) return 'O';
    if (_ky == 80) return 'P';
    if (_ky == 81) return 'Q';
    if (_ky == 82) return 'R';
    if (_ky == 83) return 'S';
    if (_ky == 84) return 'T';
    if (_ky == 85) return 'U';
    if (_ky == 86) return 'V';
    if (_ky == 87) return 'W';
    if (_ky == 88) return 'X';
    if (_ky == 89) return 'Y';
    if (_ky == 90) return 'Z';
    if (_ky == 96) return 'NUMPAD 0';
    if (_ky == 97) return 'NUMPAD 1';
    if (_ky == 98) return 'NUMPAD 2';
    if (_ky == 99) return 'NUMPAD 3';
    if (_ky == 100) return 'NUMPAD 4';
    if (_ky == 101) return 'NUMPAD 5';
    if (_ky == 102) return 'NUMPAD 6';
    if (_ky == 103) return 'NUMPAD 7';
    if (_ky == 104) return 'NUMPAD 8';
    if (_ky == 105) return 'NUMPAD 9';
    if (_ky == 106) return 'NUMPAD *';
    if (_ky == 107) return 'NUMPAD +';
    if (_ky == 109) return 'NUMPAD -';
    if (_ky == 111) return 'NUMPAD /';
    if (_ky == 110) return 'NUMPAD .';
    return "N/A";
} 
else if (argument[0] == "get") 
{
    if (keyboard_lastkey != -999)
    {
        _ky = keyboard_lastkey;
        keyboard_lastkey = -999;
        if (_ky == 27) _ky = -999;
        if (Key("to string", _ky) != "N/A") return _ky;
    }
    if (mouse_check_button_pressed(mb_left)) return KEY_MOUSE_LEFT; // -1
    if (mouse_check_button_pressed(mb_middle)) return KEY_MOUSE_MID; // -2
    if (mouse_check_button_pressed(mb_right)) return KEY_MOUSE_RIGHT; // -3
    if (mouse_wheel_down()) return KEY_MOUSE_WHEELDOWN; // -4
    if (mouse_wheel_up()) return KEY_MOUSE_WHEELUP; // -5
    return -999;
} 
else if (argument[0] == "verify") //Make sure no keys are NA, is even used?
{ 
    ii=0;
    while (ii<global.key_amount) {
    if (Key('what',global.cpref[ii])='N/A') return(1);
    ii+=1;
    }
    return(0);
}
