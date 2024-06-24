/// Map()
/*              
COMMAND REFERENCE
                Area name    Sub
Map("add area", "world map", 0);

                Area name    Spr  X    Y    Variable      Compare  Value  Variable?      Compare?  Value?  Variable?      Compare?  Value?
Map("add icon", "world map", 0,   100, 100, "knowCdwarf", ">=",    "1");
You can have up to three compares per "add icon".
*/

// Map("init") - Call only once per game.
if (argument[0] == "init")
{
    global.mapDel = 0; // delta
    global.mapNam = ds_list_create();
    global.mapSub = ds_list_create();
    
    // Map("add icon", "world map", 2, 211, 130, "area", "==", "swp"); // In game example
    
    /////////////////////////    
    // World Map (Called "Necron 7 - 666th Floor")
    /////////////////////////
    Map("add area", "Necron 7 - 666th Floor", 0);
    // Districts //
    Map("add icon", "Necron 7 - 666th Floor", sMapIconHoopz, 109, 89, "area", "==", "tnn");
    Map("add icon", "Necron 7 - 666th Floor", sMapIconHoopz, 98, 113, "area", "==", "sw1");
    Map("add icon", "Necron 7 - 666th Floor", sMapIconHoopz, 102, 121, "area", "==", "sw2");
    Map("add icon", "Necron 7 - 666th Floor", sMapIconHoopz, 153, 90, "area", "==", "est");
    Map("add icon", "Necron 7 - 666th Floor", sMapIconHoopz, 80, 91, "area", "==", "wst");
    Map("add icon", "Necron 7 - 666th Floor", sMapIconHoopz, 274, 82, "area", "==", "pea");
    Map("add icon", "Necron 7 - 666th Floor", sMapIconHoopz, 182, 57, "area", "==", "fct");
    Map("add icon", "Necron 7 - 666th Floor", sMapIconHoopz, 270, 165, "area", "==", "min");
    Map("add icon", "Necron 7 - 666th Floor", sMapIconHoopz, 193, 119, "area", "==", "far");
    Map("add icon", "Necron 7 - 666th Floor", sMapIconHoopz, 136, 146, "area", "==", "swp");
    Map("add icon", "Necron 7 - 666th Floor", sMapIconHoopz, 44, 123, "area", "==", "bct");
    Map("add icon", "Necron 7 - 666th Floor", sMapIconHoopz, 75, 43, "area", "==", "ice");
    Map("add icon", "Necron 7 - 666th Floor", sMapIconHoopz, 102, 185, "area", "==", "usw");
    Map("add icon", "Necron 7 - 666th Floor", sMapIconHoopz, 213, 151, "area", "==", "aki");
    Map("add icon", "Necron 7 - 666th Floor", sMapIconHoopz, 275, 39, "area", "==", "dth");
    Map("add icon", "Necron 7 - 666th Floor", sMapIconHoopz, 240, 78, "area", "==", "pri");
    
    //The Hunt for Cyberdwarf
    Map("add icon", "Necron 7 - 666th Floor", sMapIconCyberdwarf, 274, 24, "knowMagus", "==", "2");
    Map("add icon", "Necron 7 - 666th Floor", sMapIconCyberdwarf, 274, 24, "knowMagus", "==", "3");
    
    /////////////////////////
    // Tír na nÓg 
    /////////////////////////
    Map("add area", "Tír na nÓg", 2);
    // Districts //
    Map("add icon", "Tír na nÓg", sMapIconHoopz, 197, 92, "room", "==", "r_tnn_residentialDistrict01", "x", "<", "588", "y", "<", "488");
    Map("add icon", "Tír na nÓg", sMapIconHoopz, 230, 152, "room", "==", "r_tnn_residentialDistrict01", "x", ">=", "588", "y", ">=", "488");
    Map("add icon", "Tír na nÓg", sMapIconHoopz, 231, 95, "room", "==", "r_tnn_residentialDistrict01", "x", ">=", "588", "y", "<", "488");
    Map("add icon", "Tír na nÓg", sMapIconHoopz, 191, 145, "room", "==", "r_tnn_residentialDistrict01", "x", "<", "588", "y", ">=", "488");
    Map("add icon", "Tír na nÓg", sMapIconHoopz, 49, 117, "room", "==", "r_tnn_warehouseDistrict01", "y", "<", "424");
    Map("add icon", "Tír na nÓg", sMapIconHoopz, 52, 147, "room", "==", "r_tnn_warehouseDistrict01", "y", ">=", "424");
    Map("add icon", "Tír na nÓg", sMapIconHoopz, 27, 70, "room", "==", "r_tnn_businessDistrict01", "x", "<", "856");
    Map("add icon", "Tír na nÓg", sMapIconHoopz, 73, 73, "room", "==", "r_tnn_businessDistrict01", "x", ">=", "856");
    Map("add icon", "Tír na nÓg", sMapIconHoopz, 145, 33, "room", "==", "r_tnn_marketDistrict01", "x", "<", "936", "y", "<", "560");
    Map("add icon", "Tír na nÓg", sMapIconHoopz, 187, 37, "room", "==", "r_tnn_marketDistrict01", "x", ">=", "936", "y", "<", "560");
    Map("add icon", "Tír na nÓg", sMapIconHoopz, 151, 70, "room", "==", "r_tnn_marketDistrict01", "x", "<", "936", "y", ">=", "560");
    Map("add icon", "Tír na nÓg", sMapIconHoopz, 214, 67, "room", "==", "r_tnn_marketDistrict01", "x", ">=", "936", "y", ">=", "560");
    Map("add icon", "Tír na nÓg", sMapIconHoopz, 117, 116, "room", "==", "r_tnn_maingate02", "y", "<", "130");
    Map("add icon", "Tír na nÓg", sMapIconHoopz, 125, 164, "room", "==", "r_tnn_maingate02", "y", ">=", "130");
    Map("add icon", "Tír na nÓg", sMapIconHoopz, 283, 94, "room", "==", "r_tnn_bballcourt_transition01");
    Map("add icon", "Tír na nÓg", sMapIconHoopz, 281, 62, "room", "==", "r_tnn_bballcourt02");

    // Interior Rooms //
    Map("add icon", "Tír na nÓg", sMapIconHoopz, 149, 41, "room", "==", "r_tnn_backshop01");
    Map("add icon", "Tír na nÓg", sMapIconHoopz, 285, 43, "room", "==", "r_tnn_bballtenement01");
    Map("add icon", "Tír na nÓg", sMapIconHoopz, 193, 118, "room", "==", "r_tnn_blockhouse01");
    Map("add icon", "Tír na nÓg", sMapIconHoopz, 220, 145, "room", "==", "r_tnn_boardinghouse01");
    Map("add icon", "Tír na nÓg", sMapIconHoopz, 65, 129, "room", "==", "r_tnn_bootybass02");
    Map("add icon", "Tír na nÓg", sMapIconHoopz, 202, 35, "room", "==", "r_tnn_clinic01");
    Map("add icon", "Tír na nÓg", sMapIconHoopz, 223, 168, "room", "==", "r_tnn_ghettoofsadness01");
    Map("add icon", "Tír na nÓg", sMapIconHoopz, 248, 109, "room", "==", "r_tnn_ghosthouse01");
    Map("add icon", "Tír na nÓg", sMapIconHoopz, 218, 48, "room", "==", "r_tnn_giuseppesChurch01");
    Map("add icon", "Tír na nÓg", sMapIconHoopz, 71, 99, "room", "==", "r_tnn_gutterHouse01");
    Map("add icon", "Tír na nÓg", sMapIconHoopz, 47, 72, "room", "==", "r_tnn_kelpstershouse01");
    Map("add icon", "Tír na nÓg", sMapIconHoopz, 47, 99, "room", "==", "r_tnn_mortgage01");
    Map("add icon", "Tír na nÓg", sMapIconHoopz, 208, 170, "room", "==", "r_tnn_petshop01");
    Map("add icon", "Tír na nÓg", sMapIconHoopz, 43, 46, "room", "==", "r_tnn_rebelbase02");
    Map("add icon", "Tír na nÓg", sMapIconHoopz, 249, 146, "room", "==", "r_tnn_rentcontrolled01");
    Map("add icon", "Tír na nÓg", sMapIconHoopz, 32, 140, "room", "==", "r_tnn_warehouse01");
    Map("add icon", "Tír na nÓg", sMapIconHoopz, 234, 125, "room", "==", "r_tnn_wilmer01");
    Map("add icon", "Tír na nÓg", sMapIconHoopz, 234, 134, "room", "==", "r_tnn_wilmer02");
    Map("add icon", "Tír na nÓg", sMapIconHoopz, 163, 27, "room", "==", "r_tnn_vivian02");
    // Kelpster //
    Map("add icon", "Tír na nÓg", sMapIconGrapes,    47,  71,  "kelpsterState", "==", "2", "fruitbasketTake", "!=", "2");
    // Wilmer Quest //
    Map("add icon", "Tír na nÓg", sMapIconRent, 46, 101, "wilmerEvict", "==", "1", "mortgageDoorRealize", "==", "0");
    //Demo Helper
    Map("add icon", "Tír na nÓg", sMapIconSewers, 204, 17, "knowLONGINUSTnn", ">=", "1");
    Map("add icon", "Tír na nÓg", sMapIconTutorial, 208, 93);
    //Lugner Quest
    Map("add icon", "Tír na nÓg", sMapIconHelper, 219, 49, "lugnerQuest", "==", "3");
    Map("add icon", "Tír na nÓg", sMapIconHelper, 19, 139, "lugnerQuest", ">=", "4", "lugnerQuest", "<=", "6", );
    //Main Quest
    Map("add icon", "Tír na nÓg", sMapIconExit, 123, 144, "operationX", "==", "2");
    
    /////////////////////////////
    // Sewers Floor 1
    /////////////////////////////
    Map("add area", "Sewers Floor 1", 1);
    //Map("add icon", "Sewers Floor 1", sMapIconHoopz, 155, 58);//, "room", "==", "r_swr_room", "x", ">", "500");
    Map("add icon", "Sewers Floor 1", sMapIconHoopz, 149, 32, "room", "==", "r_sw1_descent01"); //  - 
    Map("add icon", "Sewers Floor 1", sMapIconHoopz, 154, 58, "room", "==", "r_sw1_fishersCreek01"); //  - 
    Map("add icon", "Sewers Floor 1", sMapIconHoopz, 149, 88, "room", "==", "r_sw1_foyer01"); //  - 
    Map("add icon", "Sewers Floor 1", sMapIconHoopz, 106, 86, "room", "==", "r_sw1_end01"); //  - 
    Map("add icon", "Sewers Floor 1", sMapIconHoopz, 81, 98, "room", "==", "r_sw1_manholeWest01"); //  - 
    Map("add icon", "Sewers Floor 1", sMapIconHoopz, 160, 119, "room", "==", "r_sw1_center01"); //  - 
    Map("add icon", "Sewers Floor 1", sMapIconHoopz, 209, 119, "room", "==", "r_sw1_eastEdge01"); //  - 
    Map("add icon", "Sewers Floor 1", sMapIconHoopz, 200, 142, "room", "==", "r_sw1_secret01"); //  - 
    Map("add icon", "Sewers Floor 1", sMapIconHoopz, 243, 119, "room", "==", "r_sw1_treasureDwarf01"); //  - 
    Map("add icon", "Sewers Floor 1", sMapIconHoopz, 210, 87, "room", "==", "r_sw1_crossroads01"); //  - 
    Map("add icon", "Sewers Floor 1", sMapIconHoopz, 247, 98, "room", "==", "r_sw1_manholeEast01"); //  - 
    Map("add icon", "Sewers Floor 1", sMapIconHoopz, 248, 79, "room", "==", "r_sw1_baldomero01"); //  - 
    Map("add icon", "Sewers Floor 1", sMapIconHoopz, 248, 59, "room", "==", "r_sw1_closet01"); //  - 
    Map("add icon", "Sewers Floor 1", sMapIconHoopz, 225, 58, "room", "==", "r_sw1_elemental01"); //  - 
    Map("add icon", "Sewers Floor 1", sMapIconHoopz, 203, 58, "room", "==", "r_sw1_respawn01"); //  - 
    Map("add icon", "Sewers Floor 1", sMapIconHoopz, 157, 150, "room", "==", "r_sw1_rathell01"); //  - 
    Map("add icon", "Sewers Floor 1", sMapIconHoopz, 120, 182, "room", "==", "r_sw1_southEdge01"); //  - 
    Map("add icon", "Sewers Floor 1", sMapIconHoopz, 53, 149, "room", "==", "r_sw1_gap01"); //  - 
    Map("add icon", "Sewers Floor 1", sMapIconHoopz, 55, 103, "room", "==", "r_sw1_gutterGate01"); //  - 
    Map("add icon", "Sewers Floor 1", sMapIconHoopz, 81, 126, "room", "==", "r_sw1_plantation02"); //  - 
    Map("add icon", "Sewers Floor 1", sMapIconHoopz, 117, 129, "room", "==", "r_sw1_pool01"); //  - 
    Map("add icon", "Sewers Floor 1", sMapIconHoopz, 243, 162, "room", "==", "r_sw1_floor2Access01"); // - 
    Map("add icon", "Sewers Floor 1", sMapIconHoopz, 265, 142, "room", "==", "r_sw1_utility01"); //  - 
    Map("add icon", "Sewers Floor 1", sMapIconHoopz, 265, 164, "room", "==", "r_sw1_joad01"); //  - 
    Map("add icon", "Sewers Floor 1", sMapIconHoopz, 125, 160, "room", "==", "r_sw1_longWays01", "x", ">=", "648"); //  - 
    Map("add icon", "Sewers Floor 1", sMapIconHoopz, 86, 159, "room", "==", "r_sw1_longWays01", "x", "<", "648"); //  - 
    Map("add icon", "Sewers Floor 1", sMapIconHoopz, 243, 143, "room", "==", "r_sw1_tnnShortcut01"); //  - 
    //Map("add icon", "Sewers Floor 1", sMapIconHoopz, , , "room", "==", "");
    
    /////////////////////////////
    // Sewers Floor 2
    /////////////////////////////
    Map("add area", "Sewers Floor 2", 3);
    //Map("add icon", "Sewers Floor 1", sMapIconHoopz, 155, 58);//, "room", "==", "r_swr_room", "x", ">", "500");
    Map("add icon", "Sewers Floor 2", sMapIconHoopz, 149, 155, "room", "==", "r_sw2_balcony01");
    Map("add icon", "Sewers Floor 2", sMapIconHoopz, 102, 151, "room", "==", "r_sw2_bridges01");
    Map("add icon", "Sewers Floor 2", sMapIconHoopz, 53, 133, "room", "==", "r_sw2_crossing01");
    Map("add icon", "Sewers Floor 2", sMapIconHoopz, 81, 91, "room", "==", "r_sw2_crossroad01");
    Map("add icon", "Sewers Floor 2", sMapIconHoopz, 289, 73, "room", "==", "r_sw2_eastExit01");
    Map("add icon", "Sewers Floor 2", sMapIconHoopz, 88, 64, "room", "==", "r_sw2_end01");
    Map("add icon", "Sewers Floor 2", sMapIconHoopz, 105, 119, "room", "==", "r_sw2_gordo01");
    Map("add icon", "Sewers Floor 2", sMapIconHoopz, 248, 117, "room", "==", "r_sw2_hermitPass01");
    Map("add icon", "Sewers Floor 2", sMapIconHoopz, 50, 63, "room", "==", "r_sw2_indianRopeTrick01");
    Map("add icon", "Sewers Floor 2", sMapIconHoopz, 134, 64, "room", "==", "r_sw2_looparound01");
    Map("add icon", "Sewers Floor 2", sMapIconHoopz, 181, 104, "room", "==", "r_sw2_pools01");
    Map("add icon", "Sewers Floor 2", sMapIconHoopz, 182, 153, "room", "==", "r_sw2_respawn01"); 
    Map("add icon", "Sewers Floor 2", sMapIconHoopz, 152, 89, "room", "==", "r_sw2_safeRoom01");
    Map("add icon", "Sewers Floor 2", sMapIconHoopz, 201, 67, "room", "==", "r_sw2_sludgeFloor01");
    Map("add icon", "Sewers Floor 2", sMapIconHoopz, 152, 115, "room", "==", "r_sw2_start01");
    Map("add icon", "Sewers Floor 2", sMapIconHoopz, 186, 143, "room", "==", "r_sw2_steam01");
    Map("add icon", "Sewers Floor 2", sMapIconHoopz, 250, 74, "room", "==", "r_sw2_steam02");
    Map("add icon", "Sewers Floor 2", sMapIconHoopz, 216, 99, "room", "==", "r_sw2_treasureDwarf01");
    Map("add icon", "Sewers Floor 2", sMapIconHoopz, 261, 35, "room", "==", "r_sw2_undersewerAccess01");
    Map("add icon", "Sewers Floor 2", sMapIconHoopz, 74, 166, "room", "==", "r_sw2_utility01"); 
    //Map("add icon", "Sewers Floor 1", sMapIconHoopz, , , "room", "==", ""); 
    
    /////////////////////////////
    // The Eastelands
    /////////////////////////////
    Map("add area", "The Eastelands", 4);
    //Map("add icon", "Sewers Floor 1", sMapIconHoopz, 155, 58);//, "room", "==", "r_swr_room", "x", ">", "500");
    Map("add icon", "The Eastelands", sMapIconHoopz, 161, 121, "room", "==", "r_est_cgremArena01", "x", "<=", "415");
    Map("add icon", "The Eastelands", sMapIconHoopz, 208, 121, "room", "==", "r_est_cgremArena01", "x", ">=", "416");
    Map("add icon", "The Eastelands", sMapIconHoopz, 155, 169, "room", "==", "r_est_cgremPath01", "y", ">=", "560");
    Map("add icon", "The Eastelands", sMapIconHoopz, 152, 143, "room", "==", "r_est_cgremPath01", "y", "<=", "559");
    Map("add icon", "The Eastelands", sMapIconHoopz, 156, 82, "room", "==", "r_est_cgremVillage01");
    Map("add icon", "The Eastelands", sMapIconHoopz, 101, 158, "room", "==", "r_est_difficultyFork01");
    Map("add icon", "The Eastelands", sMapIconHoopz, 193, 80, "room", "==", "r_est_easternPaths01", "y", "<=", "423");
    Map("add icon", "The Eastelands", sMapIconHoopz, 193, 80, "room", "==", "r_est_easternPaths01", "y", ">=", "424", "x", "<=", "367");
    Map("add icon", "The Eastelands", sMapIconHoopz, 208, 92, "room", "==", "r_est_easternPaths01", "y", ">=", "424", "x", ">=", "368");
    Map("add icon", "The Eastelands", sMapIconHoopz, 178, 53, "room", "==", "r_est_industrialPlaza01");
    Map("add icon", "The Eastelands", sMapIconHoopz, 250, 55, "room", "==", "r_est_industrialRock01");
    Map("add icon", "The Eastelands", sMapIconHoopz, 170, 28, "room", "==", "r_est_industrialZone01");
    Map("add icon", "The Eastelands", sMapIconHoopz, 250, 80, "room", "==", "r_est_junkworms01");
    Map("add icon", "The Eastelands", sMapIconHoopz, 298, 39, "room", "==", "r_est_mountainBase01", "y", "<=", "1208");
    Map("add icon", "The Eastelands", sMapIconHoopz, 298, 70, "room", "==", "r_est_mountainBase01", "y", ">=", "1208");
    Map("add icon", "The Eastelands", sMapIconHoopz, 313, 49, "room", "==", "r_est_mountainPath01");
    Map("add icon", "The Eastelands", sMapIconHoopz, 225, 96, "room", "==", "r_est_pythagoras01");
    Map("add icon", "The Eastelands", sMapIconHoopz, 165, 190, "room", "==", "r_est_southDeadend01");
    Map("add icon", "The Eastelands", sMapIconHoopz, 67, 185, "room", "==", "r_est_southScam01");
    Map("add icon", "The Eastelands", sMapIconHoopz, 249, 167, "room", "==", "r_est_southBeach01");
    Map("add icon", "The Eastelands", sMapIconHoopz, 202, 155, "room", "==", "r_est_swampZigzag01"); 
    //Map("add icon", "The Eastelands", sMapIconHoopz, 32, 150, "room", "==", "r_est_tnnEntrance01", "y", "<=", "604");
    //Map("add icon", "The Eastelands", sMapIconHoopz, 40, 170, "room", "==", "r_est_tnnEntrance01", "y", ">=", "605" );
    Map("add icon", "The Eastelands", sMapIconHoopz, 99, 190, "room", "==", "r_est_tnnRespawn01");
    Map("add icon", "The Eastelands", sMapIconHoopz, 130, 41, "room", "==", "r_est_turretGauntlet01");
    //Map("add icon", "Sewers Floor 1", sMapIconHoopz, , , "room", "==", ""); 
    
    /////////////////////////////
    // The Path to the Foopba through Hoosegow, written on Burger Wrapper
    /////////////////////////////
    Map("add area", "Gilbert's Base", 5);
    //TODO: add the areas to this map
    
    /////////////////////////////
    // Gilbert's Grave Sites Map, Top of Gilbert's Peak from Compson
    /////////////////////////////
    Map("add area", "Gilbert Grave Sites", 6);
    //TODO: add areas to this map once we have the final sprite

    /////////////////////////////
    // Mines Map
    /////////////////////////////
    Map("add area", "Mines Map", 7);
    //TODO: add areas to this map once we have the final sprite
    
    /////////////////////////////
    // Westelands Map
    /////////////////////////////
    Map("add area", "Westelands Map", 8);
    //TODO: add areas to this map once we have the final sprite
    
    /////////////////////////////
    // Factory Map - Floor One
    /////////////////////////////
    Map("add area", "Factory Map, Floor 1", 9);
    //TODO: add areas to this map once we have the final sprite
    
    /////////////////////////////
    // Factory Map - Floor Two
    /////////////////////////////
    Map("add area", "Factory Map, Floor 2", 10);
    //TODO: add areas to this map once we have the final sprite
    
    /////////////////////////////
    // Icelands Map
    /////////////////////////////
    Map("add area", "Icelands Map", 11);
    //TODO: add areas to this map once we have the final sprite
    
    /////////////////////////////
    // Swamp Map 1
    /////////////////////////////
    Map("add area", "Swamp Map 1", 12);
    //TODO: add areas to this map once we have the final sprite
    
    /////////////////////////////
    // Icelands Map
    /////////////////////////////
    Map("add area", "Swamp Map 2", 13);
    //TODO: add areas to this map once we have the final sprite
    
    /////////////////////////////
    // Brain City Map - Purchased at Info Kiosk in BCT
    /////////////////////////////
    Map("add area", "Brain City Directory", 14)
    //TODO: add areas to this map once we have the final sprite
    
    /////////////////////////////
    // Path to the Rootstock - Given to you by Jhodfrey
    /////////////////////////////
    Map("add area", "Path to the Rootstock", 15)
    //TODO: add areas to this map once we have the final sprite
    
    /////////////////////////////
    // Route to Ai Ruins
    /////////////////////////////
    Map("add area", "Route to the AI Ruins", 16)
    //TODO: add areas to this map once we have the final sprite
        
    /////////////////////////////
    // Template
    /////////////////////////////
    //Map("add icon", "The Westelands", sMapIconHoopz, 32, 150, "room", "==", "r_wst_tnnEntrance01", "y", "<=", "604");
    //Map("add icon", "The Westelands", sMapIconHoopz, 40, 170, "room", "==", "r_wst_tnnEntrance01", "y", ">=", "605" );
    return 1;
    

}

