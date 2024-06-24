if (argument[0] == "x") return bvX[argument[1]];
if (argument[0] == "y") return bvY[argument[1]];
if (argument[0] == "width") return bvW[argument[1]];
if (argument[0] == "height") return bvH[argument[1]];
if (argument[0] == "init")
{
    bvButtons = 0;
}
else if (argument[0] == "add")
{
    _ind = bvButtons;
    bvName[_ind] = argument[1];
    bvActive[_ind] = 0;
    bvHover[_ind] = 0;
    bvX[_ind] = argument[2];
    bvY[_ind] = argument[3];
    bvW[_ind] = argument[4];
    bvH[_ind] = argument[5];
    bvButtons += 1;
    return bvButtons - 1;
}
else if (argument[0] == "name")
{
    if (argument_count == 2) return bvName[argument[1]];
    else 
    {
        var nam = argument[2];
        var nao = nam;
        nam = string_replace_all(nam, "of the ", "");
        if (string_lower(nam) == "with a hole in the pocket") nam = "hole in pocket";
        if (nam == nao) nam = string_replace_all(nam, "with the ", "");
        if (nam == nao) nam = string_replace_all(nam, "of a ", "");
        if (nam == nao) nam = string_replace_all(nam, "with a ", "");
        if (nam == nao) nam = string_replace_all(nam, "of ", "");
        if (nam == nao) nam = string_replace_all(nam, "with ", "");
        if (nam == nao) nam = string_replace_all(nam, "cursed by a ", "");
        nam = string_replace_all(nam, "Heart of a ", "Heart ");
        bvName[argument[1]] = nam;
    }
}
else if (argument[0] == "active")
{
    bvActive[argument[1]] = argument[2];
}
else if (argument[0] == "click") //check ID mouse
{
    _ind = argument[1];
    if (scr_inside_rectangle(argument[2], argument[3], bvX[_ind], bvY[_ind], bvX[_ind] + bvW[_ind], bvY[_ind] + bvH[_ind]))
    {
        bvHover[_ind] = 1;
        if (mouse_check_button(mb_left)) return 1;
        if (mouse_check_button(mb_right)) return 2;
    }
    return 0;
}
else if (argument[0] == "draw")
{
    for (_i = 0; _i < bvButtons; _i += 1)
    {
        _ind = _i;
        draw_sprite_ext(s1x1, 0, bvX[_ind], bvY[_ind], bvW[_ind], bvH[_ind], 0, c_black, 1);
        if (bvActive[_ind])
        {
            draw_sprite_ext(s1x1, 0, bvX[_ind], bvY[_ind], bvW[_ind], bvH[_ind], 0, c_lime, 1);
        }
        else if (bvHover[_ind])
        {
            draw_sprite_ext(s1x1, 0, bvX[_ind], bvY[_ind], bvW[_ind], bvH[_ind], 0, merge_color(c_lime, c_dkgray, .5), 1);
            bvHover[_ind] = 0;
        }
        scr_font(global.fn_debug, c_white, 1, 1);
        draw_text_ext_transformed(bvX[_ind] + round(bvW[_ind] / 2), bvY[_ind] + 0 + round(bvH[_ind] / 2), bvName[_ind], -1, bvW[_ind] / 2, scl, scl, 0);
    }
    scr_font(global.fn_debug, c_white, 0, 0);
}
