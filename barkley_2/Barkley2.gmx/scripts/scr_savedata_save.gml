/// scr_savedata_save()
var fil = scr_savedata_path();
if (file_exists(fil)) file_delete(fil);
var f = file_text_open_write(fil);
file_text_write_string(f, json_encode(global.savedata));
file_text_close(f);