if (argument[0] == "invoke")
{
    var map = "Necron 7 - 666th Floor"; // Default map
    if (scr_area_get() == "sw1") map = "Sewers Floor 1";
    if (scr_area_get() == "sw2") map = "Sewers Floor 2";
    if (scr_area_get() == "tnn") map = "Tír na nÓg";
    if (scr_area_get() == "est") map = "The Eastelands";
    
    obj = instance_create(0, 0, oMap);
    var dsl = scr_savedata_get("quest.maps");
    if (Map("have", map)) obj.mapSel = ds_list_find_index(dsl, map);
}

// Map("reset") - Call every time the game resets.
if (argument[0] == "reset")
{
    scr_savedata_put_list("quest.maps", ds_list_create());
    return 1;
}

// Map("gain", <map name>) - Give Hoopz a map.
if (argument[0] == "gain")
{
    var dsl = scr_savedata_get("quest.maps");
    if (Map("exists", argument[1]) == 0) 
    { 
        show_debug_message("Map('gain', '" + argument[1] + "') - Cannot gain map that isn't defined."); 
        return 0; 
    }
    if (Map("have", argument[1]) == 0) ds_list_add(dsl, argument[1]);
    return 1;
}

// Map("lose", <map name>) - Take away map from Hoopz.
if (argument[0] == "lose")
{
    var dsl = scr_savedata_get("quest.maps");
    if (Map("exists", argument[1]) == 0) 
    { 
        show_debug_message("Map('lose', '" + argument[1] + "') - Cannot lose map that isn't defined."); 
        return 0; 
    }
    if (Map("have", argument[1]) == 1) ds_list_delete(dsl, ds_list_find_index(dsl, argument[1]));
    return 1;
}

