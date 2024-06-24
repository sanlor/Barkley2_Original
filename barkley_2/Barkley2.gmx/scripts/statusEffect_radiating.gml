// Periodic inflicts cloud that deals ZAUBER damage to nearby enemies.
statusEffect_this = statusEffect_radiating; // MUST change this to be name of the script above

if (string(argument[0]) == "applyStats") return 0;
if (string(argument[0]) == "apply") return 0;
if (string(argument[0]) == "applyBullet")
{
    var _bullet = argument[1];
    var gun = argument[2];
    if (gun[? "pChargeRatio"] == 1)
    {
        var conf;
        conf = scr_statusEffect_addToCombatAttack(statusEffect_this, _bullet);
        conf[? "strength"] = 1 + ((gun[? "pAffix"] / 50) * 5); // Maximum 1-6 damage per hurt
    }
    return 1;
}

var conf = argument[0];
var actor = argument[1];
var command = argument[2];
if (argument_count > 3) var changestat = argument[3];

if (command == "generate")
{
    scr_statusEffect_generateBasicInfo(conf, statusEffect_this, global.statusDuration * 10);
    conf[? "timerEffect"] = 3.3; // Spaces out checks to do damage, 3 checks a second
    conf[? "strength"] = 1;
    return conf;
}
else if (!instance_exists(actor)) { return 0; }
else if (command == "apply")
{
    var reapply = statusHelper_reapply(actor, statusEffect_this, conf);
    if (reapply == 0) // Target did not previously have this status
    {
        with (actor) EffectCloud("init");
    }
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
        atk[? STAT_ATTACK_DMG_ZAUBER] = conf[? "strength"];
        with (CombatActor)
        {
            if (point_distance(x, y, acx, acy) < 128)
            {
                if (random(100) < 33) scr_stats_performAttack(atk, id, false, NULL, true, true);
            }
        }
        ds_map_destroy(atk);
        time = 2 + irandom(2);
    }
    conf[? "timerEffect"] = time;
    return false;
}
else if (command == "draw_post")
{
    var spx, spy, spz, sprCur, alp, vrw, vrh, drx, dry;
    spx = actor.x;
    spy = actor.y;
    spz = actor.z;
    sprCur = actor.sprite_index;
    alp = conf[? "timer"] / conf[? "timerTotal"];
    if (alp < 0.1) alp *= 10;
    else alp = 1;
    vrw = sprite_get_width(sprCur) / 2;
    vrh = sprite_get_height(sprCur) / 2;
    drx = spx - sprite_get_xoffset(sprCur) + vrw;
    dry = spy - sprite_get_yoffset(sprCur) + vrh;
    with (actor) EffectCloud("draw", drx, dry - spz, vrw, vrh, alp, c_zauber);
    return 0;
}
