/// ZauberPush(command, caster, aim_x, aim_y, aim_z)

// ----- Zauber configurations -----

/* PIETY EFFECT: Knockback = KNOCKBACK_BASE + KNOCKBACK_PIETY_MULT * piety */
// Base knockback
var KNOCKBACK_BASE = 90;
// Knockback PIETY multiplier
var KNOCKBACK_PIETY_MULT = 1;

// Base stagger
var STAGGER_BASE = 200;
// Stagger PIETY multiplier
var STAGGER_PIETY_MULT = 2;

// Zauber range in pixels
var ZAUBER_RANGE = 180;
// Zauber duration
var ZAUBER_DURATION = 2;

// ----- Input arguments -----
var command = argument0;
var caster = argument1;
var aim_x = argument2;
var aim_y = argument3;
var aim_z = argument4;

// ----- Commands -----
if (command == "name") return global.zauberBoltName;
if (command == "sprite") return global.zauberBoltSprite;
if (command == "color") return c_cosmic;
if (command == "element") return "KOSMIK";

if (command == "cast") {
    // Cast the zauber! Do whatever you want here
    if (isCombatActor(caster)) {
        var dir = caster.zauber_dir; //caster.aiming * 22.5;
        Zauber("effect", c_cosmic, dir);
        
        var cast_dir = point_direction(caster.x, caster.y, aim_x, aim_y);
        var piety = scr_stats_getEffectiveStat(caster, STAT_BASE_PIETY);
        
        // Create zauber
        var csx = caster.x + lengthdir_x(24, dir);
        var csy = caster.y + lengthdir_y(24, dir);
        var obj = instance_create(csx, csy - 20, oCosmicPush0);
        obj.image_angle = cast_dir;
        obj.dir = dir;
        with (obj) event_user(0);
        ds_list_copy(obj.target_list, caster.target_list);
        
        // Set knockback and stagger
        var knockback = KNOCKBACK_BASE + (KNOCKBACK_PIETY_MULT * piety);
        var stagger = STAGGER_BASE + (STAGGER_PIETY_MULT * piety);
        scr_stats_setAttackStat(obj, STAT_ATTACK_KNOCKBACK, knockback);
        scr_stats_setAttackStat(obj, STAT_ATTACK_STAGGER, stagger);
        scr_stats_setAttackStat(obj, STAT_ATTACK_STAGGER_HARDNESS, STAGGER_HARDNESS_HARD);
    }
}

exit;
if (command == "cast")
{
    if (isCombatActor(caster))
    {
        var piety = scr_stats_getEffectiveStat(caster, STAT_BASE_PIETY);
        ins = instance_nearest(caster.x, caster.y, EnemyCombatActor);
        if (instance_exists(ins) && point_distance(caster.x, caster.y, ins.x, ins.y) < 200)
        {
            obj = instance_create(ins.x, ins.y, oEffectLightning);
            obj.hei = 256;
            with (obj) 
            {
                lid = EffectLightning("generate", -1, 0, hei);
                scr_stats_setAttackStat(self, STAT_ATTACK_DMG_CYBER, piety * 2);
            }
            ds_list_copy(obj.target_list, caster.target_list);
        }
    }
}
