///scr_combat_weapons_prefix1_flooding(action, gunOrNull)

// SETUP //
var _action = argument0;
var gun = argument1;
var _retvar = noone;

// PLUS - FIRING //
switch(_action)
{
    case "apply":
        //gun[? "pExtraChance"] = 0.4;
        //gun[? "pExtraNumber"] = 3;
        gun[? "bAdvanced"] = true;
    break;
    case "checkval":
        _retvar = 20;
    break;
}

// END //
return _retvar;
