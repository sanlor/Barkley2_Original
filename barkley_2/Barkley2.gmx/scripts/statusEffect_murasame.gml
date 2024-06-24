/// statusEffect_murasame(action, bulletOrNoone, gunOrNull)
// Braster and target are thrown about.
statusEffect_this = statusEffect_murasame;

if (string(argument[0]) == "applyStats") return 0;
if (string(argument[0]) == "apply") return 0;
if (string(argument[0]) == "applyBullet")
{
    var _bullet = argument[1];
    var conf = scr_statusEffect_addToCombatAttack(statusEffect_this, _bullet);
}

var conf = argument[0];
var actor = argument[1];
var command = argument[2];
if (argument_count > 3) var changestat = argument[3];

if (command == "generate") 
{
    scr_statusEffect_generateBasicInfo(conf, statusEffect_this, 0.5);    
    return conf;
}

else if (!instance_exists(actor)) return 0;

else if (command == "apply") 
{
    var atk = scr_stats_newAttackStats();
    atk[? STAT_ATTACK_KNOCKBACK] = 100 * dt();
    scr_stats_performAttack(atk, actor, true, irandom(360), false, true);
    if (instance_exists(o_hoopz.id)) scr_stats_performAttack(atk, o_hoopz.id, true, irandom(360), false, true);
    return 0;
} 
