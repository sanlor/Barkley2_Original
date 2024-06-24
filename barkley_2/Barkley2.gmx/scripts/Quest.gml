/// Quest(name, value?);

// Quest("myQuest") - Returns value of myQuest
// Quest("myQuest", 1) - Sets value of myQuest

var nam = argument[0];

if (argument_count == 1)
{
    var questpath = "quest.vars." + nam;
    if (scr_savedata_contains(questpath)) // Return existing quest data
    {
        return scr_savedata_get(questpath);
    }
    else // Create new quest data
    {
        scr_savedata_put(questpath, 0);
        return 0;
    }
}
else
{
    scr_savedata_put("quest.vars." + nam, argument[1]);
    QuestTracker("add", nam, argument[1]);
}
