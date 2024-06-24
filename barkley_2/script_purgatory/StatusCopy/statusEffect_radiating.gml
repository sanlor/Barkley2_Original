/// TODO : Empty
/// scr_combat_weapons_prefix2_radiating(action, bulletOrNoone, gunOrNull)
/*
// SETUP //
var _action = argument0;
var _bullet = argument1;
var gun = argument2;
var _retvar = 0;

// PLUS - COSMIC - HP //
switch(_action)
{
    // APPLY //
    case "apply": break;
    
    // APPLY TO BULLET //
    case "applyBullet":   
    
        // CHARGED SHOT //             
        if (gun[? "pChargeRatio"]==1) then
            {
            /// DEV NOTES ///

            // SETUP CONF VARIABLE //
            var conf;
            
            // APPLY THE AILMENT TO THE BULLET BEING FIRED //
            conf = scr_statusEffect_addToCombatAttack(statusEffect_radiating, _bullet);
                            
            // TOTAL DURATION OF THE AILMENT // 
            conf[? "timer"]         = floor(gun[? "pAffix"] / 10) + 100;
            }
    break;
    
    // VALUE OF AFFIX //
    case "checkval": 
        _retvar = 20;        
    break;
}
// end
return _retvar;
// SETUP STUFF //
/*
var conf = argument0;
var actor = argument1;
var command = argument2;
var changestat = argument3;

// GENERATE SOME DEFAULT VALUES //
if (command == "generate")
{
    // Copy attack stats into Conf so it can be used as an attack object
    var atk = scr_stats_newAttackStats();
    ds_map_copy(conf, atk);
    ds_map_destroy(atk);
    
    // Append basic information
    scr_statusEffect_generateBasicInfo(conf, statusEffect_radiating, 45);

    // Default values so there won't be undefined variable crashes //
    conf[? "timerTotal"] = conf[? "timer"];
    conf[? "timerEffect"] = 2;
    
    conf[? "timerTotal"] = conf[? "timer"];
    conf[? "timerStart"] = 0;
    conf[? "timerEnd"] = 0;

    conf[? "effectImage"] = 0;
    conf[? "effectImageMin"] = 0;
    conf[? "effectImageMax"] = 9;
    conf[? "effectY"] = 0;

    conf[? "effectFlickerTimer"] = 0;
    conf[? "effectFlickerTimerReset"] = 5;
    conf[? "effectFlickerToggle"] = 1;
    
    // Return configuration //
    return conf;
}
else if (!instance_exists(actor)) { return 0; }
else if (command == "apply")
{
    var currentAdhesive = scr_statusEffect_getFromCombatActor(actor, statusEffect_radiating);
    
    // Status effect being applied when the actor does not have it currently //
    if (currentAdhesive == -1) then
        {
        // Apply new status effect
        scr_statusEffect_applyNewToCombatActor(actor, conf);
        with (actor) EffectCloud("init");
        }
    else 
        {
        // Re-apply the status effect AKA reset the timer //
        var timer = conf[? "timer"];
        timer = max(timer, currentAdhesive[? "timer"]);
        currentAdhesive[? "timer"] = timer;
        currentAdhesive[? "timerTotal"] = timer;
        }
        
    // Return zero //
    return 0;
} 
else if (command == "step")
{
    var time = conf[? "timerEffect"];
    time -= dt();
    if time <= 0 then
    {
        var atk = scr_stats_newAttackStats();
        var acx = actor.x;
        var acy = actor.y;
        atk[? STAT_ATTACK_DMG_COSMIC] = 4 + irandom(2);
        with (CombatActor)
        {
            if (point_distance(x, y, acx, acy) < 128)
            {
                if (random(100) < 33) scr_stats_performAttack(atk, id, false, NULL, true, true);
            }
        }
        time = 2 + irandom(2);
    }
    conf[? "timerEffect"] = time;
    return false;
}
else if (command == "changestat") { return 0; }
else if (command == "damage") { return 0; }
else if (command == "draw") { return 0; } // Perhaps color actor orange? Can't figure out.
else if (command == "draw_post")
{
    var spx, spy, spz, sprCur, alp, vrw, vrh, drx, dry;
    spx = actor.x;
    spy = actor.y;
    spz = actor.z;
    sprCur = actor.sprite_index;
    alp = conf[? "timer"] / conf[? "timerTotal"];
    vrw = sprite_get_width(sprCur) / 2;
    vrh = sprite_get_height(sprCur) / 2;
    drx = spx - sprite_get_xoffset(sprCur) + vrw;
    dry = spy - sprite_get_yoffset(sprCur) + vrh;
    with (actor) EffectCloud("draw", drx, dry - spz, vrw, vrh, alp);
    return 0;
}
else if (command == "finish") { return 0; }
