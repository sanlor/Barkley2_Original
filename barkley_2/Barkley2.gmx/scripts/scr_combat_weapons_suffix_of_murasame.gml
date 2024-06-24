/// scr_combat_weapons_suffix_of_murasame(action, bulletOrNoone, gunOrNull)
var _action = argument0;
var _bullet = argument1;
var gun = argument2;

switch(_action)
{
    case "applyBullet":
        var conf;
        conf = scr_statusEffect_addToCombatAttack(statusEffect_recoil, _bullet);
        break;
}
