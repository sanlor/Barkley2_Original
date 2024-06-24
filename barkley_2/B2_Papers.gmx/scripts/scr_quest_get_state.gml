/// scr_quest_get_state(variable)
var questpath = "quest.vars." + argument0
if (scr_savedata_contains(questpath)) // Return existing quest data
{
    //if (argument0 == "player.shekels") show_error("hi", 0);
    return scr_savedata_get(questpath);
}
else // Create new quest data
{
    scr_savedata_put(questpath, 0);
    return 0;
}
