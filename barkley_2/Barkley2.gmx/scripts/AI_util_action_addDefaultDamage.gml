/// AI_util_action_addDefaultDamage(conf)

var conf = argument0;

conf[? "dmgBase"]   = 0;
conf[? "dmgRatioMight"]  = 0;
conf[? "dmgRatioWeight"] = 0;
conf[? "dmgRatioPiety"]  = 0;

conf[? "knockback"]       = 0;
conf[? "stagger"]         = 0;
conf[? "staggerHardness"] = STAGGER_HARDNESS_SOFT;

conf[? "attackScript"] = NULL;

conf[? "instantKill"] = false;

