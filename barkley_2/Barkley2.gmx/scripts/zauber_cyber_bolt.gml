/// zauber_bio_putrefracktion(command, caster, target_data, level)
/// Creates a field of lethal arkane putrification

/* Required commands are:
"name":        return name of zauber
"targettype":  return target type for this zauber
"targetwidth": return target width for this zauber
"cast":        cast this zauber
*/

var command = argument0;
var caster = argument1;
var aim_x = argument2;
var aim_y = argument3;
var aim_z = argument4;

if (command == "name") return global.zauberBoltName;
if (command == "sprite") return global.zauberBoltSprite;
if (command == "cast time") return global.zauberBoltCastTime;
if (command == "color") return c_cyber;
if (command == "targettype") return ZAUBER_TARGETTING_POINT;

if (command == "aim_decals") 
{
    dec = scr_fx_decal_transient(s_zauberCasting_target, 1, aim_x, aim_y + 8, aim_z - caster.z, 1, 1, 0, c_white, 1)
    dec.dny = 1;
}

if (command == "targetwidth") {
    // Return the desired targetting width in pixels
    var piety = scr_stats_getEffectiveStat(caster,STAT_BASE_PIETY);
    return 40 + (piety * 0.5);
}

if (command == "cast") 
{
    var piety = scr_stats_getEffectiveStat(caster, STAT_BASE_PIETY);
    var obj = instance_create(aim_x, aim_y, oEffectLightning);
    obj.hei = 256;
    with (obj) 
    {
        lid = EffectLightning("generate", -1, 0, hei);
        scr_stats_setAttackStat(self, STAT_ATTACK_DMG_CYBER, piety * 2);
    }
}
