/// Duergar("getname" / "alive" / "kill", "name")
if (argument_count > 1) var name = string_lower(argument[1]);

// Get full name and title //
if (argument[0] == "getname")
{
    if (name == "danedufresne") return "Dane-Dufresne";
    if (name == "jeanmarc") return "Jean-Marc";
    if (name == "typhoidlarry") return "Typhoid Larry";
    if (name == "vancleef") return "Van Cleef";
    if (name == "gandalfjunior") return "Gandalf Junior";
    
    name = string_insert(string_upper(string_char_at(name, 1)), name, 1); // ox = Oox
    return string_delete(name, 2, 1); // Delete extra
}
    
// CHECK IF DEAD OR ALIVE //
else if (argument[0] == "alive")
{
    if (argument_count == 2)
    {
        if (scr_quest_get_state("duergar_dead_" + name) == 1)
        {
            Quest("duergar", "dead");
            return false;
        }
        Quest("duergar", "alive");
        return true;
    }
    else
    {
        Quest("duergar_dead_" + name, argument[2]);
    }
}

// Duergar("aggro", "yordano") - Returns aggro of Yordano
// Duergar("aggro", "yordano", 1) - Sets aggro of Yordano
else if (argument[0] == "aggro")
{
    if (argument_count == 2) return Quest("duergar_aggro_" + name);
    Quest("duergar_aggro_" + name, real(argument[2]));
    return true;
}
    
// MURDER THEM //
if (argument[0] == "kill") Quest("duergar_dead_" + name, 1);

// SPAWN
if (argument[0] == "spawn") // 1 = duergar, 2 = x, 3 = y
{
    if (Duergar("alive", argument[1]) == 0) return 0;
    var bod = 0;
    var hed = 0;
    if (argument[1] == "bezawit" || argument[1] == "gandalfjunior")
    {
        obj = instance_create(argument[2], argument[3], o_enemy_duergar_wizard);
    }
    else
    {
        if (argument[1] == "archambeau") { hed = 1; }
        if (argument[1] == "astyages") { hed = 14; bod = 2; }
        if (argument[1] == "burglecut") { hed = 4; }
        // Bezawit above
        if (argument[1] == "constantine") { hed = 15; }
        if (argument[1] == "deveraux") { hed = 16; }
        if (argument[1] == "dozier") { hed = 17; bod = 3; } // plain body
        if (argument[1] == "garth") { hed = 18; }
        if (argument[1] == "guildenstern") { hed = 19; }
        if (argument[1] == "haile") { hed = 20; bod = 2; }
        if (argument[1] == "honus") { hed = 21; bod = 3; } // plain body
        if (argument[1] == "janos") { hed = 12; }
        if (argument[1] == "jeanmarc") { hed = 10; }
        if (argument[1] == "kim") { hed = 11; }
        if (argument[1] == "lafferty") { hed = 32; bod = 3; } // plain body
        if (argument[1] == "lugner") { hed = 6; }
        if (argument[1] == "melqart") { hed = 8; bod = 3; }
        if (argument[1] == "onslow") { hed = 13; }
        if (argument[1] == "osiris") { hed = 22; bod = 3; } // plain body
        if (argument[1] == "ox") { hed = 23; }
        if (argument[1] == "puannum") { hed = 7; }
        if (argument[1] == "rothlisbuergar") { hed = 24; }
        if (argument[1] == "rosencrantz") { hed = 25; }
        if (argument[1] == "schatzeder") { hed = 26; }
        if (argument[1] == "socrates") { hed = 27; bod = 2; }
        if (argument[1] == "thrax") { hed = 28; }
        if (argument[1] == "typhoidlarry") { hed = 29; }
        if (argument[1] == "vancleef") { hed = 30; bod = 1; }
        if (argument[1] == "vikingstad") { hed = 33; bod = 3; } // plain body
        if (argument[1] == "wendela") { hed = 31; }
        if (argument[1] == "yordano") { hed = 9; }
        obj = instance_create(argument[2], argument[3], o_enemy_duergar_gunner);
        obj.headType = hed;
        obj.bodyType = bod;
    }
    with (obj) 
    {
        name = argument[1];
        duergarName = argument[1];
        scr_AI_aggro_configure(9999, 9999, 9999);
        battleClear = 1;
    }
    global.battleMode = 1;
    PEDESTRIAN(false);
    global.gunPacify = false;
    return true;
}

