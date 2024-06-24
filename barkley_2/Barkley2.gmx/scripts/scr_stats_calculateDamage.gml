/// scr_stats_calculateDamage(damage, resistance, vulnerability, isElemental)

var dmg = argument0;
var res = argument1;
var vuln = argument2;
var isElemental = argument3;

//Adjust Editor Resistance Range (0 to 300) to Calculate Range (-100 to 200)
// by just subtracting 100
var res_adjust = res;// - 100;

// Constants
var REDUCTION_FACTOR; // How much of the resistance counts as a flat damage reduction bonus
if (isElemental) {
    REDUCTION_FACTOR = 0.00;
} else {
    REDUCTION_FACTOR = 0.05;
};


// Calculate damage reductions
var dmgred_flat;
if (res_adjust >= 0 and res_adjust <= 100) {
    dmgred_flat = res_adjust * REDUCTION_FACTOR;
} else {
    dmgred_flat = 0;
}

var dmgred_perc = res_adjust / 100;

// Randomize damage (15% both ways)
dmg *= 1 + (0.15 - random(0.30));


// Apply flat damage reduction
var dmg_flat = max(dmg - dmgred_flat, 0);
// Apply damage resistance.
// -100 resistance = 200% damage.
// 0 resistance = 100% damage.
// 100 resistance = 0% damage.
// 200 resistance = -100% damage. (heal)
var dmg_res = dmg_flat - (dmg_flat * dmgred_perc);


// Final damage is adjusted based on vulnerability
var vuln_exp = 1.00;
if      (vuln <= 0) vuln_exp = 0.50;
else if (vuln == 1) vuln_exp = 0.60;
else if (vuln == 2) vuln_exp = 0.80;
else if (vuln == 3) vuln_exp = 1.00;
else if (vuln == 4) vuln_exp = 1.15;
else if (vuln == 5) vuln_exp = 1.30;
else if (vuln >= 6) vuln_exp = 1.50;

var dmg_final = power(dmg_res, vuln_exp);

// Return final damage
return dmg_final;
