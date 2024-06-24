/// Attack("assign", actionMap, type, normal, bio, cyber, mental, kosmic, zauber)
// STAGGER_HARDNESS_INSTANT = Applies staggerInstant on that attack only
// STAGGER_HARDNESS_SOFT    = Applies staggerSoft that decays at 30 a second
// STAGGER_HARDNESS_HARD    = Applies staggerHard that decays at 5 a second

// How KNOCKBACK works
// Say Hoopz has 100 HP, and the enemy does a Slash attack for 20% damage after all reductions
// Slash has a 0.5 knockback factor, so it would knockback Hoopz 10 IDEALLY, BUT...
// Weight (capped at 50) reduces all knockback. So Hoopz at weight 25 would do a 50% reduction on the 10
// Resulting in 5 knockback

if (argument[0] == "init")
{
    global.attackMap = ds_map_create();
    //               Name        Gut  Luc  Acr  Mig  Pie  Wgt Spd Kno     Stg   Typ
    Attack("define", "slash",     0,  10,  55,  25,   0,  10,  0, 0.50,   2.0, STAGGER_HARDNESS_SOFT);
    Attack("define", "smash",    15,   5,  10,  50,   0,  20,  0, 1.00,   6.0, STAGGER_HARDNESS_SOFT);
    Attack("define", "charge",   10,   5,  10,  25,   0,  50,  0, 1.80,   8.0, STAGGER_HARDNESS_HARD);
    Attack("define", "shot",      5,  15,  45,  20,  15,   0,  0, 0.80,   4.0, STAGGER_HARDNESS_SOFT);
    Attack("define", "snipe",     0,  20,  75,   5,   0,   0,  0, 1.10,   7.0, STAGGER_HARDNESS_HARD);
    Attack("define", "poke",     20,  15,  30,  25,  10,   0,  0, 0.50,   1.0, STAGGER_HARDNESS_SOFT);
    Attack("define", "shock",    10,  20,   5,   5,  60,   0,  0, 1.50,   7.0, STAGGER_HARDNESS_SOFT);
    Attack("define", "soak",     25,  20,   5,  10,  40,   0,  0, 0.80,   4.0, STAGGER_HARDNESS_HARD);
    Attack("define", "stun",      0,   0,   0,   0,   0,   0,  0,  -10,  -100, STAGGER_HARDNESS_HARD);
    Attack("define", "destruct", 30,   5,  10,  10,  40,  50, 25, 2.00,   5.0, STAGGER_HARDNESS_HARD); // 1.70
    Attack("define", "bomb",      5,  15,  25,  15,  40,  25, 25, 1.25,   4.0, STAGGER_HARDNESS_HARD); // 1.50
    Attack("define", "coin",     25,  20,   5,  10,  40,   0,  0, 4.00,   1.0, STAGGER_HARDNESS_SOFT);
    Attack("define", "poke stun",20,  15,  30,  25,  10,   0,  0, 0.00,  -100, STAGGER_HARDNESS_HARD);
    return 1;
}

// Attack("element", actionMap, type, normal, bio, cyber, mental, kosmic, zauber)
if (argument[0] == "assign")
{
    var dsm = argument[1];
    dsm[? "attackSystem"] = "new";
    dsm[? "attackType"] = argument[2];
    dsm[? "elementNormal"] = argument[3];
    dsm[? "elementBio"] = argument[4];
    dsm[? "elementCyber"] = argument[5];
    dsm[? "elementMental"] = argument[6];
    dsm[? "elementKosmic"] = argument[7];
    dsm[? "elementZauber"] = argument[8];
}

