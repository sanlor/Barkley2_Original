if (live_call()) return live_result;
/// RespawnLocation()
//show_debug_message("RespawnLocation() - Execute");
/* Hierarchy
"gau", "Gauntlet", 
"tnn", "Tir Na Nog"
"sw1", "Sewers1"
"sw2", "Sewers2"
"est", "Eastelands"
"pea", "Gilbert's Peak"
"pri", "The Hoosegow"
"far", "Fary Forest"
"fct", "Factory"
"swp", "Swamps"
"bct", "Brain City"
"usw", "Undersewer"
"air", "AI Ruins"
"wst", "Westelands"
"min", "Mines"
"dth", "Death Tower"
"pdt", "Ys-Kolob"
"ice", "Icelands"
"chu", "Cuchu Lair"
*/

// As a failsafe, a respawn map will be assigned based on AREA first, 
// just in case there is no room found afterwards
var area = scr_area_get();
var respawnRoom = r_est_tnnRespawn01;
var babyzone = false;
var curRoom = room;

//Cuchu's Lair as part of Wiglaf's Mission Tracker
if (area == "chu") then Quest("cuchuLairDeath", 1)

// Failsafe, get area respawn //
switch (area)
    {
    case "gau": respawnRoom = r_gau_01_entrance01; break;
    case "tnn": respawnRoom = r_sw1_respawn01; break;
    case "sw1": respawnRoom = r_sw1_respawn01; break;
    case "sw2": respawnRoom = r_sw2_respawn01; break;
    case "est": respawnRoom = r_est_tnnRespawn01; break;
    case "pea": respawnRoom = r_pea_caveRespawnBase01; break;
    case "pri": respawnRoom = r_pea_caveRespawnBase01; break;
    case "far": respawnRoom = r_far_nexus01; break;
    case "fct": respawnRoom = r_fct_respawn01; break;
    case "swp": respawnRoom = r_swp_respawntrash01; break;
    case "bct": respawnRoom = r_usw_ruinsWifi01; break;
    case "usw": respawnRoom = r_usw_ruinsWifi01; break;
    case "air": respawnRoom = r_usw_ruinsWifi01; break;
    case "wst": respawnRoom = r_wst_northRespawn01; break;
    case "min": respawnRoom = r_far_nexus01; break;
    case "dth": respawnRoom = r_far_nexus01; break;
    case "pdt": respawnRoom = r_usw_ruinsWifi01; break;
    case "ice": respawnRoom = r_ice_respawn01; break;
    case "chu": respawnRoom = r_usw_ruinsWifi01; break;
    }
// case "min": respawnRoom = r_min_respawn01; break;

