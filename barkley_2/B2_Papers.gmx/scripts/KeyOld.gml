/// Key(string_key, bool_clear);
var tru = 0;
var clr = 0;
if (argument_count > 1) clr = argument[1];
if (argument_count > 1) tru = Key(argument[0]);

if (argument[0] == "right")
{
    if (argument_count == 1) return (keyboard_check(vk_right) || keyboard_check(ord("D")));
    else
    {
        if (keyboard_check(vk_right) && clr) keyboard_clear(vk_right);
        if (keyboard_check(ord("D")) && clr) keyboard_clear(ord("D"));
        if (Joypad(argument[0], clr)) return 1;
        return tru;
    }
}
else if (argument[0] == "left")
{
    if (argument_count == 1) return (keyboard_check(vk_left) || keyboard_check(ord("A")));
    else
    {
        if (keyboard_check(vk_left) && clr) keyboard_clear(vk_left);
        if (keyboard_check(ord("A")) && clr) keyboard_clear(ord("A"));
        if (Joypad(argument[0], clr)) return 1;
        return tru;
    }
}
else if (argument[0] == "up")
{
    if (argument_count == 1) return (keyboard_check(vk_up) || keyboard_check(ord("W")));
    else
    {
        if (keyboard_check(vk_up) && clr) keyboard_clear(vk_up);
        if (keyboard_check(ord("W")) && clr) keyboard_clear(ord("W"));
        if (Joypad(argument[0], clr)) return 1;
        return tru;
    }
}
else if (argument[0] == "down")
{
    if (argument_count == 1) return (keyboard_check(vk_down) || keyboard_check(ord("S")));
    else
    {
        if (keyboard_check(vk_down) && clr) keyboard_clear(vk_down);
        if (keyboard_check(ord("S")) && clr) keyboard_clear(ord("S"));
        if (Joypad(argument[0], clr)) return 1;
        return tru;
    }
}
else if (argument[0] == "enter")
{
    if (argument_count == 1) return (keyboard_check(vk_enter) || keyboard_check(vk_space));
    else
    {
        if (keyboard_check(vk_enter) && clr) keyboard_clear(vk_enter);
        if (keyboard_check(vk_space) && clr) keyboard_clear(vk_space);
        if (Joypad(argument[0], clr)) return 1;
        return tru;
    }
}
else if (argument[0] == "escape")
{
    if (argument_count == 1) return (keyboard_check(vk_escape));
    else
    {
        if (keyboard_check(vk_escape) && clr) keyboard_clear(vk_escape);
        if (Joypad(argument[0], clr)) return 1;
        return tru;
    }
}
else if (argument[0] == "restart")
{
    if (argument_count == 1) return (keyboard_check(ord("R")));
    else
    {
        if (keyboard_check(ord("R")) && clr) keyboard_clear(ord("R"));
        if (Joypad(argument[0], clr)) return 1;
        return tru;
    }
}
