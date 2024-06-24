/// scr_combat_weapons_suffix_of_surfing(action, bulletOrNoone, gunOrNull)
var _action = argument0;
var _bullet = argument1;
var gun = argument2;

switch(_action)
{
    case "apply":
        gun[? "bWave"] = 100;
        gun[? "bWaveAmp"] = 50;
        gun[? "bAdvanced"] = true;
        gun[? "bTimeLife"] += 48;
        gun[? "bDistanceLife"] += 64;
        gun[? "bMaxSpeed"] = 28;    // Had to make themslower to see that it actually works //
        gun[? "bMinSpeed"] = 16;
        gun[? "bUseMoveOffset"] = false;
        break;
}
