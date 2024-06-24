///scr_combat_weapons_prefix1_fetching(action, gunOrNull)

// SETUP //
var _action = argument0;
var gun = argument1;
var _retvar = noone;

// MINUS - BOUNCE //
switch(_action)
{
    case "apply":
        gun[? "bReturning"] = true;
        gun[? "bMaxSpeed"] = 36;
        gun[? "bMinSpeed"] = -36;
        gun[? "bAccel"] = 0.5;
    break;
    case "checkval":
        _retvar = 30;
    break;
}

// END //
return _retvar;
