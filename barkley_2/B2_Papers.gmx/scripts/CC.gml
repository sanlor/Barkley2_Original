var afi, gei, i, h, str, ind, bst;
if (argument[0] == "resolve globals")
{
    // Init gene bonus
    for (afi = 0; afi < 3; afi += 1)
    {
        for (gei = 0; gei < 13; gei += 1) global.geneBonus[afi, gei] = 0;
    }
    // Hoopz GLAMP bonus (applied ONCE after CC, or correctly recalculated on re-apply)
    global.bonusG = 0;
    global.bonusL = 0;
    global.bonusA = 0;
    global.bonusM = 0;
    global.bonusP = 0;
    CC("resolve inkblots");
    CC("resolve multiple");
    CC("resolve palm");
    // HUD Color
    CC("resolve gumball");
    // Gun Booster - On Drop only
    CC("resolve zodiac");
    // Genes Boosters - global.geneBoost[0, 0]
    CC("resolve lottery");
    CC("resolve likes faves");
    // Enemy GLAMP bonus - global.enemyGLAMP = 1.2; // 20 %
    CC("resolve hand scanner");
    // Player glamp
    Quest("playerGuts", 10 + global.bonusG);
    Quest("playerLuck", 10 + global.bonusL);
    Quest("playerAcrobatics", 10 + global.bonusA);
    Quest("playerMight", 10 + global.bonusM);
    Quest("playerPiety", 10 + global.bonusP);
}
else if (argument[0] == "crest")
{
    if (argument[1] == "save")
    {
        var dslCol = ds_list_create();
        var dslX = ds_list_create();
        var dslY = ds_list_create();
        // Crest is drawn at 192, 96
        with (o_cc_crest_paint)
        {
            ds_list_add(dslCol, color_chosen);
            ds_list_add(dslX, x - 192);
            ds_list_add(dslY, y - 96);
        }
        Quest("playerCCCrestMade", 1);
        scr_savedata_put_list("playerCCCrestColor", dslCol);
        scr_savedata_put_list("playerCCCrestX", dslX);
        scr_savedata_put_list("playerCCCrestY", dslY);
        show_debug_message("CC('crest', 'save') - Saved " + string(ds_list_size(dslCol)) + " paints.");
    }
    // CC("crest", "draw", x, y, scale?, alpha?);
    else if (argument[1] == "draw")
    {
        if (Quest("playerCCCrestMade") == 0) return 0;
        var dslCol = scr_savedata_get("playerCCCrestColor");
        var dslX = scr_savedata_get("playerCCCrestX");
        var dslY = scr_savedata_get("playerCCCrestY");
        var drx = argument[2];
        var dry = argument[3];
        var scl = 1;
        if (argument_count > 4) scl = argument[4];
        var alp = 1;
        if (argument_count > 5) alp = argument[5];
        // Draw frame
        //draw_sprite_ext(s_cc_crest_frames, 0, drx, dry, scl, scl, 0, c_white, alp);
        for (i = 0; i < ds_list_size(dslCol); i += 1)
        {
            draw_sprite_ext(s_cc_crest_paint, 0, drx + (dslX[| i] * scl), dry + (dslY[| i] * scl), scl, scl, 0, global.crestColor[dslCol[| i]], alp);
        }
        //draw_sprite_ext(s_cc_crest_frames, 1, drx, dry, scl, scl, 0, c_white, alp);
    }
}
else if (argument[0] == "resolve palm")
{
    boosts[0]  = "G+0 L+0 A+0 M+0 P+0"; // DOES NOT EXIST
    boosts[1]  = "G+1 L+0 A+0 M+0 P+0";
    boosts[2]  = "G+0 L+1 A+0 M+0 P+0";
    boosts[3]  = "G+0 L+0 A+1 M+0 P+0";
    boosts[4]  = "G+0 L+0 A+0 M+1 P+1";
    boosts[5]  = "G+1 L-1 A+0 M+0 P+0";
    boosts[6]  = "G+0 L+1 A-1 M+0 P+0";
    boosts[7]  = "G+0 L+0 A+1 M-1 P+0";
    boosts[8]  = "G+0 L+0 A+0 M+1 P-1";
    boosts[9]  = "G-1 L+0 A+0 M+0 P+1";
    boosts[10] = "G+1 L+0 A+0 M+0 P-1";
    boosts[11] = "G-1 L+1 A+0 M+0 P+0";
    boosts[12] = "G+0 L+0 A+1 M-1 P+0";
    boosts[13] = "G+1 L+1 A+0 M-1 P-1";
    boosts[14] = "G-1 L+0 A+0 M+0 P+0";
    boosts[15] = "G+0 L-1 A+0 M+0 P+0";
    boosts[16] = "G+0 L+0 A-1 M+0 P+0";
    boosts[17] = "G+0 L+0 A+0 M-1 P+0";
    boosts[18] = "G+0 L+0 A+0 M+0 P-1";
    // Resolve - There are 18 Lines, 4 chosen
    if (Quest("playerCCPalm") == "Accepted")
    {
        for (i = 0; i < 4;  i += 1)
        {
            ind = boosts[Quest("playerCCLine" + string(i + 1))];
            global.bonusG += real(string_copy(ind, 2, 2));
            global.bonusL += real(string_copy(ind, 6, 2));
            global.bonusA += real(string_copy(ind, 10, 2));
            global.bonusM += real(string_copy(ind, 14, 2));
            global.bonusP += real(string_copy(ind, 18, 2));
        }
    }
}
else if (argument[0] == "resolve hand scanner")
{
    var tim = Quest("playerCCScanner");
    if (tim <= 10) bon = lerp(20, 0, tim / 10);
    else if (tim > 10 && tim < 40) bon = 0;
    else if (tim >= 40) bon = lerp(0, 20, (tim - 40) / 10);
    bon = clamp(bon, 0, 20);
    global.enemyGLAMP = 1 + (bon / 100);
}
else if (argument[0] == "resolve gumball")
{
    var gum = Quest("playerCCGumball");
    var col = c_black; 
    if (gum == "Abstain") col = make_color_rgb(64, 128, 255);
    if (gum == "Special Coin") col = make_color_rgb(64, 128, 255);
    if (gum == "Butterscotch") col = make_color_rgb(196, 128, 0);
    if (gum == "Foul - Keep") col = make_color_rgb(0, 255, 0);
    if (gum == "Foul - Destroy") col = make_color_rgb(0, 128, 0);
    if (gum == "Transparent") col = make_color_rgb(196, 196, 196);
    if (gum == "Winner") col = make_color_rgb(255, 255, 0);
    if (gum == "Steel") col = make_color_rgb(128, 128, 128);
    if (gum == "Red - Strawberry") col = make_color_rgb(255, 0, 0);
    if (gum == "Red - Cherry") col = make_color_rgb(224, 32, 32);
    if (gum == "Yellow - Banana") col = make_color_rgb(196, 196, 32);
    if (gum == "Yellow - Lemon") col = make_color_rgb(224, 224, 0);
    if (gum == "Blue - Blueberries") col = make_color_rgb(0, 0, 255);
    if (gum == "Blue - Raspberries") col = make_color_rgb(32, 32, 224);
    if (gum == "White - Flavorless") col = make_color_rgb(224, 224, 224);
    if (gum == "White - Flavorful") col = make_color_rgb(255, 255, 255);
    if (gum == "Green - Apple") col = make_color_rgb(0, 196, 0);
    if (gum == "Green - Watermelon") col = make_color_rgb(32, 224, 32);
    if (gum == "Orange - Fruit") col = make_color_rgb(224, 96, 32);
    if (gum == "Orange - Color") col = make_color_rgb(255, 128, 0);
    if (gum == "Black - Liquorice") col = make_color_rgb(32, 32, 32);
    if (gum == "Black - Coffee") col = make_color_rgb(96, 64, 64);
    if (gum == "Grape") col = make_color_rgb(128, 0, 255);
    Quest("playerGumballColor", col); // Was HUE, change to COLOR
}
else if (argument[0] == "resolve zodiac")
{
    bonusMax = 2; // Max guns bonus
    zodiac_name[0] = "Aries";
    zodiac_name[1] = "Taurus";
    zodiac_name[2] = "Gemini";
    zodiac_name[3] = "Cancer";
    zodiac_name[4] = "Leo";
    zodiac_name[5] = "Virgo";
    zodiac_name[6] = "Libra";
    zodiac_name[7] = "Scorpio";
    zodiac_name[8] = "Ophiucus";
    zodiac_name[9] = "Sagittarius";
    zodiac_name[10] = "Capricorn";
    zodiac_name[11] = "Aquarius";
    zodiac_name[12] = "Pisces";
    var era = Quest("playerCCEra");
    var year = Quest("playerCCYear");
    if (string(year) == "0") year = "0000";
    
    actDay = Quest("playerCCDay");
    if (era == 0) bonDay = (abs(abs(actDay - 15) - 16) / 16) * bonusMax;
    else bonDay = (abs(actDay - 15) / 16) * bonusMax;
    
    actMon = Quest("playerCCMonth");
    if (era == 0) bonMon = (abs(abs(actMon - 6) - 6) / 6) * bonusMax;
    else bonMon = (abs(actMon - 6) / 6) * bonusMax;
    
    actYr0 = real(string_copy(year, 1, 2));
    if (era == 0) bonYr0 = (abs(abs(actYr0 - 50) - 50) / 50) * bonusMax;
    else bonYr0 = (abs(actYr0 - 50) / 50) * bonusMax;
    
    actYr1 = real(string_copy(year, 3, 2));
    if (era == 0) bonYr1 = (abs(abs(actYr1 - 50) - 50) / 50) * bonusMax;
    else bonYr1 = (abs(actYr1 - 50) / 50) * bonusMax;
    
    // Bonus
    Quest("playerCCZodiac", zodiac_name[Quest("playerCCMonth")]); // Zodiac
    Quest("playerCCPowerBonus", bonMon);      // X0:00 - Power
    Quest("playerCCCapacityBonus", bonDay);   // 0X:00 - Capacity
    Quest("playerCCAffixBonus", bonYr0);      // 00:X0 - Affix
    Quest("playerCCSpeedBonus", bonYr1);      // 00:0X - Speed / Rate
}
else if (argument[0] == "resolve lottery")
{
    // Input = playerCCLottery#
    // 002 102 202 - EXCLUDED (pound charm strange)
    // Each one of these gives a 1 point boost to the gene ID
    // XXX is no gene (1 gene boost instead of 2)
    i = 0;
    boosts[i] = "000 111"; i += 1;
    boosts[i] = "100 201"; i += 1;
    boosts[i] = "204 004"; i += 1;
    boosts[i] = "110 XXX"; i += 1;
    boosts[i] = "109 XXX"; i += 1;
    boosts[i] = "003 206"; i += 1;
    boosts[i] = "108 XXX"; i += 1;
    boosts[i] = "007 205"; i += 1;
    boosts[i] = "107 XXX"; i += 1;
    boosts[i] = "101 203"; i += 1;
    boosts[i] = "207 001"; i += 1;
    boosts[i] = "106 XXX"; i += 1;
    boosts[i] = "208 006"; i += 1;
    boosts[i] = "105 XXX"; i += 1;
    boosts[i] = "209 103"; i += 1;
    boosts[i] = "005 200"; i += 1;
    boosts[i] = "210 008"; i += 1;
    boosts[i] = "104 XXX"; i += 1;
    for (i = 0; i < 18; i += 1)
    {
        if (Quest("playerCCLottery" + string(i)) == 1)
        {
            var str = string_copy(boosts[i], 1, 3);
            afi = string_copy(boosts[i], 1, 1);
            if (afi != "X")
            {
                gei = string_copy(boosts[i], 2, 2);
                global.geneBonus[real(afi), real(gei)] += 1;
            }
            afi = string_copy(boosts[i], 5, 1);
            if (afi != "X")
            {
                gei = string_copy(boosts[i], 6, 2);
                global.geneBonus[real(afi), real(gei)] += 1;
            }
        }
    }
}
else if (argument[0] == "resolve likes faves")
{
    ///// Likes ///// 9 likes x 11 options = 99 total assignments
    // There are 32 genes, 96 is 3 per gene. Have 3 do no change.
    // The three extra are - 006, 105, 205
    // Food // 11 options
    boosts[0, 2]  = "006"; // Bean - extra 006
    boosts[0, 3]  = "203"; // Oat
    boosts[0, 4]  = "107"; // Power Bar
    boosts[0, 5]  = "005"; // Fig
    boosts[0, 6]  = "110"; // Gum
    boosts[0, 7]  = "007"; // Sauce
    boosts[0, 8]  = "105"; // Buffalo Wing
    boosts[0, 9]  = "003"; // Graham Cracker
    boosts[0, 10] = "109"; // Sorghum
    boosts[0, 11] = "200"; // Nugget
    boosts[0, 12] = "206"; // Salted Cracker
    //boosts[0, 13] = "XXX"; // Unsalted Cracker
    
    // Footwear // 11 options
    boosts[1, 2]  = "105"; // Moccasin - extra 105
    boosts[1, 3]  = "209"; // Sandals
    boosts[1, 4]  = "202"; // Ötzi the Iceman's shoes
    boosts[1, 5]  = "002"; // Flip-flop
    boosts[1, 6]  = "100"; // Espadrilles
    boosts[1, 7]  = "109"; // Pattens
    boosts[1, 8]  = "210"; // Soles
    boosts[1, 9]  = "205"; // Slippers
    boosts[1, 10] = "007"; // Flippers
    boosts[1, 11] = "102"; // Socks
    boosts[1, 12] = "106"; // Snowshoes
    //boosts[1, 13] = "XXX"; // Peg legs
    
    // Battle Tactic // 11 options
    boosts[2, 2]  = "205"; // Raucous Hoot - extra 205
    boosts[2, 3]  = "109"; // Sommersault
    boosts[2, 4]  = "008"; // Knuckle Sandwich
    boosts[2, 5]  = "206"; // Battle Juggling
    boosts[2, 6]  = "104"; // Swoop Attack
    boosts[2, 7]  = "210"; // Boomerang Throw
    boosts[2, 8]  = "001"; // War Bops
    boosts[2, 9]  = "003"; // Operation Ground and Pound
    boosts[2, 10] = "105"; // Magician Orb
    boosts[2, 11] = "000"; // Jumping Jack (to build vigor)
    boosts[2, 12] = "100"; // Crawling on Ground to Surprise Foes
    //boosts[2, 13] = "XXX"; // Peacefare
    
    // Class // 11 options
    boosts[3, 2]  = "210"; // History
    boosts[3, 3]  = "006"; // Geography
    boosts[3, 4]  = "205"; // Social Studies
    boosts[3, 5]  = "209"; // Geometry
    boosts[3, 6]  = "004"; // Algebra
    boosts[3, 7]  = "107"; // English
    boosts[3, 8]  = "008"; // Language Arts
    boosts[3, 9]  = "208"; // Pre-Algebra
    boosts[3, 10] = "102"; // Oceanography
    boosts[3, 11] = "000"; // Geology
    boosts[3, 12] = "206"; // Gym
    //boosts[3, 13] = "XXX"; // Biology
    
    // Sport // 11 options
    boosts[4, 2]  = "200"; // Basketball
    boosts[4, 3]  = "202"; // Hoop Ball
    boosts[4, 4]  = "002"; // Hoop and Ball
    boosts[4, 5]  = "104"; // College Hoop and Ball
    boosts[4, 6]  = "005"; // Parahoop and Ball
    boosts[4, 7]  = "111"; // Outdoor Hoop and Ball
    boosts[4, 8]  = "203"; // Field Hoop and Ball
    boosts[4, 9]  = "108"; // E-Hoop and Ball
    boosts[4, 10] = "204"; // Netball
    boosts[4, 11] = "102"; // Dunkball
    boosts[4, 12] = "110"; // Amateur Dunkball
    //boosts[4, 13] = "XXX"; // Hoop'n'ball
    
    // Class // 11 options
    boosts[5, 2]  = "207"; // Fighter
    boosts[5, 3]  = "007"; // Warrior
    boosts[5, 4]  = "203"; // Barbarian
    boosts[5, 5]  = "104"; // Knight
    boosts[5, 6]  = "006"; // Skirmisher
    boosts[5, 7]  = "107"; // Swordsman
    boosts[5, 8]  = "201"; // Fencer
    boosts[5, 9]  = "001"; // Gladiator
    boosts[5, 10] = "101"; // Brawler
    boosts[5, 11] = "106"; // Samurai
    boosts[5, 12] = "202"; // Boxer
    //boosts[5, 13] = "XXX"; // Rodeo Clown
    
    // Teacher // 11 options
    boosts[6, 2]  = "209"; // Ms. Moody
    boosts[6, 3]  = "105"; // Mr. Helwig
    boosts[6, 4]  = "110"; // Sra. Primavera
    boosts[6, 5]  = "004"; // Mssr. Ehrlichmann
    boosts[6, 6]  = "205"; // Mr. Pinschmidt
    boosts[6, 7]  = "207"; // Herr Matula
    boosts[6, 8]  = "002"; // Prof. Gupta
    boosts[6, 9]  = "208"; // Sir Dilweg
    boosts[6, 10] = "103"; // Lt. Turner
    boosts[6, 11] = "200"; // Dr. Szekeras PhD
    boosts[6, 12] = "005"; // Mdm. Bellard
    //boosts[6, 13] = "XXX"; // Mrs. Yamaguchi
    
    // Star // 11 options
    boosts[7, 2]  = "204"; // Sun
    boosts[7, 3]  = "111"; // Proxima Centauri
    boosts[7, 4]  = "201"; // Alpha Centauri C
    boosts[7, 5]  = "101"; // Sirius B
    boosts[7, 6]  = "208"; // R Doradus
    boosts[7, 7]  = "008"; // VY Canis Majoris
    boosts[7, 8]  = "103"; // OGLE-TR-122B
    boosts[7, 9]  = "207"; // R136a1
    boosts[7, 10] = "006"; // PPI 15
    boosts[7, 11] = "108"; // PSR J1614-2230
    boosts[7, 12] = "003"; // Barnard's Star
    //boosts[7, 13] = "XXX"; // North Star
    
    // Animal // 11 options
    boosts[8, 2]  = "001"; // Nightingale
    boosts[8, 3]  = "201"; // Axolotl
    boosts[8, 4]  = "100"; // Mole
    boosts[8, 5]  = "111"; // Alligator
    boosts[8, 6]  = "204"; // Falcon
    boosts[8, 7]  = "103"; // Nutria
    boosts[8, 8]  = "000"; // Rat
    boosts[8, 9]  = "108"; // Tapir
    boosts[8, 10] = "101"; // Snail
    boosts[8, 11] = "106"; // Mandrill
    boosts[8, 12] = "004"; // Wyvern
    //boosts[8, 13] = "XXX"; // Corndog
    
    // Resolve
    if (Quest("playerCCLikes1") != 0)
    {
        for (i = 0; i < 9; i += 1)
        {
            ind = Quest("playerCCLikes" + string(i + 1));
            var str = string_copy(boosts[i, ind], 1, 3);
            afi = string_copy(boosts[i, ind], 1, 1);
            if (afi != "X")
            {
                gei = string_copy(boosts[i, ind], 2, 2);
                global.geneBonus[real(afi), real(gei)] += 1;
            }
        }
    }
    
    // Favorites // 7 favorites - 67 total combos, 64 genes if doubled
    // 
    // Racial foe 1 // 11
    boosts[0, 2]  = "205"; // Mummies
    boosts[0, 3]  = "203"; // Ooze
    boosts[0, 4]  = "100"; // Bugbears
    boosts[0, 5]  = "204"; // Seagulls
    boosts[0, 6]  = "108"; // YouTube Let's Players
    boosts[0, 7]  = "008"; // Skulls
    boosts[0, 8]  = "000"; // Burglars // extra 000
    boosts[0, 9]  = "207"; // Gamers
    boosts[0, 10] = "106"; // Garfield // extra 106
    boosts[0, 11] = "107"; // Weresnails
    boosts[0, 12] = "007"; // Wizards
    //boosts[0, 13] = "XXX"; // The Mystical Drakes
    
    // Racial foe 2 // 11 = 22
    boosts[1, 2]  = "205"; // Mummies // extra 205
    boosts[1, 3]  = "203"; // Ooze
    boosts[1, 4]  = "100"; // Bugbears
    boosts[1, 5]  = "204"; // Seagulls
    boosts[1, 6]  = "108"; // YouTube Let's Players
    boosts[1, 7]  = "008"; // Skulls
    boosts[1, 8]  = "000"; // Burglars
    boosts[1, 9]  = "207"; // Gamers
    boosts[1, 10] = "106"; // Garfield
    boosts[1, 11] = "107"; // Weresnails
    boosts[1, 12] = "007"; // Wizards
    //boosts[1, 13] = "XXX"; // The Mystical Drakes
    
    // Phobia // 11 = 33
    boosts[2, 2]  = "006"; // Claustrophobia
    boosts[2, 3]  = "208"; // Agoraphobia
    boosts[2, 4]  = "201"; // Equinophobia
    boosts[2, 5]  = "210"; // Necrophobia
    boosts[2, 6]  = "001"; // Sitophobia
    boosts[2, 7]  = "106"; // Coulrophobia
    boosts[2, 8]  = "202"; // Entomophobia
    boosts[2, 9]  = "101"; // Zauberphobia
    boosts[2, 10] = "109"; // Anthropophobia
    boosts[2, 11] = "006"; // Albuminurophobia
    boosts[2, 12] = "206"; // Metrophobia
    //boosts[2, 13] = "XXX"; // Selachophobia
    
    // Zauber // 11 = 44
    boosts[3, 2]  = "202"; // Kilpert's Ice Arrow
    boosts[3, 3]  = "001"; // Lesser Mummification
    boosts[3, 4]  = "105"; // Turn Duergar
    boosts[3, 5]  = "110"; // Raise Vegetables
    boosts[3, 6]  = "105"; // Battlefield Spook
    boosts[3, 7]  = "005"; // Moonlight Muscle Level 7
    boosts[3, 8]  = "205"; // Patriot
    boosts[3, 9]  = "109"; // Summon Seagull III
    boosts[3, 10] = "209"; // Identify Bugbear
    boosts[3, 11] = "002"; // Jazz Toot
    boosts[3, 12] = "005"; // Herbert's Healing Hands
    //boosts[3, 13] = "XXX"; // Remove Experience
    
    // Landmarks // 11 = 55
    boosts[4, 2]  = "102"; // Pyramids of Giza
    boosts[4, 3]  = "004"; // Oatmeal Factory
    boosts[4, 4]  = "101"; // Leaning Tower of Pisa
    boosts[4, 5]  = "200"; // The Moon
    boosts[4, 6]  = "209"; // Stonehenge
    boosts[4, 7]  = "206"; // Mt. Rushmore
    boosts[4, 8]  = "002"; // GameStop
    boosts[4, 9]  = "110"; // ToG Studios
    boosts[4, 10] = "104"; // Huge Cube
    boosts[4, 11] = "210"; // Neo New York Harbor
    boosts[4, 12] = "201"; // Statue of Clispaeth
    //boosts[4, 13] = "XXX"; // Corn Cob Colosseum
    
    // Vidcon A // 5 = 60
    boosts[5, 2] = "003"; // Midnight [xSLASH].eclipse ]|[
    boosts[5, 3] = "200"; // Ziggurat Electron School
    boosts[5, 4] = "103"; // B:LADe gEAR_x_Havoc
    boosts[5, 5] = "207"; // Clown School 2
    boosts[5, 6] = "102"; // ~F.A.T.E.~ _gain_ reveLation
    
    // Vidcon C // 7 = 67
    boosts[6, 2] = "111"; // Lanzenacht Mitsuru Geschtalten:#Chaos Children
    boosts[6, 3] = "003"; // Alchemist Heart Baney#-=Divine Comedy=-
    boosts[6, 4] = "104"; // B.I.O. Magician Ooze:#Escape from Brain City
    boosts[6, 5] = "111"; // mIst-edge ~over the clouds#of wonder~
    boosts[6, 6] = "103"; // BEAST Days <Slayer>:#High School Generation
    boosts[6, 7] = "004"; // S.avan.T Rise D.N.A -#innocent crime R0ND0 -
    boosts[6, 8] = "208"; // <[SolaR]> .rOmAnCiNg. ~#Grim XraptureX
    
    // Resolve
    if (Quest("playerCCFaves1") != 0)
    {
        for (i = 0; i < 7; i += 1)
        {
            ind = Quest("playerCCFaves" + string(i + 1));
            var str = string_copy(boosts[i, ind], 1, 3);
            afi = string_copy(boosts[i, ind], 1, 1);
            if (afi != "X")
            {
                gei = string_copy(boosts[i, ind], 2, 2);
                global.geneBonus[real(afi), real(gei)] += 1;
            }
        }
    }
}
else if (argument[0] == "resolve inkblots")
{
    boosts[0, 0] = "G-1 L+0 A+0 M+0 P+1";
    boosts[0, 1] = "G+0 L+1 A+0 M+0 P-1";
    boosts[0, 2] = "G+0 L+0 A+1 M-1 P+0";
    boosts[0, 3] = "G+0 L-1 A+0 M+1 P+0";
    
    boosts[1, 0] = "G-1 L+1 A+1 M+0 P+0";
    boosts[1, 1] = "G+0 L+0 A+1 M-2 P+0";
    boosts[1, 2] = "G+0 L-2 A+0 M+2 P+1";
    boosts[1, 3] = "G+1 L+1 A+0 M-1 P+0";
    
    boosts[2, 0] = "G+1 L+0 A+1 M-1 P+0";
    boosts[2, 1] = "G+1 L+0 A+0 M-2 P+0";
    boosts[2, 2] = "G+0 L+1 A+0 M-1 P+1";
    boosts[2, 3] = "G+0 L+1 A+1 M+0 P+0";
    
    boosts[3, 0] = "G+0 L-2 A+0 M+0 P+2";
    boosts[3, 1] = "G-1 L+0 A+2 M+0 P+0";
    boosts[3, 2] = "G+0 L+1 A+0 M+1 P+0";
    boosts[3, 3] = "G+1 L+0 A+0 M-1 P+1";
    
    boosts[4, 0] = "G-1 L+1 A+1 M+0 P+0";
    boosts[4, 1] = "G+0 L+0 A-2 M+2 P+0";
    boosts[4, 2] = "G-1 L+0 A+0 M+0 P+1";
    boosts[4, 3] = "G+2 L+0 A+1 M+0 P-2";
    
    boosts[5, 0] = "G+1 L+0 A-1 M+0 P+0";
    boosts[5, 1] = "G+0 L+1 A+0 M+0 P-1";
    boosts[5, 2] = "G+0 L+0 A+0 M+0 P+1";
    boosts[5, 3] = "G+1 L-1 A-1 M+0 P-1";
    
    boosts[6, 0] = "G+1 L+1 A+0 M+0 P+0";
    boosts[6, 1] = "G-1 L+0 A+1 M+1 P+0";
    boosts[6, 2] = "G+0 L+1 A-1 M+0 P+1";
    boosts[6, 3] = "G-1 L+0 A+1 M+0 P+0";
    
    boosts[7, 0] = "G+0 L+0 A+1 M+0 P-1";
    boosts[7, 1] = "G+0 L+0 A+0 M-1 P+1";
    boosts[7, 2] = "G+1 L-1 A+0 M+0 P+0";
    boosts[7, 3] = "G+0 L-1 A+0 M+0 P+1";
    
    boosts[8, 0] = "G+1 L-1 A+0 M+0 P+0";
    boosts[8, 1] = "G+0 L+1 A-1 M+0 P+0";
    boosts[8, 2] = "G+0 L+0 A+1 M-1 P+0";
    boosts[8, 3] = "G+0 L+0 A+0 M+1 P-1";
    
    boosts[9, 0] = "G+1 L+0 A-1 M+0 P+1";
    boosts[9, 1] = "G+0 L-1 A+1 M+1 P+0";
    boosts[9, 2] = "G+0 L-1 A+2 M+0 P-1";
    boosts[9, 3] = "G-1 L+1 A+1 M+0 P+0";
    
    boosts[10, 0] = "G+1 L+0 A+1 M+0 P+0";
    boosts[10, 1] = "G+0 L+1 A+0 M+0 P+1";
    boosts[10, 2] = "G-1 L+0 A+0 M+2 P+0";
    boosts[10, 3] = "G+0 L-2 A+0 M+1 P-1";
    
    boosts[11, 0] = "G+1 L+0 A+0 M+0 P-1";
    boosts[11, 1] = "G+0 L-1 A+0 M+1 P+0";
    boosts[11, 2] = "G+0 L+1 A+0 M-1 P+0";
    boosts[11, 3] = "G-1 L+0 A+1 M+0 P+0";
    
    boosts[12, 0] = "G+1 L+0 A+1 M-1 P-1";
    boosts[12, 1] = "G+1 L+1 A+0 M-1 P+0";
    boosts[12, 2] = "G+1 L+0 A+0 M-1 P+1";
    boosts[12, 3] = "G+1 L+1 A+0 M-1 P-1";
    
    boosts[13, 0] = "G+1 L+0 A+0 M+1 P+0";
    boosts[13, 1] = "G+0 L+1 A-1 M+1 P+0";
    boosts[13, 2] = "G+0 L+0 A+0 M-1 P+1";
    boosts[13, 3] = "G-1 L+0 A+1 M+1 P+0";
    
    boosts[14, 0] = "G+0 L+1 A-1 M+0 P+0";
    boosts[14, 1] = "G+0 L+0 A+1 M+0 P-1";
    boosts[14, 2] = "G+1 L+0 A+1 M+0 P+0";
    boosts[14, 3] = "G+0 L1+ A-1 M+0 P+1";
    
    boosts[15, 0] = "G+1 L+0 A-1 M+0 P+0";
    boosts[15, 1] = "G+0 L+0 A+1 M-1 P+0";
    boosts[15, 2] = "G-1 L+0 A+0 M+0 P+0";
    boosts[15, 3] = "G+0 L+0 A+0 M+1 P-1";
    
    // Resolve - There are 16 Inkblot questions
    // The index is 0 - 15 BUT the answer has + 1 as 0 means you never got it
    for (i = 0; i < 16;  i += 1)
    {
        ind = Quest("playerCCInkblot" + string(i));
        if (ind != 0)
        {
            bst = boosts[i, ind - 1];
            global.bonusG += real(string_copy(bst, 2, 2));
            global.bonusL += real(string_copy(bst, 6, 2));
            global.bonusA += real(string_copy(bst, 10, 2));
            global.bonusM += real(string_copy(bst, 14, 2));
            global.bonusP += real(string_copy(bst, 18, 2));
        }
    }
}
else if (argument[0] == "resolve multiple")
{
    boosts[0, 0] = "G+0 L+0 A+0 M+0 P+0";
    boosts[0, 1] = "G+1 L+0 A+0 M+0 P+0";
    boosts[0, 2] = "G+0 L+0 A+0 M+0 P+0";
    boosts[0, 3] = "G+0 L+0 A+0 M+0 P+1";
    
    boosts[1, 0] = "G+0 L+0 A+0 M+0 P+0";
    boosts[1, 1] = "G+0 L+1 A+0 M+0 P+0";
    boosts[1, 2] = "G+0 L+0 A+0 M+0 P+0";
    boosts[1, 3] = "G+0 L+0 A+0 M+0 P+0";
    
    boosts[2, 0] = "G+0 L+0 A+0 M+0 P+0";
    boosts[2, 1] = "G+1 L+0 A+0 M+0 P+0";
    boosts[2, 2] = "G+0 L+0 A+0 M+0 P+0";
    boosts[2, 3] = "G+0 L+0 A+0 M+0 P+0";
    
    boosts[3, 0] = "G+0 L+0 A+0 M+0 P+0"; // Balbanes
    boosts[3, 1] = "G+0 L+0 A+0 M+0 P+1"; // Barbaneth
    
    boosts[4, 0] = "G+0 L+0 A+0 M+0 P+0";
    boosts[4, 1] = "G+0 L+0 A+0 M+0 P+0";
    boosts[4, 2] = "G+0 L+0 A+0 M+1 P+0";
    boosts[4, 3] = "G+0 L+0 A+0 M+0 P+0";
    
    boosts[5, 0] = "G+0 L+0 A+1 M+0 P+0";
    boosts[5, 1] = "G+0 L+0 A+0 M+0 P+0";
    boosts[5, 2] = "G+0 L+0 A+0 M+0 P+0";
    boosts[5, 3] = "G+0 L+0 A+0 M+0 P+0";
    
    boosts[6, 0] = "G+0 L+0 A+0 M+1 P+0";
    boosts[6, 1] = "G+0 L+0 A+0 M+0 P+0";
    boosts[6, 2] = "G+0 L+0 A+0 M+0 P+0";
    boosts[6, 3] = "G+0 L+0 A+0 M+0 P+0";
    
    boosts[7, 0] = "G+0 L+0 A+0 M+0 P+0";
    boosts[7, 1] = "G+0 L+0 A+0 M+0 P+0";
    boosts[7, 2] = "G+0 L+0 A+0 M+0 P+0";
    boosts[7, 3] = "G+1 L+0 A+0 M+0 P+0";
    
    boosts[8, 0] = "G+0 L+0 A+0 M+0 P+0";
    boosts[8, 1] = "G+0 L+0 A+0 M+0 P+0";
    boosts[8, 2] = "G+0 L+0 A+0 M+0 P+0";
    boosts[8, 3] = "G+1 L+1 A+1 M+1 P+1";
    
    boosts[9, 0] = "G+0 L+0 A+0 M+0 P+0";
    boosts[9, 1] = "G+0 L+0 A+0 M+0 P+0";
    boosts[9, 2] = "G+0 L+1 A+0 M+0 P+0";
    boosts[9, 3] = "G+0 L+0 A+0 M+0 P+0";
    
    boosts[10, 0] = "G+0 L+0 A+0 M+0 P+0";
    boosts[10, 1] = "G+0 L+0 A+0 M+0 P+0";
    boosts[10, 2] = "G+0 L+0 A+0 M+0 P+0";
    boosts[10, 3] = "G+0 L+0 A+1 M+0 P+0";
    
    boosts[11, 0] = "G+0 L+0 A+0 M+0 P+0";
    boosts[11, 1] = "G+0 L+0 A+0 M+0 P+0";
    boosts[11, 2] = "G+0 L+0 A+0 M+0 P+0";
    boosts[11, 3] = "G+0 L+1 A+0 M+0 P+0";
    
    boosts[12, 0] = "G+0 L+0 A+0 M+0 P+0";
    boosts[12, 1] = "G+0 L+0 A+0 M+0 P+0";
    boosts[12, 2] = "G+1 L+0 A+0 M+0 P+0";
    boosts[12, 3] = "G+0 L+0 A+0 M+0 P+0";
    
    boosts[13, 0] = "G+0 L+0 A+0 M+0 P+0"; // Vid Con - Instant death
    boosts[13, 1] = "G+0 L+0 A+0 M+0 P+0";
    boosts[13, 2] = "G+1 L+1 A+1 M+1 P+1";
    boosts[13, 3] = "G+0 L+0 A+0 M+0 P+0";
    
    boosts[14, 0] = "G+0 L+0 A+0 M+0 P+0";
    boosts[14, 1] = "G+0 L+0 A+0 M+0 P+0";
    boosts[14, 2] = "G+0 L+0 A+0 M+1 P+0";
    boosts[14, 3] = "G+0 L+0 A+0 M+0 P+0";
    
    boosts[15, 0] = "G+0 L+0 A+0 M+0 P+0";
    boosts[15, 1] = "G+0 L+0 A+0 M+0 P+0";
    boosts[15, 2] = "G+1 L+1 A+1 M+1 P+1";
    boosts[15, 3] = "G+0 L+0 A+0 M+0 P+0";
    
    boosts[16, 0] = "G+0 L+0 A+0 M+0 P+0";
    boosts[16, 1] = "G+0 L+0 A+0 M+0 P+0";
    boosts[16, 2] = "G+1 L+1 A+1 M+1 P+1";
    boosts[16, 3] = "G+0 L+0 A+0 M+0 P+0";
    
    boosts[17, 0] = "G+0 L+0 A+0 M+0 P+0";
    boosts[17, 1] = "G+0 L+0 A+0 M+0 P+0";
    boosts[17, 2] = "G+0 L+0 A+1 M+0 P+0";
    boosts[17, 3] = "G+0 L+0 A+0 M+0 P+0";
    
    boosts[18, 0] = "G+0 L+0 A+0 M+0 P+0";
    boosts[18, 1] = "G+0 L+0 A+0 M+0 P+0";
    boosts[18, 2] = "G+0 L+0 A+0 M+1 P+0";
    boosts[18, 3] = "G+0 L+0 A+0 M+0 P+0";
    
    boosts[19, 0] = "G+0 L+0 A+0 M+0 P+0";
    boosts[19, 1] = "G+0 L+0 A+0 M+0 P+0";
    boosts[19, 2] = "G+0 L+0 A+0 M+0 P+0";
    boosts[19, 3] = "G+0 L+0 A+0 M+0 P+1";
    
    boosts[20, 0] = "G+1 L+0 A+0 M+0 P+0";
    boosts[20, 1] = "G+0 L+0 A+0 M+0 P+0";
    boosts[20, 2] = "G+0 L+0 A+0 M+0 P+0";
    boosts[20, 3] = "G+0 L+0 A+0 M+0 P+0";
    
    boosts[21, 0] = "G+0 L+0 A+0 M+0 P+0";
    boosts[21, 1] = "G+0 L+0 A+0 M+0 P+0";
    boosts[21, 2] = "G+0 L+0 A+1 M+0 P+0";
    boosts[21, 3] = "G+0 L+0 A+0 M+0 P+0";
    
    boosts[22, 0] = "G+0 L+0 A+0 M+0 P+0";
    boosts[22, 1] = "G+0 L+0 A+0 M+0 P+0";
    boosts[22, 2] = "G+0 L+0 A+0 M+0 P+0";
    boosts[22, 3] = "G+0 L+1 A+0 M+0 P+0";
    
    boosts[23, 0] = "G+0 L+0 A+0 M+0 P+0";
    boosts[23, 1] = "G+0 L+0 A+0 M+0 P+0";
    boosts[23, 2] = "G+0 L+0 A+0 M+0 P+0";
    boosts[23, 3] = "G+0 L+0 A+1 M+0 P+0";
    
    boosts[24, 0] = "G+0 L+0 A+0 M+0 P+0";
    boosts[24, 1] = "G+0 L+0 A+0 M+0 P+1";
    boosts[24, 2] = "G+0 L+0 A+0 M+0 P+0";
    boosts[24, 3] = "G+0 L+0 A+0 M+0 P+0";
    
    boosts[25, 0] = "G+0 L+0 A+0 M+0 P+0";
    boosts[25, 1] = "G+0 L+0 A+0 M+0 P+0";
    boosts[25, 2] = "G+0 L+0 A+0 M+1 P+0";
    boosts[25, 3] = "G+0 L+0 A+0 M+0 P+0";
    
    boosts[26, 0] = "G+0 L+0 A+0 M+0 P+0";
    boosts[26, 1] = "G+0 L+0 A+0 M+0 P+0";
    boosts[26, 2] = "G+0 L+0 A+0 M+0 P+0";
    boosts[26, 3] = "G+1 L+0 A+0 M+0 P+0";
    
    boosts[27, 0] = "G+0 L+0 A+0 M+0 P+0";
    boosts[27, 1] = "G+0 L+0 A+0 M+0 P+0";
    boosts[27, 2] = "G+0 L+0 A+0 M+0 P+0";
    boosts[27, 3] = "G+0 L+0 A+0 M+0 P+1";
    
    boosts[28, 0] = "G+0 L+0 A+0 M+0 P+0";
    boosts[28, 1] = "G+1 L+0 A+0 M+0 P+0";
    boosts[28, 2] = "G+0 L+0 A+0 M+0 P+0";
    boosts[28, 3] = "G+0 L+0 A+0 M+0 P+0";
    
    boosts[29, 0] = "G+0 L+0 A+0 M+0 P+0";
    boosts[29, 1] = "G+0 L+0 A+1 M+0 P+0";
    boosts[29, 2] = "G+0 L+0 A+0 M+0 P+0";
    boosts[29, 3] = "G+0 L+0 A+0 M+0 P+0";
    
    boosts[30, 0] = "G+0 L+0 A+0 M+0 P+0";
    boosts[30, 1] = "G+0 L+0 A+0 M+0 P+0";
    boosts[30, 2] = "G+0 L+0 A+0 M+0 P+0";
    boosts[30, 3] = "G+0 L+1 A+0 M+0 P+0";
    
    boosts[31, 0] = "G+0 L+0 A+0 M+0 P+0";
    boosts[31, 1] = "G+0 L+0 A+0 M+0 P+0";
    boosts[31, 2] = "G+0 L+0 A+0 M+0 P+0";
    boosts[31, 3] = "G+0 L+0 A+0 M+0 P+1";
    
    boosts[32, 0] = "G+0 L+0 A+0 M+0 P+0";
    boosts[32, 1] = "G+0 L+0 A+0 M+0 P+0";
    boosts[32, 2] = "G+0 L+0 A+0 M+0 P+0";
    boosts[32, 3] = "G+0 L+0 A+0 M+1 P+0";
    
    boosts[33, 0] = "G+0 L+0 A+0 M+0 P+0";
    boosts[33, 1] = "G+0 L+1 A+0 M+0 P+0";
    boosts[33, 2] = "G+0 L+0 A+0 M+0 P+0";
    boosts[33, 3] = "G+0 L+0 A+0 M+0 P+0";
    
    boosts[34, 0] = "G+0 L+0 A+0 M+0 P+0";
    boosts[34, 1] = "G+0 L+0 A+0 M+0 P+0";
    boosts[34, 2] = "G+0 L+0 A+0 M+0 P+0";
    boosts[34, 3] = "G+1 L+0 A+0 M+0 P+0";
    
    boosts[35, 0] = "G+0 L+0 A+0 M+0 P+0";
    boosts[35, 1] = "G+0 L+0 A+0 M+0 P+0";
    boosts[35, 2] = "G+0 L+0 A+0 M+0 P+0";
    boosts[35, 3] = "G+0 L+0 A+0 M+1 P+0";
    
    boosts[36, 0] = "G+0 L+0 A+0 M+0 P+0";
    boosts[36, 1] = "G+0 L+0 A+0 M+0 P+0";
    boosts[36, 2] = "G+0 L+1 A+0 M+0 P+0";
    boosts[36, 3] = "G+0 L+0 A+0 M+0 P+0";
    
    boosts[37, 0] = "G+0 L+0 A+0 M+0 P+0";
    boosts[37, 1] = "G+0 L+0 A+1 M+0 P+0";
    boosts[37, 2] = "G+0 L+0 A+0 M+0 P+0";
    boosts[37, 3] = "G+0 L+0 A+0 M+0 P+0";
    
    boosts[38, 0] = "G+0 L+0 A+0 M+0 P+0";
    boosts[38, 1] = "G+0 L+0 A+0 M+0 P+0";
    boosts[38, 2] = "G+0 L+0 A+0 M+0 P+0";
    boosts[38, 3] = "G+0 L+0 A+0 M+0 P+1";
    
    boosts[39, 0] = "G+0 L+0 A+0 M+0 P+0";
    boosts[39, 1] = "G+0 L+0 A+0 M+0 P+0";
    boosts[39, 2] = "G+1 L+0 A+0 M+0 P+0";
    boosts[39, 3] = "G+0 L+0 A+0 M+0 P+0";
    
    boosts[40, 0] = "G+0 L+0 A+0 M+0 P+1";
    boosts[40, 1] = "G+0 L+0 A+0 M+0 P+0";
    boosts[40, 2] = "G+0 L+0 A+0 M+0 P+0";
    boosts[40, 3] = "G+0 L+0 A+0 M+0 P+0";
    
    boosts[41, 0] = "G+0 L+0 A+0 M+0 P+0";
    boosts[41, 1] = "G+0 L+0 A+0 M+0 P+0";
    boosts[41, 2] = "G+0 L+0 A+0 M+0 P+0";
    boosts[41, 3] = "G+0 L+1 A+0 M+0 P+0";
    
    boosts[42, 0] = "G+0 L+0 A+0 M+0 P+0";
    boosts[42, 1] = "G+1 L+0 A+0 M+0 P+0";
    boosts[42, 2] = "G+0 L+0 A+0 M+0 P+0";
    boosts[42, 3] = "G+0 L+0 A+0 M+0 P+0";
    
    boosts[43, 0] = "G+1 L+0 A+0 M+0 P+0";
    boosts[43, 1] = "G+0 L+0 A+0 M+0 P+0";
    boosts[43, 2] = "G+0 L+0 A+0 M+0 P+0";
    boosts[43, 3] = "G+0 L+0 A+0 M+0 P+0";
    
    // Resolve - There are 44 multiple choice questions
    // The index is 0 - 43 BUT the answer has + 1 as 0 means you never got it
    for (i = 0; i < 16;  i += 1)
    {
        ind = Quest("playerCCMultiple" + string(i));
        if (ind != 0)
        {
            bst = boosts[i, ind - 1];
            global.bonusG += real(string_copy(bst, 2, 2));
            global.bonusL += real(string_copy(bst, 6, 2));
            global.bonusA += real(string_copy(bst, 10, 2));
            global.bonusM += real(string_copy(bst, 14, 2));
            global.bonusP += real(string_copy(bst, 18, 2));
        }
    }
}
else if (argument[0] == "tarot")
{
    // CC("tarot", "index to card", card_index)
    if (argument[1] == "index to name")
    {
        if (argument[2] > 0) return global.tarotCard[argument[2] - 1]; else return "";
    }
    // CC("tarot", "have", "card name")
    else if (argument[1] == "have")
    {
        if (CC("tarot", "index to name", Quest("playerCCTarot1")) == argument[2]) return 1;
        if (CC("tarot", "index to name", Quest("playerCCTarot2")) == argument[2]) return 1;
        if (CC("tarot", "index to name", Quest("playerCCTarot3")) == argument[2]) return 1;
        if (CC("tarot", "index to name", Quest("playerCCTarot4")) == argument[2]) return 1;
        return 0;
    }
}

