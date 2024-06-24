// Periodic deals LUCK % extra damage.
statusEffect_this = statusEffect_pachinkoded;
statusEffect_stat = STAT_BASE_LUCK;
if (argument_count == 3) return statusMaster_damageBoost(argument[0], argument[1], argument[2]);
return statusMaster_damageBoost(argument[0], argument[1], argument[2], argument[3]);
