///scr_combat_weapons_prefix1_ricocheting(action, gunOrNull)

// SETUP //
var _action = argument0;
var gun = argument1;
var _retvar = noone;

// PLUS - BOUNCE //      
switch(_action)
{
    case "apply":
        gun[? "bWallRicochet"] = 2;
        gun[? "bAdvanced"] = true;
    break;
    case "checkval":
        _retvar = 20;
    break;
}
// END //
return _retvar;
