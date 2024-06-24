/// scr_stats_performAttack(attack_stats, defender_actor, do_knockback, knockback_dir, show_damage, do_flash)
/*

arg0 - Map containing attack stats (attacker)
arg1 - CombatActor (defender)
arg2 - Add Knockback (true/false)
arg3 - Knockback direction (0 - 360)
arg4 - Show damage indicator (true/false)

///return total damage
*/

var attackStats = argument0;
var defender = argument1;
var doKnockback = argument2;
var knockbackDirection = argument3;
var showDamage = argument4;
var doFlash = argument5;

// Sanity checks
if (!instance_exists(defender)) {
    show_debug_message("Attack perform: Defender doesn't exist");
    return 0;
}
if (defender.object_index != CombatActor and !object_is_ancestor(defender.object_index, CombatActor)) {
    show_debug_message("Attack perform: Defender is not a CombatActor: " + object_get_name(defender.object_index));
    return 0;
}

// Fetch statistics from both objects
var dmg_normal = ds_map_find_value(attackStats, STAT_ATTACK_DMG_NORMAL);
var dmg_bio = ds_map_find_value(attackStats, STAT_ATTACK_DMG_BIO);
var dmg_cyber = ds_map_find_value(attackStats, STAT_ATTACK_DMG_CYBER);
var dmg_mental = ds_map_find_value(attackStats, STAT_ATTACK_DMG_MENTAL);
var dmg_zauber = ds_map_find_value(attackStats, STAT_ATTACK_DMG_ZAUBER);
var dmg_cosmic = ds_map_find_value(attackStats, STAT_ATTACK_DMG_COSMIC);
var dmg_all = dmg_normal + dmg_bio + dmg_cyber + dmg_mental + dmg_zauber + dmg_cosmic;

// Pozzo blocks damage
if (defender.isGooped != -999)
{
    var dmg_normal = 0;
    var dmg_bio = 0;
    var dmg_cyber = 0;
    var dmg_mental = 0;
    var dmg_zauber = 0;
    var dmg_cosmic = 0;
    var dmg_all = dmg_normal + dmg_bio + dmg_cyber + dmg_mental + dmg_zauber + dmg_cosmic;
    defender.isGooped.kill = 1;
    defender.isGooped = -999;
}

var res_normal = scr_stats_getEffectiveStat(defender, STAT_BASE_RESISTANCE_NORMAL);
var res_bio = scr_stats_getEffectiveStat(defender, STAT_BASE_RESISTANCE_BIO);
var res_cyber = scr_stats_getEffectiveStat(defender, STAT_BASE_RESISTANCE_CYBER);
var res_mental = scr_stats_getEffectiveStat(defender, STAT_BASE_RESISTANCE_MENTAL);
var res_zauber = scr_stats_getEffectiveStat(defender, STAT_BASE_RESISTANCE_ZAUBER);
var res_cosmic = scr_stats_getEffectiveStat(defender, STAT_BASE_RESISTANCE_COSMIC);
var res_stagger = scr_stats_getEffectiveStat(defender, STAT_BASE_RESISTANCE_STAGGER);

var vuln_normal = scr_stats_getEffectiveStat(defender, STAT_BASE_VULN_NORMAL);
var vuln_bio = scr_stats_getEffectiveStat(defender, STAT_BASE_VULN_BIO);
var vuln_cyber = scr_stats_getEffectiveStat(defender, STAT_BASE_VULN_CYBER);
var vuln_mental = scr_stats_getEffectiveStat(defender, STAT_BASE_VULN_MENTAL);
var vuln_zauber = scr_stats_getEffectiveStat(defender, STAT_BASE_VULN_ZAUBER);
var vuln_cosmic = scr_stats_getEffectiveStat(defender, STAT_BASE_VULN_COSMIC);

var hp = scr_stats_getCurrentStat(defender, STAT_CURRENT_HP);
var weight = scr_stats_getEffectiveStat(defender, STAT_BASE_WEIGHT);

