/// ZauberPozzosPrison(command, caster, aim_x, aim_y, aim_z)

// ----- Input arguments -----
var command = argument0;
var caster = argument1;
var aim_x = argument2;
var aim_y = argument3;
var aim_z = argument4;

// ----- Commands -----
if (command == "element") return "CYBER";
if (command == "color") return c_cyber;

if (command == "aim_decals")
{
    scr_fx_decal_transient(s_zauberCasting_circle, 1, aim_x, aim_y, aim_z,
                           0.25, 0.25 * 0.7,
                           0, c_white, 0.5);
    scr_fx_decal_transient(s_zauberCasting_target, 1, aim_x, aim_y + 8, aim_z, 1, 1, 0, c_white, 1)
}

if (command == "cast")
{
    if (isCombatActor(caster))
    {
        var dir = caster.zauber_dir;
        Zauber("effect", c_cyber, dir);
        var piety = scr_stats_getEffectiveStat(caster, STAT_BASE_PIETY);
        var len = 96;
        var csx = caster.x + lengthdir_x(24, dir);
        var csy = caster.y + lengthdir_y(24, dir);
        global.tex = lengthdir_x(len, dir);
        global.tey = lengthdir_y(len, dir);
        obj = instance_create(csx, csy - 24, oZauberFeeber);
        obj.xDes = global.tex;
        obj.yDes = global.tey;
        obj.depth = -9999;
        with (obj) event_user(0);
        with (EnemyCombatActor)
        {
            if (point_distance(csx + (global.tex / 2), csy + (global.tey / 2), x, y) < 128)
            {
                var eff = scr_statusEffect_generateNewFromScript(statusEffect_maxFeeber);
                //scr_statusEffect_applyNewToCombatActor(id, eff);
                statusEffect_maxFeeber(eff, id, "apply", -1);
            }
        }
    }
}
