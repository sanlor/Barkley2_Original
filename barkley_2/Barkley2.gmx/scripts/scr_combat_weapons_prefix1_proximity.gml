///scr_combat_weapons_prefix1_proximity(action, gunOrNull)

// SETUP //
var _action = argument0;
var gun = argument1;
var _retvar = noone;

// POUND - HOMING //
switch(_action)
{
    case "apply":
        gun[? "bProximity"] = true;
        gun[? "bAdvanced"] = true;
    break;
    case "checkval":
        _retvar = 15;
    break;
}

return _retvar;
