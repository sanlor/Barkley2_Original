///scr_combat_weapons_prefix1_berzerkd(action, gunOrNull)

// SETUP //
var _action = argument0;
var gun = argument1;
var _retvar = noone;

// POUND - FIRING //
switch(_action)
{
    case "apply":
        gun[? "pBurstAmount"] = gun[? "pCurAmmo"]/gun[? "pAmmoCost"];
        gun[? "pBurstSpeed"] = gun[? "pFireSpeed"] * 2;
    break;
    case "checkval":
        _retvar = -20;
    break;
}

// END //
return _retvar;
