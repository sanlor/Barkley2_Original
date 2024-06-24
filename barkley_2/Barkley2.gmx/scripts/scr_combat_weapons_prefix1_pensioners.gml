///scr_combat_weapons_prefix1_pensioners(action, gunOrNull)

// SETUP //
var _action = argument0;
var gun = argument1;
var _retvar = noone;

// MINUS - LINEAR //
switch(_action)
{
    case "apply":
        gun[? "bAdvanced"] = true;
        gun[? "bLobGravity"] = 0;
        gun[? "bTimeLife"] = 200;
        gun[? "bDistanceLife"] = 200;
        gun[? "bMaxSpeed"] = 24;
        gun[? "bMinSpeed"] = 1;
        gun[? "bUseMoveOffset"] = false;
        gun[? "bAccel"] = -5;
    break;
    case "checkval":
        _retvar = 10;
    break;
}

// END //
return _retvar;