// Map("have", <map name>) - Returns true if Hoopz has map.
if (argument[0] == "have")
{
    var dsl = scr_savedata_get("quest.maps");
    if (ds_list_find_index(dsl, argument[1]) == -1) return 0;
    return 1;
}

// Map("exists", <map name>) - Returns if map is defined.
if (argument[0] == "exists")
{
    if (ds_list_find_index(global.mapNam, argument[1]) == -1) return 0;
    return 1;
}

// Map("add area", <map name>, <sMap subimage>)
if (argument[0] == "add area")
{
    var ind = ds_list_size(global.mapNam);
    ds_list_add(global.mapNam, argument[1]);
    ds_list_add(global.mapSub, argument[2]);
    global.mapIcoSub[ind] = ds_list_create();
    global.mapIcoLef[ind] = ds_list_create();
    global.mapIcoTop[ind] = ds_list_create();
    global.mapIcoAmt[ind] = 0;
    return 1;
}

//                 Area name    Sub  X    Y    Variable      Compare  Value  Variable?      Compare?  Value?  Variable?      Compare?  Value?
// Map("add icon", "world map", 0,   100, 100, "knowCdwarf", ">=",    "1");
if (argument[0] == "add icon")
{
    var ind = ds_list_find_index(global.mapNam, argument[1]);
    
    ds_list_add(global.mapIcoSub[ind], argument[2]);
    ds_list_add(global.mapIcoLef[ind], argument[3]);
    ds_list_add(global.mapIcoTop[ind], argument[4]);
    
    var ica = global.mapIcoAmt[ind];
    global.mapIcoVar[ind, ica] = ds_list_create();
    global.mapIcoCom[ind, ica] = ds_list_create();
    global.mapIcoVal[ind, ica] = ds_list_create();
    for (var i = 0; i < 3; i += 1)
    {
        if (argument_count > 5 + (i * 3))
        {
            ds_list_add(global.mapIcoVar[ind, ica], argument[5 + (i * 3)]);
            ds_list_add(global.mapIcoCom[ind, ica], argument[6 + (i * 3)]);
            ds_list_add(global.mapIcoVal[ind, ica], argument[7 + (i * 3)]);
        }
        else
        {
            ds_list_add(global.mapIcoVar[ind, ica], "");
            ds_list_add(global.mapIcoCom[ind, ica], "");
            ds_list_add(global.mapIcoVal[ind, ica], "");
        }
    }
    global.mapIcoAmt[ind] += 1;
    
    return 1;
}



