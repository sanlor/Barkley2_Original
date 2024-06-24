/// Fishing()
if (argument[0] == "trajectory") // 1 = Strength, 2 = Angle, 3 = Weight
{
    var xxx = o_cts_hoopz.x;
    var yyy = o_cts_hoopz.y;
    var zzz = 20; // From lure create
    var mvx = lengthdir_x((argument[1] * 0.2) + 0, argument[2]);
    var mvy = lengthdir_y((argument[1] * 0.2) + 0, argument[2]);
    var mvz = 10 + (strength * 0.4);
    while (true)
    {
        mvz -= argument[3] * 0.05;
        xxx += mvx * 0.05;
        yyy += mvy * 0.05;
        zzz += mvz * 0.05;
        if (mvz <= 0 and zzz <= 0) break;
    }
    fsx = xxx;
    fsy = yyy;
    return 1;
}
