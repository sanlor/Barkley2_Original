///scr_combat_weapons_suffix_of_pensioning(action, bulletOrNoone, gunOrNull)
var _action = argument0;
var _bullet = argument1;
var gun = argument2;

switch(_action)
{
    case "apply":
        gun[? "bAdvanced"] = true;
        gun[? "bLobGravity"] = 0;
        gun[? "bTimeLife"] = 200;
        gun[? "bDistanceLife"] = 200;
        gun[? "bMaxSpeed"] = 24;
        gun[? "bMinSpeed"] = 1;
        gun[? "bUseMoveOffset"] = false;
        gun[? "bAccel"] = -5;
        break;
}
