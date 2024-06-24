///scr_combat_weapons_suffix_of_perfectionist(action, bulletOrNoone, gunOrNull)
var _action = argument0;
var _bullet = argument1;
var gun = argument2;
     
switch(_action)
{
    case "applyBullet":

            if scr_stats_getCurrentStat(o_hoopz, STAT_CURRENT_HP) >= scr_stats_getEffectiveStat(o_hoopz, STAT_EFFECTIVE_MAX_HP) then
                {
                scr_stats_setAttackStat(_bullet, STAT_ATTACK_DMG_COSMIC, 50);
                gun[? "pBulletSprite"] = sprite_get_name(s_bull_untamonium);
                }
            
        break;
}
