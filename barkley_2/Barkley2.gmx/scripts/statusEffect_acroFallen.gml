// Periodic lowers target ACRO by XX%.
statusEffect_this = statusEffect_acroFallen; // MUST change this to be name of the script above
stat = STAT_BASE_AGILE;

if (argument_count == 3) return statusMaster_glampFallen(argument[0], argument[1], argument[2]);
return statusMaster_glampFallen(argument[0], argument[1], argument[2], argument[3]);
