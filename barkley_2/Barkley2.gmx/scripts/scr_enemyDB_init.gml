///scr_enemyDB_init()
global.enemyDB = ds_map_create();

if (file_exists(working_directory + "\enemyDB.json") == 0)
{
    show_debug_message("enemyDB: No enemyDB.json, using blank map.");
    ds_map_clear(global.enemyDB);
}
else
{
    show_debug_message("enemyDB: Loaded enemyDB.json");
    var fil = file_text_open_read(working_directory + "\enemyDB.json");
    var str = "";
    while (file_text_eof(fil) == 0) { str += file_text_readln(fil); }
    file_text_close(fil);
    global.enemyDB = json_decode(str);
}
