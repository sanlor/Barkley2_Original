/// Enemy
if (argument[0] == "init")
{
    global.enemyName = ds_list_create();
    global.enemyDebug0 = ds_list_create();
    global.enemyDebug1 = ds_list_create();
    global.enemyDebug2 = ds_list_create();
    global.enemyDebug3 = ds_list_create();
    // Add to s_enemy_editor in the exact order this is written
    //Tutorial
    Enemy("define", "o_enemy_drone_egg", "stun");
    //Sewers
    Enemy("define", "o_enemy_catfish_small", "shot");
    Enemy("define", "o_enemy_catfish_small_poison", "snipe");
    Enemy("define", "o_enemy_catfish_shield", "smash");
    Enemy("define", "o_enemy_catfish_shell");
    Enemy("define", "o_enemy_catfish_mounted", "poke");
    Enemy("define", "o_enemy_explosiveRat", "destruct");
    // SEWER BOSS
    Enemy("define", "o_enemy_babbySystem", "poke");
    Enemy("define", "o_enemy_catfish_queen", "smash", "soak");
    //Wasteland
    Enemy("define", "o_enemy_cGremlin_small_deg", "poke", "charge");
    Enemy("define", "o_enemy_cGremlin_small", "slash", "charge");
    Enemy("define", "o_enemy_cGremlin_brawler", "slash", "charge");
    Enemy("define", "o_enemy_cGremlin_gunner", "shot", "snipe");
    Enemy("define", "o_enemy_cGremlin_jetpack", "charge");
    Enemy("define", "o_enemy_junkbot");
    // WASTELAND BOSS
    Enemy("define", "o_enemy_junkworm");
    Enemy("define", "o_enemy_wastelandScourge");
    //Gilbert's Peak, Caves, Mines
    Enemy("define", "o_enemy_tengu_normal", "slash", "poke");
    Enemy("define", "o_enemy_tengu_crossbow", "snipe", "bomb");
    Enemy("define", "o_enemy_skullpep", "soak");
    //PEAK BOSS
    Enemy("define", "o_enemy_spirit_samurai", "slash", ); //"omnislash"?
    //Swamps
    Enemy("define", "o_enemy_kobold_small", "poke");
    Enemy("define", "o_enemy_kobold_medium", "smash", ); //"kick"?
    Enemy("define", "o_enemy_kobold_large", "shot");
    Enemy("define", "o_enemy_crabbold", "soak");
    Enemy("define", "o_enemy_weresnail_gunner", "shot");
    Enemy("define", "o_enemy_werecroc", "slash");
    Enemy("define", "o_enemy_mosquito", "soak");
    Enemy("define", "o_enemy_bugflower_mimic", "slash"); //"bite"?
    Enemy("define", "o_enemy_bugflower_nonmimic");
    Enemy("define", "o_enemy_vineMonster", "shot");
    //SWAMP BOSS
    Enemy("define", "o_enemy_kobold_philosopher", "soak");
    Enemy("define", "o_enemy_corpseblossom", "soak");
    //Power Plant
    Enemy("define", "o_enemy_alienMenace_medium", "slash");
    Enemy("define", "o_enemy_brainTree");
    Enemy("define", "o_enemy_alienMenace_egg");
    Enemy("define", "o_enemy_alienMenace_baby", "poke");
    Enemy("define", "o_enemy_darkRat", "destruct");
    //BOSS
    Enemy("define", "o_enemy_largebrainalien");
    Enemy("define", "o_enemy_hugebrainalien");
    //AI Ruins
    Enemy("define", "o_enemy_ruinedDrone", "shock");
    Enemy("define", "o_enemy_smCrabotron", "soak", "charge");
    Enemy("define", "o_enemy_cyberRat", "destruct");
    // RUINS BOSS
    Enemy("define", "o_enemy_crabotron", "charge", "soak", "shock");
    Enemy("define", "o_enemy_crabcommando_body");
    //Undersewers
    Enemy("define", "o_enemy_sewerBeast_young", "shot");
    Enemy("define", "o_enemy_sewerBeast_large", "shot");
    Enemy("define", "o_enemy_oozeMan", "smash");
    // Guilderbergs
    Enemy("define", "o_enemy_guilder_gald", "poke", "coin");
    Enemy("define", "o_enemy_guilder_von_miser", "poke", "coin");
    //Icelands
    Enemy("define", "o_enemy_jalapeno_stag", "charge");
    //Duergars
    Enemy("define", "o_enemy_duergar_gunner");
    Enemy("define", "o_enemy_duergar_shield");
    Enemy("define", "o_enemy_duergar_wizard");
    //Destructibles
    Enemy("define", "o_oilDrum");
    Enemy("define", "o_woodBarrel");
    Enemy("define", "o_bustaBulb");
    Enemy("define", "o_mtnpassJar");
    Enemy("define", "o_enemy_virtual");
}
else if (argument[0] == "amount") return ds_list_size(global.enemyName);
else if (argument[0] == "name") return ds_list_find_value(global.enemyName, argument[1]);
else if (argument[0] == "debug0") return ds_list_find_value(global.enemyDebug0, argument[1]);
else if (argument[0] == "debug1") return ds_list_find_value(global.enemyDebug1, argument[1]);
else if (argument[0] == "debug2") return ds_list_find_value(global.enemyDebug2, argument[1]);
else if (argument[0] == "debug3") return ds_list_find_value(global.enemyDebug3, argument[1]);
else if (argument[0] == "define")
{
    ds_list_add(global.enemyName, argument[1]);
    if (argument_count > 2) ds_list_add(global.enemyDebug0, argument[2]);
    else ds_list_add(global.enemyDebug0, "");
    if (argument_count > 3) ds_list_add(global.enemyDebug1, argument[3]);
    else ds_list_add(global.enemyDebug1, "");
    if (argument_count > 4) ds_list_add(global.enemyDebug2, argument[4]);
    else ds_list_add(global.enemyDebug2, "");
    if (argument_count > 5) ds_list_add(global.enemyDebug3, argument[5]);
    else ds_list_add(global.enemyDebug3, "");
}
