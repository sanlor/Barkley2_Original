///scr_combat_weapons_prefix1_ghost(action, gunOrNull)

// SETUP //
var _action = argument0;
var gun = argument1;
var _retvar = noone;

// PLUS - LINEAR //
switch(_action)
{
    case "apply":
        gun[? "bEnemyPierce"]+=4;
        gun[? "bThroughWalls"] = 32;
        gun[? "bAdvanced"] = true;
    break;
    case "checkval":
        _retvar = 20;
    break;
}

// END //
return _retvar;
