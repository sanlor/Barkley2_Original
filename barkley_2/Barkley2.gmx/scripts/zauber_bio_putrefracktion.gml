/// zauber_bio_putrefracktion(command, caster, target_data, level)
/// Creates a field of lethal arkane putrification

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
    return "Putrefracktion";
}

if (command == "targettype") {
    // Return the desired targetting type
    return ZAUBER_TARGETTING_POINT;
}

if (command == "targetwidth") {
    // Return the desired targetting width in pixels
    var piety = scr_stats_getEffectiveStat(caster,STAT_BASE_PIETY);
    return 40 + (piety * 0.5);
}

if (command == "cast") {
    // Cast the zauber! Do whatever you want here
    var piety = scr_stats_getEffectiveStat(caster,STAT_BASE_PIETY);
    
    var putr = instance_create(target_data[@ 0], target_data[@ 1], o_putrefaction_radius);
    putr.target_radius = 40 + (piety * 0.5);
}
