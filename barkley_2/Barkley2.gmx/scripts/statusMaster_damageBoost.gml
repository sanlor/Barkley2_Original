/// statusMaster_damageBoost(bullet, multiplier)
if (string(argument[0]) == "applyStats") return 0;
if (string(argument[0]) == "apply") return 0;
if (string(argument[0]) == "applyBullet")
{
    var _bullet = argument[1];
    var gun = argument[2];
    if (gun[? "pChargeRatio"] == 1)
    {
        var conf = scr_statusEffect_addToCombatAttack(statusEffect_this, _bullet);
        var bst = 1 + (scr_stats_getEffectiveStat(PlayerCombatActor, statusEffect_stat) / 99);
        scr_stats_setAttackStat(_bullet, STAT_ATTACK_DMG_NORMAL, scr_stats_getAttackStat(_bullet, STAT_ATTACK_DMG_NORMAL) * bst); 
        scr_stats_setAttackStat(_bullet, STAT_ATTACK_DMG_COSMIC, scr_stats_getAttackStat(_bullet, STAT_ATTACK_DMG_COSMIC) * bst); 
        scr_stats_setAttackStat(_bullet, STAT_ATTACK_DMG_MENTAL, scr_stats_getAttackStat(_bullet, STAT_ATTACK_DMG_MENTAL) * bst); 
        scr_stats_setAttackStat(_bullet, STAT_ATTACK_DMG_BIO,    scr_stats_getAttackStat(_bullet, STAT_ATTACK_DMG_BIO) * bst); 
        scr_stats_setAttackStat(_bullet, STAT_ATTACK_DMG_CYBER,  scr_stats_getAttackStat(_bullet, STAT_ATTACK_DMG_CYBER) * bst); 
        scr_stats_setAttackStat(_bullet, STAT_ATTACK_DMG_ZAUBER, scr_stats_getAttackStat(_bullet, STAT_ATTACK_DMG_ZAUBER) * bst);
    }
    return 1;
}

var conf = argument[0];
var actor = argument[1];
var command = argument[2];
if (argument_count > 3) var changestat = argument[3];

if (command == "generate")
{
    scr_statusEffect_generateBasicInfo(conf, statusEffect_this, 0);
    return conf;
}
