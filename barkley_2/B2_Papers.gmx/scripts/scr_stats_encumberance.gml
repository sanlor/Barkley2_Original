/// scr_stats_encumberance(might, weight)
/// Returns encumberance %

var might = argument0;
var weight = argument1;

if (weight > might && weight > 0) { // Reduce based on weight if overweight
    var weightRatio = might / weight;
    var weightDiff = 0.025 * (weight - might) * (weight / might);
    var enc = 1 * (weightRatio) - (weightDiff);
    return min(0.9, 1 - (enc));
} else {
    return 0;
}
