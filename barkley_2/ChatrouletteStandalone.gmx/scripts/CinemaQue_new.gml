/// CinemaQue(que / whitespace / command_string)
// This is broken off for speed reasons
if (argument_count == 1)
{
    if (string_pos("|", argument[0]) > 0) 
    {
        ds_list_add(global.dslCinLab, 0);
        CinemaQue("que", argument[0]);
    }
    else // Label
    {
        ds_list_add(global.dslCinLab, 1);
        ds_list_add(global.dslCinQue, argument[0]);
        ds_map_add(global.dsmCinLab, argument[0], ds_list_size(global.dslCinQue));
    }
}
else if (argument[0] == "whitespace") // Removes front and back whitespace froma rgument[1]
{
    var _st = argument[1];
    for (var c = 1; c < 999; c += 1) { if (string_copy(_st, c, 1) != " ") break; }
    if (c > 1) _st = string_delete(_st, 1, c - 1);
    var stl = string_length(_st);
    for (var c = 0; c < 999; c += 1) { if (string_copy(_st, stl - c, 1) != " ") break; }
    if (c > 0) _st = string_delete(_st, stl - c + 1, c);
    //show_debug_message("WHITESPACE2 >" + _st + "<");
    return _st;
}
else if (argument[0] == "que")
{
    var _in = ds_list_size(global.dslCinQue);
    ds_list_add(global.dslCinQue, argument[1]);
    
    // Break into sub commands
    var _st = argument[1];
    if (_st != "")
    {
        var exc = string_split_fast(_st);
        for (var i = 0; i < array_length_1d(exc); i += 1)
        {
            exc[i] = CinemaQue("whitespace", exc[i]);
            global.arrCinQue[_in, i] = exc[i];
        }
    }
    
    // Grab all variables - if statements, @ in dialog, anything after quest
    var qst = 0;
    for (var i = 0; i < array_length_2d(global.arrCinQue, _in); i += 1)
    {
        var _tx = global.arrCinQue[_in, i];
        if (qst == 1)
        {
            qst = 0;
            Cinema("prune quest", _tx);
            Cinema("variable", qstNam);
        }
        if (string_pos("IF ", _tx) > 0) { Cinema("prune if", _tx); Cinema("variable", comNam); }
        while (string_pos("@", _tx) > 0)
        {
            var _ps = string_pos("@", _tx);
            _tx = string_delete(_tx, 1, _ps);
            _ps = string_pos("@", _tx);
            qstNam = string_copy(_tx, 1, _ps - 1);
            _tx = string_delete(_tx, 1, _ps);
            Cinema("variable", qstNam);
        }
        if (string_pos("QUEST", _tx) > 0) qst = 1;
    }
}
