/// spawn_map_exists(roomName)

var roomName = argument0;
var path = spawn_map_path(roomName);

return file_exists(path);
