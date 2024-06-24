/// ZauberClown(command, caster, aim_x, aim_y, aim_z)

// ----- Input arguments -----
var command = argument0;
var caster = argument1;
var aim_x = argument2;
var aim_y = argument3;
var aim_z = argument4;

// ----- Commands -----
if (command == "element") return "ZAUBER";
if (command == "color") return c_fuchsia;

if (command == "aim_decals") 
{
    scr_fx_decal_transient(s_zauberCasting_circle, 1, caster.x, caster.y, caster.z,
                           0.25, 0.25 * 0.7,
                           0, c_white, 0.5);
    scr_fx_decal_transient(s_zauberCasting_target, 1, aim_x, aim_y + 8, aim_z, 1, 1, 0, c_white, 1)
}

if (command == "cast") 
{
    if (isCombatActor(caster)) 
    {
        var dir = caster.zauber_dir;
        var len = 24 + 64;
        Zauber("effect", c_fuchsia, dir);
        global.tex = caster.x + lengthdir_x(len, dir);
        global.tey = caster.y + lengthdir_y(len, dir) - 24;
        obj = instance_create(global.tex, global.tey, o_effect_zhangConfettiBlast);
        var piety = scr_stats_getEffectiveStat(caster, STAT_BASE_PIETY) / 50; // Value of 0 to 2
        obj.spawnBase *= 0.5 + piety;
        obj.spawnRandom *= 0.5 + piety;
    }
}
