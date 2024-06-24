/// Cinema()
// GZ NOTE: FREE DS LIST LATER, CACHE RESULTS
// scr_event_advance is used
// scr_event_choice_destroy is used
// goto:
// quest: GET / SET
// dialog, dialogue: 
// choice: add
var _cr = "|"; // Delimiter
if (argument[0] == "kids")
{
    return ds_list_size(global.dslCinKid);
}
else if (argument[0] == "kid")
{
    ds_list_add(global.dslCinKid, argument[1]);
}
else if (argument[0] == "history") // else start here when adding
{
    ds_list_insert(global.dslCinHis, 0, global.cinLin);
    if (ds_list_size(global.dslCinHis) > 10) ds_list_delete(global.dslCinHis, 10);
}
else if (argument[0] == "next")
{
    global.cinSub += 1;
    if (global.cinSub >= array_length_2d(global.arrCinQue, global.cinLin)) 
    { 
        global.cinSub = 0; 
        Cinema("history");
        global.cinLin += 1; 
    }
    if (global.cinLin >= ds_list_size(global.dslCinQue)) { Cinema("exit"); }
}
else if (argument[0] == "next line")
{
    global.cinSub = 0; 
    Cinema("history");
    global.cinLin += 1;
    if (global.cinLin >= ds_list_size(global.dslCinQue)) { Cinema("exit"); }
}
else if (argument[0] == "argument")
{
    argCou = 0;
    for (iii = 0; iii < 10; iii += 1) arg[iii] = "0";
    for (argCou = 0; global.cinSub + argCou < array_length_2d(global.arrCinQue, global.cinLin); argCou += 1)
    {
        arg[argCou] = Cinema("parse", global.arrCinQue[global.cinLin, global.cinSub + argCou]);
    }
    global.cinSub += argCou - 1;
}
else if (argument[0] == "prune if") // Feed in string of if statement, returns the valid valeus
{
    // comTyp == 0 - 5 value on how to handle
    // comNam == variable name
    // comVal == value to compare against
    var txt = argument[1];
    txt = string_delete(txt, 1, 2); // REMOVE "IF"
    txt = CinemaQue("whitespace", txt);
    var comCut = 0;
    txt = string_replace_all(txt, "==", "=");
    txt = string_replace_all(txt, "!=", "^");
    txt = string_replace_all(txt, ">=", "`");
    txt = string_replace_all(txt, "<=", "~");
    if (string_pos("<", txt) > 0) { comTyp = 0; comCut = string_pos(" <", txt); }
    if (string_pos("=", txt) > 0) { comTyp = 1; comCut = string_pos(" =", txt); }
    if (string_pos(">", txt) > 0) { comTyp = 2; comCut = string_pos(" >", txt); }
    if (string_pos("^", txt) > 0) { comTyp = 3; comCut = string_pos(" ^", txt); }
    if (string_pos("`", txt) > 0) { comTyp = 4; comCut = string_pos(" `", txt); }
    if (string_pos("~", txt) > 0) { comTyp = 5; comCut = string_pos(" ~", txt); }
    comNam = string_copy(txt, 1, comCut - 1);
    txt = string_delete(txt, 1, comCut + 2);
    comVal = string_copy(txt, 1, string_length(txt));
}
else if (argument[0] == "prune quest") // ONLY PRUNE IF QUEST EXISTS
{
    var txt = argument[1];
    if (string_pos("QUEST", txt) > 0) txt = string_delete(txt, 1, 5); // REMOVE "QUEST: "
    txt = CinemaQue("whitespace", txt);
    if (string_pos("+=", txt) > 0)
    {
        qstNam = string_copy(txt, 1, string_pos(" +=", txt) - 1); // Quest name
        txt = string_delete(txt, 1, string_pos(" +=", txt) + 3);
        qstTyp = "+=";
    }
    else if (string_pos("-=", txt) > 0)
    {
        qstNam = string_copy(txt, 1, string_pos(" -=", txt) - 1); // Quest name
        txt = string_delete(txt, 1, string_pos(" -=", txt) + 3);
        qstTyp = "-=";
    }
    else
    {
        qstNam = string_copy(txt, 1, string_pos(" =", txt) - 1); // Quest name
        txt = string_delete(txt, 1, string_pos(" =", txt) + 2); // REMOVE TO =
        qstTyp = "=";
    }
    qstVal = string_copy(txt, 1, string_length(txt)); // Quest value
    //if (is_real(qstVal)) qstVal = real(qstVal);
    //scr_quest_set_state(qstNam, qstVal);
}
else if (argument[0] == "variable") // Only add if it doesn't exist
{
    if (ds_list_find_index(global.dslCinVar, argument[1]) == -1) ds_list_add(global.dslCinVar, argument[1]);
}
else if (argument[0] == "process") // Process line argument[1], starting at position argument[2]
{
    if (global.cinAct == 0) exit;
    if (global.chtRep == 0 && global.dslCinLab[| global.cinLin]) { Cinema("exit"); exit; }
    if (global.dslCinLab[| global.cinLin] == 0) var txt = global.arrCinQue[global.cinLin, global.cinSub];
    else txt = "";
    show_debug_message("Cinema(): " + txt);
    
    if (string_pos("IF", txt) == 1)
    {
        Cinema("prune if", txt);
        comVal = Cinema("parse", comVal);
        if (is_real(comVal)) comVal = real(comVal);
        if (comNam == "note") comVl0 = Note("selected");
        else comVl0 = scr_quest_get_state(comNam);
        if (is_real(comVl0)) { comVal = real(comVal); comVl0 = real(comVl0); }
        //comVal = string(comVal); }
        //show_debug_message(comVal + " > " + comVl0);
        var bol = 0;
        //show_debug_message("Cinema() - IF quest >" + comNam + "< to >" + string(comVal) + "< and comparison type is >" + string(comTyp) + "<.");
        //show_debug_message("Cinema() - " + string(is_real(comVl0)) + " <> " + string(is_real(comVal)));
        
        //Shift into one variable
        if (comTyp == 0 || comTyp == 2 || comTyp == 4 || comTyp == 5) comVl0 = real(scr_quest_get_state(comNam));
        
        // See if I'm checking inventory
        if (string_pos("@", comNam) == 1) comVl0 = Item("count", string_copy(comNam, 2, string_length(comNam) - 2));
        
        show_debug_message("Cinema() - IF quest >" + string(comVl0) + "< to >" + string(comVal) + "< and comparison type is >" + string(comTyp) + "<.");
        
        if (comTyp == 0) { if (comVl0 < real(comVal)) bol = 1; }
        if (comTyp == 1) { if (is_real(comVl0) == is_real(comVal) && comVl0 == comVal) bol = 1; }
        if (comTyp == 2) { if (comVl0 > real(comVal)) bol = 1; }
        if (comTyp == 3) { if (is_real(comVl0) != is_real(comVal) || comVl0 != comVal) bol = 1; }
        if (comTyp == 4) { if (comVl0 >= real(comVal)) bol = 1; }
        if (comTyp == 5) { if (comVl0 <= real(comVal)) bol = 1; }
        if (bol == 1) { Cinema("next"); Cinema("process"); exit; }
        else { Cinema("next line"); Cinema("process"); } // goto next statement
        exit;
    }
    else if (txt == "REPLY") 
    {
        Cinema("next");
        ds_list_add(global.dslCinRepGot, global.arrCinQue[global.cinLin, global.cinSub]);
        Cinema("next");
        ds_list_add(global.dslCinRep, Cinema("parse", global.arrCinQue[global.cinLin, global.cinSub]));
        Cinema("next");
        Cinema("process"); // Keep getting replies
    }
    else
    {
        if (global.chtRep && global.chtTxt != "")
        {
            var choPor = "s_port_hoopz";
            if (BodySwap() == "matthias") choPor = "s_port_matthias";
            if (BodySwap() == "governor") choPor = "s_port_governor";
            if (BodySwap() == "untamo") choPor = NULL_STRING;
            var cinObj = scr_event_build_choice(global.chtTxt, choPor);
            for (var q = 0; q < ds_list_size(global.dslCinRep); q += 1)
            {
                scr_event_build_add_choice(cinObj, global.dslCinRep[| q]);
            }
            global.cinObj = scr_event_action_choice(cinObj);
            global.chtStt = "choice";
            global.chtTxt = "";
            show_debug_message("Cinema(): Invoke choice");
        }
    }
    if (global.chtRep) exit;
    
    if (txt == "CHOICE") 
    {
        ds_list_clear(global.dslCinRep);
        ds_list_clear(global.dslCinRepGot);
        global.chtRep = 1;
        Cinema("next");
        txt = Cinema("parse", global.arrCinQue[global.cinLin, global.cinSub]);
        global.chtTxt = txt;
        // invoke thing for choice
        Cinema("next");
        Cinema("process");
        exit;
    } 
    if (txt == "WAIT") 
    { 
        Cinema("next");
        arg[0] = real(Cinema("parse", global.arrCinQue[global.cinLin, global.cinSub]));
        if (arg[0] <= 0) { global.cinWai = 1; Cinema("next line"); exit; }
        var wait_object = instance_create(0, 0, o_wait);
        wait_object._event = id;
        wait_object._secs_to_wait = arg[0];
        global.cinObj = wait_object;
        exit;
    } 
    if (txt == "EXIT")
    {
        Cinema("exit");
        exit;
    }
    if (txt == "DIALOG") // TODO = portrait with name
    {
        global.chtStt = "dialog";
        Cinema("next");
        arg[0] = Cinema("parse", global.arrCinQue[global.cinLin, global.cinSub]);
        Cinema("next");
        arg[1] = Cinema("parse", global.arrCinQue[global.cinLin, global.cinSub]);
        var dsl = ds_list_create();
        ds_list_add(dsl, scr_event_action_dialogue);
        var porNam = arg[0];
        var porImg = scr_event_dialogue_name_portrait(arg[0]);
        if (string_pos("=", arg[0]) > 0)
        {
            var porSpl = string_split(arg[0], "=");
            porNam = CinemaQue("whitespace", porSpl[0]);
            porImg = CinemaQue("whitespace", porSpl[1]);
        }
        ds_list_add(dsl, porNam); // title
        ds_list_add(dsl, porImg); // portrait
        ds_list_add(dsl, arg[1]); // dialogue
        ds_list_add(dsl, NULL); // extras
        global.cinObj = scr_event_action_dialogue(dsl);
        ds_list_destroy(dsl);
        exit;
    }
    if (txt == "SHAKE")
    {
        Cinema("next");
        arg[0] = real(Cinema("parse", global.arrCinQue[global.cinLin, global.cinSub]));
        Cinema("next");
        arg[1] = real(Cinema("parse", global.arrCinQue[global.cinLin, global.cinSub]));
        Shake("add", arg[0], -1, 0, 0, arg[1]);
        Cinema("next");
        Cinema("process");
        exit;
    }
    if (txt == "ITEM")
    {
        Cinema("next");
        arg[0] = Cinema("parse", global.arrCinQue[global.cinLin, global.cinSub]);
        Cinema("next");
        arg[1] = real(Cinema("parse", global.arrCinQue[global.cinLin, global.cinSub]));
        if (arg[1] > 0) Item("gain", arg[0], arg[1]);
        else Item("lose", arg[0], abs(arg[1]));
        show_debug_message("ITEM | " + string(arg[0]) + " | " + string(arg[1]));
        Cinema("next line");
        Cinema("process");
        exit;
    }
    if (txt == "NOTIFY")
    {
        // scr_event_build_dialogue_item("Got a bomb!");
        global.chtStt = "dialog";
        arg[0] = "NOTIFY";
        Cinema("next");
        arg[1] = Cinema("parse", global.arrCinQue[global.cinLin, global.cinSub]);
        var dsl = ds_list_create();
        ds_list_add(dsl, scr_event_action_dialogue_item);
        ds_list_add(dsl, arg[1]);
        global.cinObj = scr_event_action_dialogue_item(dsl);
        ds_list_destroy(dsl);
        exit;
    }
    if (txt == "PLAYSET")
    {
        Cinema("next");
        arg[0] = Cinema("parse", global.arrCinQue[global.cinLin, global.cinSub]);
        Cinema("next");
        arg[1] = Cinema("parse", global.arrCinQue[global.cinLin, global.cinSub]);
        Cinema("next");
        arg[2] = Cinema("parse", global.arrCinQue[global.cinLin, global.cinSub]);
        if (asset_get_index(arg[0]) > -1) arg[0] = asset_get_index(arg[0]);
        var dsl = ds_list_create();
        ds_list_add(dsl, scr_event_action_animation_play_and_set);
        ds_list_add(dsl, real(arg[0])); // object
        ds_list_add(dsl, arg[1]); // play
        ds_list_add(dsl, arg[2]); // set
        global.cinObj = id;
        scr_event_action_animation_play_and_set(dsl);
        ds_list_destroy(dsl);
        exit;
    }
    if (txt == "SET")
    {
        Cinema("next");
        arg[0] = Cinema("parse", global.arrCinQue[global.cinLin, global.cinSub]);
        Cinema("next");
        arg[1] = Cinema("parse", global.arrCinQue[global.cinLin, global.cinSub]);
        if (asset_get_index(arg[0]) > -1) arg[0] = asset_get_index(arg[0]);
        var dsl = ds_list_create();
        ds_list_add(dsl, scr_event_action_animation_set);
        ds_list_add(dsl, real(arg[0])); // object
        ds_list_add(dsl, arg[1]); // set
        global.cinObj = id;
        scr_event_action_animation_set(dsl);
        ds_list_destroy(dsl);
        exit;
    }
    if (txt == "GOTO") 
    {
        Cinema("next");
        txt = global.arrCinQue[global.cinLin, global.cinSub];
        Cinema("goto", txt);
        exit;
    }
    if (txt == "QUEST")
    {
        Cinema("next");
        txt = global.arrCinQue[global.cinLin, global.cinSub];
        Cinema("prune quest", txt);
        if (string_pos("@", qstVal) > 0) qstVal = Cinema("parse", qstVal);
        if (is_real(qstVal)) qstVal = real(qstVal);
        show_debug_message("Cinema(): QUEST > " + qstNam + " = " + qstVal);
        if (qstTyp == "+=") scr_quest_set_state(qstNam, real(scr_quest_get_state(qstNam)) + real(qstVal));
        else if (qstTyp == "-=") scr_quest_set_state(qstNam, real(scr_quest_get_state(qstNam)) - real(qstVal));
        else 
        {
            if (string_digits(string(qstVal)) == string(qstVal)) scr_quest_set_state(qstNam, real(qstVal));
            else scr_quest_set_state(qstNam, qstVal);
        }
        scr_money_set(scr_quest_get_state("money"));
        if (qstNam == "time") scr_time_set(real(scr_quest_get_state("time")));
        Cinema("next");
        Cinema("process"); // new
        exit;
    }
    if (txt == "BREAKOUT")
    {
        Cinema("next");
        Cinema("argument");
        if (argCou == 1) Breakout(arg[0]);
        if (argCou == 2) Breakout(arg[0], arg[1]);
        if (argCou == 3) Breakout(arg[0], arg[1], arg[2]);
        Cinema("next line");
        Cinema("process");
        exit;
    }
    if (txt == "FADE")
    {
        Cinema("next");
        Cinema("argument");
        if (argCou == 1) objFad = scr_event_fade(real(arg[0]));
        if (argCou == 2) objFad = scr_event_fade(real(arg[0]), real(arg[1]));
        if (argCou == 3) objFad = scr_event_fade(real(arg[0]), real(arg[1]), real(arg[2]));
        objFad._event = oCinema.id;
        Cinema("next line");
        Cinema("process");
        exit;
    }
    if (txt == "SOUND")
    {
        Cinema("next");
        Cinema("argument");
        if (argCou == 1) audio_play_sound_ext(arg[0], 0, 0);
        if (argCou == 2) audio_play_sound_ext(arg[0], 0, real(arg[1]));
        Cinema("next line");
        Cinema("process");
        exit;
    }
    if (txt == "EVENT")
    {
        Cinema("next");
        Cinema("argument");
        if (asset_get_index(arg[0]) > -1) arg[0] = asset_get_index(arg[0]);
        var frf = real(arg[1]);
        with (real(arg[0])) event_user(frf);
        show_debug_message("Cinema(EVENT) = " + object_get_name(real(arg[0])) + " - EV" + arg[1]);
        Cinema("next line");
        Cinema("process");
        exit;
    }
    if (txt == "NOTE")
    {
        Cinema("next");
        Cinema("argument");
        if (argCou == 1) Note(arg[0]);
        if (argCou == 2) Note(arg[0], arg[1]);
        if (argCou == 3) Note(arg[0], arg[1], arg[2]);
        if (arg[0] != "select" && arg[0] != "viewer" && arg[0] != "gallery" && arg[0] != "identity")
        {
            Cinema("next line");
            Cinema("process");
        }
        exit;
    }
    
    if (txt == "CREATE")
    {
        Cinema("next");
        Cinema("argument");
        var objInd = asset_get_index(arg[0]);
        if (objInd != -1)
        {
            if (argCou == 1) instance_create(0, 0, objInd);
            if (argCou == 2) instance_create(real(arg[1]), 0, objInd);
            if (argCou == 3) instance_create(real(arg[1]), real(arg[2]), objInd);
        }
        Cinema("next line");
        Cinema("process");
        exit;
    }
    
    if (txt == "CREATE_WAIT")
    {
        Cinema("next");
        Cinema("argument");
        var objInd = asset_get_index(arg[0]);
        if (objInd != -1)
        {
            if (argCou == 1) Cinema("kid", instance_create(0, 0, objInd));
            if (argCou == 2) Cinema("kid", instance_create(real(arg[1]), 0, objInd));
            if (argCou == 3) Cinema("kid", instance_create(real(arg[1]), real(arg[2]), objInd));
        }
        Cinema("next line");
        Cinema("process");
        exit;
    }
    
    if (txt == "FRAME")
    {
        Cinema("next");
        Cinema("argument");
        var camSpd = CAMERA_SLOW;
        if (arg[0] == "CAMERA_NORMAL") camSpd = CAMERA_NORMAL;
        if (arg[0] == "CAMERA_FAST") camSpd = CAMERA_FAST;
        if (argCou >= 2) { if (asset_get_index(arg[1]) > -1) arg[1] = asset_get_index(arg[1]); }
        if (argCou >= 3) { if (asset_get_index(arg[2]) > -1) arg[2] = asset_get_index(arg[2]); }
        if (argCou >= 4) { if (asset_get_index(arg[3]) > -1) arg[3] = asset_get_index(arg[3]); }
        if (argCou == 2) scr_event_camera_frame(real(arg[1]));
        if (argCou == 3) scr_event_camera_frame(real(arg[1]), real(arg[2]));
        if (argCou == 4) scr_event_camera_frame(real(arg[1]), real(arg[2]), real(arg[3]));
        global.cinObj = -999;
        Cinema("kid", scr_event_camera_move_to_point(camX, camY, camSpd, 1));
        Cinema("next line");
        Cinema("process");
        exit;
    }
    
    if (txt == "LOOKAT")
    {
        Cinema("next");
        Cinema("argument");
        if (asset_get_index(arg[0]) > -1) arg[0] = asset_get_index(arg[0]);
        if (asset_get_index(arg[1]) > -1) arg[1] = asset_get_index(arg[1]);
        scr_entity_look_object(real(arg[0]), real(arg[1]));
        Cinema("next line");
        Cinema("process");
        exit;
    }
    
    if (txt == "LOOK")
    {
        Cinema("next");
        Cinema("argument");
        if (asset_get_index(arg[0]) > -1) arg[0] = asset_get_index(arg[0]);
        var facDir = NORTH;
        if (arg[1] == "NORTHWEST") facDir = NORTHWEST;
        if (arg[1] == "NORTHEAST") facDir = NORTHEAST;
        if (arg[1] == "SOUTHWEST") facDir = SOUTHWEST;
        if (arg[1] == "SOUTHEAST") facDir = SOUTHEAST;
        if (arg[1] == "WEST") facDir = WEST;
        if (arg[1] == "EAST") facDir = EAST;
        if (arg[1] == "SOUTH") facDir = SOUTH;
        scr_entity_look(real(arg[0]), facDir);
        Cinema("next line");
        Cinema("process"); // new
        exit;
    }
    
    if (txt == "MOVETO") // MOVETO | object_to_move | object_to_move_to | SPEED
    {
        Cinema("next");
        Cinema("argument");
        show_debug_message("Cinema() EXECUTE > MOVETO | " + arg[0] + " | " + arg[1] + " | " + arg[2] + " <");
        if (asset_get_index(arg[0]) > -1) arg[0] = asset_get_index(arg[0]);
        arg[0] = real(arg[0]);
        if (asset_get_index(arg[1]) > -1) arg[1] = asset_get_index(arg[1]);
        arg[1] = real(arg[1]);
        var movSpd = MOVE_SLOW;
        if (arg[2] == "MOVE_NORMAL") movSpd = MOVE_NORMAL;
        if (arg[2] == "MOVE_FAST") movSpd = MOVE_FAST;
        var dsl = ds_list_create();
        ds_list_add(dsl, scr_event_action_move_to_point);
        ds_list_add(dsl, arg[0]); // object
        ds_list_add(dsl, arg[1].x); // x
        ds_list_add(dsl, arg[1].y); // y
        ds_list_add(dsl, movSpd); // spd
        global.cinObj = -999;
        Cinema("kid", scr_event_action_move_to_point(dsl));
        ds_list_destroy(dsl);
        Cinema("next line");
        Cinema("process");
        exit;
    }
    
    // Try script command
    var asi = asset_get_index(txt);
    if (script_exists(asi)) // You MUST pass at least one argument
    {
        Cinema("next");
        Cinema("argument");
        for (iii = 0; iii < 10; iii += 1) { 
            if (string_digits(string(arg[iii])) == string(arg[iii])) arg[iii] = real(arg[iii]); 
        }
        if (argCou == 1) script_execute(asi, arg[0]);
        if (argCou == 2) script_execute(asi, arg[0], arg[1]);
        if (argCou == 3) script_execute(asi, arg[0], arg[1], arg[2]);
        if (argCou == 4) script_execute(asi, arg[0], arg[1], arg[2], arg[3]);
        if (argCou == 5) script_execute(asi, arg[0], arg[1], arg[2], arg[3], arg[4]);
        if (argCou == 6) script_execute(asi, arg[0], arg[1], arg[2], arg[3], arg[4], arg[5]);
        if (argCou == 7) script_execute(asi, arg[0], arg[1], arg[2], arg[3], arg[4], arg[5], arg[6]);
        Cinema("next line");
        Cinema("process");
        exit;
    }
    
    show_debug_message("Cinema(): Unknown function >" + txt + "< skipping to next line.");
    Cinema("next line");
    Cinema("process");
}
else if (argument[0] == "goto")
{
    show_debug_message("Cinema(): Executing GOTO > " + argument[1]);
    var lin = ds_map_find_value(global.dsmCinLab, argument[1]);
    if (is_undefined(lin)) Cinema("dialog", "ERROR: No such label to GOTO > " + argument[1]);
    else { Cinema("history"); global.cinLin = lin; global.cinSub = 0; Cinema("process"); }
}
else if (argument[0] == "choose")
{
    ds_list_clear(global.dslCinRep);
    ds_list_clear(global.dslCinRepGot);
    global.chtRep = 0;
    Cinema("goto", argument[1]); // continue was for regular line, remove
}
else if (argument[0] == "step")
{
    if (global.cinObj != -999) exit;
    if (global.chtRep == 1) exit;
    if (global.cinWai > 0)
    {
        global.cinWai -= dt_sec();
        if (global.cinWai <= 0) { Cinema("next"); global.cinWai = -1; }
        exit;
    }
    if (global.cinAct == 0) exit;
    //show_debug_message("step");
    Cinema("process");
}
else if (argument[0] == "parse")
{
    var txt = argument[1];
    txt = string_replace_all(txt, "P_NAME_F", P_NAME_F);
    txt = string_replace_all(txt, "P_NAME_S", P_NAME_S);
    txt = string_replace_all(txt, "P_NAME", P_NAME);
    // Replace quest variables
    while (string_pos("@", txt) > 0)
    {
        var _pc = string_pos("@", txt);
        txt = string_delete(txt, _pc, 1);
        var _ps = string_pos("@", txt);
        _qstNam = string_copy(txt, _pc, (_ps - _pc));
        show_debug_message(_qstNam);
        txt = string_delete(txt, _pc, _ps - _pc + 1);
        if (string_pos("money_", _qstNam)) qstStr = string(scr_money_db(string_delete(_qstNam, 1, 6)));
        else if (string_pos("duergar_", _qstNam)) qstStr = string(script_execute(Duergar, "getname", string_delete(_qstNam, 1, 8)));
        else if (string_pos("time_", _qstNam)) qstStr = string(scr_time_db(string_delete(_qstNam, 1, 5)));
        else if (string_pos("item_", _qstNam)) qstStr = string(Item("count", string_delete(_qstNam, 1, 5)));
        else if (_qstNam == "note") qstStr = Note("selected");
        else qstStr = string(scr_quest_get_state(_qstNam));
        txt = string_insert(qstStr, txt, _pc);
    }
    return txt;
}
else if (argument[0] == "init") // Call once per game
{
    global.dslCinQue = ds_list_create();
    global.dslCinRep = ds_list_create();
    global.dslCinRepGot = ds_list_create();
    global.dslCinLab = ds_list_create();
    global.dsmCinLab = ds_map_create();
    global.dslCinVar = ds_list_create() // has all variables in script
    global.dslCinHis = ds_list_create();
    global.dslCinKid = ds_list_create();
    Cinema("reset");
}
else if (argument[0] == "reset")
{
    ds_list_clear(global.dslCinQue); // Que of all lines
    ds_list_clear(global.dslCinRep); // Reply
    ds_list_clear(global.dslCinRepGot); // Reply GOTO
    ds_list_clear(global.dslCinLab); // Returns 1 if line is label
    ds_map_clear(global.dsmCinLab); // Map of label positions
    ds_list_clear(global.dslCinVar);
    ds_list_clear(global.dslCinHis);
    ds_list_clear(global.dslCinKid);
    ds_list_add(global.dslCinVar, "money");
    ds_list_add(global.dslCinVar, "body");
    ds_list_add(global.dslCinVar, "curfew");
    ds_list_add(global.dslCinVar, "clock");
    ds_list_add(global.dslCinVar, "area");
    ds_list_add(global.dslCinVar, "time");
    ds_list_add(global.dslCinVar, "room");
    ds_list_add(global.dslCinVar, "inside");
    global.cinLin = 0;
    global.cinSub = 0;
    global.cinWai = 0;
    global.cinAct = 0;
    global.cinFin = 0;
    global.cinObj = -999;
    global.cinCho = -1;
    global.chtRep = 0;
    global.chtTxt = "";
    global.chtStt = "";
}
else if (argument[0] == "run") // Feed in a string with commands
{
    // Do the common variables
    scr_quest_set_state("body", BodySwap());
    scr_quest_set_state("clock", ClockTime("get"));
    scr_quest_set_state("curfew", scr_time_db("tnnCurfew"));
    scr_quest_set_state("money", scr_money_count());
    scr_quest_set_state("area", scr_area_get());
    scr_quest_set_state("time", scr_time_get());
    scr_quest_set_state("room", room_get_name(room));
    scr_quest_set_state("inside", script_execute(scr_inside));
    // Do the common variables
    global.arrCinQue = 0;
    if (instance_exists(oCinema) == 0) instance_create(0, 0, oCinema);
    var ptm = get_timer();
    Cinema("reset");
    global.cinAct = 1;
    if (argument_count == 2) var _ds = Cinema("load", argument[1]);
    else var _ds = argument[2];
    show_debug_message("Cinema() - Loaded script in " + string((get_timer() - ptm) / 1000) + "ms.");
    for (var i = 0; i < ds_list_size(_ds); i += 1) CinemaQue(ds_list_find_value(_ds, i));
    show_debug_message("Cinema() - Queued script in " + string((get_timer() - ptm) / 1000) + "ms.");
    scr_event_hoopz_switch_cutscene();
    if (global.eventFrame == 1)
    {
        show_debug_message("oCinema('run') - Framing...");
        with (oCinema)
        {
            if (instance_exists(global.eventObject)) //Facing code - Make lugner face hoopz
            {
                if (global.eventObject.faceAuto == 1) scr_entity_look_object(global.eventObject, o_cts_hoopz);
            }
            scr_event_camera_frame(o_cts_hoopz, global.eventObject);
            global.cinObj = 0;
            Cinema("kid", scr_event_camera_move_to_point(camX, camY, CAMERA_FAST, 1));
            global.cinWai = 1;
        }
        global.eventFrame = 0;
    }
    else
    {
        with (oCinema) Cinema("process"); // was
    }
}
else if (argument[0] == "load")
{
    var nwl = chr(13) + chr(10);
    var dlg = argument[1] + nwl;
    var dsl = ds_list_create();
    var stl = 0;
    var pos = string_pos(nwl, dlg); // + chr(10), dlg);
    //var pos = string_pos(chr(13) + chr(10), dlg);
    while (pos > 0)
    {
        var str = string_copy(dlg, 1, pos - 1);
        dlg = string_delete(dlg, 1, pos + 1);
        pos = string_pos("//", str);
        if (pos > 0) str = string_copy(str, 1, pos - 1);
        if (str != "" && string_copy(str, 1, 1) != " ")
        {
            stl = string_length(str);
            if (string_copy(str, stl, 1) == " ") str = string_copy(str, 1, stl - 1);
            ds_list_add(dsl, str);
        }
        pos = string_pos(nwl, dlg);
    }
    return dsl;
}
else if (argument[0] == "exit")
{
    global.cinAct = 0;
    global.cinFin = 1;
    Note("selected", "");
    //with (oCinema) instance_destroy();
    show_debug_message("Cinema() - End cinema.");
    
    // Reset camera
    var current_camera = scr_camera_current();
    if (current_camera.object_index != o_camera_hoopz) 
    {
        show_debug_message("Cinema() - Camera reset...");
        Cinema("kid", scr_event_action_camera_reset());
    }
    scr_event_hoopz_switch_control();
}