if (argument[0] == "evaluate") //Arg1 = Map Index, Arg2 = Icon Index
{
    if (Map("evaluate index", argument[1], argument[2], 0) && 
        Map("evaluate index", argument[1], argument[2], 1) &&
        Map("evaluate index", argument[1], argument[2], 2)) return 1;
    return 0;
}

if (argument[0] == "evaluate index") //Arg1 = Map Index | Arg2 = Arg Index | Returns true or false
{
    _eid = argument[1];
    _lid = argument[2];
    _icd = argument[3];
    
    //show_debug_message("Comparing " + ds_list_find_value(global.mapIcoVar[_eid, _lid], _icd) + " " + ds_list_find_value(global.mapIcoCom[_eid, _lid], _icd) + " ");
    
    var vrr = ds_list_find_value(global.mapIcoVar[_eid, _lid], _icd);
    if (vrr == "") return 1;
    _var = real(scr_quest_get_state(vrr));
    if (vrr == "clocktime") _var = ClockTime("get");
    if (vrr == "room") _var = room_get_name(room);
    if (vrr == "area") _var = scr_area_get(room);
    if (vrr == "x") _var = o_hoopz.x;
    if (vrr == "y") _var = o_hoopz.y;
    
    var val = ds_list_find_value(global.mapIcoVal[_eid, _lid], _icd);
    if (string_digits(string(val)) == string(val)) _val = real(val);
    else _val = val;
    //if (vrr == "room") show_debug_message("HELLO! " + string(_val));
    
    var com = ds_list_find_value(global.mapIcoCom[_eid, _lid], _icd);
    if (com == "<")  { if (_var <  _val) return 1; }
    if (com == "<=") { if (_var <= _val) return 1; }
    if (com == "==") { if (_var == _val) return 1; }
    if (com == "!=") { if (_var != _val) return 1; }
    if (com == ">")  { if (_var >  _val) return 1; }
    if (com == ">=") { if (_var >= _val) return 1; }
    
    return 0;
}