else if (argument[0] == "new player")
{
    // Player base glamp is 10
    Quest("playerCCName", "01234567891234");
    Quest("playerCCMonth", 12);
    Quest("playerCCDay", 3);
    Quest("playerCCYear", "0021");
    Quest("playerCCEra", 0); // BC, CE
    Quest("playerCCTarot1", 2);
    Quest("playerCCTarot2", 3);
    Quest("playerCCTarot3", 4);
    Quest("playerCCTarot4", 5);
    Quest("playerCCAlignmentEthical", 2); // Lawful, Neutral, Chaotic
    Quest("playerCCAlignmentMoral", 2); // Good, Neutral, Evil
    Quest("playerCCBlood", 3);
    Quest("playerCCGenderName", "Tetranormative");
    Quest("playerCCGumball", "Special Coin");
}

else if (argument[0] == "blank player")
{
    //Quest("playerCC", 0);
    Quest("playerCCName", 0);
    Quest("playerCCMonth", 0);
    Quest("playerCCDay", 0);
    Quest("playerCCYear", 0);
    Quest("playerCCEra", 0);
    Quest("playerCCZodiac", 0);
    Quest("playerCCBloodType", 0);
    Quest("playerCCGender", 0);
    Quest("playerCCGenderName", 0);
    Quest("playerCCAlignmentEthical", 0);
    Quest("playerCCAlignmentMoral", 0);
    for (i = 0; i < 4; i += 1) Quest("playerCCTarot" + string(i), 0);
    Quest("playerCCGumball", 0);
    Quest("playerCCPlacenta", 0);
    // Events
    Quest("playerCCRune", 0);
    Quest("playerCCScanner", 0);
    for (i = 0; i < 16; i += 1) Quest("playerCCInkblot" + string(i), 0);
    for (i = 0; i < 44; i += 1) Quest("playerCCMultiple" + string(i), 0);
    Quest("playerCCPalm", 0);
    for (i = 0; i < 4; i += 1) Quest("playerCCLine" + string(i + 1), 0);
    Quest("playerCCLottery", 0);
    for (i = 0; i < 18; i += 1) Quest("playerCCLottery" + string(i), 0);
    for (i = 1; i < 10; i += 1) Quest("playerCCLikes" + string(i), 0);
    for (i = 1; i < 8; i += 1) Quest("playerCCFaves" + string(i), 0);
}

