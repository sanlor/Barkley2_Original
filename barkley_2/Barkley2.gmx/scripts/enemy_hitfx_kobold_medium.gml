/// enemy_hitfx_kobold_medium(attackerId, attackDir)

var attackerId = argument0;
var attackDir = argument1;

repeat(2)
{
    ob = scr_fx_simple(attackerId.x, attackerId.y, attackerId.z, s_koboldBloodburst);
    with(ob)
    {
        scr_entity_setDirSpd(attackDir + 195 - random(30), 3+random(6));
        scr_entity_animation_setSpeed(ANIMATION_DEFAULT, 3+random(2));
    }
    ob.image_angle = choose(0,90,180,270);
    ob.image_xscale = 0.6 + random(0.2);
    ob.image_yscale = ob.image_xscale;
}

if(hasHead)
{
    var curHp = scr_stats_getCurrentStat(id,STAT_CURRENT_HP);
    var maxHp = scr_stats_getEffectiveStat(id,STAT_EFFECTIVE_MAX_HP)
    if(curHp<maxHp/2)
    {
        if(irandom(10)<3)
        {
            hasHead = false;
            ob = instance_create(x,y,o_shootableGib);
            ob.sprite_index = s_koboldMedium_head;
            ob.image_index = headType;
            ob.image_speed = 0;
            ob.image_angle = 0;
            ob.splatSound = "kobold_splatter";
        }
    }
}
