//Run Marquee("init"); once at start of game (already done)
//Add new lines by changing what's in DATA

//EXTERNAL COMMANDS (The only commands needed outside this script)
//Marquee("queue custom", "Text", c_white); - For custom marquee messages
//Marquee("queue hit");                     - For when hoopz is hit
//Marquee("queue encounter", "Enemy Name"); - For the random time you see an enemy
//feature uneditable queues

if (argument[0] == "data")
{
    //LINES MUST BE AT LEAST 7 CHARACTERS AND SHOULD NOT EXCEED 40
    
    /////////////// ACTIVE LISTS - All active lists must be placed here ///////////////
    //Cuchulainn
    Marquee("add list", "Cuchulainn", global.textcolorCuchulainn, 1);
    Marquee("add line", "Cuchulainn", "Beauhiehiehie!");
    Marquee("add line", "Cuchulainn", "K'wahuwehuwehuwe!");
    Marquee("add line", "Cuchulainn", "Gweuheuheuheu!");
    Marquee("add line", "Cuchulainn", "Have a ROTTEN day!");
    Marquee("add line", "Cuchulainn", "You'll never stop me!");
    
    //Hoopz Banter
    Marquee("add list", "Hoopz Banter", global.textcolorHoopzBanter, 1); //merge_color(c_white, c_purple, .5), 1);
    Marquee("add line", "Hoopz Banter", "I want candy...");
    Marquee("add line", "Hoopz Banter", "I like vidcons.");
    Marquee("add line", "Hoopz Banter", "I like bikes.");
    Marquee("add line", "Hoopz Banter", "Who... am I?"); //only if not known
    Marquee("add line", "Hoopz Banter", "Gamers MUST unite.");
    Marquee("add line", "Hoopz Banter", "Ugh. This is so hard.");
    Marquee("add line", "Hoopz Banter", "Do I get a prize too?");
    Marquee("add line", "Hoopz Banter", "Heh.");
    
    /////////////////////////
    // Hoopz Quest Tracker //
    /////////////////////////
        
    Marquee("add list", "Quest", global.textcolorSidequest, 1); //merge_color(c_white, c_yellow, .5), 1);
    
    // NOTE: Only quest variables can be checked here, no time db, or other checks
    // All quest checks MUST be true for it to do the quest marquee
    
    //////////////////////////////////////////////////////////////////
    //@@@@@@@@          TIR NA NOG MARQUEES
    //////////////////////////////////////////////////////////////////
    
    // Wilmer Quest //
    Marquee("add line", "Quest", "I need to pay Mr. Wilmer's rent!", 
        "wilmerEvict", "==", "1",
        "mortgageDoorRealize", "==", "0");
        
    Marquee("add line", "Quest", "I forgot to pay the rent! I gotta check on Wilmer.", 
        "wilmerEvict", "==", "1",
        "mortgageDoorRealize", "==", "1");
        
    // LONGINUS
    Marquee("add line", "Quest", "I wonder where LONGINUS is?", 
        "knowLONGINUSTnn", "==", "1");
    Marquee("add line", "Quest", "I need to get to the LONGINUS door... The sewers?", 
        "knowLONGINUSTnn", "==", "2");
    Marquee("add line", "Quest", "Dr. Liu wants some Duergar urine.",
        "govQuest", "==", "2");
    Marquee("add line", "Quest", "Time to get the golden vial to Dr. Liu.",
        "govQuest", "==", "3");
    //Marquee("add line", "Quest", "There's a new governor in town... ME! A speech is in order.",
    //    "govQuest", "==", "5");
    Marquee("add line", "Quest", "I need the dossier from the Governor's Mansion!",
        "govQuest", "==", "5");
        
    // LUGNER
    Marquee("add line", "Quest", "I should talk to Guiseppi at the church.",
        "lugnerQuest", "==", "3");
    Marquee("add line", "Quest", "I need to meet Slag at the Warehouse.",
        "lugnerQuest", "==", "5");
    Marquee("add line", "Quest", "I need to meet Lugner at the Warehouse.",
        "lugnerQuest", "==", "6");
        
    // GUTTERHOUND
    Marquee("add line", "Quest", "Gotta find a safehouse for Gutterhound, he's robbing the bank soon.",
        "gutterhoundQuest", "==", "4");
    Marquee("add line", "Quest", "OK, got the safe house for Gutter. I need to get back to him soon.",
        "gutterhoundQuest", "==", "5");
    Marquee("add line", "Quest", "Flub the safe house. I need to get back to Gutterhound soon.",
        "gutterhoundQuest", "==", "6");
        
    // ADBUL GAFUR
    Marquee("add line", "Quest", "I wonder if Abdul-Gafur has that item ready for me...",
        "abdulOffer", "==", "5");
    Marquee("add line", "Quest", "I wonder if Abdul-Gafur has that spear ready for me...",
        "abdulOffer", "==", "6");
    Marquee("add line", "Quest", "Ugh, now I need to find Zola, what a scam!",
        "abdulOffer", "==", "7");
    
    // BBTX
    Marquee("add line", "Quest", "I wonder if I should get back and help Uschi get a bball game together.",
        "uschiState", "==", "1");
    Marquee("add line", "Quest", "Gotta find a 3rd baller for the bball game!",
        "uschiBall", "==", "2");
    Marquee("add line", "Quest", "Now I gotta challenge a Duergar to a bball game! Mamma Mia!",
        "uschiBall", "==", "3");
    Marquee("add line", "Quest", "Gotta let Uschi know the Duergars will play a bball game!",
        "uschiBall", "==", "4");
        
    // Add in hook where you know of rebels
    
    // Gelasio and Jindrich
    Marquee("add line", "Quest", "Should I approach Gelasio about his 'shady dealings'?", 
        "gelasioDuergar", "==", "2",
        "gelasioState", "<", "4");
    Marquee("add line", "Quest", "I wonder if I can find more info for Gelasio...", 
        "gelasioState", "==", "2");
    Marquee("add line", "Quest", "I agreed to look for Augustine for Gelasio.", 
        "gelasioState", "==", "3");
    Marquee("add line", "Quest", "I found Augustine! I should tell Gelasio.", 
        "baldoState", "==", "4");
    
    // Kelpster //
    Marquee("add line", "Quest", "Hmmm... Fruits for Kelpster...", 
        "kelpsterState", "==", "2",
        "fruitbasketTake", "!=", "2");
    
    // Community Service - Cornrow and Juicebox //
    Marquee("add line", "Quest", "There's fruits at Granny's house...", 
        "comServ", "==", "2",
        "fruitbasketTake", "==", "0");
        
    Marquee("add line", "Quest", "These fruits will feed a lot of kids!", 
        "comServ", "==", "2",
        "fruitbasketTake", "==", "1",
        "kelpsterFruit", "==", "0");
        
    Marquee("add line", "Quest", "The Candy Shop has Juicebox's change...", 
        "comServ", "==", "4");
        
    Marquee("add line", "Quest", "I should return Juicebox's change...", 
        "comServ", "==", "5");
        
    Marquee("add line", "Quest", "The church Granny needs her medicine.", 
        "comServ", "==", "6",
        "vivianState", "==", "0");
    Marquee("add line", "Quest", "Vivian needs her medicine.", 
        "comServ", "==", "6",
        "vivianState", ">=", "1");
        
    Marquee("add line", "Quest", "I better return to Mr. Cornrow.", 
        "comServ", "==", "7");
        
    // Eric Pet Quest //
    // ericQuest = 2 is Eric's quest has been accepted.
    Marquee("add line", "Quest", "I wonder if anyone is hiring?", 
        "ericQuest", "==", "2");
    // ericQuest = 3 is you've found the pet store and talked to the owner.
    // ericQuest = 4 is you've told Eric about the resume but still need to do it.
    Marquee("add line", "Quest", "I found a place for Eric to work!", 
        "ericQuest", ">=", "3",
        "ericQuest", "<=", "4");
    // ericQuest = 5 is you've finished the resume.
    Marquee("add line", "Quest", "Time to hand in Eric's resume...", 
        "ericQuest", "==", "5");
    // ericQuest = 6 is cuthbert hated your resume. (not hired)
    // ericFailed = 1 when you broke the bad news
    Marquee("add line", "Quest", "Yipe! Eric isn't going to be happy...", 
        "ericQuest", "==", "6",
        "ericFailed", "==", "0");
    // ericQuest = 7 is cuthbert liked the resume a little. (hired)
    // ericQuest = 8 is cuthbert liked the resume a lot. (hired)
    Marquee("add line", "Quest", "I can't wait to share the good news with Eric!", 
        "ericQuest", ">=", "7",
        "ericQuest", "<=", "8");

    //Cyberspear Quest
    Marquee("add line", "Quest", "Gotta find the AI Ruins!", "csQuest", "==", "1");
    Marquee("add line", "Quest", "Somewhere in the AI Ruins is the Cyberspear!", "csQuest", "==", "2");
    Marquee("add line", "Quest", "Gotta tell Cyberdwarf the altar is empty!", "csQuest", "==", "4");
    Marquee("add line", "Quest", "I wonder how deep the Cyberspear Rabbit Hole Goes...", "csQuest", "==", "5");
    Marquee("add line", "Quest", "Cyberdwarf will be so proud I got part of the Cyberspear.", "csQuest", "==", "7");
    
    //Duergars
    Marquee("add line", "Quest", "I wonder where I can get those Garlics for Jeltsje.", "jeltsjeGarlics", "==", "1");
        
    //Cyberdwarf
    Marquee("add list", "Cyberdwarf", global.textcolorCyberdwarf, 1);
    Marquee("add line", "Cyberdwarf", "It'sa me, Cyberdwarf.");
    Marquee("add line", "Cyberdwarf", "Cuchulainn can go suck an egg.");
    Marquee("add line", "Cyberdwarf", "Only applebottoms.");
    Marquee("add line", "Cyberdwarf", "Remember to floss.");
    
    //Random / Flavor Text
    Marquee("add list", "Random", global.textcolorFlavor, 1);
    Marquee("add line", "Random", "A tingle runs down your spine.");
    Marquee("add line", "Random", "The air has a dank smell.");
    Marquee("add line", "Random", "You take a deep breath.");
    Marquee("add line", "Random", "A breeze passes over.");
    Marquee("add line", "Random", "Something feels off.");
    Marquee("add line", "Random", "You redouble your efforts.");
    Marquee("add line", "Random", "You gather your thoughts.");
    Marquee("add line", "Random", "Tick tock.");
    Marquee("add line", "Random", "Who let the dogs in?");
    
    //Quotes
    Marquee("add list", "Quote", global.textcolorQuote, 1);
    Marquee("add line", "Quote", "Fortune favors the bold.");
    Marquee("add line", "Quote", "The only constant is change.");
    Marquee("add line", "Quote", "You don't need a reason to help people.");
    Marquee("add line", "Quote", "Where's the beef?");
    Marquee("add line", "Quote", "Favorite sport: badminton.");
    Marquee("add line", "Quote", "Stay frosty.");
    Marquee("add line", "Quote", "Welcome to the Dungle.");
    
    //Curses
    Marquee("add list", "Curses", global.textcolorCurses, 1);
    Marquee("add line", "Curses", "You are still cursed by the mummy.", "curseMummy", "!=", "0");
    Marquee("add line", "Curses", "You can't escape what's inside you... MORGELLONS.", "curseMorgellons", "!=", "0");
    
    //Time - Do not edit or move, the text used for time is found under the "queue" section of this script
    Marquee("add list", "Time", global.textcolorTime, 1);
    Marquee("add line", "Time", "DO TIME");
    
    /////////////// INACTIVE LISTS - All inactive lists must be placed after all active lists have been declared ///////////////
    //Hoopz Hit
    Marquee("add list", "Hoopz Hit", global.textcolorHoopzDamage, 1); //merge_color(c_white, c_purple, .5), 0);
    Marquee("add line", "Hoopz Hit", "I'm hit!");
    Marquee("add line", "Hoopz Hit", "Ughhhh!");
    Marquee("add line", "Hoopz Hit", "Ouchie!");
    
    //Hoopz Candy
    Marquee("add list", "Hoopz Candy", global.textcolorHoopzCandy, 1); //merge_color(c_white, c_purple, .5), 0);
    Marquee("add line", "Hoopz Candy", "Gulp!!!");
    Marquee("add line", "Hoopz Candy", "Munch!!!");
    Marquee("add line", "Hoopz Candy", "Chomp!!!");
    
    //Encounter
    Marquee("add list", "Encounter", global.textcolorEncounter, 0);
    Marquee("add line", "Encounter", "A <0> approaches.");
    Marquee("add line", "Encounter", "A <0> appears.");
    Marquee("add line", "Encounter", "You see a <0>.");
}
else if (argument[0] == "init")
{
    global.marqueeScroll = 0; //don't edit
    // global.marqueeSpeed = 3.0; // In Settings()
    global.marqueeMap = ds_map_create();
    global.marqueeName = ds_list_create();
    global.marqueeLineList = ds_list_create();
    global.marqueeLineListIndex = ds_list_create();
    global.marqueeColor = ds_list_create();
    global.marqueeType = ds_list_create();
    //global.marqueeList[0] = -1; //EXPERIMENTAL
    global.marqueeQuest[0, 0] = ""; //IF VARIABLE
    global.marqueeEqual[0, 0] = ""; //< OR == OR >
    global.marqueeValue[0, 0] = ""; //VALUE
    for (_i = 0; _i < 3; _i += 1) global.marqueeVisible[_i] = 1;
    
    global.marqueeQueueText = ds_list_create();
    global.marqueeQueueColor = ds_list_create();
    global.marqueeQueueType = ds_list_create();
    global.marqueeQueueForce = ds_list_create();
    
    //make list for conditions, default is always show but you can specify
    //global.marqueeList = ds_list_create(); //Only for normal lists - lines has lines lists
    global.marqueeLists = 0; //first list relation id is actually 1 because find map fail is 0
    global.marqueeListsInactive = 0;
    global.marqueeListsActive = 0;
    global.marqueeLines = 0; //Increments every time a line is added
    global.marqueeLast = ""; //Contains the ID of the last normal list used
    //what about a last for dynamic? ie. 6 kobolds appear
    
    Marquee("data");
}
else if (argument[0] == "add list") //1 = Name, 2 = Color, Arg3 = Active
{
    //Needs to return an ID because I may have multiple properties
    _lst = ds_list_create();
    _ist = ds_list_create();
    ds_list_add(global.marqueeLineList, _lst);
    ds_list_add(global.marqueeLineListIndex, _ist);
    ds_list_add(global.marqueeName, argument[1]);
    ds_list_add(global.marqueeColor, argument[2]);
    //ds_list_add(global.marqueeType, argument[2]);
    ds_map_add(global.marqueeMap, argument[1], global.marqueeLists + 1);
    global.marqueeLists += 1;
    if (argument[3] == 0) global.marqueeListsInactive += 1;
    else global.marqueeListsActive += 1;
    return _lst;
}
else if(argument[0] == "add line") //Arg1 = Name, Arg2 = Color, Arg3 = Variable, Arg4 = Equal, Arg5 = Value
{
    _ind = ds_map_find_value(global.marqueeMap, argument[1]);
    if (_ind <= 0) { show_error("ERROR: Marquee('add line') - " + argument[1] + " line list doesn't exist.", 0); exit; }
    _ind -= 1;
    _nam = ds_list_find_value(global.marqueeName, _ind);
    //show_message(_nam + " : " + argument[2]);
    ds_list_add(ds_list_find_value(global.marqueeLineList, _ind), argument[2]);
    ds_list_add(ds_list_find_value(global.marqueeLineListIndex, _ind), global.marqueeLines);
    global.marqueeQuest[0, global.marqueeLines] = "";
    global.marqueeEqual[0, global.marqueeLines] = "";
    global.marqueeValue[0, global.marqueeLines] = "";
    global.marqueeQuest[1, global.marqueeLines] = "";
    global.marqueeEqual[1, global.marqueeLines] = "";
    global.marqueeValue[1, global.marqueeLines] = "";
    global.marqueeQuest[2, global.marqueeLines] = "";
    global.marqueeEqual[2, global.marqueeLines] = "";
    global.marqueeValue[2, global.marqueeLines] = "";
    if (argument_count > 3) //Conditional add line
    {
        global.marqueeQuest[0, global.marqueeLines] = argument[3];
        global.marqueeEqual[0, global.marqueeLines] = argument[4];
        global.marqueeValue[0, global.marqueeLines] = argument[5];
    }
    if (argument_count > 6)
    {
        global.marqueeQuest[1, global.marqueeLines] = argument[6];
        global.marqueeEqual[1, global.marqueeLines] = argument[7];
        global.marqueeValue[1, global.marqueeLines] = argument[8];
    }
    if (argument_count > 9)
    {
        global.marqueeQuest[2, global.marqueeLines] = argument[9];
        global.marqueeEqual[2, global.marqueeLines] = argument[10];
        global.marqueeValue[2, global.marqueeLines] = argument[11];
    }
    global.marqueeLines += 1;
}
else if (argument[0] == "evaluate") //Arg1 = Line Index
{
    if (Marquee("evaluate index", argument[1], 0) && 
        Marquee("evaluate index", argument[1], 1) &&
        Marquee("evaluate index", argument[1], 2)) return 1;
    return 0;
}
else if (argument[0] == "evaluate index") //Arg1 = Line Index | Returns true or false
{
    _lid = argument[1];
    _eid = argument[2];
    if (global.marqueeQuest[_eid, _lid] == "") return 1;
    _var = real(scr_quest_get_state(global.marqueeQuest[_eid, _lid]));
    if (global.marqueeQuest[_eid, _lid] == "clocktime") _var = ClockTime("get");
    _val = real(global.marqueeValue[_eid, _lid]);
    //show_message(string(_var) + " / " + string(_val));
    if (global.marqueeEqual[_eid, _lid] == "<") { if (_var < _val) return 1; }
    if (global.marqueeEqual[_eid, _lid] == "<=") { if (_var <= _val) return 1; }
    if (global.marqueeEqual[_eid, _lid] == "==" || global.marqueeEqual[_lid] == "=") { if (_var == _val) return 1; }
    if (global.marqueeEqual[_eid, _lid] == "!=") { if (_var != _val) return 1; }
    if (global.marqueeEqual[_eid, _lid] == ">") { if (_var > _val) return 1; }
    if (global.marqueeEqual[_eid, _lid] == ">=") { if (_var >= _val) return 1; }
    return 0;
}
else if (argument[0] == "queue custom") //Arg1 = Text, Arg2 = Color
{
    //Obsolete, should always specify marquee lines in a list for easier tracking of all game marquees
    Marquee("queue", string(floor(random(10000000))), argument[1], argument[2]);
}
else if (argument[0] == "queue normal") //adds a normal marquee thing from the list
{
    //Get random baseline
    did = 0;
    while (did == 0)
    {
        if (random(100) < global.settingMarqueeQuest) _ind = ds_list_find_index(global.marqueeName, "Quest");
        else _ind = floor(random(global.marqueeListsActive));
        _nam = ds_list_find_value(global.marqueeName, _ind);
        while (global.marqueeLast == _nam)
        {
            _ind = floor(random(global.marqueeListsActive));
            _nam = ds_list_find_value(global.marqueeName, _ind);
        }
        _lst = ds_list_find_value(global.marqueeLineList, _ind);
        _ist = ds_list_find_value(global.marqueeLineListIndex, _ind);
        _cst = ds_list_find_value(global.marqueeColor, _ind);
        //_tst = ds_list_find_value(global.marqueeType, _ind);
        var _try = 0;
        while (_try < 20) // Quest will need to retry on failed, which is where 20 comes from
        {
            _ind = floor(random(ds_list_size(_lst)));
            if (Marquee("evaluate", ds_list_find_value(_ist, _ind)))
            {
                did = Marquee("queue", _nam, ds_list_find_value(_lst, _ind), _cst);
                break;
            }
            _try += 1;
        }
    }
    global.marqueeLast = _nam;
    //add time as well
}
else if (argument[0] == "queue line" || argument[0] == "force line") //Arg1 = List name to queue a line from, Arg2 = Replace text
{
    if (argument[0] == "force line") _force = 1; else _force = 0;
    _nam = argument[1];
    _ind = ds_map_find_value(global.marqueeMap, _nam); //Get list from map
    if (_ind <= 0) { show_error("ERROR: Marquee('queue line') - " + argument[1] + " line list doesn't exist.", 0); exit; }
    _ind -= 1;
    _col = ds_list_find_value(global.marqueeColor, _ind);
    _lst = ds_list_find_value(global.marqueeLineList, _ind); //Points to line list
    _ist = ds_list_find_value(global.marqueeLineListIndex, _ind); //Gets evaluation ID
    
    _ind = floor(random(ds_list_size(_lst))); //Pick line from line ist
    //show_message("LINE ID = " + string(ds_list_find_value(_lst, _ind)));
    if (Marquee("evaluate", ds_list_find_value(_ist, _ind)))
    {
        _str = ds_list_find_value(_lst, _ind);
        if (argument_count >= 3) _str = string_replace(_str, "<0>", argument[2]);
        Marquee("queue", _nam, _str, _col, _force);
    }
}
else if (argument[0] == "queue encounter")
{
    //if (global.marqueeLast == "hit") exit;
    global.marqueeLast = "encounter";
    _str = choose("A <e> approaches.", "A <e> appears.");
    _str = string_replace(_str, "<e>", argument[1]);
    Marquee("queue", "encounter", _str, c_yellow);
}
else if (argument[0] == "queue exception")
{
    //All exception texts go here
}
else if (argument[0] == "queue") //1 = Text, 2 = Color
{
    //When queueing ANYTHING, check conditions
    //Queue can take a direct quote or you can specify a list ie. hoopz banter
    //Queue will only ever add 
    //You can NEVER replace the first value, only the second value
    //possibly add name to this and check marquee last from here
    if (argument_count == 5) _force = argument[4]; else _force = 0;
    _typ = string_upper(argument[1]);
    _txt = string_upper(argument[2]);
    _col = argument[3];
    if (_txt == "DO TIME") _txt = "THE TIME IS " + ClockTime("time");
    if (ds_list_size(global.marqueeQueueText) == 0)
    {
        ds_list_add(global.marqueeQueueType, _typ);
        ds_list_add(global.marqueeQueueText, _txt);
        ds_list_add(global.marqueeQueueColor, _col);
        ds_list_add(global.marqueeQueueForce, _force);
        return 1;
    }
    else if (ds_list_size(global.marqueeQueueText) == 1)
    {
        //Get last DS value, and only add if not same
        if (ds_list_find_value(global.marqueeQueueType, 0) != _typ)
        {
            ds_list_add(global.marqueeQueueType, _typ);
            ds_list_add(global.marqueeQueueText, _txt);
            ds_list_add(global.marqueeQueueColor, _col);
            ds_list_add(global.marqueeQueueForce, _force);
            return 1;
        }
        else return 0;
        
    }
    else //2 always
    {
        //Replace the last one
        //if 1 isn't visible, replace 2
        if (global.marqueeVisible[1] == 0)
        {
            if (_force || (ds_list_find_value(global.marqueeQueueType, 0) != _typ && ds_list_find_value(global.marqueeQueueType, 2) != _typ))
            {
                if (ds_list_find_value(global.marqueeQueueForce, 1) == 0 || is_undefined(ds_list_find_value(global.marqueeQueueForce, 1)))
                {
                    ds_list_replace(global.marqueeQueueType, 1, _typ);
                    ds_list_replace(global.marqueeQueueText, 1, _txt);
                    ds_list_replace(global.marqueeQueueColor, 1, _col);
                    ds_list_replace(global.marqueeQueueForce, 1, _force);
                    return 1;
                }
            }
            //Copied
            if (_force || (ds_list_find_value(global.marqueeQueueType, 1) != _typ))
            {
                if (ds_list_find_value(global.marqueeQueueForce, 2) == 0 || is_undefined(ds_list_find_value(global.marqueeQueueForce, 2)))
                {
                    ds_list_delete(global.marqueeQueueType, 2);
                    ds_list_delete(global.marqueeQueueText, 2);
                    ds_list_delete(global.marqueeQueueColor, 2);
                    ds_list_delete(global.marqueeQueueForce, 2);
                    ds_list_add(global.marqueeQueueType, _typ);
                    ds_list_add(global.marqueeQueueText, _txt);
                    ds_list_add(global.marqueeQueueColor, _col);
                    ds_list_add(global.marqueeQueueForce, _force);
                    return 1;
                }
            }
        }
        else
        {
            if (_force || (ds_list_find_value(global.marqueeQueueType, 1) != _typ))
            {
                if (ds_list_find_value(global.marqueeQueueForce, 2) == 0 || is_undefined(ds_list_find_value(global.marqueeQueueForce, 2)))
                {
                    ds_list_delete(global.marqueeQueueType, 2);
                    ds_list_delete(global.marqueeQueueText, 2);
                    ds_list_delete(global.marqueeQueueColor, 2);
                    ds_list_delete(global.marqueeQueueForce, 2);
                    ds_list_add(global.marqueeQueueType, _typ);
                    ds_list_add(global.marqueeQueueText, _txt);
                    ds_list_add(global.marqueeQueueColor, _col);
                    ds_list_add(global.marqueeQueueForce, _force);
                    return 1;
                }
            }
        }
        return 0;
        
    }
}
else if (argument[0] == "draw")
{
    if (string(Quest("marqueeBossName")) != "0") { Marquee("draw boss"); return 1; }
    //Draw will pull new quotes as needed, and if certain conditions are met you can have
    //quotes that always appear like curses or other exceptions
    //as the queue is about to reach the end, it adds a new normal
    var txtAlp = 1;
    if (argument_count > 1) txtAlp = argument[1];
    while (ds_list_size(global.marqueeQueueText) < 3) Marquee("queue normal");
    
    draw_set_font(global.fn_3);
    draw_set_halign(0);
    draw_set_valign(0);
    
    _str0 = ds_list_find_value(global.marqueeQueueText, 0);
    _col0 = ds_list_find_value(global.marqueeQueueColor, 0);
    _str1 = ds_list_find_value(global.marqueeQueueText, 1);
    _col1 = ds_list_find_value(global.marqueeQueueColor, 1);
    _str2 = ds_list_find_value(global.marqueeQueueText, 2);
    _col2 = ds_list_find_value(global.marqueeQueueColor, 2);
    
    //if (keyboard_check(vk_control) == 0) 
    draw_set_alpha(txtAlp);
    draw_set_color(_col0);
    draw_text(floor(x + 236 + global.marqueeScroll), y + 27, _str0);
    draw_set_color(c_white);
    draw_text(floor(x + 236 + global.marqueeScroll) + string_width(_str0), y + 27, "     ");
    draw_set_color(_col1);
    draw_text(floor(x + 236 + global.marqueeScroll) + string_width(_str0 + "     "), y + 27, _str1);
    draw_set_color(c_white);
    draw_text(floor(x + 236 + global.marqueeScroll) + string_width(_str0 + "     ") + string_width(_str1), y + 27, "     ");
    draw_set_color(_col2);
    draw_text(floor(x + 236 + global.marqueeScroll) + string_width(_str0 + "     ") + string_width(_str1 + "     "), y + 27, _str2);
    draw_set_color(c_white);
    draw_text(floor(x + 236 + global.marqueeScroll) + string_width(_str0 + "     ") + string_width(_str1 + "     " + _str2), y + 27, "     ");
    draw_set_alpha(1);
    
    if (!paused()) global.marqueeScroll -= dt() * global.settingMarqueeSpeed;
    //if (keyboard_check(vk_control)) scroll -= dt() * global.marqueeSpeed;
    for (_i = 0; _i < 3; _i += 1) global.marqueeVisible[_i] = 0;
    global.marqueeVisible[0] = 1;
    if (abs(global.marqueeScroll) > string_width(_str0 + "     ") - 140) 
    {
        global.marqueeVisible[1] = 1;
    }
    if (abs(global.marqueeScroll) > string_width(_str0 + "     ") + string_width(_str1 + "     ") - 140) 
    {
        global.marqueeVisible[1] = 2;
    }
    if (abs(global.marqueeScroll) > string_width(_str0 + "     "))
    {
        global.marqueeScroll = 0;
        ds_list_delete(global.marqueeQueueType, 0);
        ds_list_delete(global.marqueeQueueText, 0);
        ds_list_delete(global.marqueeQueueColor, 0);
        ds_list_delete(global.marqueeQueueForce, 0);
        //Marquee("add normal");
    }
    draw_set_color(c_white); //fix for swapping guns text color
}
else if (argument[0] == "create")
{
    draw_set_font(global.fn_3);
    bbrSur = -1;
    bbrFor = -1;
    bbrPctLst = 1;
    bbrPct = 1;
    bbrX = 222;
    bbrY = 26;//226; <--- standalone
    bbrW = 154;
    bbrH = 8;
    bbrColBak = c_black;
    bbrColFil = merge_color(c_red, c_white, 0.2);
    
    bbrTxt = "BOSS ";
    bbrTxtPos = 0;
    bbrTxtWid = string_width(bbrTxt);
    bbrTxtSpd = 10; // Pixels per second
    bbrTxtCol = c_yellow;
    bbrTxtColBak = make_color_rgb(32, 32, 32);
    
    bbrHit = 0;
    bbrMrg = 0.33;
}
else if (argument[0] == "room end")
{
    Quest("marqueeBossName", 0);
    if (surface_exists(bbrSur)) surface_free(bbrSur);
    if (surface_exists(bbrFor)) surface_free(bbrFor);
}
else if (argument[0] == "draw boss")
{
    draw_set_font(global.fn_3);
    
    //show_debug_message("Marquee('boss hp') - DRAWING BOSS HP");
    bbrTxt = Quest("marqueeBossName");
    bbrPct = Quest("marqueeBossHealth");
    bbrTxtWid = string_width(bbrTxt); // added
    
    // Real code
    draw_set_alpha(1);
    bbrPct = clamp(bbrPct, 0, 1);
    bbrRct = abs(1 - bbrPct);
    
    if (!paused()) 
    {
        if (bbrHit > 0)
        {
            bbrHit = Goto(bbrHit, 0, dt_sec() * 4);
            if (bbrHit == 0) bbrPctLst = bbrPct;
        }
    }
    if (bbrPct != bbrPctLst) { if (bbrHit == 0) bbrHit = 1; }
    
    // Background
    if (surface_exists(bbrSur) == 0) bbrSur = surface_create(bbrW, bbrH);
    surface_set_target(bbrSur);
    draw_clear(merge_color(bbrColBak, c_white, bbrHit * bbrMrg));
    draw_set_color(merge_color(bbrTxtColBak, c_white, bbrHit * bbrMrg));
    draw_text(-bbrTxtWid + bbrTxtPos, 1, string_repeat(bbrTxt, 5));
    bbrTxtPos += dt_sec() * bbrTxtSpd;
    if (abs(bbrTxtPos) > bbrTxtWid) bbrTxtPos -= bbrTxtWid;
    surface_reset_target();
    
    // Foreground
    if (surface_exists(bbrFor) == 0) bbrFor = surface_create(bbrW, bbrH);
    surface_set_target(bbrFor);
    draw_clear(merge_color(bbrColFil, c_white, bbrHit * bbrMrg));
    draw_set_color(merge_color(bbrTxtCol, c_white, bbrHit * bbrMrg));
    draw_text(-bbrTxtWid + bbrTxtPos, 1, string_repeat(bbrTxt, 5));
    bbrTxtPos += dt_sec() * bbrTxtSpd;
    if (abs(bbrTxtPos) > bbrTxtWid) bbrTxtPos -= bbrTxtWid;
    surface_reset_target();
    
    // Draw
    draw_surface(bbrSur, x + bbrX, y + bbrY);
    draw_surface_part(bbrFor, floor(bbrW * bbrRct), 0, bbrW - floor(bbrW * bbrRct), bbrH, x + bbrX + floor(bbrW * bbrRct), y + bbrY);
    draw_sprite_ext(s1x1, 0, x + bbrX + (abs(1 - bbrPctLst) * bbrW), y + bbrY, abs(bbrPct - bbrPctLst) * bbrW, bbrH, 0, c_white, bbrHit * 2);
}
