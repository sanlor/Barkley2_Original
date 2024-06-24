/// Vidcon( "name" / "give" / "have" / "have total" / "game total" , <index>)
if (argument[0] == "db")
{
    global.vidconName[0] = "Senor Bappy";
    global.vidconName[1] = "Fatal Downshift: The Leagues";
    global.vidconName[2] = "Bananas Ape-lenty";
    global.vidconName[3] = "ATP Pro Tour 6K60: Valley of the Volleys"; //bhroom likes this one
    global.vidconName[4] = "Super Return of Chernobog"; // Milagros gives you this event_tnn_milagros01
    global.vidconName[5] = "Creppy Ghoulie IV"; // Kelpster sells you this event_tnn_kelpster01
    global.vidconName[6] = "Kindergarten Kop Killer"; //bhroom placeholder
    global.vidconName[7] = "Don't Spill the Sauce!"; //bhroom kinda likes this one
    global.vidconName[8] = "Dervish 2: Whirlstrom"; //bhroom kinda likes this one
    global.vidconName[9] = "Gorezerker: Insurrection";
    global.vidconName[10] = "Bolly Mixtures";
    global.vidconName[11] = "Zukünftiger Erbauer II: Cyberdorf";
    global.vidconName[12] = "Vidcon 12";
    global.vidconName[13] = "Vidcon 13";
    global.vidconName[14] = "Vidcon 14";
    global.vidconName[15] = "Vidcon 15";
    global.vidconName[16] = "Vidcon 16";
    global.vidconName[17] = "Vidcon 17";
    global.vidconName[18] = "Vidcon 18";
    global.vidconName[19] = "Vidcon 19";
    global.vidconName[20] = "Vidcon 20";
    global.vidconName[21] = "Vidcon 21";
    global.vidconName[22] = "Vidcon 22";
    global.vidconName[23] = "Vidcon 23";
    global.vidconName[24] = "Vidcon 24";
    global.vidconName[25] = "Wesley Girl 68";
    global.vidconName[26] = "Wesley Girl 70";
}
else if (argument[0] == "init")
{
    global.vidcons = 52;
    global.vidconExperience = 30; // How much EXP for opened vidcons
    var alt = 0;
    for (_i = 0; _i < global.vidcons; _i += 1)
    {
        global.vidconName[_i] = "Vidcon " + string(_i + 1);
        if (alt) global.vidconDescription[_i] = "Console: GameCantelope Pocket#Developer: P'Tony Dataworks#Genre: RPG# #Play as Lubic and destroy all of your foes to bring peace to the lands.";
        else global.vidconDescription[_i] = "Console: Mokugatchi 24#Developer: SludgeSoft#Genre: Racing# #Feel the rubber on the road, power into the turns, and speed past the finish line!";
        alt = !alt;
    }
    Vidcon("db");
}
else if (argument[0] == "reset")
{
    var vidconHave = ds_list_create();
    var vidconBoxed = ds_list_create();
    for (_i = 0; _i < global.vidcons; _i++)
    {
        vidconHave[| _i] = 0;
        vidconBoxed[| _i] = 1;
    }
    scr_savedata_put_list("player.xp.vidcons", vidconHave);
    scr_savedata_put_list("player.xp.vidconsBoxed", vidconBoxed);
}
else if (argument[0] == "give")
{
    var vidconHave = scr_savedata_get("player.xp.vidcons");
    var vidconBoxed = scr_savedata_get("player.xp.vidconsBoxed");
    vidconHave[| argument[1]] = 1;
    vidconBoxed[| argument[1]] = 1;
}
else if (argument[0] == "have")
{
    var vidconHave = scr_savedata_get("player.xp.vidcons");
    return vidconHave[| argument[1]];
}
else if (argument[0] == "unbox")
{
    var vidconBoxed = scr_savedata_get("player.xp.vidconsBoxed");
    vidconBoxed[| argument[1]] = 0;
}
else if (argument[0] == "is boxed")
{
    var vidconHave = scr_savedata_get("player.xp.vidcons");
    var vidconBoxed = scr_savedata_get("player.xp.vidconsBoxed");
    if (vidconHave[| argument[1]] == 0) return 0;
    return vidconBoxed[| argument[1]];
}
else if (argument[0] == "name")
{
    return global.vidconName[argument[1]];
}
else if (argument[0] == "description")
{
    return global.vidconDescription[argument[1]];
}
else if (argument[0] == "have total")
{
    var vidconHave = scr_savedata_get("player.xp.vidcons");
    var count = 0;
    for (_i = 0; _i < global.vidcons; _i += 1)
    {
        if (vidconHave[| _i]) count += 1;
    }
    return count;
}
else if (argument[0] == "boxed total")
{
    var vidconHave = scr_savedata_get("player.xp.vidcons");
    var vidconBoxed = scr_savedata_get("player.xp.vidconsBoxed");
    var count = 0;
    for (_i = 0; _i < global.vidcons; _i += 1)
    {
        if (vidconHave[| _i] && vidconBoxed[| _i]) count += 1;
    }
    return count;
}
else if (argument[0] == "unboxed total")
{
    return Vidcon("have total") - Vidcon("boxed total");
}
else if (argument[0] == "experience") // Returns Vidcon experience
{
    return Vidcon("unboxed total") * global.vidconExperience;
}
else if (argument[0] == "game total")
{
    return global.vidcons;
}
