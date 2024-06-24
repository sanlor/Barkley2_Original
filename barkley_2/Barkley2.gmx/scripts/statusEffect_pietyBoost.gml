// Periodic raises PIETY XX%, lowers all other stats YY%.
statusEffect_this = statusEffect_pietyBoost; // MUST change this to be name of the script above
stat = STAT_BASE_PIETY;

if (argument_count == 3) return statusMaster_glampBoost(argument[0], argument[1], argument[2]);
return statusMaster_glampBoost(argument[0], argument[1], argument[2], argument[3]);
