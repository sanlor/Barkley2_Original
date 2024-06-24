/// Trajectory(create, x, y, z, arc, spd, dx, dy, dz)
if (argument[0] == "create") // 1 = x, 2 = y, 3 = z, 4 = arc, 5 = ex, 6 = ey, 7 = ez
{
    obj = instance_create(0, 0, oTrajectory);
    obj.x = argument[1];
    obj.y = argument[2];
    obj.z = argument[3];
    obj.arc = argument[4];
    obj.spd = argument[5];
    obj.edx = argument[6];
    obj.edy = argument[7];
    obj.edz = argument[8];
    obj.dad = id;
    with (obj) event_user(0);
    return obj;
}
