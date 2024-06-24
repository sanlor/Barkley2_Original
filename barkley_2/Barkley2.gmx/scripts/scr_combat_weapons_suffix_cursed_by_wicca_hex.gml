/// scr_combat_weapons_suffix_cursed_by_wicca_hex(action, bulletOrNoone, gunOrNull)
var _action = argument0;
var _bullet = argument1;
var gun = argument2;

switch(_action)
{
    case "apply":
        gun[? "stepScript"] = script_get_name(scr_combat_weapons_step_periodic_nofill);
        break;
    case "applyBullet":
        gun[? "pChargeRatio"] = 0;
        gun[? "pChargeCur"] = 0;
        break;
}
