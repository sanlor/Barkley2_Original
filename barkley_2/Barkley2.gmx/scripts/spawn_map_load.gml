/// spawn_map_load(mapName)

var mapName = argument0;

var path = spawn_map_path(mapName);

var f = file_text_open_read(path);
var str = "";
while (!file_text_eof(f)) {
    str += file_text_readln(f);
}
file_text_close(f);

return json_decode(str);
