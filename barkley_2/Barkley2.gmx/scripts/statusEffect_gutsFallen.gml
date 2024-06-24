// Periodic lowers target GUTS by XX%.
statusEffect_this = statusEffect_gutsFallen; // MUST change this to be name of the script above
stat = STAT_BASE_GUTS;

if (argument_count == 3) return statusMaster_glampFallen(argument[0], argument[1], argument[2]);
return statusMaster_glampFallen(argument[0], argument[1], argument[2], argument[3]);
