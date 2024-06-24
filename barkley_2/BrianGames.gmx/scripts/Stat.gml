/// Stat(string_stat [IE. "hp" / "piety"], string_value [IE. "50%" / "30" / "-2"], object_id [optional; hoopz default])
//Argument0 = "hp" / "guts" / "luck" / "agile" / "acrobatics" / "piety" / "might"
//Argument1 = Value
//Argument2 = Object ID (optional; hoopz default)
//Example: Stat("hp", "+50%");                 - Restores 50% of HP for o_hoopz
//Example: Stat("hp", "50%");                  - Sets HP to 50% for o_hoopz
//Example: Stat("hp", "-50%", o_enemy_object); - Removes 50% of HP for o_enemy_object
//All stats except HP are permanent (to base stats)

if (argument_count == 1)
{
    if (argument[0] == "guts") { _stt = statGuts; }
    else if (argument[0] == "luck") { _stt = statLuck; }
    else if (argument[0] == "agile" || argument[0] == "acrobatics") { _stt = statAcrobatics; }
    else if (argument[0] == "might") { _stt = statMight; }
    else if (argument[0] == "piety") { _stt = statPiety; }
    else { _stt = statHP; }
    return _stt;
}
else
{
    _edt = string(argument[1]);
    _edt = round(real(_edt));
    if (argument[0] == "guts") { statGuts += _edt; }
    else if (argument[0] == "luck") { statLuck += _edt; }
    else if (argument[0] == "agile" || argument[0] == "acrobatics") { statAcrobatics += _edt; }
    else if (argument[0] == "might") { statMight += _edt; }
    else if (argument[0] == "piety") { statPiety += _edt; }
    else { statHP += _edt; }
    //return _stt;
}

exit;
{
    if (argument[0] == "guts") { _stt = STAT_BASE_GUTS; }
    else if (argument[0] == "luck") { _stt = STAT_BASE_LUCK; }
    else if (argument[0] == "agile" || argument[0] == "acrobatics") { _stt = STAT_BASE_AGILE; }
    else if (argument[0] == "might") { _stt = STAT_BASE_MIGHT; }
    else if (argument[0] == "piety") { _stt = STAT_BASE_PIETY; }
    else { _stt = STAT_CURRENT_HP; }
    
    _edt = string(argument[1]);
    
    if (argument_count == 3) _obj = argument[2]; else _obj = o_hoopz;
    if (_stt == STAT_CURRENT_HP) _mtt = STAT_EFFECTIVE_MAX_HP; else _mtt = _stt;
    
    _pct = 0;
    if (string_count("%", _edt) > 0) { _edt = string_replace(_edt, "%", ""); _pct = 1; }
    if (string_count("+", _edt) == 0 && string_count("-", _edt) == 0) _rel = 0; else _rel = 1; //Relative or not
    _edt = round(real(_edt));
    
    if (_pct == 0)
    {
        if (_stt == STAT_CURRENT_HP)
        {
            _org = scr_stats_getCurrentStat(_obj, _stt);
            if (_rel == 0) _org = 0;
            scr_stats_setCurrentStat(_obj, _stt, _org + _edt);
        }
        else 
        {
            _org = scr_stats_getBaseStat(_obj, _stt);
            if (_rel == 0) _org = 0;
            scr_stats_setBaseStat(_obj, _stt, _org + _edt);
        }
    }
    else //Set by percentage
    {
        if (_stt == STAT_CURRENT_HP)
        {
            _org2 = scr_stats_getCurrentStat(_obj, _stt);
            _org = scr_stats_getEffectiveStat(_obj, _mtt);
            if (_rel == 0) _org2 = 0;
            scr_stats_setCurrentStat(_obj, _stt, _org2 + round((_org / 100) * _edt));
        }
        else 
        {
            _org = scr_stats_getBaseStat(_obj, _stt);
            _org2 = _org;
            if (_rel == 0) _org2 = 0;
            scr_stats_setBaseStat(_obj, _stt, _org2 + round((_org / 100) * _edt));
        }
    }
}
