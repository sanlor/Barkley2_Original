/// scr_combat_attack_clone(attack_entity)
// Creates a new CombatAttackEntity with same stats and config as argument object
// Returns id, or noone if something failed

var attack = argument0;

if (!instance_exists(attack) or !object_is_ancestor(attack.object_index, CombatAttackEntity)) {
    return noone;
}

var clone = instance_create(0, 0, CombatAttackEntity);
with (clone) {
    ds_map_copy(stats_attack, attack.stats_attack);
    ds_list_copy(target_list, attack.target_list);
    ds_list_copy(status_effects, attack.status_effects);
    
    attack_from = attack.attack_from;
    knockback_type = attack.knockback_type;
    knockback_dir = attack.knockback_dir;
    deal_damage = attack.deal_damage;
    disabled = attack.disabled;
    instantkill = attack.instantkill;
}

return clone;