// Calculate attack damage and other effects
var dmg;
var dmg_total = 0;

// NORMAL
if (dmg_normal == 0 && dmg_all == 0)
{
    if (showDamage) scr_stats_createDamageIndicators(defender, "NULL", DAMAGETYPE_NORMAL, c_normal);
}
if (dmg_normal > 0) {
    dmg = scr_stats_calculateDamage(dmg_normal, res_normal, vuln_normal, false);
    hp -= dmg;
    dmg_total += dmg;
    if(showDamage && defender.displaysDamage) {
        scr_stats_createDamageIndicators(defender, dmg, DAMAGETYPE_NORMAL, c_normal);
    }
}
// BIO
if (dmg_bio > 0) {
    dmg = scr_stats_calculateDamage(dmg_bio, res_bio, vuln_bio, true);
    hp -= dmg;
    dmg_total += dmg;
    if(showDamage && defender.displaysDamage) {
        scr_stats_createDamageIndicators(defender, dmg, DAMAGETYPE_BIO, c_bio);
    }
}
// CYBER
if (dmg_cyber > 0) {
    dmg = scr_stats_calculateDamage(dmg_cyber, res_cyber, vuln_cyber, true);
    hp -= dmg;
    dmg_total += dmg;
    if(showDamage && defender.displaysDamage) {
        scr_stats_createDamageIndicators(defender, dmg, DAMAGETYPE_CYBER, c_cyber);
    }
}
// MENTAL
if (dmg_mental > 0) {
    dmg = scr_stats_calculateDamage(dmg_mental, res_mental, vuln_mental, true);
    hp -= dmg;
    dmg_total += dmg;
    if(showDamage && defender.displaysDamage) {
        scr_stats_createDamageIndicators(defender, dmg, DAMAGETYPE_MENTAL, c_mental);
    }
}
// ZAUBER
if (dmg_zauber > 0) {
    dmg = scr_stats_calculateDamage(dmg_zauber, res_zauber, vuln_zauber, true);
    hp -= dmg;
    dmg_total += dmg;
    if(showDamage && defender.displaysDamage) {
        scr_stats_createDamageIndicators(defender, dmg, DAMAGETYPE_ZAUBER, c_zauber);
    }
}
// COSMIC
if (dmg_cosmic > 0) {
    dmg = scr_stats_calculateDamage(dmg_cosmic, res_cosmic, vuln_cosmic, true);
    hp -= dmg;
    dmg_total += dmg;
    if(showDamage && defender.displaysDamage) {
        scr_stats_createDamageIndicators(defender, dmg, DAMAGETYPE_COSMIC, c_cosmic);
    }
}


// Save stat changes
scr_stats_setCurrentStat(defender, STAT_CURRENT_HP, hp);

// Calculate knockback
var knockback_atk = ds_map_find_value(attackStats, STAT_ATTACK_KNOCKBACK);
if (doKnockback && knockback_atk > 0) {
    scr_stats_knockback_add(defender, knockback_atk, knockbackDirection)
}

