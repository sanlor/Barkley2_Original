/// Map()
/*              COMMAND REFERENCE

                Area name    Sub
Map("add area", "world map", 0);

                Area name    Spr  X    Y    Variable      Compare  Value  Variable?      Compare?  Value?  Variable?      Compare?  Value?
Map("add icon", "world map", 0,   100, 100, "knowCdwarf", ">=",    "1");
You can have up to three compares per "add icon".
*/

// Map("init") - Call only once per game.
if (argument[0] == "init")
{
    global.mapDel = 0; // delta
    global.mapNam = ds_list_create();
    global.mapSub = ds_list_create();
    
    // Tir na Nog //
    Map("add area", "Tir na Nog", 2);
    // Kelpster
    Map("add icon", "Tir na Nog", sGormstone,    47,  71,  "kelpsterState", "==", "2", "fruitbasketTake", "!=", "2");
    
    // World Map //
    Map("add area", "World Map", 0);
    Map("add icon", "World Map", sMapIconQuestion,   166, 95);
    Map("add icon", "World Map", sMapIconCyberdwarf, 96,  32,  "knowCdwarfDojo", "==", 1, "x", "<", "4");
    Map("add icon", "World Map", sMapIconCyberdwarf, 50,  135, "knowCdwarfBrain", "==", 1);
    Map("add icon", "World Map", sMapIconHoopz,      211, 130, "room", "==", "rMap"); // For TnN use rooms to move Hoopz icon
    Map("add icon", "World Map", sMapIconHoopz,      98,  184, "area", "==", "sw1");
    Map("add icon", "World Map", sMapIconHoopz,      111, 92,  "area", "==", "tnn");
    // Map("add icon", "world map", 2, 211, 130, "area", "==", "swp"); // In game example
    
    Map("add area", "Sewers Floor 1", 1);
    //Map("add icon", "Sewers Floor 1", sMapIconHoopz, 155, 58);//, "room", "==", "r_swr_room", "x", ">", "500");
    Map("add icon", "Sewers Floor 1", sMapIconHoopz, 149, 32, "room", "==", "r_sw1_descent01"); //  - 
    Map("add icon", "Sewers Floor 1", sMapIconHoopz, 154, 58, "room", "==", "r_sw1_fishersCreek01"); //  - 
    Map("add icon", "Sewers Floor 1", sMapIconHoopz, 149, 88, "room", "==", "r_sw1_foyer01"); //  - 
    Map("add icon", "Sewers Floor 1", sMapIconHoopz, 106, 86, "room", "==", "r_sw1_end01"); //  - 
    Map("add icon", "Sewers Floor 1", sMapIconHoopz, 81, 98, "room", "==", "r_sw1_manholeWest01"); //  - 
    Map("add icon", "Sewers Floor 1", sMapIconHoopz, 160, 119, "room", "==", "r_sw1_center01"); //  - 
    Map("add icon", "Sewers Floor 1", sMapIconHoopz, 209, 119, "room", "==", "r_sw1_eastEdge01"); //  - 
    Map("add icon", "Sewers Floor 1", sMapIconHoopz, 200, 142, "room", "==", "r_sw1_secret01"); //  - 
    Map("add icon", "Sewers Floor 1", sMapIconHoopz, 243, 119, "room", "==", "r_sw1_treasureDwarf01"); //  - 
    Map("add icon", "Sewers Floor 1", sMapIconHoopz, 210, 87, "room", "==", "r_sw1_crossroads01"); //  - 
    Map("add icon", "Sewers Floor 1", sMapIconHoopz, 247, 98, "room", "==", "r_sw1_manholeEast01"); //  - 
    Map("add icon", "Sewers Floor 1", sMapIconHoopz, 248, 79, "room", "==", "r_sw1_baldomero01"); //  - 
    Map("add icon", "Sewers Floor 1", sMapIconHoopz, 248, 59, "room", "==", "r_sw1_closet01"); //  - 
    Map("add icon", "Sewers Floor 1", sMapIconHoopz, 225, 58, "room", "==", "r_sw1_elemental01"); //  - 
    Map("add icon", "Sewers Floor 1", sMapIconHoopz, 203, 58, "room", "==", "r_sw1_respawn01"); //  - 
    Map("add icon", "Sewers Floor 1", sMapIconHoopz, 157, 150, "room", "==", "r_sw1_rathell01"); //  - 
    Map("add icon", "Sewers Floor 1", sMapIconHoopz, 120, 182, "room", "==", "r_sw1_southEdge01"); //  - 
    Map("add icon", "Sewers Floor 1", sMapIconHoopz, 86, 159, "room", "==", "r_sw1_longWays01"); //  - 
    Map("add icon", "Sewers Floor 1", sMapIconHoopz, 53, 149, "room", "==", "r_sw1_gap01"); //  - 
    Map("add icon", "Sewers Floor 1", sMapIconHoopz, 55, 103, "room", "==", "r_sw1_gutterGate01"); //  - 
    Map("add icon", "Sewers Floor 1", sMapIconHoopz, 81, 126, "room", "==", "r_sw1_plantation02"); //  - 
    Map("add icon", "Sewers Floor 1", sMapIconHoopz, 117, 129, "room", "==", "r_sw1_pool01"); //  - 
    Map("add icon", "Sewers Floor 1", sMapIconHoopz, 243, 162, "room", "==", "r_sw1_floor2Access01"); // - 
    Map("add icon", "Sewers Floor 1", sMapIconHoopz, 265, 142, "room", "==", "r_sw1_utility01"); //  - 
    Map("add icon", "Sewers Floor 1", sMapIconHoopz, 265, 164, "room", "==", "r_sw1_joad01"); //  - 
    Map("add icon", "Sewers Floor 1", sMapIconHoopz, 125, 160, "room", "==", "r_sw1_darkestAlley01"); //  - 
    Map("add icon", "Sewers Floor 1", sMapIconHoopz, 243, 143, "room", "==", "r_sw1_tnnShortcut01"); //  - 
    //Map("add icon", "Sewers Floor 1", sMapIconHoopz, , , "room", "==", ""); 
    return 1;
}

