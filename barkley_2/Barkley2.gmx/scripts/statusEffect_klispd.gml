// Periodic deals PIETY % extra damage.
statusEffect_this = statusEffect_klispd;
statusEffect_stat = STAT_BASE_PIETY;
if (argument_count == 3) return statusMaster_damageBoost(argument[0], argument[1], argument[2]);
return statusMaster_damageBoost(argument[0], argument[1], argument[2], argument[3]);
