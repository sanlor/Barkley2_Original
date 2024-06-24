/// scr_quest_get_state(quest_name)

var questpath = "quest.vars." + argument0
if (scr_savedata_contains(questpath)) // Return existing quest data
{
    return scr_savedata_get(questpath);
}
else // Create new quest data
{
    scr_savedata_put(questpath, 0);
    return 0;
}

// OLD
//var quest = scr_quest_get(argument0);
//return ds_list_find_value(quest, 2);

// OLD
//var list = ds_list_create();
//ds_list_add(list, 0);
//ds_list_add(list, 0);
//ds_list_add(list, 0);
//scr_savedata_put_list(questpath, list);