// Find where you should respawn based on the MAP you died in //
switch (curRoom)
    {
    // Gauntlet //
    case r_gau_01_entrance01:
    case r_gau_room1_1:
    case r_gau_sewersOne01:
    case r_gau_sewersTwo01:
    case r_gau_NPCVilla01:
    case r_gau_boss_catfishQueen:
    case r_gau_boss_crabcommandoFight:
    case r_gau_boss_hugebrainAlien:
    case r_gau_boss_oozeFight:
    case r_gau_boss_sentinel:
    case r_gau_combatEffects01:
    case r_gau_21_eastelandsStart01:
    case r_gau_27_swampStart01:
    respawnRoom = r_gau_01_entrance01; break;
    
    // AI Ruins //               
    case r_air_dais01:        
    respawnRoom = r_est_tnnRespawn01; break;
    
    // Factory //
    case r_fct_arena01:         
    case r_fct_assembly01:  
    case r_fct_bigRoom01:    
    case r_fct_control01:       
    case r_fct_corridor01: 
    case r_fct_eggRooms01:      
    case r_fct_corner01:               
    case r_fct_gizmo01:         
    case r_fct_loading01:       
    case r_fct_lobby01:         
    case r_fct_office01:           
    case r_fct_storage01:       
    case r_fct_tutorialZone01:    
    respawnRoom = r_fct_respawn01; break;
    
    // Wasteland // TNN side respawn //
    case r_est_cgremArena01:            
    case r_est_cgremPath01:            
    case r_est_cgremVillage01:          
    case r_est_difficultyFork01:           
    case r_est_easternPaths01:          
    case r_est_factoryChicane01: 
    case r_fct_factoryOutpost01:              
    case r_fct_factoryParking01:       
    case r_fct_factoryStorage01:        
    case r_est_junkworms01:            
    case r_est_mountainBase01:             
    case r_est_pythagoras01:                 
    case r_est_swampZigzag01:          
    case r_wst_tnnEntrance01:         
    case r_est_tnnRespawn01:           
    case r_wst_wadingRace01:           
    case r_wst_westJunction01:            
    case r_wst_westOpenGrounds01:       
    respawnRoom = r_est_tnnRespawn01; break;
    
    // Wasteland // North side Respawn //
    case r_wst_donutDomain01:          
    case r_est_industrialPlaza01:      
    case r_est_industrialRock01:            
    case r_est_industrialZone01:           
    case r_wst_northCircle01:           
    case r_wst_northPassage01:         
    case r_wst_northRespawn01:          
    case r_wst_northRuins01:                    
    case r_est_turretGauntlet01:       
    case r_wst_westMaze01:              
    respawnRoom = r_wst_northRespawn01; break;
    
    // Sewers Floor 01 //
    case r_sw1_baldomero01:         
    case r_sw1_center01:            
    case r_sw1_closet01:            
    case r_sw1_crossroads01:           
    case r_sw1_descent01:         
    case r_sw1_eastEdge01:          
    case r_sw1_elemental01:         
    case r_sw1_end01:              
    case r_sw1_fishersCreek01:     
    case r_sw1_floor2Access01:   
    case r_sw1_foyer01:          
    case r_sw1_gap01:              
    case r_sw1_gutterGate01:      
    case r_sw1_joad01:             
    case r_sw1_longWays01:          
    case r_sw1_manholeEast01:      
    case r_sw1_manholeWest01:               
    case r_sw1_plantation02:        
    case r_sw1_pool01:             
    case r_sw1_rathell01:           
    case r_sw1_respawn01:          
    case r_sw1_secret01:  
    case r_sw1_southEdge01:          
    case r_sw1_tnnShortcut01:      
    case r_sw1_treasureDwarf01:     
    case r_sw1_utility01:  
    case r_sw2_gordo01:          
    respawnRoom = r_sw1_respawn01; break;
    
    // Sewers Floor 02 //
    case r_sw2_balcony01: 
    case r_sw2_bridges01: 
    case r_sw2_crossing01: 
    case r_sw2_crossroad01: 
    case r_sw2_eastExit01: 
    case r_sw2_end01:
    case r_sw2_hermitPass01: 
    case r_sw2_indianRopeTrick01: 
    case r_sw2_looparound01: 
    case r_sw2_pools01: 
    case r_sw2_respawn01: 
    case r_sw2_sludgeFloor01: 
    case r_sw2_start01: 
    case r_sw2_steam01: 
    case r_sw2_steam02: 
    case r_sw2_treasureDwarf01: 
    case r_sw2_utility01: 
    respawnRoom = r_sw2_respawn01; break;
    
    // Undersewers //
    
    // Swamps Trash //
    case r_swp_barkleypond01: 
    case r_swp_bcdeadend01:
    case r_swp_bcentrance01:
    case r_swp_bogchurch01:
    case r_swp_centralbend01:    
    case r_swp_koboldcamp01:    
    case r_swp_longpathrespawn01:
    case r_swp_longpathutility01:
    case r_swp_quagmire01:
    case r_swp_respawntrash01:    
    case r_swp_roundabout01:
    case r_swp_shacklake01:
    case r_swp_swampRanch01:
    case r_swp_utilityonpath01:    
    case r_swp_westentrance01:
    case r_swp_westpool01:
    case r_swp_westshortcut01:
    respawnRoom = r_swp_respawntrash01; break;
    
    // Swamps water //
    case r_swp_beach01:
    case r_swp_corpseLake01:
    case r_swp_cuchu1_01:
    case r_swp_cuchu3_01:
    case r_swp_cuchu4_01:
    case r_swp_cuchuelevator01:
    case r_swp_duergarencounter01:
    case r_swp_eastwestcrossroads01:
    case r_swp_flowerguardian01:
    case r_swp_koboldchallenge01:
    case r_swp_respawnwater01:
    case r_swp_southPatch01:
    case r_swp_waterbowl01:
    respawnRoom = r_swp_respawnwater01; break;
    
    // Mines //
    case r_min_baseCampAlpha01:
    case r_min_baseCampBeta01:
    case r_min_constantine01:
    case r_min_eastPit01:
    case r_min_entrance01:
    case r_min_jeanmarcPit01:
    case r_min_junction01:
    case r_min_kaleviCave01:
    case r_min_respawn01:
    case r_min_secret01:
    respawnRoom = r_min_respawn01; break;
    }
    
// Babyzone check //
// Get the info on how recently your three prior deaths have happened //
var deathTime = global.deathTimeThird - global.deathTimeFirst;

// Treshold for babbyzone respawn //
var deathTreshold = 180;

