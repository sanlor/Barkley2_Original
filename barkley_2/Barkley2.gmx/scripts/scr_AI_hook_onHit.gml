// This is the hook that is triggered when the unit is hit

var attack_id = argument0;

var attacker_id = attack_id.attack_from;

if (attacker_id != noone and instance_exists(attacker_id)) {
    scr_AI_aggro_addAggro(attacker_id, 25); // was 50);
}
