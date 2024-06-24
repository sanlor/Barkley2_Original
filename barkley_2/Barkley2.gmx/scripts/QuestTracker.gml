///QuestTracker("init" / "reset" / "add" / "note")
// QuestTracker("init") - Creates a new quest tracker file if it doesn't exist
// QuestTracker("reset") - Clears quest tracker file
// QuestTracker("add", quest_variable, quest_state);
// QuestTracker("note", note_text);
var fil;
var nam = "save0tracker.csv";
if (argument_count == 1)
{
    if (argument[0] == "init")
    {
        if (scr_savedata_exists() == 0)
        {
            fil = file_text_open_write(nam);
            file_text_close(fil);
        }
    }
    else if (argument[0] == "reset")
    {
        if (file_exists(nam)) file_delete(nam);
        fil = file_text_open_write(nam);
        file_text_close(fil);
    }
}
else
{
    if (argument[0] == "add")
    {
        fil = file_text_open_append(nam);
        file_text_write_string(fil, ClockTime("display") + ", " + argument[1] + ", " + string(argument[2]));
        file_text_writeln(fil);
        file_text_close(fil);
    }
    else if (argument[0] == "note")
    {
        fil = file_text_open_append(nam);
        file_text_write_string(fil, ClockTime("display") + ", " + argument[1]);
        file_text_writeln(fil);
        file_text_close(fil);
    }
}   