// Map("create")
if (argument[0] == "create")
{
    o_curs.toggleCursor = false;
    audio_play_sound_ext("sn_mnu_exit01", 10, 0);
    Border("generate", 1, SCREEN_WIDTH + 48, 63);
    hide = 1;
    hideToggle = 0;
    ext = 0; // EXIT
    soundClickExit = "sn_mnu_exit01"; // Click exit
    butSpd = 0.15;
    sldSpd = 0.25; //Time to bring up screen
    butHilCol = make_color_rgb(48, 52, 45);// Hilight color
    butTxtCol = make_color_rgb(255, 202, 19);// Hilight color
    
    notVel = 0;
    mapPrv = 0;
    mapSel = 0;
    mapTrn = 0;
    mapAmt = 0; // If you create on Step, it will not do step
    curOvr = -1; // If you create on Step, it will not do step
    curHov = 0;
    
    // BUTTONS //
    butMid = SCREEN_WIDTH * 0.5;
    
    // Exit
    i = 0;
    butWid[i] = 81;
    butHei[i] = 17 + 6 + 8; // 17 + 6
    butX[i] = butMid - round(butWid[i] / 2) + 1;
    butY[i] = (SCREEN_HEIGHT - 36) + 5; // + 6 added
    butSpr[i] = sButtonPapers; butSub[i] = 3;
    butXcl[i] = 1;
    
    // Flip right
    i += 1;
    butWid[i] = 30; //25
    butHei[i] = 30; //41
    butX[i] = butMid + 174; //butX[i] = butMid + 164;
    butY[i] = (SCREEN_HEIGHT / 2); //butY[i] = (SCREEN_HEIGHT / 2) - 20;
    butSpr[i] = sMapFlip; butSub[i] = 0; //butSpr[i] = sButtonFlip; butSub[i] = 2;
    butXcl[i] = 1;
    
    // Flip left
    i += 1;
    butWid[i] = 30; //25
    butHei[i] = 30; //41
    butX[i] = butMid - 174; //butX[i] = butMid - 164 - 25;
    butY[i] = (SCREEN_HEIGHT / 2); //butY[i] = (SCREEN_HEIGHT / 2) - 20;
    butSpr[i] = sMapFlip; butSub[i] = 0; //butSpr[i] = sButtonFlip1; butSub[i] = 2;
    butXcl[i] = -1;
    
    butAmt = 3;
    for (i = 0; i < butAmt; i += 1) { butHov[i] = 0; }
    // BUTTONS //
    
    guplur = 1;
    
    return 1;
}