else if (argument[0] == "generate identity")
{
    CC("blank player");
    Quest("playerCCName", choose("Joe", "Jim", "John"));
    
    Quest("playerCCMonth", irandom_range(1, 12));
    Quest("playerCCDay", irandom_range(1, 31));
    Quest("playerCCYear", string(irandom(9)) + string(irandom(9)) + string(irandom(9)) + string(irandom(9)));
    Quest("playerCCEra", irandom(1));
    
    Quest("playerCCBlood", irandom(5));
    
    // Gender
    var gen = "";
    if (random(100) < 20) gen += "Male";
    if (random(100) < 20) gen += "Female";
    if (random(100) < 20) gen += "Dwarf";
    if (random(100) < 20) gen += "Eunuch";
    if (random(100) < 20) gen += "Other"
    if (gen == "") gen = choose("Male", "Female", "Dwarf", "Eunuch", "Other");
    Quest("playerCCGender", gen);
    Quest("playerCCGenderName", ds_map_find_value(global.genderMap, gen));
    
    // Alignment
    Quest("playerCCAlignmentEthical", irandom(2)); // Lawful, Neutral, Chaotic
    Quest("playerCCAlignmentMoral", irandom(2)); // Good, Neutral, Evil
    
    // Crest does not exist
    
    // Tarot - Dome is 16
    for (i = 0; i < 4; i += 1) Quest("playerCCTarot" + string(i + 1), 0);
    var dslTar = ds_list_create();
    ds_list_add(dslTar, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10);
    ds_list_add(dslTar, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20);
    ds_list_add(dslTar, 21, 23, 24, choose(25, 26, 27)); // 22 missing, and juggler deal is added
    ds_list_shuffle(dslTar);
    var crd = ds_list_find_value(dslTar, 0);
    Quest("playerCCTarot1", crd);
    if (crd != 16)
    {
        crd = ds_list_find_value(dslTar, 1);
        Quest("playerCCTarot2", crd);
        if (crd != 16)
        {
            crd = ds_list_find_value(dslTar, 2);
            Quest("playerCCTarot3", crd);
            if (crd != 16)
            {
                crd = ds_list_find_value(dslTar, 3);
                Quest("playerCCTarot4", crd);
            }
        }
    }
    ds_list_destroy(dslTar);
    
    // Gumball
    if (random(100) < 5) Quest("playerCCGumball", "Abstain");
    else if (random(100) < 5) Quest("playerCCGumball", "Special Coin");
    else if (random(100) < 33) Quest("playerCCGumball", choose("Butterscotch", "Foul - Keep", "Foul - Destroy", "Transparent", "Winner", "Steel", "Red - Strawberry"));
    else if (random(100) < 33) Quest("playerCCGumball", choose("Red - Cherry", "Yellow - Banana", "Yellow - Lemon", "Blue - Blueberries", "Blue - Raspberries", "White - Flavorless", "White - Flavorful"));
    else Quest("playerCCGumball", choose("Green - Apple", "Green - Watermelon", "Orange - Fruit", "Orange - Color", "Black - Liquorice", "Black - Coffee", "Grape"));

    // Tree decide
    var pla = irandom(4);
    Quest("playerCCPlacenta", pla);
    var dslEve = ds_list_create();
    ds_list_add(dslEve, o_cc_rune, o_cc_hand_scanner, o_cc_inkblots, o_cc_multiple, o_cc_palm_reading, o_cc_lottery, o_cc_likes_favorites);
    ds_list_shuffle(dslEve);
    
    for (i = 0; i < pla; i += 1)
    {
        var eve = ds_list_find_value(dslEve, i);
        if (eve == o_cc_rune)
        {
            Quest("playerCCRune", choose("Abstain", "M'kah, spirit of fire", "Tuh, ghost of grandpa", "Esh'tak, specter of winter", 
                "Olop, wraith of riceballs", "Nip'pon, apparition of anime", "Xatar, phantom of vidcons", 
                "Dilly dong dong, kelpie of corn cobs", "As'hak, haunt of dwarves"));
        }
        if (eve == o_cc_hand_scanner)
        {
            Quest("playerCCScanner", random(50));
        }
        if (eve == o_cc_inkblots)
        {
            var dslInk = ds_list_create();
            for (h = 0; h < 16; h += 1) ds_list_add(dslInk, h);
            ds_list_shuffle(dslInk);
            for (h = 0; h < 4; h += 1) Quest("playerCCInkblot" + string(dslInk[| h]), 1 + irandom(3));
            ds_list_destroy(dslInk);
        }
        if (eve == o_cc_multiple)
        {
            var dslMul = ds_list_create();
            for (h = 0; h < 44; h += 1) ds_list_add(dslMul, h);
            ds_list_shuffle(dslMul);
            for (h = 0; h < 4; h += 1) Quest("playerCCMultiple" + string(dslMul[| h]), 1 + irandom(3));
            ds_list_destroy(dslMul);
        }
        if (eve == o_cc_palm_reading) // 1 - 18
        {
            if (random(100) < 5) Quest("playerCCPalm", "Abstain");
            else
            {
                Quest("playerCCPalm", "Accepted");
                for (h = 0; h < 4; h += 1) Quest("playerCCLine" + string(h + 1), 1 + irandom(17));
            }
        }
        if (eve == o_cc_lottery)
        {
            Quest("playerCCLottery", 1);
            var num = irandom(18);
            var dslLot = ds_list_create();
            for (h = 0; h < 18; h += 1) ds_list_add(dslLot, h);
            ds_list_shuffle(dslLot);
            for (h = 0; h < num; h += 1) Quest("playerCCLottery" + string(dslLot[| h]), 1);
            ds_list_destroy(dslLot);
        }
        if (eve == o_cc_likes_favorites)
        {
            for (h = 1; h < 10; h += 1) Quest("playerCCLikes" + string(h), 2 + random(10));
            for (h = 1; h < 6; h += 1) Quest("playerCCFaves" + string(h), 2 + random(10));
            Quest("playerCCFaves6", 2 + random(4));
            Quest("playerCCFaves7", 2 + random(5));
        }
    }
}

