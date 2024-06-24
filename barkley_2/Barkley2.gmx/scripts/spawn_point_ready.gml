/// spawn_point_ready(spawnPoint)

var spawnPoint = argument0;

var spawnState = spawn_state_get(spawnPoint[? "uuid"]); 
if (spawnState == NULL or spawnState[? "resources"] > 0) {
    if (instance_exists(o_hoopz) and
            point_distance(o_hoopz.x, o_hoopz.y, spawnPoint[? "x"], spawnPoint[? "y"]) < 800) {
        return true;
    }
}

return false;
