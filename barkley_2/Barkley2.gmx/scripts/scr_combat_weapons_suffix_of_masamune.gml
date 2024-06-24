///scr_combat_weapons_suffix_of_masamune(action, bulletOrNoone, gunOrNull)
var _action = argument0;
var _bullet = argument1;
var gun = argument2;

switch(_action)
{
    case "applyBullet":
    
            var conf;
            conf = scr_statusEffect_addToCombatAttack(statusEffect_slow, _bullet);
            conf[? "timer"] = 5;
    
            scr_stats_setAttackStat(_bullet, STAT_ATTACK_KNOCKBACK, 
            scr_stats_getAttackStat(_bullet,STAT_ATTACK_KNOCKBACK) + 35 + 5 * gun[? "pAffix"]/100);
            scr_stats_setAttackStat(_bullet, STAT_ATTACK_DMG_NORMAL, 0);
            
        break;
}
