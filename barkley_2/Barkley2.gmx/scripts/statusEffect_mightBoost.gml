// Periodic raises MIGHT 60%, lowers all other stats 15%.
statusEffect_this = statusEffect_mightBoost; // MUST change this to be name of the script above
stat = STAT_BASE_MIGHT;

if (argument_count == 3) return statusMaster_glampBoost(argument[0], argument[1], argument[2]);
return statusMaster_glampBoost(argument[0], argument[1], argument[2], argument[3]);
