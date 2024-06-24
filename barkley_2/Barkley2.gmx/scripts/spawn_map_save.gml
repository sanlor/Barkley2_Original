/// spawn_map_save(mapName, spawnMap)

var mapName = argument0;
var spawnMap = argument1;

var path = spawn_map_path(mapName);

if (file_exists(path)) {
    file_delete(path);
}

var json = json_encode(spawnMap);
var f = file_text_open_write(path);
file_text_write_string(f, json);
file_text_close(f);
