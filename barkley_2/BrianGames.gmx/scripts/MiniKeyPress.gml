if (argument_count == 2) _c = argument[1]; else _c = 0;
if (argument[0] == "up")
{
    if (keyboard_check(vk_up)) { if (_c == 0) keyboard_clear(vk_up); return 1; }
    //if (keyboard_check(ord("W"))) { if (_c == 0) keyboard_clear(ord("W")); return 1; }
}
else if (argument[0] == "down")
{
    if (keyboard_check(vk_down)) { if (_c == 0) keyboard_clear(vk_down); return 1; }
    //if (keyboard_check(ord("S"))) { if (_c == 0) keyboard_clear(ord("S")); return 1; }
}
else if (argument[0] == "left")
{
    if (keyboard_check(vk_left)) { if (_c == 0) keyboard_clear(vk_left); return 1; }
    //if (keyboard_check(ord("A"))) { if (_c == 0) keyboard_clear(ord("A")); return 1; }
}
else if (argument[0] == "right")
{
    if (keyboard_check(vk_right)) { if (_c == 0) keyboard_clear(vk_right); return 1; }
    //if (keyboard_check(ord("D"))) { if (_c == 0) keyboard_clear(ord("D")); return 1; }
}
else if (argument[0] == "action")
{
    if (keyboard_check(vk_enter)) { if (_c == 0) keyboard_clear(vk_enter); return 1; }
    //if (keyboard_check(vk_shift)) { if (_c == 0) keyboard_clear(vk_shift); return 1; }
}
else if (argument[0] == "cancel")
{
    if (keyboard_check(vk_backspace)) { if (_c == 0) keyboard_clear(vk_backspace); return 1; }
}
else if (argument[0] == "pause")
{
    if (keyboard_check(vk_escape)) { if (_c == 0) keyboard_clear(vk_escape); return 1; }
}
else if (argument[0] == "any")
{
    if (keyboard_check(vk_up)) { if (_c == 0) keyboard_clear(vk_up); return 1; }
    if (keyboard_check(vk_down)) { if (_c == 0) keyboard_clear(vk_down); return 1; }
    if (keyboard_check(vk_left)) { if (_c == 0) keyboard_clear(vk_left); return 1; }
    if (keyboard_check(vk_right)) { if (_c == 0) keyboard_clear(vk_right); return 1; }
    if (keyboard_check(vk_enter)) { if (_c == 0) keyboard_clear(vk_enter); return 1; }
    
    
    //if (keyboard_check(ord("W"))) { if (_c == 0) keyboard_clear(ord("W")); return 1; }
    //if (keyboard_check(ord("S"))) { if (_c == 0) keyboard_clear(ord("S")); return 1; }
    //if (keyboard_check(ord("A"))) { if (_c == 0) keyboard_clear(ord("A")); return 1; }
    //if (keyboard_check(ord("D"))) { if (_c == 0) keyboard_clear(ord("D")); return 1; }
    //if (keyboard_check(vk_shift)) { if (_c == 0) keyboard_clear(vk_shift); return 1; }
    
    if (keyboard_check(vk_escape)) { if (_c == 0) keyboard_clear(vk_escape); return 1; }
}
return 0;
