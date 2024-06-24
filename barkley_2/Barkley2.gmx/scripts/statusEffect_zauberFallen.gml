// Periodic lowers target ZAUBER resistence by XX%.
statusEffect_this = statusEffect_zauberFallen;
statusEffect_stat = STAT_BASE_RESISTANCE_ZAUBER;

if (argument_count == 3) return statusMaster_resistLowerOne(argument[0], argument[1], argument[2]);
return statusMaster_resistLowerOne(argument[0], argument[1], argument[2], argument[3]);
