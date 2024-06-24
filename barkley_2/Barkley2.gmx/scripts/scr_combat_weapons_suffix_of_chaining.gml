/// scr_combat_weapons_suffix_of_chaining(action, bulletOrNoone, gunOrNull)
var _action = argument0;
var _bullet = argument1;
var gun = argument2;

switch(_action)
{
    case "apply":
        gun[? "bEnemyChain"] = global.affixChainingEnemies;
        gun[? "bEnemyChainRange"] = global.affixChainingRange;
        gun[? "bEnemyPierce"]+=global.affixChainingEnemies - 1;
        gun[? "bAdvanced"] = true;
        break;
}
