#define scr_fx_explosion_createFromType
///scr_fx_explosion_createFromType(x, y, z, type_as_integer_or_string)
// String: Creates a specific explosion where the string indicates the explosion e.g. "flaregun"
// Integer: Creates a generic explosion where the value of 0-9 determines the strength, higher is bigger.

var _x = argument0;
var _y = argument1;
var _z = argument2;
var type = argument3;

var obj = instance_create(_x, _y, oSmokeMass);
obj.z = _z;

if (is_string(type)) {
    return __getSpecific(type, obj);
} else {
    return __getGeneric(type, obj);
}


#define __getSpecific
///__getGeneric(type_as_integer)
// Creates a specifc explosion where the string indicates the explosion e.g. "flaregun"

var type = argument0;
var obj = argument1;

switch(type)
{
    case "flaregun":
        obj.init_Radius = 18;
        obj.init_RadiusMin = 14;
        obj.att_RadiusGain = 2;
        obj.init_Pow = 8;
        obj.init_Interval = 0.2;
        obj.att_IntervalGain = 0;
        obj.att_IntervalRand = 0.1;
        obj.att_Time = 4;
        audio_play_sound_at_xy("impact_flaregun", false, 10, obj.x, obj.y);
        Shake("add", 4, 120, obj.x, obj.y, .3);
        
        // Create additional explosion FX
        //scr_fx_simple_ext(obj.x, obj.y, obj.z + 4, s_effect_explo_32, 1 + random(.5),
        //                  1, 1, choose(0,90,180,270), c_white, 1);
        break;
        
    case "rocket":
        obj.init_Radius = 36;
        obj.init_RadiusMin = 24;
        obj.att_RadiusGain = 0.5;
        obj.init_Pow = 8;
        obj.init_Interval = 0.025;
        obj.att_IntervalGain = 0.002;
        obj.att_IntervalRand = 0.05;
        obj.att_Time = 6;
        obj.gravity_z = 5;
        audio_play_sound_at_xy("hoopzweap_rocket_impact", false, 10, obj.x, obj.y);
        Shake("add", 8, 250, obj.x, obj.y, .5);
    
        // Create additional explosion FX
        //scr_fx_simple_ext(obj.x, obj.y, obj.z + 4, s_effect_explo_96, 1,
        //                  1, 1, choose(0,90,180,270), c_white, 1);
        break;
        
    default:
        break;
}

return obj;


#define __getGeneric
///__getGeneric(type_as_integer)
// Creates a generic explosion where the value of 0-9 determines the strength, higher is bigger.

var type = argument0;
var obj = argument1;

switch(type)
{
    case 0:
    
        obj.init_Radius = 8;
        obj.att_RadiusGain = 0.5;
        obj.init_Pow = 8;
        obj.init_Interval = 0.8;
        obj.att_IntervalGain = 0.4;
        obj.att_IntervalRand = 0.4;
        obj.att_Time = 4;
        audio_play_sound_at_xy("impact_flaregun", false, 10, obj.x, obj.y);
        Shake("add", 4, 120, obj.x, obj.y, .3);
        
        break;
        
    case 1:
        obj.init_Radius = 10;
        obj.att_RadiusGain = 0.5;
        obj.init_Pow = 8;
        obj.init_Interval = 0.6;
        obj.att_IntervalGain = 0.2;
        obj.att_IntervalRand = 0.2;
        obj.att_Time = 6;
        audio_play_sound_at_xy("impact_flaregun", false, 10, obj.x, obj.y);
        Shake("add", 6, 130, obj.x, obj.y, .3);
        break;
        
    case 2:
        obj.init_Radius = 12;
        obj.att_RadiusGain = 0.75;
        obj.init_Pow = 12;
        obj.att_PowGain = -0.4;
        obj.att_PowRand = 8;
        obj.init_Interval = 0.2;
        obj.att_IntervalGain = 0.1;
        obj.att_IntervalRand = 0.2;
        obj.att_Time = 8;
        audio_play_sound_at_xy("impact_flaregun", false, 10, obj.x, obj.y);
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
        audio_play_sound_at_xy("impact_flaregun", false, 10, obj.x, obj.y);
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
        audio_play_sound_at_xy("impact_flaregun", false, 10, obj.x, obj.y);
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
        audio_play_sound_at_xy("oildrum_death", false, 10, obj.x, obj.y);
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
        audio_play_sound_at_xy("oildrum_death", false, 10, obj.x, obj.y);
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
        audio_play_sound_at_xy("oildrum_death", false, 10, obj.x, obj.y);
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
        audio_play_sound_at_xy("oildrum_death", false, 10, obj.x, obj.y);
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
        audio_play_sound_at_xy("oildrum_death", false, 10, obj.x, obj.y);
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
        audio_play_sound_at_xy("oildrum_death", false, 10, obj.x, obj.y);
        Shake("add", 32, 220, obj.x, obj.y, 1.5);
        break;
        
    default:
        break;
}

return obj;