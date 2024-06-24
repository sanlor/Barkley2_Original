/// statusEffect_immunity_isImmune(combatActor, statusEffect)

var actor  = argument0;
var status = argument1;

return actor.statusImmuneAll || ds_list_contains(actor.immunities, status);

