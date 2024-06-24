///scr_combat_weapons_suffix_of_lepers_digest(action, bulletOrNoone, gunOrNull)
var _action = argument0;
var _bullet = argument1;
var gun = argument2;
  
switch(_action)
{
    case "apply":
        gun[? "stepScript"] = script_get_name(scr_combat_weapons_step_leper);
        gun[? "bAmmoChange"] = -1;
        break;
}
