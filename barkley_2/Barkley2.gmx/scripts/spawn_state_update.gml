/// spawn_state_update(state)

/* NOTE: Enemy does not report death - spawn point notices it by itself. This way,
         enemies do not need to be concerned with spawn points. */

var state = argument0;

var enemyList = state[? "enemies"];
for (var i = 0; i < ds_list_size(enemyList); i++) {
    var enemyState = enemyList[| i];
    var enemyUuid = enemyState[? "uuid"];
    var enemy = actor_getByUuid(enemyUuid);
    if (enemy != NULL and instance_exists(enemy)) {
        enemyState[? "x"] = enemy.x;
        enemyState[? "y"] = enemy.y;
        enemyState[? "z"] = enemy.z;
        if (enemy.changedStatsBase) {
            ds_map_copy(enemyState[? "statsBase"], enemy.stats_base);
            enemy.changedStatsBase = false;
        }
        if (enemy.changedStatsCurrent) {
            ds_map_copy(enemyState[? "statsCurrent"], enemy.stats_current);
            enemy.changedStatsCurrent = false;
        }
    } else {
        ds_map_destroy(enemyState);
        ds_list_delete(enemyList, i);
        i--;
    }
}
