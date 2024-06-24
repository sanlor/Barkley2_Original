/// Zauber()

if (argument[0] == "init")
{
    global.zauberList = ds_list_create();
    // Zauber HUD icon is in s_item_16
    //               Ref        Script              Name                       Color      Sub
    Zauber("define", "bio0",    ZauberPozzosPrison, "Pozzo's Prison",          c_bio,     4);
    Zauber("define", "kosmik0", ZauberPush,         "Duffery's Flagrant Foul", c_cosmic,  7);
    Zauber("define", "zauber0", ZauberStarlight,    "Summon Some Fary's",      c_zauber,  8);
    Zauber("define", "mental0", ZauberBallSucker,   "Ball Sucker",             c_mental,  6);
    Zauber("define", "cyber0",  ZauberFeeber,       "MaxFeeber.EXE",           c_cyber,   5);
    Zauber("define", "clown0",  ZauberClown,        "Confetti Brast",          c_fuchsia, 12);
    return 1;
}

if (argument[0] == "slot")
{
    if (argument_count == 1) return Quest("playerZauberSlot");
    else Quest("playerZauberSlot", argument[1]);
    return 1;
}

if (argument[0] == "slot ref") 
{
    var dsl = scr_savedata_get("player.zaubers");
    if (argument_count == 1) return ds_list_find_value(dsl, Zauber("slot"));
    return ds_list_find_value(dsl, argument[1]);
}

if (argument[0] == "slot next")
{
    if (Zauber("amount") <= 1) return 1;
    Zauber("slot", Zauber("slot") + 1);
    if (Zauber("slot") >= Zauber("amount")) Zauber("slot", 0);
    return 1;
}

if (argument[0] == "amount") return ds_list_size(scr_savedata_get("player.zaubers"));

// Zauber("name", "bio0") = "Pozzo's Prison"
if (argument[0] == "name")
{
    var _in = ds_list_find_index(global.zauberList, argument[1]);
    return global.zauberName[_in];
}

// Zauber("script", "bio0") = ZauberPozzosPrison
if (argument[0] == "script")
{
    var _in = ds_list_find_index(global.zauberList, argument[1]);
    return global.zauberScript[_in];
}

// Zauber("color", "bio0") = c_bio
if (argument[0] == "color")
{
    var _in = ds_list_find_index(global.zauberList, argument[1]);
    return global.zauberColor[_in];
}

// Zauber("sub", "bio0") = 4
if (argument[0] == "sub")
{
    var _in = ds_list_find_index(global.zauberList, argument[1]);
    return global.zauberSub[_in];
}

if (argument[0] == "define")
{
    var _in = ds_list_size(global.zauberList);
    ds_list_add(global.zauberList, argument[1]);
    global.zauberScript[_in] = argument[2];
    global.zauberName[_in] = argument[3];
    global.zauberColor[_in] = argument[4];
    global.zauberSub[_in] = argument[5];
    return 1;
}

if (argument[0] == "reset")
{
    scr_savedata_put_list("player.zaubers", ds_list_create());
    Zauber("slot", NULL);
    return 1;
}

if (argument[0] == "clear")
{
    ds_list_clear(scr_savedata_get("player.zaubers"));
    return 1;
}

if (argument[0] == "gain")
{
    var dsl = scr_savedata_get("player.zaubers");
    if (ds_list_find_index(dsl, argument[1]) == -1)
    {
        ds_list_add(dsl, argument[1]);
    }
    else show_debug_message("Zauber('gain') - Didn't gain, you already have " + string(argument[1]));
    return 1;
}

// Zauber("effect", color, dir)
if (argument[0] == "effect")
{
    var caster = o_hoopz.id;
    var csx = caster.x + lengthdir_x(24, argument[2]);
    var csy = caster.y + lengthdir_y(24, argument[2]);
    audio_play_sound_on_actor(caster, "periodic_released", false, 100);
    obj = instance_create(csx, csy - 20, oZauberCast);
    obj.color = argument[1];
    obj.dir = argument[2];
    with (obj) event_user(0);
    return 1;
}

// Zauber("draw icon", ref, x, y, alpha?)
if (argument[0] == "draw icon")
{
    var _al = 1;
    if (argument_count > 4) _al = argument[4];
    
    draw_sprite_ext(s_item_16, Zauber("sub", argument[1]), argument[2], argument[3], 1, 1, 0, c_white, 1);
    return 1;
}

/// Zauber("cast", ref, caster, aim_x, aim_y, aim_z)
if (argument[0] == "cast")
{
    var zauber       = Zauber("script", argument[1]);
    var caster       = argument[2];
    var cast_x       = argument[3];
    var cast_y       = argument[4];
    var cast_z       = argument[5];
    
    var res = script_execute(zauber, "cast", caster, cast_x, cast_y, cast_z);
    Zauber("stat", caster, 1, 1, 1, 1, 1); // "Level 1" reduction, 3 is 2, 5 is 3
    
    return res;
}

// Zauber("stat", actor, G, L, A, M, P)
if (argument[0] == "stat")
{
    var actor = argument[1];
    var G = argument[2];
    var L = argument[3];
    var A = argument[4];
    var M = argument[5];
    var P = argument[6];
    
    var current = scr_statusEffect_getFromCombatActor(actor, statusEffect_zauberGlamp);
    if (current == NULL) {
        scr_statusEffect_applyFromScriptToCombatActor(statusEffect_zauberGlamp, actor);
        current = scr_statusEffect_getFromCombatActor(actor, statusEffect_zauberGlamp);
    }
    
    current[? STAT_BASE_GUTS] += G;
    current[? STAT_BASE_LUCK] += L;
    current[? STAT_BASE_AGILE] += A;
    current[? STAT_BASE_MIGHT] += M;
    current[? STAT_BASE_PIETY] += P;
    current[? "timer"] = 100;
    
    return 1;
}

show_debug_message("Zauber() - Unknown command " + string(argument[0]));
