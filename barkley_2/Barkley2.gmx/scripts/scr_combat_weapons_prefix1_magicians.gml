///scr_combat_weapons_prefix1_magicians(action, gunOrNull)

// SETUP //
var _action = argument0;
var gun = argument1;
var _retvar = noone;

// PLUS - RANDOM //
switch(_action)
{
    case "apply":
        gun[? "bAdvanced"] = true;
        gun[? "bMagician"] = true;
        gun[? "bTimeLife"] += 50;
        gun[? "bDistanceLife"] += 50;
    break;
    case "checkval":
        _retvar = 10;
    break;
}

// END //
return _retvar;