if (argument[0] == "invoke")
{
    var map = "World Map"; // Default map
    if (scr_area_get() == "sw1") map = "Sewers Floor 1";
    if (scr_area_get() == "tnn") map = "Tir na Nog";
    
    obj = instance_create(0, 0, oMap);
    var dsl = scr_savedata_get("quest.maps");
    if (Map("have", map)) obj.mapSel = ds_list_find_index(dsl, map);
}

// Map("reset") - Call every time the game resets.
if (argument[0] == "reset")
{
    scr_savedata_put_list("quest.maps", ds_list_create());
    return 1;
}

// Map("gain", <map name>) - Give Hoopz a map.
if (argument[0] == "gain")
{
    var dsl = scr_savedata_get("quest.maps");
    if (Map("exists", argument[1]) == 0) 
    { 
        show_debug_message("Map('gain', '" + argument[1] + "') - Cannot gain map that isn't defined."); 
        return 0; 
    }
    if (Map("have", argument[1]) == 0) ds_list_add(dsl, argument[1]);
    return 1;
}

// Map("lose", <map name>) - Take away map from Hoopz.
if (argument[0] == "lose")
{
    var dsl = scr_savedata_get("quest.maps");
    if (Map("exists", argument[1]) == 0) 
    { 
        show_debug_message("Map('lose', '" + argument[1] + "') - Cannot lose map that isn't defined."); 
        return 0; 
    }
    if (Map("have", argument[1]) == 1) ds_list_delete(dsl, ds_list_find_index(dsl, argument[1]));
    return 1;
}

// Map("have", <map name>) - Returns true if Hoopz has map.
if (argument[0] == "have")
{
    var dsl = scr_savedata_get("quest.maps");
    if (ds_list_find_index(dsl, argument[1]) == -1) return 0;
    return 1;
}

