
/*

///scr_fx_explosion_spawn_at(x,y,z,exploType)

var _x = argument0;
var _y = argument1;
var _z = argument2;
var _type = argument3;

var _obj = scr_fx_explosion_getFromType(_type);

_obj.x = _x;
_obj.y = _y;
_obj.z = _z;

///

///scr_fx_explosion_getFromType(type_as_integer_or_string)
// String: Creates a specific explosion where the string indicates the explosion e.g. "flaregun"
// Integer: Creates a generic explosion where the value of 0-9 determines the strength, higher is bigger.

var _type = argument0;

if (is_string(_type)) {
    return __getSpecific(_type);
} else {
    return __getGeneric(_type);
}

////

///__getGeneric(type_as_integer)
// Creates a specifc explosion where the string indicates the explosion e.g. "flaregun"

var _type = argument0;

var _obj = instance_create(x,y,o_effect_explosion);

switch(_type)
{
    case "flaregun":
        _obj.init_Radius = 18;
        _obj.init_RadiusMin = 14;
        _obj.att_RadiusGain = 2;
        _obj.init_Pow = 8;
        _obj.init_Interval = 0.2;
        _obj.att_IntervalGain = 0;
        _obj.att_IntervalRand = 0.1;
        _obj.att_Time = 4;
        audio_play_sound_at_xy("impact_flaregun", false, 10, x, y);
        Shake("add", 4, 120, x, y, .3);
        
        // Create additional explosion FX
        scr_fx_simple_ext(x, y, z + 4, s_effect_explo_32, 1 + random(.5), 1, 1, choose(0,90,180,270), c_white, 1);
        
        break;
        
    default:
        break;
}

return _obj;

////

///__getGeneric(type_as_integer)
// Creates a generic explosion where the value of 0-9 determines the strength, higher is bigger.

var _type = argument0;

var _obj = instance_create(x,y,o_effect_explosion);

switch(_type)
{
    case 0:
    
        _obj.init_Radius = 8;
        _obj.att_RadiusGain = 0.5;
        _obj.init_Pow = 8;
        _obj.init_Interval = 0.8;
        _obj.att_IntervalGain = 0.4;
        _obj.att_IntervalRand = 0.4;
        _obj.att_Time = 4;
        audio_play_sound_at_xy("impact_flaregun", false, 10, x, y);
        Shake("add", 4, 120, x, y, .3);
        
        break;
        
    case 1:
        _obj.init_Radius = 10;
        _obj.att_RadiusGain = 0.5;
        _obj.init_Pow = 8;
        _obj.init_Interval = 0.6;
        _obj.att_IntervalGain = 0.2;
        _obj.att_IntervalRand = 0.2;
        _obj.att_Time = 6;
        audio_play_sound_at_xy("impact_flaregun", false, 10, x, y);
        Shake("add", 6, 130, x, y, .3);
        break;
        
    case 2:
        _obj.init_Radius = 12;
        _obj.att_RadiusGain = 0.75;
        _obj.init_Pow = 12;
        _obj.att_PowGain = -0.4;
        _obj.att_PowRand = 8;
        _obj.init_Interval = 0.2;
        _obj.att_IntervalGain = 0.1;
        _obj.att_IntervalRand = 0.2;
        _obj.att_Time = 8;
        audio_play_sound_at_xy("impact_flaregun", false, 10, x, y);
        Shake("add", 8, 140, x, y, .5);
        break;
        
    case 3:
        _obj.init_Radius = 16;
        _obj.att_RadiusGain = 1;
        _obj.init_Pow = 18;
        _obj.att_PowRand = 8;
        _obj.att_PowGain = -0.6;
        _obj.init_Interval = 0.2;
        _obj.att_IntervalGain = 0.1;
        _obj.att_IntervalRand = 0.2;
        _obj.att_Time = 10;
        audio_play_sound_at_xy("impact_flaregun", false, 10, x, y);
        Shake("add", 9, 150, x, y, .5);
        break;
        
    case 4:
        _obj.init_Radius = 20;
        _obj.att_RadiusGain = 1;
        _obj.init_Pow = 24;
        _obj.att_PowRand = 8;
        _obj.att_PowGain = -1;
        _obj.init_Interval = 0.2;
        _obj.att_IntervalGain = 0.1;
        _obj.att_IntervalRand = 0.2;
        _obj.att_Time = 12;
        audio_play_sound_at_xy("impact_flaregun", false, 10, x, y);
        Shake("add", 10, 160, x, y, .5);
        break;
        
    case 5:
        _obj.init_Radius = 22;
        _obj.att_RadiusGain = 1;
        _obj.init_Pow = 28;
        _obj.att_PowRand = 8;
        _obj.att_PowGain = -1;
        _obj.init_Interval = 0.2;
        _obj.att_IntervalGain = 0.1;
        _obj.att_IntervalRand = 0.2;
        _obj.att_Time = 14;
        audio_play_sound_at_xy("oildrum_death", false, 10, x, y);
        Shake("add", 16, 170, x, y, 1);
        break;
        
    case 6:
        _obj.init_Radius = 24;
        _obj.att_RadiusGain = 1;
        _obj.init_Pow = 28;
        _obj.att_PowRand = 8;
        _obj.att_PowGain = -1;
        _obj.init_Interval = 0.2;
        _obj.att_IntervalGain = 0.1;
        _obj.att_IntervalRand = 0.2;
        _obj.att_Time = 15;
        audio_play_sound_at_xy("oildrum_death", false, 10, x, y);
        Shake("add", 16, 180, x, y, 1);
        break;
    
    case 7:
        _obj.init_Radius = 22;
        _obj.att_RadiusGain = 1;
        _obj.init_Pow = 32;
        _obj.att_PowRand = 8;
        _obj.att_PowGain = -1;
        _obj.init_Interval = 0.2;
        _obj.att_IntervalGain = 0.1;
        _obj.att_IntervalRand = 0.2;
        _obj.att_Time = 16;
        audio_play_sound_at_xy("oildrum_death", false, 10, x, y);
        Shake("add", 16, 190, x, y, 1);
        break;
        
    case 8:
        _obj.init_Radius = 28;
        _obj.att_RadiusGain = 1;
        _obj.init_Pow = 44;
        _obj.att_PowRand = 8;
        _obj.att_PowGain = -2;
        _obj.init_Interval = 0.2;
        _obj.att_IntervalGain = 0.1;
        _obj.att_IntervalRand = 0.2;
        _obj.att_Time = 17;
        audio_play_sound_at_xy("oildrum_death", false, 10, x, y);
        Shake("add", 28, 200, x, y, 1.5);
        break;
        
    case 9:
        _obj.init_Radius = 30;
        _obj.att_RadiusGain = 1;
        _obj.init_Pow = 50;
        _obj.att_PowRand = 8;
        _obj.att_PowGain = -2;
        _obj.init_Interval = 0.1;
        _obj.att_IntervalGain = 0.1;
        _obj.att_IntervalRand = 0.2;
        _obj.att_Time = 18;
        audio_play_sound_at_xy("oildrum_death", false, 10, x, y);
        Shake("add", 30, 210, x, y, 1.5);
        break;
        
    case 10:
        _obj.init_Radius = 32;
        _obj.att_RadiusGain = -1;
        _obj.init_Pow = 16;
        _obj.init_Height = 4;
        _obj.att_PowRand = 6;
        _obj.att_PowGain = -0.6;
        _obj.init_Interval = 0.1;
        _obj.att_IntervalGain = 0.05;
        _obj.att_HeightGain = 0.5;
        _obj.att_IntervalRand = 0.2;
        _obj.att_Time = 16;
        _obj.move_z = 12;
        audio_play_sound_at_xy("oildrum_death", false, 10, x, y);
        Shake("add", 32, 220, x, y, 1.5);
        break;
        
    default:
        break;
}

return _obj;
