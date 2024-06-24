///scr_combat_weapons_suffix_of_badaim(action, bulletOrNoone, gunOrNull)
var _action = argument0;
var _bullet = argument1;
var gun = argument2;
 
switch(_action)
{
    case "apply":
        gun[? "bAimAjarMin"] = 0;
        gun[? "bAimAjarMax"] = 360;
        gun[? "bAdvanced"] = true;
        break;
}
