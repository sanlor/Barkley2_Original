if (file_exists(working_directory + "\save.b2")) {
    file_delete(working_directory + "\save.b2");
}

var f = file_text_open_write(working_directory + "\save.b2");
file_text_write_string(f, json_encode(global.savedata));
file_text_close(f);
