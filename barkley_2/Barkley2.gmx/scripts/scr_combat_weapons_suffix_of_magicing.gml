///scr_combat_weapons_suffix_of_magicing(action, bulletOrNoone, gunOrNull)
var _action = argument0;
var _bullet = argument1;
var gun = argument2;

switch(_action)
{
    case "apply":
        gun[? "bAdvanced"] = true;
        gun[? "bMagician"] = true;
        gun[? "bTimeLife"] += 20;
        gun[? "bDistanceLife"] += 20;
        break;
}
