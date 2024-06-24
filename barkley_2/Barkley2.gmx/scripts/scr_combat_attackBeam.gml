/// scr_combat_attackBeam(bullet,pointlist,beamsize,dmgRatio)

var bullet   = argument0;
var _pointlist = argument1;
var _size = argument2;
var _dmgRatio = argument3;

var pxnb = ds_list_size(_pointlist);

if(pxnb>=4)
{
    if (!instance_exists(actor) or !instance_exists(bullet) or
            !object_is_ancestor(actor.object_index, CombatActor) or
            !object_is_ancestor(bullet.object_index, CombatAttackEntity)) {return 0;}
    
    // Set up attack to use for damage cone.
    var attack = scr_combat_attack_clone(bullet);
    if (!instance_exists(attack)) {return 0;}
    
    // Remove Hoopz from target list
    var plyInd = ds_list_find_index(target_list, PlayerCombatActor);
    if (plyInd != -1) ds_list_delete(target_list, plyInd);
    var plyInd = ds_list_find_index(target_list, o_hoopz);
    if (plyInd != -1) ds_list_delete(target_list, plyInd);
    
    with (attack) {
        // Rays do not apply any ailments.
        ds_list_clear(status_effects);
    
        // Scale damage so all rays damage sum equals DAMAGE_RATIO times bullet damage.
        stats_attack[? STAT_ATTACK_DMG_NORMAL] *= _dmgRatio;
        stats_attack[? STAT_ATTACK_DMG_BIO] *= _dmgRatio;
        stats_attack[? STAT_ATTACK_DMG_CYBER] *= _dmgRatio;
        stats_attack[? STAT_ATTACK_DMG_MENTAL] *= _dmgRatio;
        stats_attack[? STAT_ATTACK_DMG_ZAUBER] *= _dmgRatio;
        stats_attack[? STAT_ATTACK_DMG_COSMIC] *= _dmgRatio;
        
        // For knockback and stagger, sum of rays kb/stagger should equal bullet kb/stagger.
        stats_attack[? STAT_ATTACK_KNOCKBACK] *= _dmgRatio;
        stats_attack[? STAT_ATTACK_STAGGER] *= _dmgRatio;
    }
    
    /*
    var from_x = actor.x;
    var from_y = actor.y;
    var from_z = actor.z + 15;*/
    
    draw_set_color(laserCol);
    var sizeStay = 0;
    var prevlx = ds_list_find_value(lstPoints,pxnb-2);
    var prevly = ds_list_find_value(lstPoints,pxnb-1);
    
    var hitTargets = ds_list_create();
    
    for(i=pxnb-4; i>=0; i-=2)
    {
        ptx = ds_list_find_value(lstPoints,i);
        pty = ds_list_find_value(lstPoints,i+1);
        
            ///scr_draw_line(ptx,pty,prevlx,prevly,lcurSize);
        var enemy = scr_enemy_collision_line_id(prev1x,prev1y,ptx,ptym,20,bullet.target_list)
        
        for (var i = 0; i < ds_list_size(bullet.target_list); i++)
        {
            var _t = bullet.target_list[| i];
            if(ds_list_find_index(hitTargets,_t)==-1)
            {
                with (_t)
                {
                    if (!invulnerable && z + hitbox_z_bottom <= z && hitbox_z_top >= z)
                    {
                        if (collision_line(ptx,pty,prevlx,prevly, id, true, false))
                        {
                            ds_list_add(hitTargets, id);
                        }
                    }
                }
            }
        }
        ///collision_line
        
        prevlx = ptx;
        prevly = pty;
        
        sizeStay+=1;
        if(sizeStay>12){lcurSize = floor(lcurSize*0.9); lcurSize-=1;}
    }
    
    if(ds_list_size(hitTargets)>0)
    {
        for (var i = 0; i < ds_list_size(hitTargets); i++)
        {
            var _t = bullet.target_list[| i];
            
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
       
    /*
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
    */
    
    ds_list_destroy(hitTargets);
    
    // Clean up resources
    with (attack) {
        instance_destroy();
    }
}