// SPAWN ACTOR
if (argument[0] == "spawn actor") // 1 = duergar, 2 = x, 3 = y
{
    var str = "o_" + argument[1] + "01";
    return instance_create(real(argument[2]), real(argument[3]), asset_get_index(str));
}

if (argument[0] == "battle royal")
{
    with (o_enemygroup_duergars)
    {
        var sel = id;
        ds_list_clear(target_list);
        with (o_enemygroup_duergars)
        {
            if (id != sel) ds_list_add(sel.target_list, id);
        }
    }
    return true;
}

if (argument[0] == "init")
{
    // Create list of Standard Duergars
    _i = 0;
    global.duergarStandard[_i] = "archambeau"; _i += 1;
    global.duergarStandard[_i] = "astyages"; _i += 1;
    global.duergarStandard[_i] = "burglecut"; _i += 1;
    //global.duergarStandard[_i] = "bezawit"; _i += 1;
    global.duergarStandard[_i] = "gandalfjunior"; _i += 1;
    global.duergarStandard[_i] = "constantine"; _i += 1;
    global.duergarStandard[_i] = "deveraux"; _i += 1;
    global.duergarStandard[_i] = "dozier"; _i += 1;
    global.duergarStandard[_i] = "garth"; _i += 1;
    global.duergarStandard[_i] = "guildenstern"; _i += 1;
    global.duergarStandard[_i] = "haile"; _i += 1;
    global.duergarStandard[_i] = "honus"; _i += 1;
    global.duergarStandard[_i] = "janos"; _i += 1;
    global.duergarStandard[_i] = "jeanmarc"; _i += 1;
    global.duergarStandard[_i] = "kim"; _i += 1;
    global.duergarStandard[_i] = "lafferty"; _i += 1;
    global.duergarStandard[_i] = "lugner"; _i += 1;
    global.duergarStandard[_i] = "melqart"; _i += 1;
    global.duergarStandard[_i] = "onslow"; _i += 1;
    global.duergarStandard[_i] = "osiris"; _i += 1;
    global.duergarStandard[_i] = "ox"; _i += 1;
    global.duergarStandard[_i] = "puannum"; _i += 1;
    global.duergarStandard[_i] = "rothlisbuergar"; _i += 1;
    global.duergarStandard[_i] = "rosencrantz"; _i += 1;
    global.duergarStandard[_i] = "schatzeder"; _i += 1;
    global.duergarStandard[_i] = "socrates"; _i += 1;
    global.duergarStandard[_i] = "thrax"; _i += 1;
    global.duergarStandard[_i] = "typhoidlarry"; _i += 1;
    global.duergarStandard[_i] = "vancleef"; _i += 1;
    global.duergarStandard[_i] = "vikingstad"; _i += 1;
    global.duergarStandard[_i] = "wendela"; _i += 1;
    global.duergarStandard[_i] = "yordano"; _i += 1;
    global.duergarStandardAmount = _i;
    // Create list of Nonstandard Duergars
    _i = 0;
    global.duergarNonstandard[_i] = "danedufresne"; _i += 1;
    global.duergarNonstandard[_i] = "gottler"; _i += 1;
    global.duergarNonstandard[_i] = "jeltsje"; _i += 1;
    global.duergarNonstandard[_i] = "hasdrubal"; _i += 1;
    global.duergarNonstandard[_i] = "lucretia"; _i += 1;
    global.duergarNonstandard[_i] = "oolon"; _i += 1;
    global.duergarNonstandard[_i] = "perry"; _i += 1;
    global.duergarNonstandard[_i] = "lumis"; _i += 1;
    global.duergarNonstandard[_i] = "ng"; _i += 1;
    global.duergarNonstandard[_i] = "iptehar"; _i += 1;
    global.duergarNonstandardAmount = _i;
    // Create list of ALL duergars
    _i = 0;
    for (_h = 0; _h < global.duergarStandardAmount; _h += 1)
    {
        global.duergarAll[_i] = global.duergarStandard[_h]; 
        _i += 1;
    }
    for (_h = 0; _h < global.duergarNonstandardAmount; _h += 1)
    {
        global.duergarAll[_i] = global.duergarNonstandard[_h]; 
        _i += 1;
    }
    global.duergarAllAmount = _i;
    return true;
}
