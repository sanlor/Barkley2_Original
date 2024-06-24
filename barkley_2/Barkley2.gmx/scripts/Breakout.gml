//Add breakouts, remove breakouts, draw all
if (is_real(argument[0])) // ds_list containing actions
{
    var siz = ds_list_size(argument[0]) - 1;
    if (siz == 1) Breakout(ds_list_find_value(argument[0], 1));
    if (siz == 2) Breakout(ds_list_find_value(argument[0], 1), ds_list_find_value(argument[0], 2));
    if (siz == 3) Breakout(ds_list_find_value(argument[0], 1), ds_list_find_value(argument[0], 2), ds_list_find_value(argument[0], 3));
    if (siz == 4) Breakout(ds_list_find_value(argument[0], 1), ds_list_find_value(argument[0], 2), ds_list_find_value(argument[0], 3), ds_list_find_value(argument[0], 4));
    if (siz == 5) Breakout(ds_list_find_value(argument[0], 1), ds_list_find_value(argument[0], 2), ds_list_find_value(argument[0], 3), ds_list_find_value(argument[0], 4), ds_list_find_value(argument[0], 5));
    if (siz == 6) Breakout(ds_list_find_value(argument[0], 1), ds_list_find_value(argument[0], 2), ds_list_find_value(argument[0], 3), ds_list_find_value(argument[0], 4), ds_list_find_value(argument[0], 5), ds_list_find_value(argument[0], 6));
    scr_event_advance(id);
    return 1;
}
else if (argument[0] == "build") // Shift functions to action
{
    var act = ds_list_create();
    ds_list_add(act, Breakout);
    if (argument_count > 1) ds_list_add(act, argument[1]);
    if (argument_count > 2) ds_list_add(act, argument[2]);
    if (argument_count > 3) ds_list_add(act, argument[3]);
    if (argument_count > 4) ds_list_add(act, argument[4]);
    if (argument_count > 5) ds_list_add(act, argument[5]);
    if (argument_count > 6) ds_list_add(act, argument[6]);
    if (argument_count > 7) ds_list_add(act, argument[7]);
    ds_list_add(_event_list, act);
    return ds_list_size(_event_list) - 1;
}
else if (argument[0] == "data")
{
    switch (argument[1]) //Specify sub-images and text here
    {
        case "money":
            _sub = 0; break;
        case "ducats":
            _sub = 8; break;
        case "hp":
            _sub = 2; break;
        case "arrows":
            _sub = 1; break;
        case "batteries":
            _sub = 3; break;
        case "Fiscian Gut's":
            _sub = 7; break;  
        case "chupCount":
            _txt = "Chups Left:" break;
        case "Bomb":
            _sub = 4; break;
        case "dwarfCustody":
            _txt = "Dwarves:"; break;
        case "W Fruit":
            _txt = "W Fruit:"; break;
        case "Dreadfruit":
            _txt = "Dreadfruit:"; break;
        case "Chup":
            _txt = "Chups:"; break;
        case "d:GLAZEr":
            _txt = "d:GLAZErs:"; break;
        case "powerGlaze":
            _txt = "GLAZE:"; break;
        case "govPolicyBalance":
            _txt = "Political capital:"; break;
        case "Influence Ovum":
            _txt = "Influence Ovums:"; break;
        /*  
        case "": break;
            _txt = "" break;
        */
    }
    
    if (argument[1] == "money") _val = scr_money_count();
    else if (argument[1] == "hp") _val = scr_stats_getCurrentStat(o_hoopz, STAT_CURRENT_HP);
    else if (Item("index", argument[1]) >= 0) _val = Item("count", argument[1]); //If it's an item get item count
    else _val = scr_quest_get_state(argument[1]); //If it's a quest get quest state
}
else if (argument[0] == "init")
{
    //Breakout X and Y are ultimately edited in Settings! so changing these won't do anything
    //EDIT BREAKOUT X AND Y IN --> Settings() <-- F12 in text to jump there
    
    global.breakoutYSpc = -20; //-48;
    global.breakouts = 0;
    global.breakoutValue = ds_list_create(); //value to retrieve, is also the name
    global.breakoutNew = 0;
    //global.breakoutIcon = ds_list_create(); //-1 is none, otherwise do icon
    for (_i = 0; _i < 10; _i += 1) global.breakoutChoice[_i] = ds_list_create(); //determines edit of value, 0 default
}
else if (argument[0] == "add")
{
    _ind = ds_list_find_index(global.breakoutValue, argument[1]);
    if (_ind == -1)
    {
        ds_list_add(global.breakoutValue, argument[1]);
        for (_i = 0; _i < 10; _i += 1) ds_list_add(global.breakoutChoice[_i], 0);
        for (_i = 0; _i + 2 < argument_count; _i += 1)
        {
            ds_list_replace(global.breakoutChoice[_i], global.breakouts, real(argument[2 + _i]));
        }
        global.breakouts += 1;
    }
    global.breakoutNew = 0;
}
else if (argument[0] == "edit")
{
    _ind = ds_list_find_index(global.breakoutValue, argument[1]);
    if (_ind != -1)
    {
        for (_i = 0; _i < 10; _i += 1) ds_list_replace(global.breakoutChoice[_i], _ind, 0);
        for (_i = 0; _i + 2 < argument_count; _i += 1)
        {
            ds_list_replace(global.breakoutChoice[_i], _ind, argument[2 + _i]);
        }
    }
    global.breakoutNew = 0;
}
else if (argument[0] == "remove")
{
    //Find value in list
    _ind = ds_list_find_index(global.breakoutValue, argument[1]);
    if (_ind != -1)
    {
        ds_list_delete(global.breakoutValue, _ind);
        for (_i = 0; _i < 10; _i += 1) ds_list_delete(global.breakoutChoice[_i], _ind);
        global.breakouts -= 1;
    }
    global.breakoutNew = 0;
}
else if (argument[0] == "clear")
{
    ds_list_clear(global.breakoutValue);
    for (_i = 0; _i < 10; _i += 1) ds_list_clear(global.breakoutChoice[_i]);
    global.breakouts = 0;
    global.breakoutNew = 0;
}
else if (argument[0] == "draw")
{
    if (global.breakouts == 0) exit;
    
    //Set prior values
    if (global.breakoutNew == 0)
    {
        for (_i = 0; _i < global.breakouts; _i += 1)
        {
            Breakout("data", ds_list_find_value(global.breakoutValue, _i));
            global.breakoutPrior[_i] = _val;
            global.breakoutSpeed[_i] = 0;
        }
        global.breakoutNew = 1;
    }
    
    draw_set_font(global.fn_2);
    _cho = argument[1];
    
    //Get width - If text
    _sub = -1;
    _val = 0;
    _txt = "";
    Breakout("data", ds_list_find_value(global.breakoutValue, 0));
    if (_txt == "") _bx1 = 83;//64 + 16 + 3; //128;
    else _bx1 = string_width(_txt + " " + string("000")) + 48 - 19; //value + valueTo
    
    _bx0 = view_xview[0] + global.breakoutX - _bx1;
    _by0 = view_yview[0] + global.breakoutY; //minus y based on how many items show
    
    _by1 = 40;
    //grow height based on how many items show
    
    //Draw bg (not border) based on breakouts
    _by0 -= 20 * (global.breakouts - 1);
    _by1 += 20 * (global.breakouts - 1);
    draw_spr_tiled(_bx0 + 4, _by0 + 4, _bx0 + _bx1 - 4, _by0 + _by1 - 4, global.dialogBG, 0, 0.75);
    
    //dy = _by0 - 17;
    dy = _by0 + 17;
    //dy += global.breakouts * abs(global.breakoutYSpc);
    for (_i = 0; _i < global.breakouts; _i += 1)
    {
        _sub = -1;
        _val = 0;
        _txt = "";
        Breakout("data", ds_list_find_value(global.breakoutValue, _i)); //_sub and _val
        
        //Set _val to wind up value
        if (_val != global.breakoutPrior[_i])
        {
            global.breakoutSpeed[_i] += dt_sec(); //(_val - global.breakoutPrior);
            if (global.breakoutSpeed[_i] >= 1)
            {
                global.breakoutPrior[_i] = _val;
                global.breakoutSpeed[_i] = 0;
            }
            _val = round(global.breakoutPrior[_i] + ((_val - global.breakoutPrior[_i]) * global.breakoutSpeed[_i]));
        }
        else
        {
            global.breakoutSpeed[_i] = 0;
        }
        
        if (_txt == "")
        {
            dx = _bx0 + 14;
            draw_sprite(s_breakout_icon, _sub, dx, dy - 3); //19 is the space eneded for an icon
            _spc = 19;
        }
        else
        {
            dx = _bx0 + 14;
            draw_text(dx, dy, _txt); //19 is the space eneded for an icon
            _spc = string_width(_txt) + 3; //icon is 16 + 3
        }
        
        //
        dx += _spc;
        //dy = _by0 + 17;
        draw_set_color(c_white);
        //if (icon == 0) dx += string_length(valueName + ": ");
        if (false) //method == 0)
        {
            draw_text(dx, dy, string(_val));
            if (_cho != -1)
            {
                if (ds_list_find_value(global.breakoutChoice[_cho], _i) != 0) //choice == 1) //comparer
                {
                    _vto = ds_list_find_value(global.breakoutChoice[_cho], _i);
                    dx += string_width(string(_val) + "  ");
                    draw_set_color(c_white);
                    draw_text(dx, dy, ">");
                    dx += string_width(">  ");
                    if (_val + _vto < _val) draw_set_color(c_red);
                    else draw_set_color(c_lime); //if (_val + _vto > _val) draw_set_color(c_lime);
                    //else draw_set_color(c_white);
                    draw_text(dx, dy, string(_val + _vto));
                }
            }
        }
        else //Replace
        {
            if (_txt == "") { dx += 18; draw_set_halign(1); }
            _did = 0;
            if (_cho != -1)
            {
                if (ds_list_find_value(global.breakoutChoice[_cho], _i) != 0) //choice == 1) //comparer
                {
                    _vto = ds_list_find_value(global.breakoutChoice[_cho], _i);
                    if (_val + _vto < _val) draw_set_color(c_red);
                    else draw_set_color(c_lime);
                    draw_text(dx, dy, string(_val + _vto));
                    _did = 1;
                }
            }
            if (_did == 0) draw_text(dx, dy, string(_val));
            if (_txt == "") { dx -= 18; draw_set_halign(0); }
        }
    
        dy += abs(global.breakoutYSpc);
        //_by0 += global.breakoutYSpc;
    }
    
    //Draw border (not bg) based on breakouts
    _bx1 = _bx0 + _bx1;
    _by1 = _by0 + _by1;
    
    //Edges
    draw_spr_tiled(_bx1 -16,_by0 +16,_bx1 ,_by1 -16,global.dialogEdge,0,1); //right
    draw_spr_tiled(_bx0 +16,_by0 ,_bx1 -16,_by0 +15,global.dialogEdge,1,1); //top
    draw_spr_tiled(_bx0 ,_by0 +8,_bx0 +15,_by1 -4,global.dialogEdge,2,1); //left
    draw_spr_tiled(_bx0 +16,_by1 -16,_bx1 -16,_by1 ,global.dialogEdge,3,1); //bottom
    
    //corners
    draw_sprite_ext(global.dialogCorner, 0, _bx1 - sprite_get_width(global.dialogCorner), _by0 , 1, 1, 0, c_white, 1); //top right
    draw_sprite_ext(global.dialogCorner, 1, _bx0 , _by0 , 1, 1, 0, c_white, 1); //top left
    draw_sprite_ext(global.dialogCorner, 2, _bx0 , _by1 - sprite_get_height(global.dialogCorner), 1, 1, 0, c_white, 1); //bottom left
    draw_sprite_ext(global.dialogCorner, 3, _bx1 - sprite_get_width(global.dialogCorner), _by1 - sprite_get_height(global.dialogCorner), 1, 1, 0, c_white, 1); //bottom right
    
    //scr_breakout_border(_bx0, _by0, _bx0 + _bx1, _by0 + _by1);
}
