/// scr_zauber_reduceStats(actor, G, L, A, M, P);

var actor = argument0;
var G = argument1;
var L = argument2;
var A = argument3;
var M = argument4;
var P = argument5;

var current = scr_statusEffect_getFromCombatActor(actor, statusEffect_zauberGlamp);
if (current == NULL) {
    scr_statusEffect_applyFromScriptToCombatActor(statusEffect_zauberGlamp, actor);
    current = scr_statusEffect_getFromCombatActor(actor, statusEffect_zauberGlamp);
}

current[? STAT_BASE_GUTS] += G;
current[? STAT_BASE_LUCK] += L;
current[? STAT_BASE_AGILE] += A;
current[? STAT_BASE_MIGHT] += M;
current[? STAT_BASE_PIETY] += P;
current[? "timer"] = 100;

