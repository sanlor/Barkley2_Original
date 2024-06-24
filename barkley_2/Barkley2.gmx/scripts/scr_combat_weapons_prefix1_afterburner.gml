///scr_combat_weapons_prefix1_afterburner(action, gunOrNull)

// SETUP //
var _action = argument0;
var gun = argument1;
var _retvar = noone;

// POUND - LINEAR //
switch(_action)
{
    case "apply":
        //gun[? "bAimAjarMin"] = 180;
        //gun[? "bAimAjarMax"] = 0;
        gun[? "bAdvanced"] = true;
    break;
    case "checkval":
        _retvar = 15;
    break;
}

// END //
return _retvar;
