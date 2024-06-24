/// Joypad(button, clear)
var clr = 0;
if (argument_count > 1) clr = argument[1];
if (gamepad_is_supported() == 0) exit;

// Get current joypad
var gp_num = gamepad_get_device_count();
var gpn = -1;
for (var i = 0; i < gp_num; i++;)
{
    if (gamepad_is_connected(i)) gpn = i;;
}

if (gpn == -1) exit;

if (argument[0] == "enter")
{
    if (clr == 0)return (gamepad_button_check(gpn, gp_face1) || gamepad_button_check(gpn, gp_face2));
    else return (gamepad_button_check_pressed(gpn, gp_face1) || gamepad_button_check_pressed(gpn, gp_face2));
}
if (argument[0] == "escape")
{
    if (clr == 0) return gamepad_button_check(gpn, gp_select);
    else return gamepad_button_check_pressed(gpn, gp_select);
}
if (argument[0] == "up")
{
    if (clr == 0) return gamepad_button_check(gpn, gp_padu);
    else return gamepad_button_check_pressed(gpn, gp_padu);
}
if (argument[0] == "down")
{
    if (clr == 0) return gamepad_button_check(gpn, gp_padd);
    else return gamepad_button_check_pressed(gpn, gp_padd);
}
if (argument[0] == "left")
{
    if (clr == 0) return gamepad_button_check(gpn, gp_padl);
    else return gamepad_button_check_pressed(gpn, gp_padl);
}
if (argument[0] == "right")
{
    if (clr == 0) return gamepad_button_check(gpn, gp_padr);
    else return gamepad_button_check_pressed(gpn, gp_padr);
}
if (argument[0] == "rumble")
{
    gamepad_set_vibration(gpn, argument[1], argument[2]);
}
if (argument[0] == "restart")
{
    if (clr == 0) return (gamepad_button_check(gpn, gp_start) || gamepad_button_check(gpn, gp_face3) || gamepad_button_check(gpn, gp_face4));
    else return (gamepad_button_check_pressed(gpn, gp_start) || gamepad_button_check_pressed(gpn, gp_face3) || gamepad_button_check_pressed(gpn, gp_face4));
}
