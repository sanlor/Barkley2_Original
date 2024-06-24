///scr_combat_weapons_prefix1_chaining(action, gunOrNull)

// SETUP //
var _action = argument0;
var gun = argument1;
var _retvar = noone;

// POUND - BOUNCE //
switch(_action)
{
    case "apply":
        gun[? "bEnemyChain"] = global.affixChainingEnemies;
        gun[? "bEnemyChainRange"] = global.affixChainingRange;
        gun[? "bEnemyPierce"]+=global.affixChainingEnemies - 1;
        gun[? "bAdvanced"] = true;
    break;
    case "checkval":
        _retvar = 30;
    break;
}

// END //
return _retvar;
