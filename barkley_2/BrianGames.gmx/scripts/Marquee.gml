///not used in here















//Run Marquee("init"); once at start of game (already done)
//Add new lines by changing what's in DATA

//EXTERNAL COMMANDS (The only commands needed outside this script)
//Marquee("queue custom", "Text", c_white); - For custom marquee messages
//Marquee("queue hit");                     - For when hoopz is hit
//Marquee("queue encounter", "Enemy Name"); - For the random time you see an enemy

if (argument[0] == "data")
{
    
}
else if (argument[0] == "init")
{
    global.marqueeScroll = 0; //don't edit
    global.marqueeSpeed = 3.0; //edit this for marquee speed
    global.marqueeMap = ds_map_create();
    global.marqueeName = ds_list_create();
    global.marqueeLineList = ds_list_create();
    global.marqueeLineListIndex = ds_list_create();
    global.marqueeColor = ds_list_create();
    global.marqueeType = ds_list_create();
    //global.marqueeList[0] = -1; //EXPERIMENTAL
    global.marqueeVariable[0] = ""; //IF VARIABLE
    global.marqueeEqual[0] = ""; //< OR == OR >
    global.marqueeValue[0] = ""; //VALUE
    for (_i = 0; _i < 3; _i += 1) marqueeVisible[_i] = 1;
    
    global.marqueeQueueText = ds_list_create();
    global.marqueeQueueColor = ds_list_create();
    global.marqueeQueueType = ds_list_create();
    
    //make list for conditions, default is always show but you can specify
    //global.marqueeList = ds_list_create(); //Only for normal lists - lines has lines lists
    global.marqueeLists = 0; //first list relation id is actually 1 because find map fail is 0
    global.marqueeLines = 0; //Increments every time a line is added
    global.marqueeLast = ""; //Contains the ID of the last normal list used
    //what about a last for dynamic? ie. 6 kobolds appear
    
    //Cuchulainn
    Marquee("add list", "Cuchulainn", c_green);
    //global.cool = _lst;
    Marquee("add line", "Cuchulainn", "Beauhiehiehie!");
    Marquee("add line", "Cuchulainn", "K'wahuwehuwehuwe!");
    Marquee("add line", "Cuchulainn", "Gweuheuheuheu!");
    Marquee("add line", "Cuchulainn", "Have a ROTTEN day!");
    Marquee("add line", "Cuchulainn", "You'll never stop me!");
    
    //Hoopz Banter
    Marquee("add list", "Hoopz Banter", merge_color(c_white, c_purple, .5));
    Marquee("add line", "Hoopz Banter", "I want candy...");
    Marquee("add line", "Hoopz Banter", "I like vidcons.");
    Marquee("add line", "Hoopz Banter", "I like bikes.");
    Marquee("add line", "Hoopz Banter", "Who... am I?"); //only if not known
    Marquee("add line", "Hoopz Banter", "Gamers MUST unite.");
    Marquee("add line", "Hoopz Banter", "Hey Cuchulainn: get a grip!");
    
    //Cyberdwarf
    if (1)
    {
    Marquee("add list", "Cyberdwarf", c_orange);
    Marquee("add line", "Cyberdwarf", "It'sa me, Cyberdwarf.");
    Marquee("add line", "Cyberdwarf", "Cuchulainn can go suck an egg.");
    Marquee("add line", "Cyberdwarf", "Only apple bottoms.");
    }
    
    //Random / Flavor Text
    if (1)
    {
    Marquee("add list", "Random", c_white);
    Marquee("add line", "Random", "You feel a tingle down your spine.");
    Marquee("add line", "Random", "The air around you has a dank smell.");
    }
    
    //Quotes - ds_list_add(global.marqueeQuotes, "");
    if (1)
    {
    Marquee("add list", "Quote", c_white);
    Marquee("add line", "Quote", "Fortune favors the bold.");
    Marquee("add line", "Quote", "The only constant is change.");
    Marquee("add line", "Quote", "You don't need a reason to help people.");
    Marquee("add line", "Quote", "Where's the beef?");
    }
    
    //Time
    Marquee("add list", "Time", c_aqua);
    Marquee("add line", "Time", "DO TIME");
    
    //Curses
    Marquee("add list", "Curses", c_red);
    Marquee("add line", "Curses", "You are still cursed by the mummy.", "comServ", "!=", "0");
    //Marquee("add line", "Curses", "Something about morgellons.");
    
    //exit;
    //Hoopz Hit - ds_list_add(global.marqueeHoopzHit, "");
    //Marquee("add list");
    //ds_list_add(global.marqueeHoopzHit, "I'm hit!");
    //ds_list_add(global.marqueeHoopzHit, "Ugh!");
    //ds_list_add(global.marqueeHoopzHit, "Ouchie!");
    
    Marquee("queue normal");
    Marquee("queue normal");
    Marquee("queue normal");
}
else if (argument[0] == "add list") //1 = Name, 2 = Color
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
    return _lst;
}
else if(argument[0] == "add line")
{
    _ind = ds_map_find_value(global.marqueeMap, argument[1]);
    if (_ind <= 0) { show_message("ERROR: Marquee('add line') - " + argument[1] + " line list doesn't exist."); exit; }
    _ind -= 1;
    _nam = ds_list_find_value(global.marqueeName, _ind);
    //show_message(_nam + " : " + argument[2]);
    ds_list_add(ds_list_find_value(global.marqueeLineList, _ind), argument[2]);
    ds_list_add(ds_list_find_value(global.marqueeLineListIndex, _ind), global.marqueeLines);
    if (argument_count == 3)
    {
        global.marqueeVariable[global.marqueeLines] = "";
        global.marqueeEqual[global.marqueeLines] = "";
        global.marqueeValue[global.marqueeLines] = "";
    }
    else //Conditional add line
    {
        global.marqueeVariable[global.marqueeLines] = argument[3];
        global.marqueeEqual[global.marqueeLines] = argument[4];
        global.marqueeValue[global.marqueeLines] = argument[5];
    }
    global.marqueeLines += 1;
}
else if (argument[0] == "evaluate") //Arg1 = Line Index | Returns true or false
{
    _lid = argument[1];
    if (global.marqueeVariable[_lid] == "") return 1;
    _var = real(scr_quest_get_state(global.marqueeVariable[_lid]));
    _val = real(global.marqueeValue[_lid]);
    //show_message(string(_var) + " / " + string(_val));
    if (global.marqueeEqual[_lid] == "<") { if (_var < _val) return 1; }
    if (global.marqueeEqual[_lid] == "==") { if (_var == _val) return 1; }
    if (global.marqueeEqual[_lid] == "!=") { if (_var != _val) return 1; }
    if (global.marqueeEqual[_lid] == ">") { if (_var > _val) return 1; }
    return 0;
}
else if (argument[0] == "queue custom") //Arg1 = Text, Arg2 = Color
{
    Marquee("queue", string(floor(random(10000000))), argument[1], argument[2]);
}
else if (argument[0] == "queue normal") //adds a normal marquee thing from the list
{
    //Get random baseline
    did = 0;
    while (did == 0)
    {
        _ind = floor(random(global.marqueeLists));
        _nam = ds_list_find_value(global.marqueeName, _ind);
        while (global.marqueeLast == _nam)
        {
            _ind = floor(random(global.marqueeLists));
            _nam = ds_list_find_value(global.marqueeName, _ind);
        }
        _lst = ds_list_find_value(global.marqueeLineList, _ind);
        _ist = ds_list_find_value(global.marqueeLineListIndex, _ind);
        _cst = ds_list_find_value(global.marqueeColor, _ind);
        //_tst = ds_list_find_value(global.marqueeType, _ind);
        _ind = floor(random(ds_list_size(_lst)));
        if (Marquee("evaluate", ds_list_find_value(_ist, _ind)))
        {
            did = Marquee("queue", _nam, ds_list_find_value(_lst, _ind), _cst);
        }
    }
    global.marqueeLast = _nam;
    //add time as well
}
else if (argument[0] == "queue hit")
{
    //if (global.marqueeLast == "hit") exit;
    global.marqueeLast = "hit";
    Marquee("queue", "hit", choose("I'm hit!", "Ugh!", "Ouchie!"), merge_color(c_white, c_purple, .5));
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
    _typ = string_upper(argument[1]);
    _txt = string_upper(argument[2]);
    if (_txt == "DO TIME") _txt = "THE TIME IS " + ClockTime("time");
    if (ds_list_size(global.marqueeQueueText) == 0)
    {
        ds_list_add(global.marqueeQueueType, _typ);
        ds_list_add(global.marqueeQueueText, _txt);
        ds_list_add(global.marqueeQueueColor, argument[3]);
        return 1;
    }
    else if (ds_list_size(global.marqueeQueueText) == 1)
    {
        //Get last DS value, and only add if not same
        if (ds_list_find_value(global.marqueeQueueType, 0) != _typ)
        {
            ds_list_add(global.marqueeQueueType, _typ);
            ds_list_add(global.marqueeQueueText, _txt);
            ds_list_add(global.marqueeQueueColor, argument[3]);
            return 1;
        }
        else return 0;
        
    }
    else //2 always
    {
        //exit;
        //Replace the last one
        //if 1 isn't visible, replace 2
        if (marqueeVisible[1] == 0)
        {
            if (ds_list_find_value(global.marqueeQueueType, 0) != _typ && ds_list_find_value(global.marqueeQueueType, 2) != _typ)
            {
                //ds_list_delete(global.marqueeQueueType, 2);
                //ds_list_delete(global.marqueeQueueText, 2);
                //ds_list_delete(global.marqueeQueueColor, 2);
                ds_list_replace(global.marqueeQueueType, 1, _typ);
                ds_list_replace(global.marqueeQueueText, 1, _txt);
                ds_list_replace(global.marqueeQueueColor, 1, argument[3]);
                return 1;
            }
        }
        else
        {
            if (ds_list_find_value(global.marqueeQueueType, 1) != _typ)
            {
                ds_list_delete(global.marqueeQueueType, 2);
                ds_list_delete(global.marqueeQueueText, 2);
                ds_list_delete(global.marqueeQueueColor, 2);
                ds_list_add(global.marqueeQueueType, _typ);
                ds_list_add(global.marqueeQueueText, _txt);
                ds_list_add(global.marqueeQueueColor, argument[3]);
                return 1;
            }
        }
        return 0;
        
    }
}
else if (argument[0] == "draw")
{
    //Draw will pull new quotes as needed, and if certain conditions are met you can have
    //quotes that always appear like curses or other exceptions
    //as the queue is about to reach the end, it adds a new normal
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
    draw_set_color(_col0);
    draw_text(floor(x + 236 + global.marqueeScroll), y + 27, _str0);
    draw_set_color(c_white);
    draw_text(floor(x + 236 + global.marqueeScroll) + string_width(_str0), y + 27, " - ");
    draw_set_color(_col1);
    draw_text(floor(x + 236 + global.marqueeScroll) + string_width(_str0 + " - "), y + 27, _str1);
    draw_set_color(c_white);
    draw_text(floor(x + 236 + global.marqueeScroll) + string_width(_str0 + " - ") + string_width(_str1), y + 27, " - ");
    draw_set_color(_col2);
    draw_text(floor(x + 236 + global.marqueeScroll) + string_width(_str0 + " - ") + string_width(_str1 + " - "), y + 27, _str2);
    
    if (!scr_pause_isPaused()) global.marqueeScroll -= dt() * global.marqueeSpeed;
    //if (keyboard_check(vk_control)) scroll -= dt() * global.marqueeSpeed;
    for (_i = 0; _i < 3; _i += 1) marqueeVisible[_i] = 0;
    marqueeVisible[0] = 1;
    if (abs(global.marqueeScroll) > string_width(_str0 + " - ") - 140) 
    {
        marqueeVisible[1] = 1;
    }
    if (abs(global.marqueeScroll) > string_width(_str0 + " - ") + string_width(_str1 + " - ") - 140) 
    {
        marqueeVisible[1] = 2;
    }
    if (abs(global.marqueeScroll) > string_width(_str0 + " - "))
    {
        global.marqueeScroll = 0;
        ds_list_delete(global.marqueeQueueType, 0);
        ds_list_delete(global.marqueeQueueText, 0);
        ds_list_delete(global.marqueeQueueColor, 0);
        //Marquee("add normal");
    }
    while (ds_list_size(global.marqueeQueueText) < 3) Marquee("queue normal");
    draw_set_color(c_white); //fix for swapping guns text color
}