// CC("identity", "draw", x, y, color?, alpha?)
// Needs CC data loaded for this to work
else if (argument[0] == "identity")
{
    var drx = argument[2];
    var dry = argument[3];
    var drc = c_white;
    var dra = 1;
    if (argument_count > 4) drc = argument[4];
    if (argument_count > 5) dra = argument[5];
    // Get gumball and crest color
    var sat = color_get_red(drc) / 255;
    if (argument[1] == "draw")
    {
        draw_sprite_ext(s_cc_identity_card, 0, drx, dry, 1, 1, 0, drc, dra);
        // 4, 4 face
        draw_sprite_ext(sMenuUtilityFaces, 0, drx + 3, dry + 4, 1, 1, 0, drc, dra);
        // 112, 75 crest
        // 63, 7
        CC("crest", "draw", drx + 68 + (112 / 2), dry + 4 + (74 / 2), 0.5, dra);
        // Blood
        draw_sprite_ext(s_cc_identity_blood, Quest("playerCCBlood"), drx + 17, dry + 73, 1, 1, 0, drc, dra);
        // Gumball
        var gmx = drx + 17 + 30;
        var gmy = dry + 73 - 6;
        CC("gumball", Quest("playerCCGumball"));
        gumCol = merge_color(c_black, gumCol, sat);
        if (gumSpr != -1) draw_sprite_ext(gumSpr, gumSub, gmx, gmy, 1, 1, 0, gumCol, dra);
        // Name
        draw_set_alpha(dra);
        scr_font(global.fn_smallc, make_color_rgb(8, 0, 24), 1, 0);
        draw_text(drx + 46, dry + 89, Quest("playerCCName"));
        // Alignment
        var str = CC("alignment", Quest("playerCCAlignmentEthical"), Quest("playerCCAlignmentMoral"));
        draw_text(drx + 46, dry + 89 + 23, str);
        // Gender
        draw_text(drx + 46, dry + 89 + 23 + 23, Quest("playerCCGenderName"));
        // Date of Birth
        var str = string_format(Quest("playerCCMonth"), 2, 0) + "/";
        str += string_replace_all(string_format(Quest("playerCCDay"), 2, 0) + "/", " ", "0");
        str += Quest("playerCCYear");
        if (Quest("playerCCEra") == 0) str += " BC"; else str += " CE";
        draw_text(drx + 46, dry + 89 + 23 + 23 + 23, str);
        draw_set_alpha(1);
        // Cards
        drx += 126 + 32 - (13 * 3) - 2;
        dry += 64 + 48 + (13 * 3);
        for (i = 0; i < 4; i += 1) // 64x96 cards
        {
            ind = Quest("playerCCTarot" + string(i + 1)); // 13 11
            if (ind != 0)
            {
                draw_sprite_ext(s_cc_tarot_cards, ind, drx, dry, 1, 1, 0, drc, dra);
                drx += 13;
                dry -= 13;
            }
        }
    }
}

