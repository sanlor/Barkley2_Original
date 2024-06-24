///scr_combat_cloneBullet(source)
var source = argument0;
var objType = source.object_index;
if(objType != o_bullet && objType != o_advBullet){objType = o_advBullet;}
var clone = instance_create(source.x,source.y,objType);
////instance_copy(source);

clone.move_x_offset = 0;
clone.move_y_offset = 0;
                        
with(clone)
{
    z = source.z;
    scr_entity_setDirSpd(source.move_dir,source.move_dist);
    stats_attack = scr_stats_newAttackStats();
    
    sprite_index = source.sprite_index;
    scr_stats_setAttackStat(id, STAT_ATTACK_DMG_NORMAL, scr_stats_getAttackStat(source, STAT_ATTACK_DMG_NORMAL));
    scr_stats_setAttackStat(id, STAT_ATTACK_DMG_BIO, scr_stats_getAttackStat(source, STAT_ATTACK_DMG_BIO));
    scr_stats_setAttackStat(id, STAT_ATTACK_DMG_CYBER, scr_stats_getAttackStat(source, STAT_ATTACK_DMG_CYBER));
    scr_stats_setAttackStat(id, STAT_ATTACK_DMG_MENTAL, scr_stats_getAttackStat(source, STAT_ATTACK_DMG_MENTAL));
    scr_stats_setAttackStat(id, STAT_ATTACK_DMG_ZAUBER, scr_stats_getAttackStat(source, STAT_ATTACK_DMG_ZAUBER));
    scr_stats_setAttackStat(id, STAT_ATTACK_DMG_COSMIC, scr_stats_getAttackStat(source, STAT_ATTACK_DMG_COSMIC));
    
    scr_stats_setAttackStat(id, STAT_ATTACK_KNOCKBACK, scr_stats_getAttackStat(source, STAT_ATTACK_KNOCKBACK));
    
    status_effects = ds_list_create();
    hit_list = ds_list_create();
    target_list = ds_list_create();
    
    ds_list_copy(hit_list,source.hit_list);
    ds_list_copy(target_list,source.target_list);
}

return clone;
