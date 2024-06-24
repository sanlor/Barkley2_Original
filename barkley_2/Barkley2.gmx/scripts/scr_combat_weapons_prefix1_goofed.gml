///scr_combat_weapons_prefix1_goofed(action, gunOrNull)

// SETUP //
var _action = argument0;
var gun = argument1;
var _retvar = noone;

// POUND - RANDOM //
switch(_action)
{
    case "apply":
        gun[? "bRoaming"] += 150;
        gun[? "bAdvanced"] = true;
    break;
    case "checkval":
        _retvar = 15;
    break;
}

// END //
return _retvar;