// Map("exists", <map name>) - Returns if map is defined.
if (argument[0] == "exists")
{
    if (ds_list_find_index(global.mapNam, argument[1]) == -1) return 0;
    return 1;
}

// Map("add area", <map name>, <sMap subimage>)
if (argument[0] == "add area")
{
    var ind = ds_list_size(global.mapNam);
    ds_list_add(global.mapNam, argument[1]);
    ds_list_add(global.mapSub, argument[2]);
    global.mapIcoSub[ind] = ds_list_create();
    global.mapIcoLef[ind] = ds_list_create();
    global.mapIcoTop[ind] = ds_list_create();
    global.mapIcoAmt[ind] = 0;
    return 1;
}

//                 Area name    Sub  X    Y    Variable      Compare  Value  Variable?      Compare?  Value?  Variable?      Compare?  Value?
// Map("add icon", "world map", 0,   100, 100, "knowCdwarf", ">=",    "1");
if (argument[0] == "add icon")
{
    var ind = ds_list_find_index(global.mapNam, argument[1]);
    
    ds_list_add(global.mapIcoSub[ind], argument[2]);
    ds_list_add(global.mapIcoLef[ind], argument[3]);
    ds_list_add(global.mapIcoTop[ind], argument[4]);
    
    var ica = global.mapIcoAmt[ind];
    global.mapIcoVar[ind, ica] = ds_list_create();
    global.mapIcoCom[ind, ica] = ds_list_create();
    global.mapIcoVal[ind, ica] = ds_list_create();
    for (var i = 0; i < 3; i += 1)
    {
        if (argument_count > 5 + (i * 3))
        {
            ds_list_add(global.mapIcoVar[ind, ica], argument[5 + (i * 3)]);
            ds_list_add(global.mapIcoCom[ind, ica], argument[6 + (i * 3)]);
            ds_list_add(global.mapIcoVal[ind, ica], argument[7 + (i * 3)]);
        }
        else
        {
            ds_list_add(global.mapIcoVar[ind, ica], "");
            ds_list_add(global.mapIcoCom[ind, ica], "");
            ds_list_add(global.mapIcoVal[ind, ica], "");
        }
    }
    global.mapIcoAmt[ind] += 1;
    
    return 1;
}



if (argument[0] == "evaluate") //Arg1 = Map Index, Arg2 = Icon Index
{
    if (Map("evaluate index", argument[1], argument[2], 0) && 
        Map("evaluate index", argument[1], argument[2], 1) &&
        Map("evaluate index", argument[1], argument[2], 2)) return 1;
    return 0;
}

if (argument[0] == "evaluate index") //Arg1 = Map Index | Arg2 = Arg Index | Returns true or false
{
    _eid = argument[1];
    _lid = argument[2];
    _icd = argument[3];
    
    //show_debug_message("Comparing " + ds_list_find_value(global.mapIcoVar[_eid, _lid], _icd) + " " + ds_list_find_value(global.mapIcoCom[_eid, _lid], _icd) + " ");
    
    var vrr = ds_list_find_value(global.mapIcoVar[_eid, _lid], _icd);
    if (vrr == "") return 1;
    _var = real(scr_quest_get_state(vrr));
    if (vrr == "clocktime") _var = ClockTime("get");
    if (vrr == "room") _var = room_get_name(room);
    if (vrr == "area") _var = scr_area_get(room);
    //if (vrr == "x") _var = o_hoopz.x;
    //if (vrr == "y") _var = o_hoopz.y;
    
    var val = ds_list_find_value(global.mapIcoVal[_eid, _lid], _icd);
    if (string_digits(string(val)) == string(val)) _val = real(val);
    else _val = val;
    //if (vrr == "room") show_debug_message("HELLO! " + string(_val));
    
    var com = ds_list_find_value(global.mapIcoCom[_eid, _lid], _icd);
    if (com == "<")  { if (_var <  _val) return 1; }
    if (com == "<=") { if (_var <= _val) return 1; }
    if (com == "==") { if (_var == _val) return 1; }
    if (com == "!=") { if (_var != _val) return 1; }
    if (com == ">")  { if (_var >  _val) return 1; }
    if (com == ">=") { if (_var >= _val) return 1; }
    
    return 0;
}

