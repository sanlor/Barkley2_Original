/// scr_combat_weapons_suffix_of_flicker(action, bulletOrNoone, gunOrNull)
var _action = argument0;
var _bullet = argument1;
var gun = argument2;

switch(_action)
{
    case "apply":
        gun[? "bAdvanced"] = true;
        gun[? "bLobGravity"] = 0;
        gun[? "bTimeLife"] = 5;
        gun[? "bDistanceLife"] = 20;
        gun[? "bMaxSpeed"] = 24;
        gun[? "bMinSpeed"] = 10;
        break;
}
