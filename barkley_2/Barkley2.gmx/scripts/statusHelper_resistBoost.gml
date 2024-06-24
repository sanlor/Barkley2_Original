/// statusHelper_resistBoost(actor, resistBoost, boostMultiplier, lowerMultiplier)
//show_debug_message("BOOST MULTIPLIER IS... " + string(argument2) + " | LOWER MULTIPLIER IS... " + string(argument3));
statusHelper_statMultiply(argument0, argument1, argument2);
if (argument1 != STAT_BASE_RESISTANCE_BIO) statusHelper_statMultiply(argument0, STAT_BASE_RESISTANCE_BIO, argument3);
if (argument1 != STAT_BASE_RESISTANCE_CYBER) statusHelper_statMultiply(argument0, STAT_BASE_RESISTANCE_CYBER, argument3);
if (argument1 != STAT_BASE_RESISTANCE_MENTAL) statusHelper_statMultiply(argument0, STAT_BASE_RESISTANCE_MENTAL, argument3);
if (argument1 != STAT_BASE_RESISTANCE_COSMIC) statusHelper_statMultiply(argument0, STAT_BASE_RESISTANCE_COSMIC, argument3);
if (argument1 != STAT_BASE_RESISTANCE_ZAUBER) statusHelper_statMultiply(argument0, STAT_BASE_RESISTANCE_ZAUBER, argument3);