// Map("step")
if (argument[0] == "step")
{
    paused(true);
    hide = Goto(hide, hideToggle, dt_sec() / sldSpd);
    if (hideToggle == 1)
    {
        if (hide == 1) 
        {
            o_curs.toggleCursor = true;
            paused(false);
            instance_destroy();
        }
        exit;
    }
    mapAmt = ds_list_size(scr_savedata_get("quest.maps"));
    if (mapAmt < 1) notVel = 1;
    
    // EXIT
    if (guplur == 0 && global.keyinput_type != KEYINPUT_GAMEPAD && keyboard_check_pressed(ord("M"))) Map("exit");
    guplur = 0;
    
    did = 1;
    if (global.keyinput_type == KEYINPUT_GAMEPAD && notVel == 1) did = 0;
    if (MiniKeyPress("right") && did)
    {
        Map("right");
        //curHov = 0; // gz edited
    }
    if (MiniKeyPress("left") && did) 
    {
        Map("left")
        //curHov = 0;
    }
    if (global.keyinput_type == KEYINPUT_GAMEPAD) 
    {
        if (MiniKeyPress("cancel")) Map("exit");
        if (mapAmt >= 1 && (MiniKeyPress("up") || MiniKeyPress("down"))) notVel = !notVel;
        if (notVel && MiniKeyPress("action")) Map("exit");
    }
    
    x = view_xview[0];
    y = view_yview[0];
    
    curOvr = -1;
    if (global.keyinput_type == KEYINPUT_GAMEPAD && notVel == 1) curOvr = 0;
    if (global.keyinput_type == KEYINPUT_GAMEPAD && notVel == 0) curOvr = 10;
    
    for (i = 0; i < butAmt; i += 1)
    {
        xbf = 0; ybf = 0;
        if (i > 0) { xbf -= butWid[i] / 2; ybf -= butHei[i] / 2; }
        var hil = scr_mouse_rect(x + xbf + butX[i], y + ybf + butY[i], x + xbf + butX[i] + butWid[i], y + ybf + butY[i] + butHei[i]);
        if (global.keyinput_type == KEYINPUT_GAMEPAD) hil = 0;
        if (hil || curOvr == i)
        {
            if (i == 0) butHov[i] = Goto(butHov[i], 1, dt_sec() / butSpd);
            else 
            { 
                if (butHov[i] < 1) butHov[i] = 1; 
                else butHov[i] -= dt_sec() / butSpd;
            }
            curOvr = i;
            if (hil && MiniKeyPress("action"))
            {
                if (i == 0) Map("exit");
                if (i == 1) Map("right");
                if (i == 2) Map("left");
            }
        }
        else 
        {
            if (i == 0) butHov[i] -= dt_sec() / butSpd;
            else butHov[i] = 0;
        }
        butHov[i] = clamp(butHov[i], 0, 1.5);
    }
    
    return 1;
}

