/// Teleports enemy to nearby location

if (string(argument[0]) == "applyStats") return 0;
if (string(argument[0]) == "apply") return 0;
if (string(argument[0]) == "applyBullet")
{
    var _bullet = argument[1];
    var gun = argument[2];
    if (gun[? "pChargeRatio"] == 1)
    {
        var conf;
        conf = scr_statusEffect_addToCombatAttack(statusEffect_blinking, _bullet);
        conf[? "distance"] = 32 + gun[? "pAffix"];
    }
    return 1;
}

var conf = argument[0];
var actor = argument[1];
var command = argument[2];
if (argument_count > 3) var changestat = argument[3];

if (command == "generate") then 
{
    var atk = scr_stats_newAttackStats();
    ds_map_copy(conf, atk);
    ds_map_destroy(atk);
    scr_statusEffect_generateBasicInfo(conf, statusEffect_blinking, 0);
    conf[? "distance"] = 32;// + gun[? "pAffix"];
    return conf;
}
else if (command == "apply")
{    
    var atk = scr_stats_newAttackStats();
    atk[? STAT_ATTACK_STAGGER] = 100;
    atk[? STAT_ATTACK_STAGGER_HARDNESS] = STAGGER_HARDNESS_HARD;
    scr_stats_performAttack(atk, actor, false, NULL, false, true);
    ds_map_destroy(atk);
    
    var spark = instance_create(actor.x, actor.y, o_effect_generic_animateOnce);
    spark.z = 16 + random(8);
    spark.sprite_index = s_effect_affix_blink;
    spark.image_blend = c_zauber;
    with (spark) scr_entity_animation_setSpeed(ANIMATION_DEFAULT, 1 + random(0.5));
    
    with (actor) CombatBlink(conf[? "distance"]);
    
    var spark = instance_create(actor.x, actor.y, o_effect_generic_animateOnce);
    spark.z = 16 + random(8);
    spark.sprite_index = s_effect_affix_blink;
    spark.image_blend = c_zauber;
    with (spark) scr_entity_animation_setSpeed(ANIMATION_DEFAULT, 1 + random(0.5));
    return 1;
}
