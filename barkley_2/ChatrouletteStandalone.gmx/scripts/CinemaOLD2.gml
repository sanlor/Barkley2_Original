// goto:
// quest: GET / SET
// dialog, dialogue: 
// choice: add
var _cr = "|"; // Delimiter
if (argument[0] == "history")
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
    if (global.cinLin >= ds_list_size(global.dslCinQue)) { global.cinAct = 0; global.cinFin = 1; }
}
else if (argument[0] == "next line")
{
    global.cinSub = 0; 
    Cinema("history");
    global.cinLin += 1;
    if (global.cinLin >= ds_list_size(global.dslCinQue)) { global.cinAct = 0; global.cinFin = 1; }
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
    qstNam = string_copy(txt, 1, string_pos(" =", txt) - 1); // Quest name
    txt = string_delete(txt, 1, string_pos(" =", txt) + 2); // REMOVE TO =
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
    if (chtRep == 0 && global.dslCinLab[| global.cinLin]) { global.cinAct = 0; global.cinFin = 1; exit; }
    if (global.dslCinLab[| global.cinLin] == 0) var txt = global.arrCinQue[global.cinLin, global.cinSub];
    else txt = "";
    show_debug_message("Cinema(): " + txt);
    
    if (string_pos("IF", txt) > 0)
    {
        Cinema("prune if", txt);
        if (is_real(comVal)) comVal = real(comVal);
        comVl0 = scr_quest_get_state(comNam);
        if (is_real(comVl0)) { comVal = real(comVal); comVl0 = real(comVl0); }
        var bol = 0;
        show_debug_message("Cinema() - IF quest >" + comNam + "< to >" + string(comVal) + "< and comparison type is >" + string(comTyp) + "<.");
        //show_debug_message("Cinema() - " + string(is_real(comVl0)) + " <> " + string(is_real(comVal)));
        if (comTyp == 0) { if (real(scr_quest_get_state(comNam)) < real(comVal)) bol = 1; }
        if (comTyp == 1) { if (is_real(comVl0) == is_real(comVal) && comVl0 == comVal) bol = 1; }
        if (comTyp == 2) { if (real(scr_quest_get_state(comNam)) > real(comVal)) bol = 1; }
        if (comTyp == 3) { if (is_real(comVl0) != is_real(comVal) || comVl0 != comVal) bol = 1; }
        if (comTyp == 4) { if (real(scr_quest_get_state(comNam)) >= real(comVal)) bol = 1; }
        if (comTyp == 5) { if (real(scr_quest_get_state(comNam)) <= real(comVal)) bol = 1; }
        if (bol == 1) { Cinema("next"); Cinema("process"); exit; }
        else { Cinema("next line"); Cinema("process"); } // goto next statement
        exit;
    }
    else if (string_pos("REPLY", txt) > 0) 
    {
        Cinema("next");
        ds_list_add(global.dslCinRepGot, global.arrCinQue[global.cinLin, global.cinSub]);
        Cinema("next");
        ds_list_add(global.dslCinRep, global.arrCinQue[global.cinLin, global.cinSub]);
        Cinema("next");
        Cinema("process"); // Keep getting replies
    }
    else
    {
        if (chtRep && chtTxt != "")
        {
            // Invoke choicer
            
            stt = "choice";
            arg[0] = chtTxt;
            chtTxt = "";
            show_debug_message("Cinema(): Invoke choice");
        }
    }
    if (chtRep) exit;
    
    if (string_pos("CHOICE", txt) > 0) 
    {
        ds_list_clear(global.dslCinRep);
        ds_list_clear(global.dslCinRepGot);
        chtRep = 1;
        Cinema("next");
        txt = global.arrCinQue[global.cinLin, global.cinSub];
        chtTxt = txt;
        // invoke thing for choice
        Cinema("next");
        Cinema("process");
        exit;
    } 
    if (string_pos("WAIT", txt) > 0) 
    { 
        Cinema("next");
        txt = global.arrCinQue[global.cinLin, global.cinSub];
        global.cinWai = real(txt);
    } 
    if (string_pos("EXIT", txt) > 0)
    {
        global.cinAct = 0;
        global.cinFin = 1; 
    }
    if (string_pos("DIALOG", txt) > 0)
    {
        stt = "dialog";
        Cinema("next");
        arg[0] = global.arrCinQue[global.cinLin, global.cinSub];
        Cinema("next");
        arg[1] = Cinema("parse",global.arrCinQue[global.cinLin, global.cinSub]);
        global.cinAct = 0;
        // Invoke dialog
        //Cinema("dialog", nam, Cinema("parse", txt));
    }
    if (string_pos("ITEM", txt) > 0)
    {
        stt = "dialog";
        arg[0] = "ITEM";
        Cinema("next");
        arg[1] = global.arrCinQue[global.cinLin, global.cinSub];
        global.cinAct = 0;
    }
    if (string_pos("NOTE", txt) > 0)
    {
        stt = "dialog";
        Cinema("next");
        arg[0] = "NOTE " + global.arrCinQue[global.cinLin, global.cinSub];
        Cinema("next");
        arg[1] = global.arrCinQue[global.cinLin, global.cinSub];
        global.cinAct = 0;
    }
    if (string_pos("LOOK", txt) > 0)
    {
        Cinema("next");
        nam = global.arrCinQue[global.cinLin, global.cinSub];
        Cinema("next");
        txt = global.arrCinQue[global.cinLin, global.cinSub];
        Cinema("next");
        Cinema("look", nam, txt);
    }
    if (string_pos("PLAYSET", txt) > 0)
    {
        Cinema("next line");
        show_debug_message("Cinema() - PLAYSET");
    }
    if (string_pos("GOTO", txt) > 0) 
    {
        Cinema("next");
        txt = global.arrCinQue[global.cinLin, global.cinSub];
        Cinema("goto", txt);
    }
    if (string_pos("QUEST", txt) > 0)
    {
        Cinema("next");
        txt = global.arrCinQue[global.cinLin, global.cinSub];
        Cinema("prune quest", txt);
        if (is_real(qstVal)) qstVal = real(qstVal);
        show_debug_message("Cinema(): QUEST > " + qstNam + " = " + qstVal);
        scr_quest_set_state(qstNam, qstVal);
        Cinema("next");
    }
}
else if (argument[0] == "look")
{
    show_debug_message("Cinema > Look > " + argument[1] + " > " + argument[2]);
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
    chtRep = 0;
    Cinema("goto", argument[1]); // continue was for regular line, remove
}
else if (argument[0] == "step")
{
    if (chtRep == 1) exit;
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
    global.cinLin = 0;
    global.cinSub = 0;
    global.cinWai = 0;
    global.cinAct = 0;
    global.cinFin = 0;
    chtRep = 0;
    chtTxt = "";
}
else if (argument[0] == "run") // Feed in a string with commands
{
    var ptm = get_timer();
    Cinema("reset");
    global.cinAct = 1;
    var _ds = Cinema("load", argument[1]);
    for (var i = 0; i < ds_list_size(_ds); i += 1) CinemaQue(ds_list_find_value(_ds, i));
    show_debug_message("Cinema() - Loaded script in " + string((get_timer() - ptm) / 1000) + "ms.");
}
else if (argument[0] == "load")
{
    var nwl = chr(13) + chr(10);
    var dlg = argument[1] + nwl;
    var dsl = ds_list_create();
    var pos = string_pos(chr(13) + chr(10), dlg);
    var stl = 0;
    while (pos > 0)
    {
        var skp = 0;
        var str = string_copy(dlg, 1, pos - 1);
        dlg = string_delete(dlg, 1, pos + 1);
        pos = string_pos("//", str);
        if (pos > 0) str = string_copy(str, 1, pos - 1);
        if (string_copy(str, 1, 1) == " " || str == "") skp = 1;
        if (skp == 0)
        {
            stl = string_length(str);
            if (string_copy(str, stl, 1) == " ") str = string_copy(str, 1, stl - 1);
            ds_list_add(dsl, str);
        }
        pos = string_pos(nwl, dlg);
    }
    return dsl;
}
