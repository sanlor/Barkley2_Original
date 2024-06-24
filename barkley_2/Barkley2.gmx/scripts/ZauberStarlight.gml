/// ZauberStarlight(command, caster, aim_x, aim_y, aim_z)

// ----- Input arguments -----
var command = argument0;
var caster = argument1;
var aim_x = argument2;
var aim_y = argument3;
var aim_z = argument4;

// ----- Commands -----
if (command == "name") return global.zauberStarlightName;
if (command == "sprite") return global.zauberStarlightSprite;
if (command == "element") return "ZAUBER";
if (command == "color") return c_zauber;

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
        Zauber("effect", c_fuchsia, dir);
        var conf = scr_statusEffect_generateNewFromScript(statusEffect_zauber_zauber_starlight);
        scr_statusEffect_applyOrRefreshOnCombatActor(statusEffect_zauber_zauber_starlight, conf, caster);
        ds_map_destroy(conf);
    }
}
