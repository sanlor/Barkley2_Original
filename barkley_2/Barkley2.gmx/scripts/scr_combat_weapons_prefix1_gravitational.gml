///scr_combat_weapons_prefix1_gravitational(action, gunOrNull)

// SETUP //
var _action = argument0;
var gun = argument1;
var _retvar = noone;

// PLUS - HOMING //
switch(_action)
{
    case "apply":
        gun[? "bEnemySeek"] = global.affixGravitationalSeek;
        gun[? "bEnemySeekRange"] = global.affixGravitationalSeekRange;
        gun[? "bEnemySeekTime"] = 0; //5;
        gun[? "bAdvanced"] = true;
    break;
    case "checkval":
        _retvar = 20;
    break;
}
// END //
return _retvar;
