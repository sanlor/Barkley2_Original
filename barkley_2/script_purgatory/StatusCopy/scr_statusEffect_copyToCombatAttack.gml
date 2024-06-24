/// scr_statusEffect_copyToCombatAttack(confMap, attack)
/* Adds a status effect to a CombatAttack.
Returns the status effect configuration map.

arg0 - Status Effect Script
arg1 - CombatAttackEntity */

var confMap = argument0;
var attack = argument1;

var conf = ds_map_create();
ds_map_copy(conf, confMap);
ds_list_add(attack.status_effects, conf);

return conf;
