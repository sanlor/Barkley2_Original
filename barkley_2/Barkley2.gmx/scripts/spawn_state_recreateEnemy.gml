/// spawn_state_recreateEnemy(state)

var state = argument0;

var enemyList = state[? "enemies"];
for (var i = 0; i < ds_list_size(enemyList); i++) {
    var enemyState = enemyList[| i];
    var objectIndex = assetOrNull(enemyState[? "objectName"], asset_object);
    if (objectIndex != NULL) {
        var enemy = instance_create(enemyState[? "x"], enemyState[? "y"], objectIndex);
        if (instance_exists(enemy)) {
            enemy.z = enemyState[? "z"];
            enemy.uuid = enemyState[? "uuid"];
            ds_map_copy(enemy.stats_base, enemyState[? "statsBase"]);
            ds_map_copy(enemy.stats_current, enemyState[? "statsCurrent"]);
        }
    }
}
