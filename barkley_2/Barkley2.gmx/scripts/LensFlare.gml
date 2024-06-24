/// LensFlare("create", x0, y0, x1, y1, x2, y2, time_seconds)
if (argument[0] == "create")
{
    var obj = instance_create(0, 0, o_lensflare);
    obj.lx0 = real(argument[1]);
    obj.ly0 = real(argument[2]);
    obj.lx1 = real(argument[3]);
    obj.ly1 = real(argument[4]);
    obj.lx2 = real(argument[5]);
    obj.ly2 = real(argument[6]);
    obj.tim = real(argument[7]);
    with (obj) event_user(0);
}
else
{
    show_debug_message("LensFlare() - ERROR: No function that begins with '" + string(argument[0]) + "'.");
}
