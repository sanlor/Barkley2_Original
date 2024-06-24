/// spawn_state_addEnemy(state, enemy)

var state = argument0;
var enemy = argument1;

if (instance_exists(enemy) and object_is_ancestor(enemy.object_index, CombatActor)) {
    var enemyMap = ds_map_create();
    enemyMap[? "objectName"] = object_get_name(enemy.object_index);
    enemyMap[? "uuid"] = enemy.uuid;
    enemyMap[? "x"] = enemy.x;
    enemyMap[? "y"] = enemy.y;
    enemyMap[? "z"] = enemy.z;
    ds_map_add_map(enemyMap, "statsBase", ds_map_newcopy(enemy.stats_base));
    ds_map_add_map(enemyMap, "statsCurrent", ds_map_newcopy(enemy.stats_current));
    
    var enemyList = state[? "enemies"];
    ds_list_add_map(enemyList, enemyMap);
}
