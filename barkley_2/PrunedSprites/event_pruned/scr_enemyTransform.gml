///the logic of how one enemy transforms to another goes here
///Gonna be a doozy

var _enemy = argument0;
var _target = argument1;

if(is_string(_target))
{
    ////special transformation type
    switch(_target)
    {
        case "beehive":
            with(_enemy)
            {
                var startguts = scr_stats_getEffectiveStat(_enemy,STAT_BASE_GUTS);
                instance_change(o_enemy_beehive,false);
                event_user(5);
                
                totTinyBees = 0;
                totSmallBees = 0;
                totMedBees = 0;
                totLargeBees = 0;
                genTimer = 5;
                toSpawn = 0;
                
                move_x = 0;
                move_y = 0;
                move_z = 0;
                path_end();
                
                if(startguts>8)///large beehive
                {
                    sprite_index = s_beehive_large;
                    scr_entity_setZHitbox(0, 64);
                    genInterval = 10;
                    genOnHit = 12;
                    totTinyBees = 24;
                    totSmallBees = 6;
                    totMedBees = 2;
                    scr_stats_setBaseStat(_enemy, STAT_BASE_HP, 80)
                    scr_stats_setBaseStat(_enemy, STAT_BASE_RESISTANCE_KNOCKBACK, 48);
                }
                else if(startguts>5)///medium beehive
                {
                    sprite_index = s_beehive_medium;
                    scr_entity_setZHitbox(0, 32);
                    genInterval = 15;
                    genOnHit = 6;
                    totTinyBees = 16;
                    totSmallBees = 2;
                    scr_stats_setBaseStat(_enemy, STAT_BASE_HP, 40)
                    scr_stats_setBaseStat(_enemy, STAT_BASE_RESISTANCE_KNOCKBACK, 32);
                }
                else if(startguts>2)///small beehive
                {
                    sprite_index = s_beehive_small;
                    scr_entity_setZHitbox(0, 24);
                    genInterval = 20;
                    genOnHit = 4;
                    totTinyBees = 8;
                    scr_stats_setBaseStat(_enemy, STAT_BASE_HP, 20)
                    scr_stats_setBaseStat(_enemy, STAT_BASE_RESISTANCE_KNOCKBACK, 24);
                }
                else////tiny beehive
                {
                    sprite_index = s_beehive_tiny;
                    scr_entity_setZHitbox(0, 16);
                    genInterval = 30;
                    genOnHit = 2;
                    totTinyBees = 4;
                    scr_stats_setBaseStat(_enemy, STAT_BASE_HP, 10)
                    scr_stats_setBaseStat(_enemy, STAT_BASE_RESISTANCE_KNOCKBACK, 16);
                }
                
                scr_stats_setCurrentStat(_enemy,STAT_CURRENT_HP,9999);///fully heal character upon transformation
                
                // Enemy configurations
                event_hook_on_hit = 15;
                
                ////remove AI
                p_AI_passive = -1;
                p_AI_active = -1;
                p_action[0] = -1;
                
            }
            break;
    }
    
    show_debug_message("transformation: " + object_get_name(_enemy.object_index)+" into "+ _target);
}
else
{
    ////transform to a specific other enemy object's instance
    with(_enemy){instance_change(_target,false);}
    show_debug_message("transformation: " + object_get_name(_enemy.object_index)+" into "+ object_get_name(_target));
}
