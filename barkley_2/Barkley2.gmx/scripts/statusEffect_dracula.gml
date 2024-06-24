/// statusEffect_dracula(action, bulletOrNoone, gunOrNull)
// Slurp hitpoints from enemy.
statusEffect_this = statusEffect_dracula;

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
    scr_statusEffect_generateBasicInfo(conf, statusEffect_this, 20);
    conf[? "healingAmount"] = 2;
    return conf;
}

else if (!instance_exists(actor)) return 0;

else if (command == "apply") 
{
    var currentDracula = scr_statusEffect_getFromCombatActor(actor, statusEffect_this);
    if (currentDracula == -1) 
    {
        scr_statusEffect_applyNewToCombatActor(actor, conf);
        if (instance_exists(o_hoopz))
        {
            var healamount = conf[? "healingAmount"];
            scr_stats_setCurrentStat(o_hoopz, STAT_CURRENT_HP, scr_stats_getCurrentStat(o_hoopz, STAT_CURRENT_HP)+healamount);
            scr_stats_createDamageIndicators(o_hoopz,0-healamount,DAMAGETYPE_NORMAL,c_teal);
            heal = instance_create(o_hoopz.x, o_hoopz.y, o_effect_affix_heal); 
            heal.target = o_hoopz;
        }
    }
    return 0;
} 