// Attack("damage", attacker, actionMap, bullet)
if (argument[0] == "damage")
{
    //show_debug_message("Attack() - damage");
    var dmg = 0;
    var att = argument[1];
    var dsm = argument[2];
    var bul = argument[3];
    var dsl = ds_map_find_value(global.attackMap, dsm[? "attackType"]);
    dmg += scr_stats_getEffectiveStat(att, STAT_BASE_GUTS) * (ds_list_find_value(dsl, 0) / 100);
    dmg += scr_stats_getEffectiveStat(att, STAT_BASE_LUCK) * (ds_list_find_value(dsl, 1) / 100);
    dmg += scr_stats_getEffectiveStat(att, STAT_BASE_AGILE) * (ds_list_find_value(dsl, 2) / 100);
    dmg += scr_stats_getEffectiveStat(att, STAT_BASE_MIGHT) * (ds_list_find_value(dsl, 3) / 100);
    dmg += scr_stats_getEffectiveStat(att, STAT_BASE_PIETY) * (ds_list_find_value(dsl, 4) / 100);
    dmg += scr_stats_getEffectiveStat(att, STAT_BASE_WEIGHT) * (ds_list_find_value(dsl, 5) / 100);
    dmg += scr_stats_getEffectiveStat(att, STAT_BASE_SPEED) * (ds_list_find_value(dsl, 6) / 100);
    scr_stats_setAttackStat(bul, STAT_ATTACK_DMG_NORMAL, dmg * dsm[? "elementNormal"]);
    scr_stats_setAttackStat(bul, STAT_ATTACK_DMG_BIO, dmg * dsm[? "elementBio"]);
    scr_stats_setAttackStat(bul, STAT_ATTACK_DMG_CYBER, dmg * dsm[? "elementCyber"]);
    scr_stats_setAttackStat(bul, STAT_ATTACK_DMG_MENTAL, dmg * dsm[? "elementMental"]);
    scr_stats_setAttackStat(bul, STAT_ATTACK_DMG_COSMIC, dmg * dsm[? "elementKosmic"]);
    scr_stats_setAttackStat(bul, STAT_ATTACK_DMG_ZAUBER, dmg * dsm[? "elementZauber"]);
    if (ds_list_find_value(dsl, 7) < 0) scr_stats_setAttackStat(bul, STAT_ATTACK_KNOCKBACK, abs(ds_list_find_value(dsl, 7)));
    else scr_stats_setAttackStat(bul, STAT_ATTACK_KNOCKBACK, ds_list_find_value(dsl, 7) * dmg);
    if (ds_list_find_value(dsl, 8) < 0) scr_stats_setAttackStat(bul, STAT_ATTACK_STAGGER, abs(ds_list_find_value(dsl, 8)));
    else scr_stats_setAttackStat(bul, STAT_ATTACK_STAGGER, ds_list_find_value(dsl, 8) * dmg);
    scr_stats_setAttackStat(bul, STAT_ATTACK_STAGGER_HARDNESS, ds_list_find_value(dsl, 9));
    return dmg;
}

/// Attack("calculate", attackType, g, l, a, m, p, weight, speed);
if (argument[0] == "calculate")
{
    //var dsm = argument[1];
    var dsl = ds_map_find_value(global.attackMap, argument[1]);
    var dmg = 0;
    dmg += real(argument[2]) * (ds_list_find_value(dsl, 0) / 100);
    dmg += real(argument[3]) * (ds_list_find_value(dsl, 1) / 100);
    dmg += real(argument[4]) * (ds_list_find_value(dsl, 2) / 100);
    dmg += real(argument[5]) * (ds_list_find_value(dsl, 3) / 100);
    dmg += real(argument[6]) * (ds_list_find_value(dsl, 4) / 100);
    dmg += real(argument[7]) * (ds_list_find_value(dsl, 5) / 100);
    dmg += real(argument[8]) * (ds_list_find_value(dsl, 6) / 100);
    return dmg;
}

if (argument[0] == "define")
{
    var dsl = ds_list_create();
    ds_list_add(dsl, argument[2]);  // 0 = G
    ds_list_add(dsl, argument[3]);  // 1 = L
    ds_list_add(dsl, argument[4]);  // 2 = A
    ds_list_add(dsl, argument[5]);  // 3 = M
    ds_list_add(dsl, argument[6]);  // 4 = P
    ds_list_add(dsl, argument[7]);  // 5 = Weight
    ds_list_add(dsl, argument[8]);  // 6 = Speed
    ds_list_add(dsl, argument[9]);  // 7 = Knockback
    ds_list_add(dsl, argument[10]); // 8 = Stagger
    ds_list_add(dsl, argument[11]); // 9 = Stagger Type
    ds_map_add(global.attackMap, argument[1], dsl);
    return 1;
}



/*

var attacker = argument0;
var conf = argument1;
var attack = argument2;
var damageType = argument3;

var atkDmg = conf[? "dmgBase"] + 
         conf[? "dmgRatioMight"]  * scr_stats_getEffectiveStat(attacker, STAT_BASE_MIGHT) + 
         conf[? "dmgRatioWeight"] * scr_stats_getEffectiveStat(attacker, STAT_BASE_WEIGHT) + 
         conf[? "dmgRatioPiety"]  * scr_stats_getEffectiveStat(attacker, STAT_BASE_PIETY);
scr_stats_setAttackStat(attack, damageType, atkDmg);

scr_stats_setAttackStat(attack, STAT_ATTACK_KNOCKBACK, conf[? "knockback"]);
scr_stats_setAttackStat(attack, STAT_ATTACK_STAGGER, conf[? "stagger"]);
scr_stats_setAttackStat(attack, STAT_ATTACK_STAGGER_HARDNESS, conf[? "staggerHardness"]);

if (conf[? "attackScript"] != NULL) {
    script_execute(conf[? "attackScript"], attack, attacker);
}
