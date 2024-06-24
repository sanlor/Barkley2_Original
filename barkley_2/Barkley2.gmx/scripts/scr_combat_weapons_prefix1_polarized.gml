///scr_combat_weapons_prefix1_polarized(action, gunOrNull)

// SETUP //
var _action = argument0;
var gun = argument1;
var _retvar = noone;

// MINUS - HOMING //
switch(_action)
{
    case "apply":
        gun[? "bEnemySeek"] = -24 * 2;
        gun[? "bEnemySeekRange"] = 128;
        gun[? "bEnemySeekTime"] = .1; //5;
        gun[? "bAdvanced"] = true;
    break;
    case "checkval":
        _retvar = 10;
    break;
}

// END //
return _retvar;
