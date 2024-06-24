/// scr_stats_createDamageIndicators(defender_actor, damage, damage_type, color)

var defender = argument0;
var damage = argument1;
var damagetype = argument2;
var color = argument3;


// Create 'popcorn' damage
var n;
n = instance_create(defender.x, defender.y, o_entity_indicatorDamage_popcorn);
n.number = damage;
n.target = defender;
n.type = damagetype;
n.color = color;

if (damage == "NULL" || damage == "BLOCK") exit;

// Create total damage
if (instance_exists(o_entity_indicatorDamage) && defender != noone) {
    var prevInd = noone;
    with (o_entity_indicatorDamage) {
        if (target == defender) {
            prevInd = id;
        }
    }
    
    if (prevInd != noone) {
        // Destroy this one, add its damage to incoming one
        damage += prevInd.number;
        with prevInd instance_destroy();
    }
}

var n;
n = instance_create(defender.x, defender.y, o_entity_indicatorDamage);
n.number = damage;
n.target = defender;