// Map("create")
if (argument[0] == "create")
{
    o_curs.toggleCursor = false;
    audio_play_sound_ext("sn_mnu_exit01", 10, 0);
    Border("generate", 1, SCREEN_WIDTH + 48, 63);
    hide = 1;
    hideToggle = 0;
    ext = 0; // EXIT
    soundClickExit = "sn_mnu_exit01"; // Click exit
    butSpd = 0.15;
    sldSpd = 0.25; //Time to bring up screen
    butHilCol = make_color_rgb(48, 52, 45);// Hilight color
    butTxtCol = make_color_rgb(255, 202, 19);// Hilight color
    
    notVel = 0;
    mapPrv = 0;
    mapSel = 0;
    mapTrn = 0;
    mapAmt = 0; // If you create on Step, it will not do step
    curOvr = -1; // If you create on Step, it will not do step
    curHov = 0;
    
    // BUTTONS //
    butMid = SCREEN_WIDTH * 0.5;
    
    // Exit
    i = 0;
    butWid[i] = 81;
    butHei[i] = 17 + 6 + 8; // 17 + 6
    butX[i] = butMid - round(butWid[i] / 2) + 1;
    butY[i] = (SCREEN_HEIGHT - 36) + 5; // + 6 added
    butSpr[i] = sButtonPapers; butSub[i] = 3;
    butXcl[i] = 1;
    
    // Flip right
    i += 1;
    butWid[i] = 30; //25
    butHei[i] = 30; //41
    butX[i] = butMid + 174; //butX[i] = butMid + 164;
    butY[i] = (SCREEN_HEIGHT / 2); //butY[i] = (SCREEN_HEIGHT / 2) - 20;
    butSpr[i] = sMapFlip; butSub[i] = 0; //butSpr[i] = sButtonFlip; butSub[i] = 2;
    butXcl[i] = 1;
    
    // Flip left
    i += 1;
    butWid[i] = 30; //25
    butHei[i] = 30; //41
    butX[i] = butMid - 174; //butX[i] = butMid - 164 - 25;
    butY[i] = (SCREEN_HEIGHT / 2); //butY[i] = (SCREEN_HEIGHT / 2) - 20;
    butSpr[i] = sMapFlip; butSub[i] = 0; //butSpr[i] = sButtonFlip1; butSub[i] = 2;
    butXcl[i] = -1;
    
    butAmt = 3;
    for (i = 0; i < butAmt; i += 1) { butHov[i] = 0; }
    // BUTTONS //
    
    guplur = 1;
    
    return 1;
}

