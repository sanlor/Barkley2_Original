/// scr_savedata_load()

var f;
f = file_text_open_read(scr_savedata_path());

var str = "";
while (!file_text_eof(f)) {
    str += file_text_readln(f);
}
file_text_close(f);

global.savedata = json_decode(str);

// Deserialize grids
Gunsmap("generate", scr_savedata_get("gunsmap.seed"));
Breakout("clear"); //Is there a more suitable place for this? Needs to be called every reload and resetting of the game.

QuestTracker("note", "Game loaded., NULL");
