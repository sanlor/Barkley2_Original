/// Smoke("puff" / "mass", x, y, z, scl / type)
// scale is based on 32
if (argument[0] == "puff")
{
    var obj = instance_create(argument[1], argument[2], oSmoke);
    obj.z = argument[3];
    obj.scl = (1 / 32) * argument[4];
    if (argument_count > 5) obj.color = argument[5];
    if (argument_count > 6) obj.value = argument[6];
    if (argument_count > 5) Smoke("color", obj.color, obj.value);
    with (obj) event_user(0);
    with (obj) instance_destroy();
    if (argument_count > 5) Smoke("color", c_white);
    return 1;
}
if (argument[0] == "puff keep")
{
    var obj = instance_create(argument[1], argument[2], oSmoke);
    obj.z = argument[3];
    obj.scl = (1 / 32) * argument[4];
    if (argument_count > 5) obj.color = argument[5];
    if (argument_count > 6) obj.value = argument[6];
    if (argument_count > 5) Smoke("color", obj.color, obj.value);
    with (obj) event_user(0);
    //with (obj) instance_destroy();
    if (argument_count > 5) Smoke("color", c_white);
    return obj;
}
else if (argument[0] == "mass") // 1 = x, 2 = y, 3 = z, 4 = type, 5 = color, 6 = value?
{
    var _x = real(argument[1]);
    var _y = real(argument[2]);
    var _z = real(argument[3]);
    var type = real(argument[4]);

    var obj = instance_create(_x, _y, oSmokeMass);
    obj.z = _z;
    if (argument_count > 5) obj.color = argument[5];
    if (argument_count > 6) obj.value = argument[6];
    switch(type)
    {
        case 0:
        
            obj.init_Radius = 8;
            obj.att_RadiusGain = 0.5;
            obj.init_Pow = 18;
            obj.init_Interval = 0.8;
            obj.att_IntervalGain = 0.4;
            obj.att_IntervalRand = 0.4;
            obj.att_Time = 4;
            break;
            
        case 1:
            obj.init_Radius = 10;
            obj.att_RadiusGain = 0.5;
            obj.init_Pow = 18;
            obj.init_Interval = 0.6;
            obj.att_IntervalGain = 0.2;
            obj.att_IntervalRand = 0.2;
            obj.att_Time = 6;
            break;
            
        case 2:
            obj.init_Radius = 12;
            obj.att_RadiusGain = 0.75;
            obj.init_Pow = 18;
            obj.att_PowGain = -0.4;
            obj.att_PowRand = 8;
            obj.init_Interval = 0.2;
            obj.att_IntervalGain = 0.1;
            obj.att_IntervalRand = 0.2;
            obj.att_Time = 8;
            break;
            
        case 3:
            obj.init_Radius = 16;
            obj.att_RadiusGain = 1;
            obj.init_Pow = 18;
            obj.att_PowRand = 8;
            obj.att_PowGain = -0.6;
            obj.init_Interval = 0.2;
            obj.att_IntervalGain = 0.1;
            obj.att_IntervalRand = 0.2;
            obj.att_Time = 10;
            break;
            
        case 4:
            obj.init_Radius = 20;
            obj.att_RadiusGain = 1;
            obj.init_Pow = 24;
            obj.att_PowRand = 8;
            obj.att_PowGain = -1;
            obj.init_Interval = 0.2;
            obj.att_IntervalGain = 0.1;
            obj.att_IntervalRand = 0.2;
            obj.att_Time = 12;
            break;
            
        case 5:
            obj.init_Radius = 22;
            obj.att_RadiusGain = 1;
            obj.init_Pow = 28;
            obj.att_PowRand = 8;
            obj.att_PowGain = -1;
            obj.init_Interval = 0.2;
            obj.att_IntervalGain = 0.1;
            obj.att_IntervalRand = 0.2;
            obj.att_Time = 14;
            break;
            
        case 6:
            obj.init_Radius = 24;
            obj.att_RadiusGain = 1;
            obj.init_Pow = 28;
            obj.att_PowRand = 8;
            obj.att_PowGain = -1;
            obj.init_Interval = 0.2;
            obj.att_IntervalGain = 0.1;
            obj.att_IntervalRand = 0.2;
            obj.att_Time = 15;
            break;
        
        case 7:
            obj.init_Radius = 22;
            obj.att_RadiusGain = 1;
            obj.init_Pow = 32;
            obj.att_PowRand = 8;
            obj.att_PowGain = -1;
            obj.init_Interval = 0.2;
            obj.att_IntervalGain = 0.1;
            obj.att_IntervalRand = 0.2;
            obj.att_Time = 16;
            break;
            
        case 8:
            obj.init_Radius = 28;
            obj.att_RadiusGain = 1;
            obj.init_Pow = 44;
            obj.att_PowRand = 8;
            obj.att_PowGain = -2;
            obj.init_Interval = 0.2;
            obj.att_IntervalGain = 0.1;
            obj.att_IntervalRand = 0.2;
            obj.att_Time = 17;
            break;
            
        case 9:
            obj.init_Radius = 30;
            obj.att_RadiusGain = 1;
            obj.init_Pow = 50;
            obj.att_PowRand = 8;
            obj.att_PowGain = -2;
            obj.init_Interval = 0.1;
            obj.att_IntervalGain = 0.1;
            obj.att_IntervalRand = 0.2;
            obj.att_Time = 18;
            break;
            
        case 10:
            obj.init_Radius = 32;
            obj.att_RadiusGain = -1;
            obj.init_Pow = 16;
            obj.init_Height = 4;
            obj.att_PowRand = 6;
            obj.att_PowGain = -0.6;
            obj.init_Interval = 0.1;
            obj.att_IntervalGain = 0.05;
            obj.att_HeightGain = 0.5;
            obj.att_IntervalRand = 0.2;
            obj.att_Time = 16;
            obj.move_z = 12;
            break;
            
        default:
            break;
    }
    
    obj.init_Interval *= 1.5;
    obj.init_Pow *= 1.75;
    
    return obj;
}
else if (argument[0] == "color") // 1 = Color, 2 = Value?
{
    global.smokeBlend = argument[1];
    if (argument_count == 2) global.smokeValue = 0;
    else global.smokeValue = argument[2];
    global.smokeColor[0] = merge_color(make_color_rgb(142, 180, 198), global.smokeBlend, global.smokeValue);
    global.smokeColor[1] = merge_color(make_color_rgb(192, 219, 225), global.smokeBlend, global.smokeValue);
    global.smokeColor[2] = merge_color(make_color_rgb(255, 255, 255), global.smokeBlend, global.smokeValue);
    return 1;
}
else if (argument[0] == "customcolor") // 1 = Color, 2 = Value?
{
    global.smokeColor[0] = argument[1];
    global.smokeColor[1] = argument[2];
    global.smokeColor[2] = argument[3];
    return 1;
}
else if (argument[0] == "init")
{
    Smoke("color", c_white, 0);
    return 1;
}
