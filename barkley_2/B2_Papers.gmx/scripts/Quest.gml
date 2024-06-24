if (argument_count == 1)
{
    return scr_quest_get_state(argument[0]);
}
else
{
    scr_quest_set_state(argument[0], argument[1]);
}