// If you have at least three prior death times go forward //
if (global.deathTimeFirst != 0 and global.deathTimeSecond != 0 and global.deathTimeThird != 0) then
    {
    // If you have died three times within the death treshold, you are being sent to the Babyzone respawn instead of a normal one //
    if deathTime < deathTreshold then 
        {
        global.deathTimeFirst = 0;
        global.deathTimeSecond = 0;
        global.deathTimeThird = 0;
        babyzone = true;
        }
    }
    
// Babyzone alterations //
if babyzone = true then
    {
    // Move the respawn to an easier area //
    switch (respawnRoom)
        {
        case r_tnn_wilmer01: 
        respawnRoom = r_tnn_wilmer01;
        break;
        case r_est_tnnRespawn01: 
        respawnRoom = r_est_tnnRespawn01; 
        break;
        case r_wst_northRespawn01: 
        respawnRoom = r_est_tnnRespawn01; 
        break;
        case r_swp_respawntrash01: 
        respawnRoom = r_swp_respawntrash01; 
        break;
        case r_swp_respawnwater01: 
        respawnRoom = r_swp_respawntrash01; 
        break;
        case r_sw1_respawn01: 
        respawnRoom = r_sw1_respawn01; 
        break;
        case r_sw2_respawn01: 
        respawnRoom = r_sw1_respawn01; 
        break;
        }
    }
    
// Cuchu Trial (Longinus mission) random respawn location //
if Quest("cuchuRespawn") == 1 then
    {
    // Only happens this once //
    Quest("cuchuRespawn", 2);
    
    // Pick a random spot //
    // TODO: this could be enhanced to a place you haven't been yet
    respawnRoom = 
    choose(r_est_tnnRespawn01, 
    r_wst_northRespawn01, 
    r_swp_respawntrash01, 
    r_swp_respawnwater01, 
    r_sw1_respawn01, 
    r_sw2_respawn01, 
    r_fct_respawn01,
    r_far_nexus01,
    r_pea_caveRespawnBase01);
    }
        
// X and Y coords for "normal" respawns //
switch (respawnRoom)
    {
    // Get the X and Y //
    case r_tnn_wilmer01: 
    respawnX = 256; respawnY = 352; 
    break;
    case r_est_tnnRespawn01: 
    respawnX = 648; respawnY = 224; 
    break;
    case r_wst_northRespawn01: 
    respawnX = 272; respawnY = 328; 
    break;
    case r_swp_respawntrash01: 
    respawnX = 264; respawnY = 200; 
    break;
    case r_swp_respawnwater01: 
    respawnX = 312; respawnY = 248; 
    break;
    case r_sw1_respawn01: 
    respawnX = 272; respawnY = 224; 
    break;
    case r_sw2_respawn01: 
    respawnX = 312; respawnY = 208; 
    break;
    case r_fct_respawn01: 
    respawnX = 240; respawnY = 304; 
    break;
    case r_min_respawn01:
    respawnX = 588; respawnY = 248;
    break;
    case r_far_nexus01:
    respawnX = 488; respawnY = 720;
    break;
    case r_ice_respawn01:
    respawnX = 240; respawnY = 200;
    break;
    case r_gau_01_entrance01:
    respawnX = 224; respawnY = 208;
    break;
    case r_pea_caveRespawnBase01:
    respawnX = 184; respawnY = 264;
    break;
    case r_usw_ruinsWifi01:
    respawnX = 368; respawnY = 176;
    break;
    }
    
// Junklord check //
var deaths = scr_savedata_get("player.deaths.total");
switch (deaths)
    {
    case 5:
    case 10:
    case 15:
    case 20:
    case 25:
    case 30:
    case 35:
    case 40:
    case 45:
    case 50:
    respawnJunklord = true;
    break;
    }
    
// Once past the point of no return //
if (Quest("pointOfNoReturn") == 1)
{
    respawnRoom = r_chu_corridor01;
    respawnX = 136; 
    respawnY = 296;
}

// Debug messages //
show_debug_message("You have died: " + string(deaths) + " times");
show_debug_message("global.respawnRoom = " + room_get_name(respawnRoom));
show_debug_message("global.respawnX = " + string(respawnX));
show_debug_message("global.respawnY = " + string(respawnY));

// Teleport data //
global.respawnX = respawnX;
global.respawnY = respawnY;
global.respawnRoom = respawnRoom;

// Savedata //
scr_savedata_put("player.respawn.x", global.respawnX);
scr_savedata_put("player.respawn.y", global.respawnY);
scr_savedata_put("player.respawn.room", global.respawnRoom);
