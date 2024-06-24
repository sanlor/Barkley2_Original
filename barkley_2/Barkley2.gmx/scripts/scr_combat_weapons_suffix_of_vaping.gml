/// scr_combat_weapons_suffix_of_vaping(action, bulletOrNoone, gunOrNull)
var _action = argument0;
var _bullet = argument1;
var gun = argument2;

switch(_action)
{
    case "apply":
        gun[? "stepScript"] = script_get_name(scr_combat_weapons_step_vaping);
        break;
}
