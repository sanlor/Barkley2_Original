// Periodic lowers target BIO resistence by XX%.
statusEffect_this = statusEffect_bioFallen;
statusEffect_stat = STAT_BASE_RESISTANCE_BIO;

if (argument_count == 3) return statusMaster_resistLowerOne(argument[0], argument[1], argument[2]);
return statusMaster_resistLowerOne(argument[0], argument[1], argument[2], argument[3]);