// Map("step")
if (argument[0] == "step")
{
    paused(true);
    hide = Goto(hide, hideToggle, dt_sec() / sldSpd);
    if (hideToggle == 1)
    {
        if (hide == 1) 
        {
            o_curs.toggleCursor = true;
            paused(false);
            instance_destroy();
        }
        exit;
    }
    mapAmt = ds_list_size(scr_savedata_get("quest.maps"));
    if (mapAmt < 1) notVel = 1;
    
    // EXIT
    if (guplur == 0 && global.keyinput_type != KEYINPUT_GAMEPAD && keyboard_check_pressed(ord("M"))) Map("exit");
    guplur = 0;
    
    did = 1;
    if (global.keyinput_type == KEYINPUT_GAMEPAD && notVel == 1) did = 0;
    if (MiniKeyPress("right") && did)
    {
        Map("right");
        //curHov = 0; // gz edited
    }
    if (MiniKeyPress("left") && did) 
    {
        Map("left")
        //curHov = 0;
    }
    if (global.keyinput_type == KEYINPUT_GAMEPAD) 
    {
        if (MiniKeyPress("cancel")) Map("exit");
        if (mapAmt >= 1 && (MiniKeyPress("up") || MiniKeyPress("down"))) notVel = !notVel;
        if (notVel && MiniKeyPress("action")) Map("exit");
    }
    
    x = view_xview[0];
    y = view_yview[0];
    
    curOvr = -1;
    if (global.keyinput_type == KEYINPUT_GAMEPAD && notVel == 1) curOvr = 0;
    if (global.keyinput_type == KEYINPUT_GAMEPAD && notVel == 0) curOvr = 10;
    
    for (i = 0; i < butAmt; i += 1)
    {
        xbf = 0; ybf = 0;
        if (i > 0) { xbf -= butWid[i] / 2; ybf -= butHei[i] / 2; }
        var hil = scr_mouse_rect(x + xbf + butX[i], y + ybf + butY[i], x + xbf + butX[i] + butWid[i], y + ybf + butY[i] + butHei[i]);
        if (global.keyinput_type == KEYINPUT_GAMEPAD) hil = 0;
        if (hil || curOvr == i)
        {
            if (i == 0) butHov[i] = Goto(butHov[i], 1, dt_sec() / butSpd);
            else 
            { 
                if (butHov[i] < 1) butHov[i] = 1; 
                else butHov[i] -= dt_sec() / butSpd;
            }
            curOvr = i;
            if (hil && MiniKeyPress("action"))
            {
                if (i == 0) Map("exit");
                if (i == 1) Map("right");
                if (i == 2) Map("left");
            }
        }
        else 
        {
            if (i == 0) butHov[i] -= dt_sec() / butSpd;
            else butHov[i] = 0;
        }
        butHov[i] = clamp(butHov[i], 0, 1.5);
    }
    
    return 1;
}

if (argument[0] == "exit")
{
    curHov = 1;
    audio_play_sound_ext(soundClickExit, 10, 0);
    ext = 1;
    hideToggle = 1;
    return 1;
}

if (argument[0] == "right")
{
    if (mapAmt <= 1) exit;
    butHov[1] = 1.5;
    curHov = 1;
    mapPrv = mapSel;
    mapTrn = -1;
    mapSel += 1;
    if (mapSel >= mapAmt) mapSel = 0; 
    audio_play_sound_ext(soundClickExit, 10, 0);
    //audio_play_sound_ext(notSou[notSel], 10, 0);
    return 1;
}

if (argument[0] == "left")
{
    if (mapAmt <= 1) exit;
    butHov[2] = 1.5;
    curHov = 1;
    mapPrv = mapSel;
    mapTrn = 1;
    mapSel -= 1;
    if (mapSel < 0) mapSel = mapAmt - 1;  
    audio_play_sound_ext(soundClickExit, 10, 0);
    //audio_play_sound_ext(notSou[notSel], 10, 0);
    return 1;
}

