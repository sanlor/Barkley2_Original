///scr_combat_weapons_prefix1_dotline(action, gunOrNull)

// SETUP //
var _action = argument0;
var gun = argument1;
var _retvar = noone;

// MINUS - RANDOM //

switch(_action)
{
    case "apply":
        gun[? "bDotline"] = true;
    break;
    case "checkval":
        _retvar = 30;
    break;
}

// END //
return _retvar;
