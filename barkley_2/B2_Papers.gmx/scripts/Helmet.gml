// Helmet("draw")
if (argument[0] == "name") return "Bonnet";
else if (argument[0] == "weight") return 1;
else if (argument[0] == "res_normal") return 100;
else if (argument[0] == "res_bio") return 100;
else if (argument[0] == "res_cyber") return 100;
else if (argument[0] == "res_cosmic") return 100;
else if (argument[0] == "res_mental") return 100;
else if (argument[0] == "res_zauber") return 100;
else if (argument[0] == "draw") // Arg1 = string_helmet Arg2 = x Arg3 = y Arg4 = xscale Arg5 = yscale Arg6 = Rot Arg7 = Color Arg8 = Alpha
{
    // Only arg1, arg2, and arg3 are needed, rest are optional
    var xsc = 1;
    var ysc = 1;
    var rot = 0;
    var col = c_white;
    var alp = 1;
    if (argument_count > 4) xsc = argument[4];
    if (argument_count > 5) ysc = argument[5];
    if (argument_count > 6) rot = argument[6];
    if (argument_count > 7) col = argument[7];
    if (argument_count > 8) alp = argument[8];
    var helmetName = argument[1];
    draw_sprite_ext(sHelmet, 0, argument[2], argument[3], xsc, ysc, rot, col, alp);
}
