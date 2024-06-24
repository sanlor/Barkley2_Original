// Periodic lowers target KOSMIC resistence by XX%.
statusEffect_this = statusEffect_kosmicFallen;
statusEffect_stat = STAT_BASE_RESISTANCE_COSMIC;

if (argument_count == 3) return statusMaster_resistLowerOne(argument[0], argument[1], argument[2]);
return statusMaster_resistLowerOne(argument[0], argument[1], argument[2], argument[3]);
