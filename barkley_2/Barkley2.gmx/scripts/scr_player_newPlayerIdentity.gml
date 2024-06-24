// scr_player_newPlayerIdentity
randomize();
// Clock time and QuestTracker, must be at top of this script to get all quest vars
ClockTime("init");
QuestTracker("init");
BodySwap("init"); //Call once per game reset, body of hoopz for Gov quest
Note("init");
Item("reset");
Map("reset");
Cyberspear("reset");
// Create a temporary CombatActor to use for generating Stats
var ca = instance_create(0, 0, PlayerCombatActor);
with (ca) {
    // Set Hoopz ID Quest Variables
    Quest("playerX1", 1);
    Quest("playerName", "X114JAM9"); // constant P_NAME
    Quest("playerNameFull", "X114JAM9"); // constant P_NAME_F
    Quest("playerNameShort", "X1"); // constant P_NAME_S
    
    Quest("playerGumballColor", floor(random(255))); // green is 80
    Quest("playerBlueFace", 0);
    Quest("playerBlueFaceName", "Becker");
    
    // CC Bonus
    Quest("playerCCBonus", 2); // Keeping for OLD stuff, will remove later
    
    // CC Name
    Quest("playerCCName", "");
    
    // CC Birth Date
    // Compares to ClockTime's 4 digits and gives BONUS equal to quest value
    // if X digit below is even and not 0
    Quest("playerCCPowerBonus", 0);      // X0:00 - Power
    Quest("playerCCCapacityBonus", 0);   // 0X:00 - Capacity
    Quest("playerCCAffixBonus", 0);      // 00:X0 - Affix
    Quest("playerCCSpeedBonus", 0);      // 00:0X - Speed / Rate
    Quest("playerCCMonth", 0);           // Power Bonus
    Quest("playerCCDay", 0);             // Capacity Bonus
    Quest("playerCCYear", 0);            // Affix Bonus
    Quest("playerCCEra", 0);             // Rate Bonus
    Quest("playerCCZodiac", "Aries");    // Zodiac
    // Zodiac can be used for Character dialogs
    
    // CC Blood Type
    // Effects FONT and PETAL color of the Haiku
    // 0 = A, 1 = B , 2 = C, 3 = O, 4 = 10w-30, 5 = Corn Syrup
    // o_hoopz_death_grayscale CREATE event has the color values
    Quest("playerCCBloodType", 0);
    
    // CC Gender
    // No use currently
    Quest("playerCCGender", "Dwarf");
    Quest("playerCCGenderName", "Dwarf");
    
    // CC Alignment
    Quest("playerCCAlignmentEthical", ALIGN_ETHICAL_NEUTRAL);
    Quest("playerCCAlignmentMoral", ALIGN_MORAL_NEUTRAL);
    
    // CC Tarot
    // 0 - 25 and 26 is BABE
    Quest("playerCCTarot1", 0);
    Quest("playerCCTarot2", 1);
    Quest("playerCCTarot3", 2);
    Quest("playerCCTarot4", 3);
    
    // CC Rune
    // This is tracked in a quest var but you also get it as an item at the start
    Quest("playerCCRune", 0);
    
    // CC Enemy Boost (hand scanner)
    Quest("playerCCScanner", 0); // Enemy glamp bonus
    
    // Roll Hoopz base stats
    scr_stats_resetStats();
    scr_stats_setBaseStat( self, STAT_BASE_LEVEL, 12);
    scr_stats_setBaseStat( self, STAT_BASE_HP, 47);
    scr_stats_setBaseStat( self, STAT_BASE_SPEED, 9.5); // AGILITY // Tweak this when the formula is set
    
    scr_stats_setBaseStat( self, STAT_BASE_GUTS, 10);
    scr_stats_setBaseStat( self, STAT_BASE_LUCK, 10);
    scr_stats_setBaseStat( self, STAT_BASE_AGILE, 10);
    scr_stats_setBaseStat( self, STAT_BASE_MIGHT, 10);
    scr_stats_setBaseStat( self, STAT_BASE_PIETY, 10);
    //scr_stats_rollBaseStats(1, 8, 8, 8, 8, 8);
    scr_stats_genEffectiveStats();
    scr_stats_resetCurrentStats();

    // Save maps into Savedata
    scr_savedata_put_map("player.stats.base", stats_base);
    scr_savedata_put_map("player.stats.effective", stats_effective);
    scr_savedata_put_map("player.stats.current", stats_current);
    
    // Save status effects into Savedata
    scr_savedata_put_list("player.stats.statuseffects", list_status_effect);
    
    // Clean up temporary object
    instance_destroy();
}

