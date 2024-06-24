///scr_combat_weapons_prefix1_surfing(action, gunOrNull)

// SETUP //
var _action = argument0;
var gun = argument1;
var _retvar = noone;

// MINUS - CURVED //
switch(_action)
{
    case "apply":
        gun[? "bWave"] = 100;
        gun[? "bWaveAmp"] = 50;
        gun[? "bAdvanced"] = true;
        gun[? "bTimeLife"] += 64;
        gun[? "bDistanceLife"] += 96;
        gun[? "bMaxSpeed"] = 28;    // Had to make themslower to see that it actually works //
        gun[? "bMinSpeed"] = 16;
        gun[? "bUseMoveOffset"] = false;
    break;
    case "checkval":
        _retvar = 15;
    break;
}

// END //
return _retvar;
