/// zauber_test_multi(command, caster, target_data, level)
/// Test of a multi-actor-target zauber

/* Required commands are:
"name":        return name of zauber
"targettype":  return target type for this zauber
"targetwidth": return target width for this zauber
"cast":        cast this zauber
*/

/* Command to perform */
var command = argument0;

/* Caster ID */
var caster = argument1;

/* Target data is one of: (depending on target type)
- An Actor ID
- An array of Actor ID's
- An array with 3 elements containing X, Y, Z positions */
var target_data = argument2;

/* The charge level, from 1 to 5 */
var level = argument3;


if (command == "name") {
    // Return the zauber name
    return "Zauber Test - Multi Target";
}

if (command == "targettype") {
    // Return the desired targetting type
    return ZAUBER_TARGETTING_MULTI;
}

if (command == "targetwidth") {
    // Return the desired targetting width in pixels
    // NOTE: Width here determines area within which actors will be locked on to
    return 80;
}

if (command == "cast") {
    // Cast the zauber! Do whatever you want here
    for (var i = 0; i < array_length_1d(target_data); i++) {
        var target = target_data[@ i];
        if (instance_exists(target)) {
            var _obj;       
            _obj = instance_create(target.x, target.y, o_enemyAttack_explosion);
            _obj.z = target.z;
            _obj.sprite_index = s_oilDrumExplode;
            scr_stats_setAttackStat(_obj, STAT_ATTACK_DMG_NORMAL, 20);
            scr_stats_setAttackStat(_obj, STAT_ATTACK_KNOCKBACK, 100);
            audio_play_sound_on_actor(caster,scr_soundbank_pickSound("vinemonster_death"),false,90);
        }
    }
}
