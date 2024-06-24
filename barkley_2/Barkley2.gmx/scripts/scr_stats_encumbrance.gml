/// scr_stats_encumbernce(might, weight)
/// Returns encumbrance %
var might = argument0;
var weight = argument1;
// Encumbrance for every 1 point of weight over (or fraction thereof) (see Settings for value)
//return clamp((weight - might) * global.encumbranceMod, 0, 0.9);
var encumbrance = (might - weight) * global.encumbranceMod;
if (encumbrance > 0) encumbrance = 0;
return encumbrance;
