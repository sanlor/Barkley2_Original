/// enemy_hitfx_kobold_large(attackerId, attackDir)

var attackerId = argument0;
var attackDir = argument1;

repeat(3)
{
    ob = scr_fx_simple(attackerId.x, attackerId.y, attackerId.z, s_koboldBloodburst);
    with(ob)
    {
        scr_entity_setDirSpd(attackDir + 200 - random(40), 6+random(8));
        scr_entity_animation_setSpeed(ANIMATION_DEFAULT, 2+random(1));
    }
    ob.image_angle = choose(0,90,180,270);
    ob.image_xscale = 0.8 + random(0.2);
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
            ob.sprite_index = s_koboldLarge_head;
            ob.image_index = headType*18;
            ob.image_speed = 0;
            ob.image_angle = 0;
            ob.splatSound = "kobold_splatter";
            ob.strip = ob.image_index;
            attackSpit[? "disabled"] = true;
            attackClone[? "disabled"] = true;
            headgushintv = 10+random(10);
            headgushburst = 2+irandom(3);
            scr_stats_setBaseStat(self, STAT_BASE_WEIGHT, 20);
            scr_stats_setBaseStat(self, STAT_BASE_SPEED, 6);
        }
    }
}
