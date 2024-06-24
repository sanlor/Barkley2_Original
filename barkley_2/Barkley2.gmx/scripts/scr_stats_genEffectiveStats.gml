/// scr_stats_genEffectiveStats()
/* Updates all of the Effective stats.
   Stats must be updated in the proper order, relating to their
   dependencies between each other. */

var maxhp_prev = scr_stats_getEffectiveStat(self, STAT_EFFECTIVE_MAX_HP);

// == Level ==
scr_stats_setEffectiveStat(self, STAT_BASE_LEVEL, scr_stats_getBaseStat(self, STAT_BASE_LEVEL));
scr_stats_statusEffectsOnStat(STAT_BASE_LEVEL);

// == HP ==
scr_stats_setEffectiveStat(self, STAT_BASE_HP, scr_stats_getBaseStat(self, STAT_BASE_HP));
scr_stats_statusEffectsOnStat(STAT_BASE_HP);

// == The Magic Five a.k.a. The Power Rangers ==
scr_stats_setEffectiveStat(self, STAT_BASE_GUTS, scr_stats_getBaseStat(self, STAT_BASE_GUTS));
scr_stats_setEffectiveStat(self, STAT_BASE_MIGHT, scr_stats_getBaseStat(self, STAT_BASE_MIGHT));
scr_stats_setEffectiveStat(self, STAT_BASE_AGILE, scr_stats_getBaseStat(self, STAT_BASE_AGILE));
scr_stats_setEffectiveStat(self, STAT_BASE_LUCK, scr_stats_getBaseStat(self, STAT_BASE_LUCK));
scr_stats_setEffectiveStat(self, STAT_BASE_PIETY, scr_stats_getBaseStat(self, STAT_BASE_PIETY));
scr_stats_statusEffectsOnStat(STATGROUP_BASICS);


// == Abilities ==

// Weight
scr_stats_setEffectiveStat(self, STAT_BASE_WEIGHT, scr_stats_getBaseStat(self, STAT_BASE_WEIGHT));
scr_stats_statusEffectsOnStat(STAT_BASE_WEIGHT);

// Encumbrance
var might = scr_stats_getEffectiveStat(self, STAT_BASE_MIGHT);
var weight = scr_stats_getEffectiveStat(self, STAT_BASE_WEIGHT);
var agile = scr_stats_getEffectiveStat(self, STAT_BASE_AGILE);

var encumbrance = scr_stats_encumbrance(might, weight);
scr_stats_setEffectiveStat(self, STAT_EFFECTIVE_ENCUMBERANCE, encumbrance);
scr_stats_statusEffectsOnStat(STAT_EFFECTIVE_ENCUMBERANCE);

// OLD Speed  (Requires Weight, MIGHT, AGILE)
//var basespd = scr_stats_getBaseStat(self, STAT_BASE_SPEED);
//var encumb = scr_stats_getEffectiveStat(self, STAT_EFFECTIVE_ENCUMBERANCE);
//var spd = basespd * (1 + (agile * 0.5)/100); // Add AGILE to move speed
//spd *= (1.0 - encumb); // Reduce by encumbrance

// New speed set-up
var lethargy = (agile - weight) * global.lethargyMod;
if (lethargy < -1) lethargy = -1;
var speed_log = log10(lethargy + global.logWeight); // lethargy
if (speed_log < -1) speed_log = -1;
var speed_change = speed_log * global.baseSpeed;
//var encumbrance = (might - weight) * global.encumbranceMod;
//if (encumbrance > 0) encumbrance = 0;
var spd = speed_change + global.baseSpeed + encumbrance;
spd = max(1, spd);
//show_debug_message("lethargy = " + string(lethargy));
//show_debug_message("log = " + string(speed_log));
//show_debug_message("speed_change = " + string(speed_change));
//show_debug_message("encumbrance = " + string(encumbrance));

scr_stats_setEffectiveStat(self, STAT_BASE_SPEED, spd);
scr_stats_statusEffectsOnStat(STAT_BASE_SPEED);

// Max HP (Requires HP, GUTS)
var hp = scr_stats_getEffectiveStat(self, STAT_BASE_HP);
scr_stats_setEffectiveStat(self, STAT_EFFECTIVE_MAX_HP,
    hp + (scr_stats_getEffectiveStat(self, STAT_BASE_GUTS) * 4)); // BASE_HP + 4*GUTS
    
scr_stats_statusEffectsOnStat(STAT_EFFECTIVE_MAX_HP);

