/// spawn_step()

var roomName = room_get_name(room);

if (ds_map_exists(global.spawn_maps, roomName)) {
    var spawnMap = global.spawn_maps[? roomName];
    
    var key = ds_map_find_first(spawnMap);
    for (var i = 0; i < ds_map_size(spawnMap); i++) {
        var spawnPoint = spawnMap[? key];
        var uuid = spawnPoint[? "uuid"];
        
        if (string_char_at(uuid, 1) != "_") {
            if (!spawn_state_exists(uuid)) {
                spawn_state_new(spawnPoint);
            }
            var state = spawn_state_get(uuid);
            
            if (spawn_point_ready(spawnPoint)) {
                var n = spawn_point_spawnEnemy(spawnPoint);
                if (n != NULL and instance_exists(n)) {
                    spawn_state_addEnemy(spawn_state_get(uuid), n);
                }
                
                spawn_state_decreaseResourceCount(state);
            }
            
            spawn_state_update(state);
        }
        
        key = ds_map_find_next(spawnMap, key);
    }
}
