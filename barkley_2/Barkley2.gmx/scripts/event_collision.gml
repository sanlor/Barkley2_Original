if (argument0 == SCRIPT_COLLISION_HOOPZ)
{
    if (global.event) exit;
    if (instance_exists(oCinema) && global.cinPly) exit;
    x = 99999;
    y = 99999;
    Cinema("run", script);
}