// == Resistances ==
var pietyBonus = scr_stats_getEffectiveStat(self, STAT_BASE_PIETY) * global.pietyBonus;
var resBio = scr_stats_getBaseStat(self, STAT_BASE_RESISTANCE_BIO) + pietyBonus;
var resCyber = scr_stats_getBaseStat(self, STAT_BASE_RESISTANCE_CYBER) + pietyBonus;
var resMental = scr_stats_getBaseStat(self, STAT_BASE_RESISTANCE_MENTAL) + pietyBonus;
var resZauber = scr_stats_getBaseStat(self, STAT_BASE_RESISTANCE_ZAUBER) + pietyBonus;
var resCosmic = scr_stats_getBaseStat(self, STAT_BASE_RESISTANCE_COSMIC) + pietyBonus;
scr_stats_setEffectiveStat(self, STAT_BASE_RESISTANCE_BIO, resBio);
scr_stats_setEffectiveStat(self, STAT_BASE_RESISTANCE_CYBER, resCyber);
scr_stats_setEffectiveStat(self, STAT_BASE_RESISTANCE_MENTAL, resMental);
scr_stats_setEffectiveStat(self, STAT_BASE_RESISTANCE_ZAUBER, resZauber);
scr_stats_setEffectiveStat(self, STAT_BASE_RESISTANCE_COSMIC, resCosmic);

scr_stats_setEffectiveStat(self, STAT_BASE_RESISTANCE_KNOCKBACK,scr_stats_getBaseStat(self, STAT_BASE_RESISTANCE_KNOCKBACK));
scr_stats_setEffectiveStat(self, STAT_BASE_RESISTANCE_STAGGER, scr_stats_getBaseStat(self, STAT_BASE_RESISTANCE_STAGGER));

scr_stats_setEffectiveStat(self, STAT_BASE_RESISTANCE_NORMAL, scr_stats_getBaseStat(self, STAT_BASE_RESISTANCE_NORMAL));

/* OLD SYSTEM
scr_stats_setEffectiveStat(self, STAT_BASE_RESISTANCE_BIO, scr_stats_getBaseStat(self, STAT_BASE_RESISTANCE_BIO));
scr_stats_setEffectiveStat(self, STAT_BASE_RESISTANCE_CYBER, scr_stats_getBaseStat(self, STAT_BASE_RESISTANCE_CYBER));
scr_stats_setEffectiveStat(self, STAT_BASE_RESISTANCE_MENTAL, scr_stats_getBaseStat(self, STAT_BASE_RESISTANCE_MENTAL));
scr_stats_setEffectiveStat(self, STAT_BASE_RESISTANCE_ZAUBER, scr_stats_getBaseStat(self, STAT_BASE_RESISTANCE_ZAUBER));
scr_stats_setEffectiveStat(self, STAT_BASE_RESISTANCE_COSMIC, scr_stats_getBaseStat(self, STAT_BASE_RESISTANCE_COSMIC));
*/

scr_stats_setEffectiveStat(self, STAT_BASE_VULN_NORMAL, scr_stats_getBaseStat(self, STAT_BASE_VULN_NORMAL));
scr_stats_setEffectiveStat(self, STAT_BASE_VULN_BIO, scr_stats_getBaseStat(self, STAT_BASE_VULN_BIO));
scr_stats_setEffectiveStat(self, STAT_BASE_VULN_CYBER, scr_stats_getBaseStat(self, STAT_BASE_VULN_CYBER));
scr_stats_setEffectiveStat(self, STAT_BASE_VULN_MENTAL, scr_stats_getBaseStat(self, STAT_BASE_VULN_MENTAL));
scr_stats_setEffectiveStat(self, STAT_BASE_VULN_ZAUBER, scr_stats_getBaseStat(self, STAT_BASE_VULN_ZAUBER));
scr_stats_setEffectiveStat(self, STAT_BASE_VULN_COSMIC, scr_stats_getBaseStat(self, STAT_BASE_VULN_COSMIC));

scr_stats_statusEffectsOnStat(STATGROUP_RESISTANCES); // Resistances, absorbtions and vulnerabilities!


// If MaxHP has increased, increase Current HP along with it!
var maxhp_after = scr_stats_getEffectiveStat(self, STAT_EFFECTIVE_MAX_HP);
if (maxhp_after > maxhp_prev) {
    var diff = maxhp_after - maxhp_prev;
    scr_stats_setCurrentStat(self, STAT_CURRENT_HP, scr_stats_getCurrentStat(self, STAT_CURRENT_HP) + diff);
}

