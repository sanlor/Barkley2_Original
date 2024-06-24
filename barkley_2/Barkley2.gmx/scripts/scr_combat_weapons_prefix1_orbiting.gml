///scr_combat_weapons_prefix1_orbiting(action, gunOrNull)

// SETUP //
var _action = argument0;
var gun = argument1;
var _retvar = noone;

// PLUS - CURVED //
switch(_action)
{
    case "apply":
        gun[? "bBarrierDist"] = min(20+gun[? "pRange"]/2,96);
        gun[? "bBarrierRotSpd"] = (10 + gun[? "pFireSpeed"]/10) * choose(1,-1);
        gun[? "bBarrierRotCount"] = 5.2+gun[? "pAffix"]/30;
        gun[? "bAdvanced"] = true;
        gun[? "bTimeLife"] += 300;
        gun[? "bDistanceLife"] += 300;
    break;
    case "checkval":
        _retvar = 15;
    break;
}
// END //
return _retvar;
