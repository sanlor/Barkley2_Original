/// scr_combat_weapons_setPattern(gun, pattern)
/// Set patterns within type, material and prefixes
/// TODO: it will resolve conflicts for when two different patterns are set on a single weapon

var gun = argument0;
var pattern = argument1;

gun[? "pPattern"] = pattern;
