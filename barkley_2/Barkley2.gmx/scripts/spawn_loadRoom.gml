/// spawn_loadRoom()

var roomName = room_get_name(room);

if (spawn_map_exists(roomName)) {
    if (!ds_map_exists(global.spawn_maps, roomName)) {
        global.spawn_maps[? roomName] = spawn_map_load(roomName);
    }

    var spawnMap = global.spawn_maps[? roomName];
    var key = ds_map_find_first(spawnMap);
    for (var i = 0; i < ds_map_size(spawnMap); i++) {
        var uuid = key;
        if (string_char_at(uuid, 1) != "_" and spawn_state_exists(uuid)) {
            var state = spawn_state_get(uuid);
            spawn_state_recreateEnemy(state);
        }    
    
        key = ds_map_find_next(spawnMap, key);
    }
    
    spawn_step();
}
