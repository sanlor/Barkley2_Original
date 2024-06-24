///scr_combat_weapons_prefix1_noscope360(action, gunOrNull)

// SETUP //
var _action = argument0;
var gun = argument1;
var _retvar = noone;

// POUND - HOMING //
switch(_action)
{
    case "apply":
        //gun[? "bAimAjarMax"] = 360;
        gun[? "bAdvanced"] = true;               
    break;
    case "checkval":
        _retvar = 2;
    break;
}

// END //
return _retvar;
