/// scr_combat_weapon_bfg_damageCone(actor, direction, bullet)
// This script creates and executes the damage cone of the BFG.

var actor    = argument0;
var cone_dir = argument1;
var bullet   = argument2;

var RAYS = 15;
var SPREAD = 40;
var RANGE = 250;
var DAMAGE_RATIO = 4;

if (!instance_exists(actor) or !instance_exists(bullet) or
        !object_is_ancestor(actor.object_index, CombatActor) or
        !object_is_ancestor(bullet.object_index, CombatAttackEntity)) {
    return 0;
}

// Set up attack to use for damage cone.
var attack = scr_combat_attack_clone(bullet);
if (!instance_exists(attack)) {
    return 0;
}

// Remove Hoopz from target list
var plyInd = ds_list_find_index(target_list, PlayerCombatActor);
if (plyInd != -1) ds_list_delete(target_list, plyInd);
var plyInd = ds_list_find_index(target_list, o_hoopz);
if (plyInd != -1) ds_list_delete(target_list, plyInd);

with (attack) {
    // Rays do not apply any ailments.
    ds_list_clear(status_effects);

    // Scale damage so all rays damage sum equals DAMAGE_RATIO times bullet damage.
    var ratio = DAMAGE_RATIO / RAYS;
    stats_attack[? STAT_ATTACK_DMG_NORMAL] *= ratio;
    stats_attack[? STAT_ATTACK_DMG_BIO] *= ratio;
    stats_attack[? STAT_ATTACK_DMG_CYBER] *= ratio;
    stats_attack[? STAT_ATTACK_DMG_MENTAL] *= ratio;
    stats_attack[? STAT_ATTACK_DMG_ZAUBER] *= ratio;
    stats_attack[? STAT_ATTACK_DMG_COSMIC] *= ratio;
    
    // For knockback and stagger, sum of rays kb/stagger should equal bullet kb/stagger.
    stats_attack[? STAT_ATTACK_KNOCKBACK] /= RAYS;
    stats_attack[? STAT_ATTACK_STAGGER] /= RAYS;
}

var from_x = actor.x;
var from_y = actor.y;
var from_z = actor.z + 15;

for (var ray_dir = cone_dir - (SPREAD/2);
         ray_dir <= cone_dir + (SPREAD/2);
         ray_dir += SPREAD / (RAYS-1)) {
        
    var to_x = from_x + lengthdir_x(RANGE, ray_dir);
    var to_y = from_y + lengthdir_y(RANGE, ray_dir);
    
    var enemy = scr_enemy_collision_line_id(from_x, from_y, to_x, to_y, from_z, bullet.target_list);
    if (enemy != noone and instance_exists(enemy)) {
        // Position attack correctly so that on-hit effects e.g. blood happen at correct location.
        var enemy_shape = scr_entity_getMovementCollisionShape(enemy);
        var enemy_width = sat_util_shapemaxwidth(enemy_shape);
        attack.x = enemy.x + lengthdir_x(enemy_width, ray_dir + 180);
        attack.y = enemy.y + lengthdir_y(enemy_width, ray_dir + 180);
        attack.z = from_z;
        
        // Set up knockback direction
        attack.knockback_type = KNOCKBACKTYPE_SPECIFIED_DIRECTION;
        attack.knockback_dir = ray_dir;
        
        // Do the attack
        scr_combat_attack_actor(enemy, attack, true);
    }
}

// Clean up resources
with (attack) {
    instance_destroy();
}