if (argument[0] == "exit")
{
    curHov = 1;
    audio_play_sound_ext(soundClickExit, 10, 0);
    ext = 1;
    hideToggle = 1;
    return 1;
}

if (argument[0] == "right")
{
    if (mapAmt <= 1) exit;
    butHov[1] = 1.5;
    curHov = 1;
    mapPrv = mapSel;
    mapTrn = -1;
    mapSel += 1;
    if (mapSel >= mapAmt) mapSel = 0; 
    audio_play_sound_ext(soundClickExit, 10, 0);
    //audio_play_sound_ext(notSou[notSel], 10, 0);
    return 1;
}

if (argument[0] == "left")
{
    if (mapAmt <= 1) exit;
    butHov[2] = 1.5;
    curHov = 1;
    mapPrv = mapSel;
    mapTrn = 1;
    mapSel -= 1;
    if (mapSel < 0) mapSel = mapAmt - 1;  
    audio_play_sound_ext(soundClickExit, 10, 0);
    //audio_play_sound_ext(notSou[notSel], 10, 0);
    return 1;
}

// Map("draw",     "world map", alpha);
if (argument[0] == "draw")
{
    var dsl = scr_savedata_get("quest.maps");
    //show_debug_message(ds_list_find_value(dsl, mapSel));
    var ind = ds_list_find_index(global.mapNam, ds_list_find_value(dsl, mapSel)); //ds_list_find_index(global.mapNam, argument[1]);
    var ald = clamp(hide, 0, 1); //argument[2]
    var rld = abs(1 - ald);
    var lef = view_xview[0] + ((384 - 320) * 0.5); //340
    var top = view_yview[0] + ((240 - 200) * 0.5) + (ald * 240) + 5; //208 - added + 6
    
    // Black BG
    draw_sprite_ext(s1x1, 0, x, y, 384, 240, 0, c_black, 0.75 * rld);
    
    // If you have no maps
    butAmt = 1;
    if (mapAmt == 0)
    {
        scr_font(global.fn_1, c_white, 1, 1);
        draw_text_transformed(x + (384 / 2), y + (240 / 2) + (240 * ald), "No maps available.", 1, 1, 0);
        scr_font(-1, -1, 0, 0);
    }
    else
    {
        if (mapAmt > 1) butAmt = 3;
        
        mapRep = 2;
        mapTrn = Goto(mapTrn, 0, dt_sec() / butSpd);
        if (mapTrn < 0) lef += abs(mapTrn * 384); 
        else if (mapTrn > 0) lef -= abs(mapTrn * 384);
        else mapRep = 1;
        //ind = mapSel;
        
        //show_debug_message("Icon checks: " + string(ds_list_size(global.mapIcoSub[ind])));
        mapAlp = 1;
        mapCol = c_white;
        if (global.keyinput_type == KEYINPUT_GAMEPAD)
        {
            mapCol = merge_color(c_white, c_gray, butHov[0]);
        }
        else
        {
            var fad = max(butHov[0]);//, butHov[1], butHov[2]);
            mapCol = merge_color(c_white, c_gray, fad);
        }
        for (h = 0; h < mapRep; h += 1)
        {
            draw_sprite_ext(sMap, ds_list_find_value(global.mapSub, ind), lef, top, 1, 1, 0, mapCol, mapAlp);
            for (i = 0; i < ds_list_size(global.mapIcoSub[ind]); i += 1)
            {
                //show_debug_message("Fresh evaluate");
                if (Map("evaluate", ind, i) == 1)
                {
                    draw_sprite_ext(ds_list_find_value(global.mapIcoSub[ind], i), global.mapDel * 3.3,
                        lef + ds_list_find_value(global.mapIcoLef[ind], i), top + ds_list_find_value(global.mapIcoTop[ind], i), 
                        1, 1, 0, mapCol, mapAlp);
                }
            }
            if (mapRep == 2) ind = ds_list_find_index(global.mapNam, ds_list_find_value(dsl, mapPrv));
            lef += sign(mapTrn) * 384;
        }
    }
    
    // Top bar
    if (mapAmt > 0)
    {
        Border("draw", 1, x - 24, y - 40 + - (ald * 21));
        draw_set_alpha(1);
        scr_font(global.fn_2, c_white, 1);
        draw_text(x + 192, y + 4 - (ald * 21), ds_list_find_value(dsl, mapSel));
        scr_font(-1, -1, 0);
    }
    
    // BUTTONS
    for (i = 0; i < butAmt; i += 1)
    {
        if (i > 0 && global.keyinput_type == KEYINPUT_GAMEPAD && notVel == 1) break;
        dx = x + butX[i];
        dy = y + butY[i];
        if (i == 0) dy += ald * 41;
        else if (i == 1) dx += ald * 48;
        else if (i == 2) dx -= ald * 48;
        if (i == 0)
        {
            var extSub = butHov[i] * 6;
            if (ext == 1) extSub = 7;
            draw_sprite_ext(sButtonExit, extSub, dx, dy + 10 - (butHov[i] * 10), 1, 1, 0, c_white, 1);
        }
        else
        {
            var bss = butSub[i] + (sign(butHov[i]));
            if (global.keyinput_type != KEYINPUT_GAMEPAD) bss = butSub[i] + ceil(butHov[i]);
            draw_sprite_ext(butSpr[i], bss, dx, dy, butXcl[i], 1, 0, c_white, 1);
        }
    }
    
    // Cursor
    if (curOvr == -1) curSub = 0; else curSub = 1;
    curCol = merge_color(c_white, butTxtCol, curHov);
    curHov -= dt_sec() / butSpd;
    curHov = clamp(curHov, 0, 1);
    if (global.keyinput_type != KEYINPUT_GAMEPAD) draw_sprite_ext(s_curs2, curSub, mouse_x, mouse_y, 1, 1, 0, curCol, rld);
    
    global.mapDel += dt_sec();
    return 1;
}

show_debug_message("Map() - No such command > " + string(argument[0]) + " <");
