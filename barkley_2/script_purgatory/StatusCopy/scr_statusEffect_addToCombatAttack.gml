/// scr_statusEffect_addToCombatAttack(script, attack)
/* Adds a status effect to a CombatAttack.
Returns the status effect configuration map.

arg0 - Status Effect Script
arg1 - CombatAttackEntity */

var status_scr = argument0;
var attack = argument1;

var conf = ds_map_create();
script_execute(status_scr, conf, NULL, "generate", NULL);
ds_list_add(attack.status_effects, conf);

// gets the attacking entity for use in status effect stat comparisons
if (object_is_ancestor(attack.object_index, CombatAttackEntity))
    conf[? "attackingEntity"] = attack.attack_from;
else
    conf[? "attackingEntity"] = attack;

return conf;
