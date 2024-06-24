/// statusEffect_muramasa(action, bulletOrNoone, gunOrNull)
// Target is pulled towards the braster.
statusEffect_this = statusEffect_muramasa;

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
    var currentPull = scr_statusEffect_getFromCombatActor(actor, statusEffect_this);
    if (currentPull == -1) scr_statusEffect_applyNewToCombatActor(actor, conf);
    return 0;
} 

else if (command == "step") 
{
    var atk = scr_stats_newAttackStats();
    atk[? STAT_ATTACK_KNOCKBACK] = 150 * dt();
    scr_stats_performAttack(atk, actor, true, point_direction(actor.x, actor.y, o_hoopz.x, o_hoopz.y), false, true);
    return 0;
}