// Calculate stagger
var stagger_atk = ds_map_find_value(attackStats, STAT_ATTACK_STAGGER);
var stagger_atk_hardness = ds_map_find_value(attackStats, STAT_ATTACK_STAGGER_HARDNESS);
var stagger = stagger_atk * (1 - (res_stagger/100)); // TEMPORARY
if (stagger > 0) {
    // Apply stagger
    var stagger_instant = stagger * 0.2 + scr_stats_getCurrentStat(defender, STAT_CURRENT_STAGGER_INSTANT);
    var stagger_soft = stagger * 0.4 + scr_stats_getCurrentStat(defender, STAT_CURRENT_STAGGER_SOFT);
    var stagger_hard = stagger * 0.4 + scr_stats_getCurrentStat(defender, STAT_CURRENT_STAGGER_HARD);

    // Cap stagger to 100
    var do_stagger = false;
    if (stagger_hard > 100) {
        stagger_hard = 100;
        stagger_soft = 0;
        stagger_instant = 0;
        do_stagger = true;
    }
    else if (stagger_hard + stagger_soft >= 100) {
        stagger_soft = 100 - stagger_hard;
        stagger_instant = 0;
        do_stagger = true;
    }
    else if (stagger_hard + stagger_soft + stagger_instant >= 100) {
        stagger_instant = 100 - stagger_hard + stagger_soft;
        do_stagger = true;
    }

    scr_stats_setCurrentStat(defender, STAT_CURRENT_STAGGER_INSTANT, stagger_instant);
    scr_stats_setCurrentStat(defender, STAT_CURRENT_STAGGER_SOFT, stagger_soft);
    scr_stats_setCurrentStat(defender, STAT_CURRENT_STAGGER_HARD, stagger_hard);

    if (do_stagger) {
        var cur_hardness = scr_stats_getCurrentStat(defender, STAT_CURRENT_STAGGER_HARDNESS);
        var cur_time = scr_stats_getCurrentStat(defender, STAT_CURRENT_STAGGER_TIME);
        if (cur_time <= 0 or stagger_atk_hardness > cur_hardness) {
            scr_stats_setCurrentStat(defender, STAT_CURRENT_STAGGER_HARDNESS, stagger_atk_hardness);
            scr_stats_setCurrentStat(defender, STAT_CURRENT_STAGGER_TIME, scr_stats_stagger_timeForHardness(stagger_atk_hardness));

            // onStagger script
            if (defender.hook_onStagger_script != NULL) {
                with defender {
                    script_execute(hook_onStagger_script);
                }
            }
            // onStagger event
            if (defender.hook_onStagger_event != NULL) {
                with defender {
                    event_user(hook_onStagger_event);
                }
            }
        }
    }
}

// Update lifebar //
with defender if object_get_name(object_index) != "o_hoopz" then scr_enemy_lifebar("update");

// Actor Flash //
if (doFlash) {
    var flash_dmg_max = 0;
    var flash_color = c_white;
    var flash_resist = 0;

    if (dmg_normal * (1-res_normal/100) > flash_dmg_max) {
        flash_dmg_max = dmg_normal * (1-res_normal/100);
        flash_color = c_white;
        flash_resist = res_normal;
    }
    if (dmg_bio * (1-res_bio/100) > flash_dmg_max) {
        flash_dmg_max = dmg_bio * (1-res_bio/100);
        flash_color = c_bio;
        flash_resist = res_bio;
    }
    if (dmg_cyber * (1-res_cyber/100) > flash_dmg_max) {
        flash_dmg_max = dmg_cyber * (1-res_cyber/100);
        flash_color = c_cyber;
        flash_resist = res_cyber;
    }
    if (dmg_mental * (1-res_mental/100) > flash_dmg_max) {
        flash_dmg_max = dmg_mental * (1-res_mental/100);
        flash_color = c_mental;
        flash_resist = res_mental;
    }
    if (dmg_zauber * (1-res_zauber/100) > flash_dmg_max) {
        flash_dmg_max = dmg_zauber * (1-res_zauber/100);
        flash_color = c_zauber;
        flash_resist = res_zauber;
    }
    if (dmg_cosmic * (1-res_cosmic/100) > flash_dmg_max) {
        flash_dmg_max = dmg_cosmic * (1-res_cosmic/100);
        flash_color = c_cosmic;
        flash_resist = res_cosmic;
    }

    if (flash_dmg_max > 0) {
        with defender {
            hit_flash_timer = hit_flash_time;
            hit_flash_color = flash_color;
            hit_flash_str = 1 - (flash_resist / 100);
        }
    }
}

// Execute onDamage hook, if applicable
with (defender) {
    if (dmg_total > 0 and hook_onDamage_script != NULL) {
        script_execute(hook_onDamage_script, dmg_total);
    }
}

// Return total amount of damage dealt, for displaying on-screen
return dmg_total;
