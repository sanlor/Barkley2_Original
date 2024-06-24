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
    scr_time_db("add", "mortgageClose", 0.8);
    scr_time_db("add", "bootybass", 1.0, 2.0);
    scr_time_db("add", "petClosed", 1.2);
    scr_time_db("add", "gutterhoundRobbery", 2.7);
    
    scr_time_db("add", "tnnCurfew", 3.0, 4.0);
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


/*
var moment = 0;

switch (argument0)
{
    //The Mortgage Office Closes
    case "mortgageClose": moment = 0.8; break;
    
    // Last time unit of Tir na Nog quests
    case "tnnFinal": moment = 5; break;

    // Tir na Nog Curfew
    case "tnnCurfew": moment = 3; break;
    case "tnnCurfewEnd": moment = 4; break;
    
    // Gutterhound
    case "gutterhoundRobbery":
        if (Quest("gutterhoundState") == 3) { moment = 4; }
        else { moment = 4; }
        break;
    
    // Fede
    case "fedeSurgery": moment = 3; break;
    case "fedeRecovery": moment = 4; break;
    
    // Pet Store
    case "petBusiness": // earliest closing time
        moment = 4 + Quest("petScore"); 
        break; 
    case "petShutter": // pet store is definitely closed
        moment = 5 + Quest("petScore"); 
        break; 
    case "petEric":
        moment = scr_quest_get_state("petEric");
        break;
    case "petDelivery":
        moment = 0;
        break;
        
    // Dolvolund
    case "dolvolundDepart":
        moment = 10; // TODO
        break;
        
    // wilmerGoodbye
    case "wilmerGoodbye": moment = 5; break;
    
    // industrial park
    case "industrialDestroy":
        if Quest("industrialSave") == 0 { moment = 12; }
        else { moment = 99; } 
        break;
    case "industrialFire": moment = scr_time_db("industrialDestroy") + 4; break;
    
    
    case "cccc": moment = 3; break;
    case "dddd": moment = 3; break;
    case "eeee": moment = 3; break;
    case "ffff": moment = 3; break;
    case "gggg": moment = 3; break;
    case "hhhh": moment = 3; break;
    case "iiii": moment = 3; break;
    case "jjjj": moment = 3; break;
    case "kkkk": moment = 3; break;
    case "llll": moment = 3; break;
    case "mmmm": moment = 3; break;
    case "nnnn": moment = 3; break;
    
    default: 
        show_message("case " + string(argument0) + " not found in scr_time_db(), bort is setting it to 65535 on a whim");
        moment = 65535;
        break;
        
}

return (moment - 1);
