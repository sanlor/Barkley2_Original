/// scr_time_set(time)
/// Set Time

// var _time = scr_time_get()
// scr_savedata_put("quest.time", argument0);
argument0 = real(argument0);

QuestTracker("add", "questTime", argument0);

if (argument0 > 1)
{
    if ( argument0 > scr_time_get() )
    {
        
        // sabah update
        //script_execute(scr_sabah_update);
        
        // update frog kid location
        //script_execute(scr_frog_update);
        
        // shi update
        if (scr_time_get() >= 9) { script_execute(scr_shi_update); }
        
        // refresh chaiyaporn!!!
        if (Quest("chaiyapornTime") == 1)
        {
            Quest("chaiyapornTime", 0);
        }
        
        // SPECIFIC TIME EVENTS...
        switch (argument0)
        {
            case 0: break;
            case 1: break;
            case 2:
            
                // I'm going to re-loacte this one to avoid potential problems //
                // Wilmer gets evicted //
                break;
            default: break;
        }
    }
}

scr_savedata_put("quest.time", argument0);
scr_savedata_put("quest.timeDestination", argument0);
//if (argument0 <= 1) 
//{
//    scr_savedata_put("quest.time", argument0);
//    scr_savedata_put("quest.timeDestination", argument0);
//}
//else
//{
//    scr_savedata_put("quest.timeDestination", argument0);
    //Destination only happens on a room end?
//}
