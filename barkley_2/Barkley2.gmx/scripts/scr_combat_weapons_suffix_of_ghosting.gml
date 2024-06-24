/// scr_combat_weapons_suffix_of_ghosting(action, bulletOrNoone, gunOrNull)
var _action = argument0;
var _bullet = argument1;
var gun = argument2;

switch(_action)
{
    case "apply":
        gun[? "bEnemyPierce"]+=4;
        gun[? "bThroughWalls"] = 32;
        gun[? "bAdvanced"] = true;
        break;
}
