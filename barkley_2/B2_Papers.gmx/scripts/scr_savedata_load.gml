/// scr_savedata_load()

var f;
if (file_exists(working_directory + "\save.override.b2")) {
    var f = file_text_open_read(working_directory + "\save.override.b2");
} else {
    var f = file_text_open_read(working_directory + "\save.b2");
}

var str = "";
while (!file_text_eof(f)) {
    str += file_text_readln(f);
}
file_text_close(f);

global.savedata = json_decode(str);

// Deserialize grids
scr_gunmap_load();
Breakout("clear"); //Is there a more suitable place for this? Needs to be called every reload and resetting of the game.

QuestTracker("note", "Game loaded., NULL");
