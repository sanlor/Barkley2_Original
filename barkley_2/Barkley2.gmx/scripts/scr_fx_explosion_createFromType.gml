///scr_fx_explosion_createFromType(x, y, z, intensity_0_to_10)
// String: Creates a specific explosion where the string indicates the explosion e.g. "flaregun"
// Integer: Creates a generic explosion where the value of 0-9 determines the strength, higher is bigger.

var _x = argument0;
var _y = argument1;
var _z = argument2;
var type = argument3;

var obj = instance_create(_x, _y, o_effect_explosion);
obj.z = _z;
obj.blastType = type;

audio_play_sound_at_xy("explosion_generic_" + string(type), false, 10, obj.x, obj.y);
switch(type)
{
    case 0:
    
        obj.init_Radius = 8;
        obj.att_RadiusGain = 0.5;
        obj.init_Pow = 8 + 2;
        obj.init_Interval = 0.8;
        obj.att_IntervalGain = 0.4;
        obj.att_IntervalRand = 0.4;
        obj.att_Time = 4;
        Shake("add", 4, 120, obj.x, obj.y, .3);
        
        break;
        
    case 1:
        obj.init_Radius = 10;
        obj.att_RadiusGain = 0.5;
        obj.init_Pow = 8 + 4;
        obj.init_Interval = 0.6;
        obj.att_IntervalGain = 0.2;
        obj.att_IntervalRand = 0.2;
        obj.att_Time = 6;
        Shake("add", 6, 130, obj.x, obj.y, .3);
        break;
        
    case 2:
        obj.init_Radius = 12;
        obj.att_RadiusGain = 0.75;
        obj.init_Pow = 12 + 3;
        obj.att_PowGain = -0.4;
        obj.att_PowRand = 8;
        obj.init_Interval = 0.2;
        obj.att_IntervalGain = 0.1;
        obj.att_IntervalRand = 0.2;
        obj.att_Time = 8;
        Shake("add", 8, 140, obj.x, obj.y, .5);
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
        Shake("add", 9, 150, obj.x, obj.y, .5);
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
        Shake("add", 10, 160, obj.x, obj.y, .5);
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
        Shake("add", 16, 170, obj.x, obj.y, 1);
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
        Shake("add", 16, 180, obj.x, obj.y, 1);
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
        Shake("add", 16, 190, obj.x, obj.y, 1);
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
        Shake("add", 28, 200, obj.x, obj.y, 1.5);
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
        Shake("add", 30, 210, obj.x, obj.y, 1.5);
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
        Shake("add", 32, 220, obj.x, obj.y, 1.5);
        break;
        
    default:
        break;
}

obj.init_Interval = 0.5; //*= 2;
obj.att_IntervalGain = 1; ///= 4;
obj.att_Time /= 2;

//Smoke("mass", obj.x, obj.y, obj.z, obj.blastType, c_black, 0.5);

return obj;