// CC("alignment", ethical, moral)
else if (argument[0] == "alignment")
{
    var str = "";
    if (argument[1] == 0) str += "Lawful ";
    if (argument[1] == 1) str += "Neutral ";
    if (argument[1] == 2) str += "Chaotic ";
    if (argument[2] == 0) str += "Good";
    if (argument[2] == 1) str += "Neutral";
    if (argument[2] == 2) str += "Evil";
    return str;
}

else if (argument[0] == "gumball")
{
    var gum = argument[1];
    gumSpr = s_cc_identity_gumball;
    if (gum == "Abstain" || gum == "Foul - Destroy") { gumSpr = -1; }
    if (gum == "Special Coin") { gumSub = 5; gumCol = c_white; }
    if (gum == "Butterscotch") { gumSub = 0; gumCol = make_color_rgb(196, 128, 0); }
    if (gum == "Foul" || gum == "Foul - Keep") { gumSub = 1; gumCol = c_white; }
    if (gum == "Transparent") { gumSub = 2; gumCol = c_white; }
    if (gum == "Winner") { gumSub = 3; gumCol = c_white; }
    if (gum == "Steel") { gumSub = 4; gumCol = c_white; }
    if (gum == "Red - Strawberry") { gumSub = 0; gumCol = make_color_rgb(255, 0, 0); }
    if (gum == "Red - Cherry") { gumSub = 0; gumCol = make_color_rgb(255, 0, 0); }
    if (gum == "Yellow - Banana") { gumSub = 0; gumCol = make_color_rgb(255, 255, 0); }
    if (gum == "Yellow - Lemon") { gumSub = 0; gumCol = make_color_rgb(255, 255, 0); }
    if (gum == "Blue - Blueberries") { gumSub = 0; gumCol = make_color_rgb(0, 0, 255); }
    if (gum == "Blue - Raspberries") { gumSub = 0; gumCol = make_color_rgb(0, 0, 255); }
    if (gum == "White - Flavorless") { gumSub = 0; gumCol = c_white; }
    if (gum == "White - Flavorful") { gumSub = 0; gumCol = c_white; }
    if (gum == "Green - Apple") { gumSub = 0; gumCol = make_color_rgb(0, 224, 0); }
    if (gum == "Green - Watermelon") { gumSub = 0; gumCol = make_color_rgb(0, 224, 0); }
    if (gum == "Orange - Fruit") { gumSub = 0; gumCol = make_color_rgb(255, 128, 0); }
    if (gum == "Orange - Color") { gumSub = 0; gumCol = make_color_rgb(255, 128, 0); }
    if (gum == "Black - Liquorice") { gumSub = 0; gumCol = make_color_rgb(32, 32, 32); }
    if (gum == "Black - Coffee") { gumSub = 0; gumCol = make_color_rgb(32, 32, 32); }
    if (gum == "Grape") { gumSub = 0; gumCol = make_color_rgb(128, 0, 255); }
}

