/// zauber_bioPutrefaction(command, caster, target_data, level)
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
    return "Arkane Putrefaction";
}

if (command == "targettype") {
    // Return the desired targetting type
    return ZAUBER_TARGETTING_POINT;
}

if (command == "targetwidth") {
    // Return the desired targetting width in pixels
    return 32+(8*level);
}

if (command == "cast") {
    // Cast the zauber! Do whatever you want here
    var _obj;
    var _blt = instance_create(target_data[@ 0], target_data[@ 1],o_griffins_radius);
    _blt.tick_duration = 32+(scr_stats_getEffectiveStat(caster,STAT_BASE_PIETY)*2)*0.0005;
}
