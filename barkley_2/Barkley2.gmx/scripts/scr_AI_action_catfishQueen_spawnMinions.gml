var _action = argument0;
var _retvar = false;

if(_action=="config")
{
    var conf = ds_map_create();
    conf[? "count"] = 0;
    return conf;
}

if(_action=="reset")
{
    return 0;
}

if(_action = "execute")
{
    var conf = argument1;
    
    var spawner = instance_create(0, 0, o_enemy_catfish_queen_minionSpawner);
    var queue = spawner.spawnQueue;
    
    switch (conf[? "count"]) {
    
        case 0:
            ds_queue_enqueue(queue,
                o_enemy_catfish_small,
                o_enemy_catfish_small,
                o_enemy_catfish_small);
            break;
    
        case 1:
            ds_queue_enqueue(queue,
                o_enemy_catfish_mounted,
                o_enemy_catfish_small);
            break;
    
        case 2:
            ds_queue_enqueue(queue,
                o_enemy_catfish_small,
                o_enemy_catfish_shield);
            break;
    
        case 3:
            ds_queue_enqueue(queue,
                o_enemy_catfish_mounted,
                o_enemy_catfish_small_poison);
            break;
    
        case 4:
            ds_queue_enqueue(queue,
                o_enemy_catfish_small,
                o_enemy_catfish_small_poison,
                o_enemy_catfish_small_poison,
                o_enemy_catfish_small);
            break;
    }
    
    if (conf[? "count"] >= 4) {
        conf[? "count"] = 1;
    } else {
        conf[? "count"] = conf[? "count"] + 1;
    }
    
    return AI_STATERESULT_FALLTHROUGH_REMOVE;
}
