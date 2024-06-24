/// scr_combat_weapons_specialshot(gun, bullet)

var gun = argument0;
var _bullet = argument1;
var pType = gun[? "pType"];
var pMaterial = gun[? "pMaterial"];

switch(pType)
{
    case GUN_TYPE_FLAMETHROWER:
        // Disable bullet damage for flamethrower - damage is dealt by the status effect
        _bullet.deal_damage = false;
    
        // Add the Burning status effect
        var conf;
        conf = scr_statusEffect_addToCombatAttack(statusEffect_burning, _bullet);
        conf[? "timer"] = 14;
        conf[? "hitTimer"] = 0;
        conf[? "hitInterval"] = 3;
        conf[? STAT_ATTACK_DMG_NORMAL] = scr_stats_getAttackStat(_bullet, STAT_ATTACK_DMG_NORMAL);
        conf[? STAT_ATTACK_DMG_BIO]    = scr_stats_getAttackStat(_bullet, STAT_ATTACK_DMG_BIO);
        conf[? STAT_ATTACK_DMG_CYBER]  = scr_stats_getAttackStat(_bullet, STAT_ATTACK_DMG_CYBER);
        conf[? STAT_ATTACK_DMG_MENTAL] = scr_stats_getAttackStat(_bullet, STAT_ATTACK_DMG_MENTAL);
        conf[? STAT_ATTACK_DMG_ZAUBER] = scr_stats_getAttackStat(_bullet, STAT_ATTACK_DMG_ZAUBER);
        conf[? STAT_ATTACK_DMG_COSMIC] = scr_stats_getAttackStat(_bullet, STAT_ATTACK_DMG_COSMIC);     
        break;
}

switch(pMaterial)
{
    case "Napalm":
        // Add the Burning status effect
        var conf;
        conf = scr_statusEffect_addToCombatAttack(statusEffect_burning, _bullet);
        conf[? "timer"] = 14;
        conf[? "hitTimer"] = 0;
        conf[? "hitInterval"] = 3;
        conf[? STAT_ATTACK_DMG_NORMAL] = scr_stats_getAttackStat(_bullet, STAT_ATTACK_DMG_NORMAL);
        conf[? STAT_ATTACK_DMG_BIO]    = scr_stats_getAttackStat(_bullet, STAT_ATTACK_DMG_BIO);
        conf[? STAT_ATTACK_DMG_CYBER]  = scr_stats_getAttackStat(_bullet, STAT_ATTACK_DMG_CYBER);
        conf[? STAT_ATTACK_DMG_MENTAL] = scr_stats_getAttackStat(_bullet, STAT_ATTACK_DMG_MENTAL);
        conf[? STAT_ATTACK_DMG_ZAUBER] = scr_stats_getAttackStat(_bullet, STAT_ATTACK_DMG_ZAUBER);
        conf[? STAT_ATTACK_DMG_COSMIC] = scr_stats_getAttackStat(_bullet, STAT_ATTACK_DMG_COSMIC); 
        break;
}