// Map("draw",     "world map", alpha);
if (argument[0] == "draw")
{
    var dsl = scr_savedata_get("quest.maps");
    //show_debug_message(ds_list_find_value(dsl, mapSel));
    var ind = ds_list_find_index(global.mapNam, ds_list_find_value(dsl, mapSel)); //ds_list_find_index(global.mapNam, argument[1]);
    var ald = clamp(hide, 0, 1); //argument[2]
    var rld = abs(1 - ald);
    var lef = view_xview[0] + ((384 - 320) * 0.5); //340
    var top = view_yview[0] + ((240 - 200) * 0.5) + (ald * 240) + 5; //208 - added + 6
    
    // Black BG
    draw_sprite_ext(s1x1, 0, x, y, 384, 240, 0, c_black, 0.75 * rld);
    
    // If you have no maps
    butAmt = 1;
    if (mapAmt == 0)
    {
        scr_font(global.fn_1, c_white, 1, 1);
        draw_text_transformed(x + (384 / 2), y + (240 / 2) + (240 * ald), "No maps available.", 1, 1, 0);
        scr_font(-1, -1, 0, 0);
    }
    else
    {
        if (mapAmt > 1) butAmt = 3;
        
        mapRep = 2;
        mapTrn = Goto(mapTrn, 0, dt_sec() / butSpd);
        if (mapTrn < 0) lef += abs(mapTrn * 384); 
        else if (mapTrn > 0) lef -= abs(mapTrn * 384);
        else mapRep = 1;
        //ind = mapSel;
        
        //show_debug_message("Icon checks: " + string(ds_list_size(global.mapIcoSub[ind])));
        mapAlp = 1;
        mapCol = c_white;
        if (global.keyinput_type == KEYINPUT_GAMEPAD)
        {
            mapCol = merge_color(c_white, c_gray, butHov[0]);
        }
        else
        {
            var fad = max(butHov[0]);//, butHov[1], butHov[2]);
            mapCol = merge_color(c_white, c_gray, fad);
        }
        for (h = 0; h < mapRep; h += 1)
        {
            draw_sprite_ext(sMap, ds_list_find_value(global.mapSub, ind), lef, top, 1, 1, 0, mapCol, mapAlp);
            for (i = 0; i < ds_list_size(global.mapIcoSub[ind]); i += 1)
            {
                //show_debug_message("Fresh evaluate");
                if (Map("evaluate", ind, i) == 1)
                {
                    draw_sprite_ext(ds_list_find_value(global.mapIcoSub[ind], i), global.mapDel * 3.3,
                        lef + ds_list_find_value(global.mapIcoLef[ind], i), top + ds_list_find_value(global.mapIcoTop[ind], i), 
                        1, 1, 0, mapCol, mapAlp);
                }
            }
            if (mapRep == 2) ind = ds_list_find_index(global.mapNam, ds_list_find_value(dsl, mapPrv));
            lef += sign(mapTrn) * 384;
        }
    }
    
    // Top bar
    if (mapAmt > 0)
    {
        Border("draw", 1, x - 24, y - 40 + - (ald * 21));
        draw_set_alpha(1);
        scr_font(global.fn_2, c_white, 1);
        draw_text(x + 192, y + 4 - (ald * 21), ds_list_find_value(dsl, mapSel));
        scr_font(-1, -1, 0);
    }
    
    // BUTTONS
    for (i = 0; i < butAmt; i += 1)
    {
        if (i > 0 && global.keyinput_type == KEYINPUT_GAMEPAD && notVel == 1) break;
        dx = x + butX[i];
        dy = y + butY[i];
        if (i == 0) dy += ald * 41;
        else if (i == 1) dx += ald * 48;
        else if (i == 2) dx -= ald * 48;
        if (i == 0)
        {
            var extSub = butHov[i] * 6;
            if (ext == 1) extSub = 7;
            draw_sprite_ext(sButtonExit, extSub, dx, dy + 10 - (butHov[i] * 10), 1, 1, 0, c_white, 1);
        }
        else
        {
            var bss = butSub[i] + (sign(butHov[i]));
            if (global.keyinput_type != KEYINPUT_GAMEPAD) bss = butSub[i] + ceil(butHov[i]);
            draw_sprite_ext(butSpr[i], bss, dx, dy, butXcl[i], 1, 0, c_white, 1);
        }
    }
    
    // Cursor
    if (curOvr == -1) curSub = 0; else curSub = 1;
    curCol = merge_color(c_white, butTxtCol, curHov);
    curHov -= dt_sec() / butSpd;
    curHov = clamp(curHov, 0, 1);
    if (global.keyinput_type != KEYINPUT_GAMEPAD) draw_sprite_ext(s_curs2, curSub, mouse_x, mouse_y, 1, 1, 0, curCol, rld);
    
    global.mapDel += dt_sec();
    return 1;
}

show_debug_message("Map() - No such command > " + string(argument[0]) + " <");
