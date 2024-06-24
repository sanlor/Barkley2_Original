/// scr_combat_weapons_suffix_of_eternity(action, bulletOrNoone, gunOrNull)
var _action = argument0;
var _bullet = argument1;
var gun = argument2;

switch(_action)
{
    case "applyBullet":
            gun[? "bTimeLife"] += 5000;
            gun[? "bDistanceLife"] += 5000;
        break;
}
