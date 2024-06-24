// Periodic raises target KOSMIC resistence XX%, lowers other resistences YY%.
statusEffect_this = statusEffect_kosmicBoost; // MUST change this to be name of the script above
statusEffect_stat = STAT_BASE_RESISTANCE_COSMIC;

if (argument_count == 3) return statusMaster_genericResistBoost(argument[0], argument[1], argument[2]);
return statusMaster_genericResistBoost(argument[0], argument[1], argument[2], argument[3]);