// Quest time
scr_time_set(1);

// Current position in world
scr_savedata_put("map.room", room_get_name(global.settingLoadRoom));
scr_savedata_put("map.x", global.settingLoadX);
scr_savedata_put("map.y", global.settingLoadY);
//scr_savedata_put("map.respawnJunk", true);

// Respawn info
scr_savedata_put("player.respawn.do", false);
scr_savedata_put("player.respawn.room", "");
scr_savedata_put("player.respawn.x", 0);
scr_savedata_put("player.respawn.y", 0);
scr_savedata_put("player.respawn.loc", "");
scr_savedata_put("player.respawn.junk", false);
scr_savedata_put("player.deaths.total", 0);
scr_savedata_put("player.deaths.current", 0);

// Jerkins (Player starts with the Cornhusk Jerkin!) - Bhroom
Jerkin("reset");
Jerkin("gain", "Cornhusk Jerkin");
Jerkin("equip", "Cornhusk Jerkin");

// Maps
Map("gain", "Necron 7 - 666th Floor");

// Chips
scr_savedata_put_list("player.chips.has", ds_list_create());
scr_savedata_put("player.chips.current", NULL_STRING);

// Items
scr_savedata_put_list("player.items.has", ds_list_create());
scr_savedata_put_list("player.schematics.zaubers", ds_list_create());
scr_savedata_put_list("player.schematics.relics", ds_list_create());

// Candy
Candy("reset");
Candy("current", NULL);

// Zaubers
Zauber("reset");

// Humanism
scr_savedata_put("player.humanism.bio", global.settingHoopzBio);
scr_savedata_put("player.humanism.cyber", global.settingHoopzCyber);
scr_savedata_put("player.humanism.cosmic", global.settingHoopzCosmic);
scr_savedata_put("player.humanism.zauber", global.settingHoopzZauber);

// Bonnet
scr_savedata_put("player.hasBonnet", true);

// Money
scr_money_set(0);

// XP
scr_savedata_put("player.xp.questxp", 0);
Vidcon("reset"); // Reset vidcons you have and vidcon XP
scr_savedata_put("player.xp.level", 12);
scr_savedata_put("ustation.smelt", 500);

// Spawn points
scr_savedata_put_map("spawn", ds_map_create());

// Gunmap - Generate hoopz's gun map for this game
Gunsmap("generate");
scr_savedata_put("gunsmap.seed", global.gunsmapSeed);

// Generate guns
var gunBandolier = ds_list_create();
var gunBag = ds_list_create();
var gunSchematics = ds_list_create();
scr_savedata_put_list("player.guns.bandolier", gunBandolier);
scr_savedata_put_list("player.guns.bag", gunBag);
scr_savedata_put_list("player.guns.schematics", gunSchematics);
Lineage("reset"); // Must call before gun gen
scr_equipment_guns_bandolier_setSlotsTotal(5);
scr_equipment_guns_bag_setSlotsTotal(20);
scr_equipment_guns_bandolier_equip(0);
scr_player_setGunHolstered(true);


// Cuchu elevator starts at floor 666 // I put this here as guided by bort, blame him. 
// The idea is to set the initial floor to 666 just once so this seems like a good spot //
Quest("elevatorFloorGoal", 665);
Quest("elevatorFloor", 665);
Quest("hudVisible", 1);
Quest("zoneVisible", 1);
Quest("dropEnabled", 1);
Quest("dropTable", 0); // 0 = regular, 1 = boss
Quest("infiniteAmmo", 0);
Quest("yapWords", 0);

// SUPER ROBOT ~ temporary, bortnote
//scr_superRobot_init();

// Here was previously adding character classes....

// Here was previously adding a bunch of candy to the player to start out....
