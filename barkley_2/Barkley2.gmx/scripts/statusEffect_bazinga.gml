/// statusEffect_bazinga(action, bulletOrNoone, gunOrNull)
// Bullets heal target.
statusEffect_this = statusEffect_bazinga;

if (string(argument[0]) == "applyStats") return 0;
if (string(argument[0]) == "apply") return 0;
if (string(argument[0]) == "applyBullet")
{
    var _bullet = argument[1];
    var conf = scr_statusEffect_addToCombatAttack(statusEffect_bazinga, _bullet);
    conf[? "heal"] = (scr_stats_getAttackStat(_bullet, STAT_ATTACK_DMG_NORMAL));
    scr_stats_setAttackStat(_bullet, STAT_ATTACK_DMG_NORMAL, 0);
}

var conf = argument[0];
var actor = argument[1];
var command = argument[2];
if (argument_count > 3) var changestat = argument[3];

if (command == "generate") 
{
    scr_statusEffect_generateBasicInfo(conf, statusEffect_this, 0.1);
    conf[? "heal"] = 1;
    return conf;
}

else if (!instance_exists(actor)) return 0;

else if (command == "apply") 
{
    var currentBazinga = scr_statusEffect_getFromCombatActor(actor, statusEffect_this);
    if (currentBazinga == -1) 
    {
        scr_statusEffect_applyNewToCombatActor(actor, conf);
        if (instance_exists(o_hoopz))
        {
            var healamount = conf[? "heal"];
            scr_stats_setCurrentStat(actor, STAT_CURRENT_HP, scr_stats_getCurrentStat(actor, STAT_CURRENT_HP)+healamount);
            scr_stats_createDamageIndicators(actor,0-healamount,DAMAGETYPE_NORMAL,c_teal);
            heal = instance_create(actor.x, actor.y, o_effect_affix_heal); 
            heal.target = actor;
        }
    }
    else 
    {
        var timer = conf[? "timer"];
        timer = max(timer, currentBazinga[? "timer"]);
        currentBazinga[? "timer"] = timer;
    }
    return 0;
}