else if (argument[0] == "init")
{
    global.tarotCard[0] = "Fool";
    global.tarotCard[1] = "Popess";
    global.tarotCard[2] = "Empress";
    global.tarotCard[3] = "Emperor";
    global.tarotCard[4] = "Hierophant";
    global.tarotCard[5] = "Lovers";
    global.tarotCard[6] = "Chariot";
    global.tarotCard[7] = "Justice";
    global.tarotCard[8] = "Hermit";
    global.tarotCard[9] = "Misfortune";
    global.tarotCard[10] = "Might";
    global.tarotCard[11] = "Hanged Man";
    global.tarotCard[12] = "Death";
    global.tarotCard[13] = "Temperance";
    global.tarotCard[14] = "Devil";
    global.tarotCard[15] = "Dome";
    global.tarotCard[16] = "Star";
    global.tarotCard[17] = "Moon";
    global.tarotCard[18] = "Sun";
    global.tarotCard[19] = "Karma";
    global.tarotCard[20] = "Universe";
    global.tarotCard[21] = "Babe In The Woods";
    global.tarotCard[22] = "Rules Card";
    global.tarotCard[23] = "Fortune";
    global.tarotCard[24] = "Juggler";
    global.tarotCard[25] = "Mountebank";
    global.tarotCard[26] = "Magician";
    
    // Crest
    global.crestColor[0] = make_color_rgb(255, 0, 0);
    global.crestColor[1] = make_color_rgb(255, 255, 0);
    global.crestColor[2] = make_color_rgb(0, 0, 255);
    global.crestColor[3] = make_color_rgb(0, 255, 0);
    global.crestColor[4] = make_color_rgb(255, 0, 255);
    global.crestColor[5] = make_color_rgb(150, 150, 150);
    
    // Gender
    global.genderMap = ds_map_create();
    ds_map_add(global.genderMap, "Male", "Male");
    ds_map_add(global.genderMap, "Dwarf", "Dwarf");
    ds_map_add(global.genderMap, "Other", "Other");
    ds_map_add(global.genderMap, "Female", "Female");
    ds_map_add(global.genderMap, "Eunuch", "Eunuch");
    ds_map_add(global.genderMap, "MaleDwarf", "Gourami");
    ds_map_add(global.genderMap, "MaleOther", "Twin");
    ds_map_add(global.genderMap, "MaleFemale", "Futanari");
    ds_map_add(global.genderMap, "MaleEunuch", "Y-abjured");
    ds_map_add(global.genderMap, "DwarfOther", "Filikili");
    ds_map_add(global.genderMap, "EunuchOther", "Mas o Menos");
    ds_map_add(global.genderMap, "FemaleOther", "Dual");
    ds_map_add(global.genderMap, "DwarfEunuch", "Kapi Agha");
    ds_map_add(global.genderMap, "FemaleDwarf", "Zeherah");
    ds_map_add(global.genderMap, "FemaleEunuch", "X-abjured");
    ds_map_add(global.genderMap, "MaleDwarfOther", "Haploid");
    ds_map_add(global.genderMap, "MaleEunuchOther", "Oogamous");
    ds_map_add(global.genderMap, "MaleDwarfEunuch", "Kizlar Agha");
    ds_map_add(global.genderMap, "MaleFemaleOther", "Switch");
    ds_map_add(global.genderMap, "MaleFemaleDwarf", "Triploid");
    ds_map_add(global.genderMap, "FemaleDwarfOther", "Diploid");
    ds_map_add(global.genderMap, "DwarfEunuchOther", "Isogamous");
    ds_map_add(global.genderMap, "MaleFemaleEunuch", "Hermaphrodite");
    ds_map_add(global.genderMap, "FemaleDwarfEunuch", "Silahdar Agha");
    ds_map_add(global.genderMap, "FemaleEunuchOther", "Anisogamous");
    ds_map_add(global.genderMap, "MaleFemaleDwarfOther", "Tetrasex");
    ds_map_add(global.genderMap, "MaleDwarfEunuchOther", "Tetrabro");
    ds_map_add(global.genderMap, "MaleFemaleDwarfEunuch", "Tetranormative");
    ds_map_add(global.genderMap, "MaleFemaleEunuchOther", "Tetradain");
    ds_map_add(global.genderMap, "FemaleDwarfEunuchOther", "Tetralass");
    ds_map_add(global.genderMap, "MaleFemaleDwarfEunuchOther", "Pentaploid");
    
    // Blood
    global.bloodMap = ds_map_create();
    ds_map_add(global.bloodMap, 0, "Type A");
    ds_map_add(global.bloodMap, 1, "Type B");
    ds_map_add(global.bloodMap, 2, "Type AB");
    ds_map_add(global.bloodMap, 3, "Type O");
    ds_map_add(global.bloodMap, 4, "10w-30");
    ds_map_add(global.bloodMap, 5, "Corn syrup");
    
    for (i = 0; i < 3; i += 1)
    {
        for (h = 0; h < 20; h += 1) global.geneBonus[i, h] = 0;
    }
}
