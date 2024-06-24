/// Chatroulette()

// WARNING:
// ALL CALLS TO THIS SCRIPT MUST BE MADE IN THE oChatroulette OBJECT!

if (argument[0] == "dialog" || argument[0] == "dialogue")
{
    with (oChatroulette)
    {
        msg = Chatroulette("parse", argument[1]);
        Chatroulette("add lines");
    }
}
else if (argument[0] == "process") // Process line
{
    var txt;
    if (argument_count == 1) txt = ds_list_find_value(dslQue, chtLin);
    else txt = argument[1];
    show_debug_message("Chatroulette(): " + txt);
    // chtLin += 1;
    var pos = string_pos(": ", txt) + 1;
    var txtCut = string_copy(txt, pos + 1, string_length(txt) - pos);
    
    if (string_pos("IF ", txt) > 0)
    {
        txt = string_copy(txt, 1, string_pos(":", txt) - 1); // Extract first if txt
        //show_debug_message("Chatroulette() - " + txt);
        txt = string_delete(txt, 1, 3); // REMOVE "IF "
        var comTyp = 0;
        var comCut = 0;
        var comVal = 0;
        var comValRaw = 0;
        var comNam = "";
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
        //comValRaw = comVal;
        if (is_real(comVal)) comVal = real(comVal);
        var bol = 0;
        show_debug_message("Chatroulette() - IF quest >" + comNam + "< to >" + string(comVal) + "< and comparison type is >" + string(comTyp) + "<.");
        if (comTyp == 0) { if (real(scr_quest_get_state(comNam)) < real(comVal)) bol = 1; }
        if (comTyp == 1) { if (string(scr_quest_get_state(comNam)) == string(comVal)) bol = 1; }
        if (comTyp == 2) { if (real(scr_quest_get_state(comNam)) > real(comVal)) bol = 1; }
        if (comTyp == 3) { if (string(scr_quest_get_state(comNam)) != string(comVal)) bol = 1; }
        if (comTyp == 4) { if (real(scr_quest_get_state(comNam)) >= real(comVal)) bol = 1; }
        if (comTyp == 5) { if (real(scr_quest_get_state(comNam)) <= real(comVal)) bol = 1; }
        if (bol == 1) { Chatroulette("process", txtCut); exit; }
        else { chtLin += 1; Chatroulette("process"); } // goto next statement
        exit;
    }
    
    chtLin += 1;
    
    if (string_pos("REPLY > ", txt) > 0) 
    {
        var po2 = string_pos("> ", txt) + 2;
        ds_list_add(dslRep, txtCut);
        ds_list_add(dslRepGot, string_copy(txt, po2, pos - po2 - 1));
        chtRep = 1;
        Chatroulette("process"); // Keep getting replies
    }
    if (chtRep) exit;
    
    if (string_pos("SPEED: ", txt) > 0) { chtSpd = real(txtCut); }
    if (string_pos("PARTNER AVATAR: ", txt) > 0) { parAva = real(txtCut); }
    if (string_pos("YOU AVATAR: ", txt) > 0) { youAva = real(txtCut); }
    if (string_pos("WAIT: ", txt) > 0) { chtWai = real(txtCut); } //show_debug_message("wait " + txtCut); }
    if (string_pos("DISCONNECT", txt) > 0)
    {
        chtAct = 0;
        conDis = 2;
        parAva = -1;
        Chatroulette("dialog", "Partner has left.");
    }
    if (string_pos("SYSTEM: ", txt) > 0)
    {
        Chatroulette("dialog", txtCut);
    }
    if (string_pos("PARTNER: ", txt) > 0) 
    {
        chtWai = 1.0 + (string_length(txtCut) / chtSpd);
        chtTyp = string_length(txtCut) / chtSpd;
        chtDia = "par";
        chtTxt = txtCut;
    }
    if (string_pos("YOU: ", txt) > 0) 
    {
        chtRep = 1;
        chtRepCou = chtRepDel;
        ds_list_add(dslRep, txtCut);
        ds_list_add(dslRepGot, "CONTINUE");
    }
    if (string_pos("GOTO: ", txt) > 0) 
    {
        show_debug_message("Chatroulette(): Executing GOTO > " + txtCut);
        Chatroulette("goto", txtCut);
    }
    if (string_pos("QUEST: ", txt) > 0) 
    {
        txt = string_delete(txt, 1, 7); // REMOVE "QUEST: "
        var qstNam = string_copy(txt, 1, string_pos(" =", txt) - 1); // Quest name
        txt = string_delete(txt, 1, string_pos(" =", txt) + 2); // REMOVE TO =
        var qstVal = string_copy(txt, 1, string_length(txt)); // Quest value
        if (is_real(qstVal)) qstVal = real(qstVal);
        Quest(qstNam, qstVal);
    }
    Chatroulette("step"); // added late, should be good but could add issues?
}
else if (argument[0] == "goto")
{
    var lin = ds_map_find_value(dsmLab, argument[1]);
    if (is_undefined(lin)) Chatroulette("dialog", "ERROR: No such label to GOTO > " + argument[1]);
    else { chtLin = lin; Chatroulette("process"); }
}
else if (argument[0] == "choose")
{
    ds_list_clear(dslRep);
    ds_list_clear(dslRepGot);
    chtRep = 0;
    Chatroulette("dialog", "You: " + argument[2]);
    if (argument[1] != "CONTINUE") Chatroulette("goto", argument[1]);
}
else if (argument[0] == "que" || argument[0] == "queue")
{
    ds_list_add(dslQue, argument[1]);
}
else if (argument[0] == "step")
{
    if (chtAct == 0) exit; // disconnect
    if (chtRepCou > 0)
    {
        chtRepCou -= dt_sec();
        if (chtRepCou <= 0) chtRepCou = 0;
    }
    if (chtRep == 1) exit;
    if (chtWai > 0) 
    {
        if (chtWai < chtTyp) parTyp = 1; else parTyp = 0;
        chtWai -= dt_sec();
    }
    else 
    {
        parTyp = 0; // Maybe not here?
        chtTyp = 0;
        if (chtDia == "par") Chatroulette("dialog", "Partner: " + chtTxt);
        if (chtDia == "you") Chatroulette("dialog", "You: " + chtTxt);
        chtDia = "";
        Chatroulette("process");
    }
    
}
else if (argument[0] == "parse")
{
    var txt = argument[1];
    txt = string_replace_all(txt, "P_NAME_F", P_NAME_F);
    txt = string_replace_all(txt, "P_NAME_S", P_NAME_S);
    txt = string_replace_all(txt, "P_NAME", P_NAME);
    return txt;
}
else if (argument[0] == "init")
{
    dslQue = ds_list_create();
    dslRep = ds_list_create();
    dslRepGot = ds_list_create();
    dsmLab = ds_map_create();
    chtAct = 0;
    chtWai = 0; // Wait
    chtTyp = 0;
    chtRep = 0;
    chtRepDel = 1; // delay in seconds to reply
    chtRepCou = 0;
    chtLin = 0;
    chtDia = "";
    chtTxt = "";
    chtSpd = 25;
}
else if (argument[0] == "reset")
{
    chtLin = 0;
    chtRep = 0;
    chtDia = "";
    chtSpd = 25;
    chtWai = 0;
}
else if (argument[0] == "load")
{
    ds_list_clear(dslQue);
    ds_list_clear(dslRep);
    ds_list_clear(dslRepGot);
    ds_map_clear(dsmLab);
    for (var iii = 0; iii < ds_list_size(argument[1]); iii += 1)
    {
        Chatroulette(ds_list_find_value(argument[1], iii));
    }
}
else if (argument[0] == "script")
{
    var dlg = argument[1] + chr(13) + chr(10);
    var dsl = ds_list_create();
    var pos = string_pos(chr(13) + chr(10), dlg);
    show_debug_message("pos: " + string(pos));
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
            if (string_copy(str, string_length(str), 1) == " ") str = string_copy(str, 1, string_length(str)- 1);
            ds_list_add(dsl, str);
            show_debug_message(str);
        }
        pos = string_pos(chr(13) + chr(10), dlg);
    }
    return dsl;
}
else if (argument[0] == "exit")
{
    ds_list_destroy(dslQue);
    global.event = 0;
    o_curs.toggleCursor = true;
    instance_destroy();
}
else if (argument[0] == "mouse")
{
    return cursorX >= view_xview[0] + argument[1] && cursorY >= view_yview[0] + argument[2] && cursorX <= view_xview[0] + argument[3] && cursorY <= view_yview[0] + argument[4];
}
else if (argument[0] == "button next") // 0
{
    chtAct = 0;
    butNam[i] = "Next";
    parMsgCou = -1;
    parTyp = 0;
    parAva = -1;
    ds_list_clear(dslLin);
    ds_list_clear(dslLinCol);
    ds_list_clear(dslRep);
    msg = "Finding partner...";
    Chatroulette("add lines");
    conTim = 1.5 + random(1);
}
else if (argument[0] == "button stop") Chatroulette("exit"); // 1
else if (argument[0] == "button premium") boxPre = 1; // 2
else if (argument[0] == "button send") // 3
{
    if (ds_list_size(dslRep) == 0) exit;
    Chatroulette("choose", ds_list_find_value(dslRepGot, repSel), ds_list_find_value(dslRep, repSel));
    repSel = 0;
}
else if (argument[0] == "button autobap") butSta[4] = !butSta[4]; // 4
else if (argument[0] == "partner list")
{
    parCou = 0;
    ds_list_clear(dslPar);
    for (i = 0; i < npcCount; i += 1) ds_list_add(dslPar, i);
    ds_list_shuffle(dslPar);
    ds_list_insert(dslPar, 2 + floor(random(3)), 999); // Insert Cdwarf
    //ds_list_insert(dslPar, 0, 999); // DEBUG
}
else if (argument[0] == "get partner")
{
    youAva = 4; // Reset hoopz
    parTyp = 0;
    ds_list_clear(dslLin);
    ds_list_clear(dslLinCol);
    Chatroulette("dialog", "Connected to somebody.");
    Chatroulette("dialog", " ");
    Chatroulette("reset");
    //show_debug_message("Partner = " + string(dslPar[| parCou]));
    if (dslPar[| parCou] != 999) Chatroulette("load", dialogNPC[dslPar[| parCou]]);
    else Chatroulette("load", dialogCdwarf);
    parCou += 1;
    if (parCou >= ds_list_size(dslPar)) Chatroulette("partner list");
    chtAct = 1;
}
else if (argument[0] == "add lines")
{
    if (msg == "") 
    {
        ds_list_add(dslLin, "");
        ds_list_add(dslLinCol, c_black);
        exit;
    }
    widMax = chatWidth - 10;
    col = c_black;
    if (string_copy(msg, 1, 4) == "You:") col = c_blue;
    if (string_copy(msg, 1, 8) == "Partner:") col = c_red;
    draw_set_font(global.fn_chat);
    while (msg != "")
    {
        wid = 0;
        for (i = 1; i <= string_length(msg); i += 1)
        {
            if (string_copy(msg, i, 1) == " ")
            {
                wid = string_width(string_copy(msg, 1, i));
                if (wid < widMax) //320
                {
                    msgCur = string_copy(msg, 1, i);
                    msgCut = i;
                }
                else break;
            }
        }
        if (string_width(msg) < widMax && i - 1 == string_length(msg)) // wid < widMax
        { 
            msgCut = string_length(msg); 
            msgCur = msg; 
        }
        ds_list_add(dslLin, msgCur);
        ds_list_add(dslLinCol, col);
        while (ds_list_size(dslLin) > 8) ds_list_delete(dslLin, 0);
        msg = string_delete(msg, 1, msgCut);
    }
}
else // Add to queue OR make a label
{
    if (string_pos(": ", argument[0]) > 0 || string_pos("DISCONNECT", argument[0]) > 0) Chatroulette("que", argument[0]);
    else ds_map_add(dsmLab, argument[0], ds_list_size(dslQue));
}
