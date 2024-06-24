/// scr_time_db(eventName)
//  Returns "before", "during" or "after"
//  Will return "invalid" if no event is found
if (argument[0] == "init")
{
    global.timeName = ds_list_create();
    global.timeStart = ds_list_create();
    global.timeEnd = ds_list_create();
    // Add all time definitions here
    // Times with 1 argument can only return "before" or "after"
    // try to arrange these by area, and then by chronological order!
    //////////////////
    /// TIR NA NOG ///
    //////////////////
    scr_time_db("add", "milagrosOpen", 2.9);
    scr_time_db("add", "mortgageClosed", 0.9);
    //scr_time_db("add", "wilmerEviction", 2); - Not needed as mortgageClosed already does the job
    //scr_time_db("add", "bootybassClosed", 3.0); - This is not used anywhere
    // scr_time_db("add", "petClosed", 3.8); - This is not used anywhere
    // scr_time_db("add", "gutterhoundRobbery", 3.8); - This is not used anywhere
    scr_time_db("add", "tnnCurfew", 3.8, 4.8);
    scr_time_db("add", "fedeDiagnose", 3); // When fede appears sitting, sad
    scr_time_db("add", "fedeSurgery", 4); // Fede is in hospital bed, arm in sewers
    /////////////////////////////////
    /// Operation Reverse Dunkirk ///
    /////////////////////////////////
    scr_time_db("add", "opX_slagSocial", 7.0, 12.9);
    scr_time_db("add", "opX_Foopba", 13.2, 16.0);
    scr_time_db("add", "opX_Chandragupta", 16.0, 22.0);
    
    scr_time_db("add", "swampDuergars", 13);
    scr_time_db("add", "industrialTurrets", 12); // Point at which industrial parks battery dies and the turrets stop working // Obsolete now
}
else if (argument[0] == "get")
{
    var _di = ds_list_find_index(global.timeName, argument[1]);
    if (_di == -1)
    {
        show_debug_message("scr_time_db('get') - Event " + argument[1] + " not found. Returned 0.");
        return 0;
    }
    return global.timeStart[| _di];
}
else if (argument[0] == "get string")
{
    return ClockTime("display", (24 - scr_time_db("get", argument[1])) * 3600);
}
else if (argument[0] == "add") // "add", eventName, timeStart, timeEnd (optional)
{
    ds_list_add(global.timeName, argument[1]);
    ds_list_add(global.timeStart, argument[2]);
    if (argument_count == 3) ds_list_add(global.timeEnd, argument[2]);
    else ds_list_add(global.timeEnd, argument[3]);
}
else
{
    var _di = ds_list_find_index(global.timeName, argument[0]);
    if (_di == -1)
    {
        show_debug_message("scr_time_db() - Event " + argument[0] + " not found. Returned invalid.");
        return "invalid";
    }
    var _ts = global.timeStart[| _di];
    var _te = global.timeEnd[| _di];
    if (argument[0] == "tnnCurfew")
    {
        if (Quest("tnnCurfew") == 2) return "after";
        if (Quest("tnnCurfew") == 1) return "during";
        return "before";
    }
    if (ClockTime("get") < _ts) return "before";
    else if (ClockTime("get") >= _te) return "after";
    else return "during";
}
