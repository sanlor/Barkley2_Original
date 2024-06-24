/// scr_soundbanks_init() 
/// Initializes all of the sounds in the game.

global.soundbanks = ds_map_create();

// OPTIMIZE: Temp bugfix - something fills up list 0 with junk... #2099
ds_list_create();

// EXTERNAL SOUND
scr_sound_init();

// SEWER STEAM //
scr_soundbank_addSound("sewer_steam", "sn_sewer_steam01");
scr_soundbank_addSound("sewer_steam", "sn_sewer_steam02");
scr_soundbank_addSound("sewer_steam", "sn_sewer_steam03");

// HILDEBURGA WRENCH //
scr_soundbank_addSound("wrench", "sn_hildeburga_wrench01");
scr_soundbank_addSound("wrench", "sn_hildeburga_wrench02");
scr_soundbank_addSound("wrench", "sn_hildeburga_wrench03");

// PROBOSCIS PICKAXE //
scr_soundbank_addSound("proboscis_pickaxe", "sn_proboscisPickaxe01");
scr_soundbank_addSound("proboscis_pickaxe", "sn_proboscisPickaxe02");
scr_soundbank_addSound("proboscis_pickaxe", "sn_proboscisPickaxe03");

// DOJO SLAPS AND GRUNTS //
scr_soundbank_addSound("dojo_grunt", "sn_dojogrunt01");
scr_soundbank_addSound("dojo_grunt", "sn_dojogrunt02");
scr_soundbank_addSound("dojo_grunt", "sn_dojogrunt03");
scr_soundbank_addSound("dojo_grunt", "sn_dojogrunt04");
scr_soundbank_addSound("dojo_slap", "sn_dojoslap01");
scr_soundbank_addSound("dojo_slap", "sn_dojoslap02");
scr_soundbank_addSound("dojo_slap", "sn_dojoslap03");
scr_soundbank_addSound("dojo_slap", "sn_dojoslap04");
scr_soundbank_addSound("dojo_slap", "sn_dojoslap05");
scr_soundbank_addSound("dojo_slap", "sn_dojoslap06");

// FISHING MINIGAME //
scr_soundbank_addSound("fishing_lure_cast", "sn_lurecast01");
scr_soundbank_addSound("fishing_lure_fall", "sn_lurefall01");
scr_soundbank_addSound("fishing_lure_reel", "sn_fishingreel01");
scr_soundbank_addSound("fishing_lure_reel_fast", "sn_fishingreelfast01");
scr_soundbank_addSound("fishing_fish_trashing", "sn_fishtrashing01");
scr_soundbank_addSound("fishing_fish_trashing", "sn_fishtrashing02");
scr_soundbank_addSound("fishing_fish_trashing", "sn_fishtrashing03");
scr_soundbank_addSound("fishing_battle_losing", "sn_fishbattlelosing01");
scr_soundbank_addSound("fishing_victory", "sn_fishingvictory01");
scr_soundbank_addSound("fishing_defeat", "sn_fishingdefeat01");
scr_soundbank_addSound("fishing_fish_hooked", "sn_fishhooked01");

// SHRUBBERY OF ALL SORTS //
scr_soundbank_addSound("shrub", "sn_shrub02");
scr_soundbank_addSound("shrub", "sn_shrub03");
scr_soundbank_addSound("shrub", "sn_shrub04");

// Rubbing against cattails //
scr_soundbank_addSound("cattail", "sn_cattail01");
scr_soundbank_addSound("cattail", "sn_cattail02");
scr_soundbank_addSound("cattail", "sn_cattail03");
scr_soundbank_addSound("cattail", "sn_cattail04");

// Rubbing against tallgrass //
scr_soundbank_addSound("tallgrass", "sn_tallgrass01");
scr_soundbank_addSound("tallgrass", "sn_tallgrass02");
scr_soundbank_addSound("tallgrass", "sn_tallgrass03");
scr_soundbank_addSound("tallgrass", "sn_tallgrass04");

// BUBBLEPOP //
scr_soundbank_addSound("bubblepop", "sn_bubblepop01");
scr_soundbank_addSound("bubblepop", "sn_bubblepop02");
scr_soundbank_addSound("bubblepop", "sn_bubblepop03");

// STUPID MINIGAME SHIT AND SUCH //
scr_soundbank_addSound("organ_harvest_skin", "sn_pdt_cuttingflesh01");
scr_soundbank_addSound("organ_harvest_skin", "sn_pdt_cuttingflesh02");
scr_soundbank_addSound("organ_harvest_skin", "sn_pdt_cuttingflesh03");

// CREEPYPASTAS //
scr_soundbank_addSound("creepypasta_scream", "sn_mg_creepypasta_scream1");
scr_soundbank_addSound("creepypasta_scream", "sn_mg_creepypasta_scream2");
scr_soundbank_addSound("creepypasta_scream", "sn_mg_creepypasta_scream3");

// PUZZLELOCKS //
scr_soundbank_addSound("puzzlelock_open", "sn_mg_puzzlelock_open1");
scr_soundbank_addSound("puzzlelock_open", "sn_mg_puzzlelock_open2");
scr_soundbank_addSound("puzzlelock_button", "sn_mg_puzzlelock_button1");
scr_soundbank_addSound("puzzlelock_button", "sn_mg_puzzlelock_button2");
scr_soundbank_addSound("puzzlelock_button", "sn_mg_puzzlelock_button3");

// THUNDER SOUUNDS //
scr_soundbank_addSound("thunder", "sn_thunder01");
scr_soundbank_addSound("thunder", "sn_thunder02");
scr_soundbank_addSound("thunder", "sn_thunder03");
scr_soundbank_addSound("thunder", "sn_thunder04");
scr_soundbank_addSound("thunder", "sn_thunder05");
scr_soundbank_addSound("thunder", "sn_thunder06");
scr_soundbank_addSound("thunder", "sn_thunder07");
scr_soundbank_addSound("thunder", "sn_thunder08");
scr_soundbank_addSound("thunder", "sn_thunder09");
scr_soundbank_addSound("thunder", "sn_thunder10");
scr_soundbank_addSound("thunder", "sn_thunder11");
scr_soundbank_addSound("thunder", "sn_thunder12");
scr_soundbank_addSound("thunder_muffled", "sn_thunder_muffled01");
scr_soundbank_addSound("thunder_muffled", "sn_thunder_muffled02");
scr_soundbank_addSound("thunder_muffled", "sn_thunder_muffled03");
scr_soundbank_addSound("thunder_muffled", "sn_thunder_muffled04");

////GENERIC EFFECTS
// Debris
scr_soundbank_addSound("debris_clatter", "sn_debris_clatter01");
scr_soundbank_addSound("debris_clatter", "sn_debris_clatter02");
scr_soundbank_addSound("debris_clatter", "sn_debris_clatter03");
scr_soundbank_addSound("debris_clatter", "sn_debris_clatter04");
scr_soundbank_addSound("debris_clatter", "sn_debris_clatter05");
scr_soundbank_addSound("debris_clatter", "sn_debris_clatter06");
scr_soundbank_addSound("debris_clatter", "sn_debris_clatter07");
scr_soundbank_addSound("debris_clatter", "sn_debris_clatter08");
scr_soundbank_addSound("debris_clatter", "sn_debris_clatter09");
scr_soundbank_addSound("debris_clatter", "sn_debris_clatter10");
scr_soundbank_addSound("debris_clatter", "sn_debris_clatter11");
scr_soundbank_addSound("debris_clatter", "sn_debris_clatter12");
scr_soundbank_addSound("debris_clatter", "sn_debris_clatter13");
scr_soundbank_addSound("debris_clatter", "sn_debris_clatter14");
scr_soundbank_addSound("debris_clatter", "sn_debris_clatter15");

//// WEATHER AND ENVIRONMENT //
scr_soundbank_addSound("rain_normal", "sn_rain_normal01");
scr_soundbank_addSound("rain_heavy", "sn_rain_heavy01");
scr_soundbank_addSound("rain_normal_indoors", "sn_rain_normal_indoors01");
scr_soundbank_addSound("rain_heavy_indoors", "sn_rain_heavy_indoors01");
scr_soundbank_addSound("ladder_metal", "sn_metalladder1");
scr_soundbank_addSound("ladder_metal", "sn_metalladder2");
scr_soundbank_addSound("ladder_other", "sn_woodladder01");
scr_soundbank_addSound("ladder_other", "sn_woodladder02");
scr_soundbank_addSound("ladder_latch", "sn_ladderdrop");
scr_soundbank_addSound("trailing_steps", "sn_stepstrailing1");
scr_soundbank_addSound("trailing_steps", "sn_stepstrailing2");
scr_soundbank_addSound("trailing_steps", "sn_stepstrailing3");

// DOORS //
scr_soundbank_addSound("door_locked", "sn_lock1");
scr_soundbank_addSound("door_locked", "sn_lock2");
scr_soundbank_addSound("door_locked", "sn_lock3");
scr_soundbank_addSound("door_locked", "sn_lock4");
scr_soundbank_addSound("door_open_tech", "sn_dooropen_tech");
scr_soundbank_addSound("door_open_sewer", "sn_dooropen_sewer");
scr_soundbank_addSound("door_open_slab", "sn_dooropen_slab");
scr_soundbank_addSound("door_open_wood", "sn_dooropen_wood");
scr_soundbank_addSound("door_open_tnn", "sn_dooropen_tnn");
scr_soundbank_addSound("door_open_plain", "sn_dooropen_plain");
scr_soundbank_addSound("door_open_garage", "sn_garagedoor02");
scr_soundbank_addSound("door_open_garage", "sn_garagedoor03");
scr_soundbank_addSound("door_close_tech", "sn_doorclosed_tech");
scr_soundbank_addSound("door_close_sewer", "sn_doorclosed_sewer");
scr_soundbank_addSound("door_close_slab", "sn_doorclosed_slab");
scr_soundbank_addSound("door_close_wood", "sn_doorclosed_wood");
scr_soundbank_addSound("door_close_tnn", "sn_doorclosed_tnn");
scr_soundbank_addSound("door_close_plain", "sn_doorclosed_plain");
scr_soundbank_addSound("manhole_opening_closing", "sn_manholecover01");
scr_soundbank_addSound("manhole_opening_closing", "sn_manholecover02");
scr_soundbank_addSound("splash_in", "sn_splashobject10");
scr_soundbank_addSound("splash_out", "sn_splashobject06");

////HOOPZ SOUNDS
scr_soundbank_addSound("impact_flaregun", "sn_flaregun_explosion1_1");
scr_soundbank_addSound("impact_flaregun", "sn_flaregun_explosion1_2");
scr_soundbank_addSound("impact_flaregun", "sn_flaregun_explosion1_3");

//scr_soundbank_addSound("hoopz_demise", "sn_hoopz_demiseScream01");
//scr_soundbank_addSound("hoopz_demise", "sn_hoopz_demiseScream01");
//scr_soundbank_addSound("hoopz_demise", "sn_hoopz_demiseScream01");

scr_soundbank_addSound("hoopz_demise", "sn_hoopz_demiseBHROOM01");
scr_soundbank_addSound("hoopz_demise", "sn_hoopz_demiseERICW01");
scr_soundbank_addSound("hoopz_demise", "sn_hoopz_demiseLAZ01");

scr_soundbank_addSound("hoopzweap_pistol3", "sn_pistol3_2");
scr_soundbank_addSound("hoopzweap_pistol3", "sn_pistol3_4");
scr_soundbank_addSound("hoopzweap_pistol3", "sn_pistol3_5");

scr_soundbank_addSound("hoopzweap_flintlock", "sn_flintlock1_1");
scr_soundbank_addSound("hoopzweap_flintlock", "sn_flintlock1_2");
scr_soundbank_addSound("hoopzweap_flintlock", "sn_flintlock1_3");

scr_soundbank_addSound("hoopzweap_flaregun", "sn_flaregun1_1");
scr_soundbank_addSound("hoopzweap_flaregun", "sn_flaregun1_2");
scr_soundbank_addSound("hoopzweap_flaregun", "sn_flaregun1_3");

scr_soundbank_addSound("hoopzweap_revolver", "sn_revolver1_1");
scr_soundbank_addSound("hoopzweap_revolver", "sn_revolver1_2");
scr_soundbank_addSound("hoopzweap_revolver", "sn_revolver1_3");

scr_soundbank_addSound("hoopzweap_magnum", "sn_magnum1_1");
scr_soundbank_addSound("hoopzweap_magnum", "sn_magnum1_2");
scr_soundbank_addSound("hoopzweap_magnum", "sn_magnum1_3");

scr_soundbank_addSound("hoopzweap_pistol6", "sn_pistol6_1");
scr_soundbank_addSound("hoopzweap_pistol6", "sn_pistol6_2");
scr_soundbank_addSound("hoopzweap_pistol6", "sn_pistol6_3");

scr_soundbank_addSound("hoopzweap_rifle", "sn_rifle7_1");
scr_soundbank_addSound("hoopzweap_rifle", "sn_rifle7_2");
scr_soundbank_addSound("hoopzweap_rifle", "sn_rifle7_3");

scr_soundbank_addSound("hoopzweap_musket", "sn_musket1_1");
scr_soundbank_addSound("hoopzweap_musket", "sn_musket1_2");
scr_soundbank_addSound("hoopzweap_musket", "sn_musket1_3");

scr_soundbank_addSound("hoopzweap_sniperrifle", "sn_sniperrifle1_1");
scr_soundbank_addSound("hoopzweap_sniperrifle", "sn_sniperrifle1_2");
scr_soundbank_addSound("hoopzweap_sniperrifle", "sn_sniperrifle1_3");

scr_soundbank_addSound("hoopzweap_huntingrifle", "sn_huntingrifle9_1");
scr_soundbank_addSound("hoopzweap_huntingrifle", "sn_huntingrifle9_2");
scr_soundbank_addSound("hoopzweap_huntingrifle", "sn_huntingrifle9_3");

scr_soundbank_addSound("hoopzweap_tranqrifle", "sn_tranqrifle1_1");
scr_soundbank_addSound("hoopzweap_tranqrifle", "sn_tranqrifle1_2");
scr_soundbank_addSound("hoopzweap_tranqrifle", "sn_tranqrifle1_3");

scr_soundbank_addSound("hoopzweap_shotgun", "sn_shotgun5");
scr_soundbank_addSound("hoopzweap_shotgun", "sn_shotgun6");
scr_soundbank_addSound("hoopzweap_shotgun", "sn_shotgun9");

scr_soundbank_addSound("hoopzweap_doublebarreledshotgun", "sn_doublebarreledshotgun1_1");
scr_soundbank_addSound("hoopzweap_doublebarreledshotgun", "sn_doublebarreledshotgun1_2");
scr_soundbank_addSound("hoopzweap_doublebarreledshotgun", "sn_doublebarreledshotgun1_3");

scr_soundbank_addSound("hoopzweap_revolvershotgun", "sn_revolvershotgun1_1");
scr_soundbank_addSound("hoopzweap_revolvershotgun", "sn_revolvershotgun1_2");
scr_soundbank_addSound("hoopzweap_revolvershotgun", "sn_revolvershotgun1_3");

scr_soundbank_addSound("hoopzweap_elephantgun", "sn_elephantgun1_1");
scr_soundbank_addSound("hoopzweap_elephantgun", "sn_elephantgun1_2");
scr_soundbank_addSound("hoopzweap_elephantgun", "sn_elephantgun1_3");

scr_soundbank_addSound("hoopzweap_smg", "sn_smg3_1");
scr_soundbank_addSound("hoopzweap_smg", "sn_smg3_2");
scr_soundbank_addSound("hoopzweap_smg", "sn_smg3_3");

scr_soundbank_addSound("hoopzweap_hmg", "sn_hmg1_1");
scr_soundbank_addSound("hoopzweap_hmg", "sn_hmg1_2");
scr_soundbank_addSound("hoopzweap_hmg", "sn_hmg1_3");

scr_soundbank_addSound("hoopzweap_assaultrifle", "sn_assaultrifle1_1");
scr_soundbank_addSound("hoopzweap_assaultrifle", "sn_assaultrifle1_2");
scr_soundbank_addSound("hoopzweap_assaultrifle", "sn_assaultrifle1_3");

scr_soundbank_addSound("hoopzweap_crossbow", "sn_crossbow1_1");
scr_soundbank_addSound("hoopzweap_crossbow", "sn_crossbow1_2");
scr_soundbank_addSound("hoopzweap_crossbow", "sn_crossbow1_3");

scr_soundbank_addSound("hoopzweap_flamethrower_trigger", "sn_flamethrower_click03");
scr_soundbank_addSound("hoopzweap_flamethrower_gas", "sn_flamethrower_gas03");

scr_soundbank_addSound("hoopzweap_flamethrower_attack", "sn_flamethrower_attack03");
scr_soundbank_addSound("hoopzweap_flamethrower_sustain", "sn_flamethrower_sustain03");
scr_soundbank_addSound("hoopzweap_flamethrower_release", "sn_flamethrower_release03");

scr_soundbank_addSound("hoopzweap_minigun", "sn_minigun3");
scr_soundbank_addSound("hoopzweap_minigun", "sn_minigun7");
scr_soundbank_addSound("hoopzweap_minigun", "sn_minigun8");
scr_soundbank_addSound("hoopzweap_minig_windup", "sn_windup01");
scr_soundbank_addSound("hoopzweap_minig_windup", "sn_windup02");
scr_soundbank_addSound("hoopzweap_minig_windup", "sn_windup04");
scr_soundbank_addSound("hoopzweap_minig_windup", "sn_windup06");

scr_soundbank_addSound("hoopzweap_minig_sustain", "sn_sustain01");
scr_soundbank_addSound("hoopzweap_minig_sustain", "sn_sustain02");
scr_soundbank_addSound("hoopzweap_minig_sustain", "sn_sustain04");
scr_soundbank_addSound("hoopzweap_minig_sustain", "sn_sustain06");

scr_soundbank_addSound("hoopzweap_minig_winddown", "sn_winddown01");
scr_soundbank_addSound("hoopzweap_minig_winddown", "sn_winddown04");
scr_soundbank_addSound("hoopzweap_minig_winddown", "sn_winddown02");
scr_soundbank_addSound("hoopzweap_minig_winddown", "sn_winddown06");

//Hit sounds
scr_soundbank_addSound("hoopzDmgSoundNormal", "sn_hoopzDmgSoundNormal01");
scr_soundbank_addSound("hoopzDmgSoundNormal", "sn_hoopzDmgSoundNormal02");
scr_soundbank_addSound("hoopzDmgSoundNormal", "sn_hoopzDmgSoundNormal03");
scr_soundbank_addSound("hoopzDmgSoundNormalKb", "sn_hoopzDmgSoundNormalKB01");
scr_soundbank_addSound("hoopzDmgSoundNormalKb", "sn_hoopzDmgSoundNormalKB02");
scr_soundbank_addSound("hoopzDmgSoundNormalKb", "sn_hoopzDmgSoundNormalKB03");

scr_soundbank_addSound("hoopzDmgSoundBio", "sn_debug_one");
scr_soundbank_addSound("hoopzDmgSoundBioKb", "sn_debug_two");

scr_soundbank_addSound("hoopzDmgSoundCyber", "sn_debug_one");
scr_soundbank_addSound("hoopzDmgSoundCyberKb", "sn_debug_two");

scr_soundbank_addSound("hoopzDmgSoundMental", "sn_debug_one");
scr_soundbank_addSound("hoopzDmgSoundMentalKb", "sn_debug_two");

scr_soundbank_addSound("hoopzDmgSoundCosmic", "sn_debug_one");
scr_soundbank_addSound("hoopzDmgSoundCosmicKb", "sn_debug_two");

scr_soundbank_addSound("hoopzDmgSoundZauber", "sn_debug_one");
scr_soundbank_addSound("hoopzDmgSoundZauberKb", "sn_debug_two");

/////Special material sounds

// Candy Gun's Brast //
scr_soundbank_addSound("candy_shot", "sn_bubblepop01");
scr_soundbank_addSound("candy_shot", "sn_bubblepop02");
scr_soundbank_addSound("candy_shot", "sn_bubblepop03");

// Candy Gun's Debris // This is the debris that scatters after bullet impact //
scr_soundbank_addSound("candy_impact", "sn_bonedebris01");
scr_soundbank_addSound("candy_impact", "sn_bonedebris02");
scr_soundbank_addSound("candy_impact", "sn_bonedebris03");
scr_soundbank_addSound("candy_impact", "sn_bonedebris04");

// 3D Printed //

// Soiled Gun's Brast //
scr_soundbank_addSound("hoopzweap_soiled_shot", "sn_rottengunfire01");
scr_soundbank_addSound("hoopzweap_soiled_shot", "sn_rottengunfire02");
scr_soundbank_addSound("hoopzweap_soiled_shot", "sn_rottengunfire03");

// Rotten Gun's Brast //
scr_soundbank_addSound("hoopzweap_rotten_shot", "sn_rottengunfire01");
scr_soundbank_addSound("hoopzweap_rotten_shot", "sn_rottengunfire02");
scr_soundbank_addSound("hoopzweap_rotten_shot", "sn_rottengunfire03");

// Rotten Gun's Impact //
scr_soundbank_addSound("hoopzweap_rotten_impact", "sn_rottengunimpact01");
scr_soundbank_addSound("hoopzweap_rotten_impact", "sn_rottengunimpact02");
scr_soundbank_addSound("hoopzweap_rotten_impact", "sn_rottengunimpact03");

// Broken Gun's Brast //
scr_soundbank_addSound("hoopzweap_broken_shot", "sn_brokengunfire01");
scr_soundbank_addSound("hoopzweap_broken_shot", "sn_brokengunfire02");
scr_soundbank_addSound("hoopzweap_broken_shot", "sn_brokengunfire03");

// Broken Gun's Misfire //
scr_soundbank_addSound("hoopzweap_broken_misfire", "sn_brokengunmissfire01");

// Broken Gun's Wide Shot //
scr_soundbank_addSound("hoopzweap_broken_wideshot", "sn_brokengunwideshot01");
scr_soundbank_addSound("hoopzweap_broken_wideshot", "sn_brokengunwideshot02");
scr_soundbank_addSound("hoopzweap_broken_wideshot", "sn_brokengunwideshot03");

// Carbon //

// Mythril //

// Rusty //

// Junk Gun's Brast //
scr_soundbank_addSound("hoopzweap_junk_shot", "sn_junkgunfire01");
scr_soundbank_addSound("hoopzweap_junk_shot", "sn_junkgunfire02");
scr_soundbank_addSound("hoopzweap_junk_shot", "sn_junkgunfire03");

// Junk Gun's Impact //
scr_soundbank_addSound("hoopzweap_junk_impact", "sn_junkgunimpact01");
scr_soundbank_addSound("hoopzweap_junk_impact", "sn_junkgunimpact02");
scr_soundbank_addSound("hoopzweap_junk_impact", "sn_junkgunimpact03");

// Junk Gun's Debris // This is the debris that scatters after bullet impact //
scr_soundbank_addSound("hoopzweap_junk_debris", "sn_junkgundebris01");
scr_soundbank_addSound("hoopzweap_junk_debris", "sn_junkgundebris02");
scr_soundbank_addSound("hoopzweap_junk_debris", "sn_junkgundebris03");
scr_soundbank_addSound("hoopzweap_junk_debris", "sn_junkgundebris04");
scr_soundbank_addSound("hoopzweap_junk_debris", "sn_junkgundebris05");
scr_soundbank_addSound("hoopzweap_junk_debris", "sn_junkgundebris06");
scr_soundbank_addSound("hoopzweap_junk_debris", "sn_junkgundebris07");
scr_soundbank_addSound("hoopzweap_junk_debris", "sn_junkgundebris08");

// Neon Gun's Brast //
scr_soundbank_addSound("hoopzweap_neon_shot", "sn_neonshot01");
scr_soundbank_addSound("hoopzweap_neon_shot", "sn_neonshot01");
scr_soundbank_addSound("hoopzweap_neon_shot", "sn_neonshot01");

// Salt Gun's Brast //
scr_soundbank_addSound("hoopzweap_salt_shot", "sn_saltshot01");
scr_soundbank_addSound("hoopzweap_salt_shot", "sn_saltshot02");
scr_soundbank_addSound("hoopzweap_salt_shot", "sn_saltshot03");

// Salt Gun's Impact //
scr_soundbank_addSound("hoopzweap_salt_impact", "sn_saltimpact01");
scr_soundbank_addSound("hoopzweap_salt_impact", "sn_saltimpact02");
scr_soundbank_addSound("hoopzweap_salt_impact", "sn_saltimpact03");

// Wood //

// Aluminum //

// Glass Gun's Brast //
scr_soundbank_addSound("hoopzweap_glass_shot", "sn_glassfire01");
scr_soundbank_addSound("hoopzweap_glass_shot", "sn_glassfire02");
scr_soundbank_addSound("hoopzweap_glass_shot", "sn_glassfire03");

// Glass Gun's Impact //
scr_soundbank_addSound("hoopzweap_glass_impact", "sn_glassbreak01");
scr_soundbank_addSound("hoopzweap_glass_impact", "sn_glassbreak02");
scr_soundbank_addSound("hoopzweap_glass_impact", "sn_glassbreak03");

// Plastic Foam Dart Gun's Brast //
scr_soundbank_addSound("hoopzweap_foamdart_shot", "sn_dartgunfire01");
scr_soundbank_addSound("hoopzweap_foamdart_shot", "sn_dartgunfire02");
scr_soundbank_addSound("hoopzweap_foamdart_shot", "sn_dartgunfire03");

// Plastic Foam Dart Gun's Impact //
scr_soundbank_addSound("hoopzweap_foamdart_impact", "sn_dartgunimpact01");
scr_soundbank_addSound("hoopzweap_foamdart_impact", "sn_dartgunimpact02");
scr_soundbank_addSound("hoopzweap_foamdart_impact", "sn_dartgunimpact03");

// Leather //

// Studded //

// Dual //

// Plantain Gun's Brast //
scr_soundbank_addSound("hoopzweap_plantain_shot", "sn_plantanshot01");
scr_soundbank_addSound("hoopzweap_plantain_shot", "sn_plantanshot02");
scr_soundbank_addSound("hoopzweap_plantain_shot", "sn_plantanshot03");

// Plantain Gun's Impact //
scr_soundbank_addSound("hoopzweap_plantain_impact", "sn_plantanhit01");
scr_soundbank_addSound("hoopzweap_plantain_impact", "sn_plantanhit02");
scr_soundbank_addSound("hoopzweap_plantain_impact", "sn_plantanhit03");

// Plantain Gun's Slip // Slip on a banana peel //
scr_soundbank_addSound("hoopzweap_plantain_slip", "sn_plantanslip01");
scr_soundbank_addSound("hoopzweap_plantain_slip", "sn_plantanslip02");
scr_soundbank_addSound("hoopzweap_plantain_slip", "sn_plantanslip03");

// Plantain Gun's Spawn // Spawn some banana peels //
scr_soundbank_addSound("hoopzweap_plantain_spawn", "sn_plantanspawn01");
scr_soundbank_addSound("hoopzweap_plantain_spawn", "sn_plantanspawn02");
scr_soundbank_addSound("hoopzweap_plantain_spawn", "sn_plantanspawn03");

// Bone Gun's Brast //
scr_soundbank_addSound("hoopzweap_bone_shot", "sn_bonegunfire01");
scr_soundbank_addSound("hoopzweap_bone_shot", "sn_bonegunfire02");
scr_soundbank_addSound("hoopzweap_bone_shot", "sn_bonegunfire03");

// Bone Gun's Impact //
scr_soundbank_addSound("hoopzweap_bone_impact", "sn_bonegunimpact01");
scr_soundbank_addSound("hoopzweap_bone_impact", "sn_bonegunimpact02");
scr_soundbank_addSound("hoopzweap_bone_impact", "sn_bonegunimpact03");

// Bone Gun's Debris // This is the debris that scatters after bullet impact //
scr_soundbank_addSound("hoopzweap_bone_debris", "sn_bonedebris01");
scr_soundbank_addSound("hoopzweap_bone_debris", "sn_bonedebris02");
scr_soundbank_addSound("hoopzweap_bone_debris", "sn_bonedebris03");
scr_soundbank_addSound("hoopzweap_bone_debris", "sn_bonedebris04");

// Aluminium //

// Titanium //

// Stone Gun's Brast //
scr_soundbank_addSound("hoopzweap_stone_shot", "sn_stonegunfire01");
scr_soundbank_addSound("hoopzweap_stone_shot", "sn_stonegunfire02");
scr_soundbank_addSound("hoopzweap_stone_shot", "sn_stonegunfire03");

// Stone Gun's Impact //
scr_soundbank_addSound("hoopzweap_stone_impact", "sn_stonegunimpact01");
scr_soundbank_addSound("hoopzweap_stone_impact", "sn_stonegunimpact02");
scr_soundbank_addSound("hoopzweap_stone_impact", "sn_stonegunimpact03");

// Stone Gun's Moai Head // BFG //
scr_soundbank_addSound("hoopzweap_stone_moai", "sn_stonemoai");

// Chrome //

// Frankincense //

// Iron //

// Cobalt //

// Nickel //

// Copper //

// Zinc //

// Fiberglass //

// Grass Gun's Shot //
scr_soundbank_addSound("hoopzweap_grass_shot", "sn_grassshot01");
scr_soundbank_addSound("hoopzweap_grass_shot", "sn_grassshot02");
scr_soundbank_addSound("hoopzweap_grass_shot", "sn_grassshot03");

// Soy //
scr_soundbank_addSound("hoopzweap_soy_shot", "sn_soygunfire01");
scr_soundbank_addSound("hoopzweap_soy_shot", "sn_soygunfire02");
scr_soundbank_addSound("hoopzweap_soy_shot", "sn_soygunfire03");

// Steel //

// Brass //

// Orichalcum Gun's Brast //
scr_soundbank_addSound("hoopzweap_orichalcum_shot", "sn_orchihaliumshot01");
scr_soundbank_addSound("hoopzweap_orichalcum_shot", "sn_orchihaliumshot02");
scr_soundbank_addSound("hoopzweap_orichalcum_shot", "sn_orchihaliumshot03");

// Orichalcum Gun's Bounce //
scr_soundbank_addSound("hoopzweap_orichalcum_bounce", "sn_orchihaliumbounce01");
scr_soundbank_addSound("hoopzweap_orichalcum_bounce", "sn_orchihaliumbounce02");
scr_soundbank_addSound("hoopzweap_orichalcum_bounce", "sn_orchihaliumbounce03");

// Napalm Gun's Brast //
scr_soundbank_addSound("hoopzweap_napalm_shot", "sn_napalmshot01");
scr_soundbank_addSound("hoopzweap_napalm_shot", "sn_napalmshot02");
scr_soundbank_addSound("hoopzweap_napalm_shot", "sn_napalmshot03");

// Napalm Gun's Brast // Alternative //
scr_soundbank_addSound("hoopzweap_napalm_shot_alt", "sn_napalmshotvariant01");
scr_soundbank_addSound("hoopzweap_napalm_shot_alt", "sn_napalmshotvariant02");
scr_soundbank_addSound("hoopzweap_napalm_shot_alt", "sn_napalmshotvariant03");

// Origami Gun's Brast //
scr_soundbank_addSound("hoopzweap_origami_shot", "sn_oragamishot01");
scr_soundbank_addSound("hoopzweap_origami_shot", "sn_oragamishot02");
scr_soundbank_addSound("hoopzweap_origami_shot", "sn_oragamishot03");

// Origami Gun's Impact //
scr_soundbank_addSound("hoopzweap_origami_impact", "sn_oragamihit01");
scr_soundbank_addSound("hoopzweap_origami_impact", "sn_oragamihit02");
scr_soundbank_addSound("hoopzweap_origami_impact", "sn_oragamihit03");

// Origami Gun's Flight //
scr_soundbank_addSound("hoopzweap_origami_fly", "sn_oragamifly01");
scr_soundbank_addSound("hoopzweap_origami_fly", "sn_oragamifly02");
scr_soundbank_addSound("hoopzweap_origami_fly", "sn_oragamifly03");

// Offal Gun's Brast //
scr_soundbank_addSound("hoopzweap_offal_shot", "sn_offalshot01");
scr_soundbank_addSound("hoopzweap_offal_shot", "sn_offalshot02");
scr_soundbank_addSound("hoopzweap_offal_shot", "sn_offalshot03");

// Crystal Gun's Brast //
scr_soundbank_addSound("hoopzweap_crystal_shot", "sn_crystalshot01");
scr_soundbank_addSound("hoopzweap_crystal_shot", "sn_crystalshot02");
scr_soundbank_addSound("hoopzweap_crystal_shot", "sn_crystalshot03");

// Crystal Gun's Brast // Alternative //
scr_soundbank_addSound("hoopzweap_crystal_shot_alt", "sn_crystalshotvariant01");
scr_soundbank_addSound("hoopzweap_crystal_shot_alt", "sn_crystalshotvariant02");
scr_soundbank_addSound("hoopzweap_crystal_shot_alt", "sn_crystalshotvariant03");

// Crystal Gun's Impact Explosion //
scr_soundbank_addSound("hoopzweap_crystal_explode", "sn_crystalexplosion01");
scr_soundbank_addSound("hoopzweap_crystal_explode", "sn_crystalexplosion02");
scr_soundbank_addSound("hoopzweap_crystal_explode", "sn_crystalexplosion03");

// Crystal Gun's Brast // Alternative //
scr_soundbank_addSound("hoopzweap_crystal_bullet", "sn_crystalbullet01");
scr_soundbank_addSound("hoopzweap_crystal_bullet", "sn_crystalbullet02");
scr_soundbank_addSound("hoopzweap_crystal_bullet", "sn_crystalbullet03");

// Adamantium Gun's Brast //
scr_soundbank_addSound("hoopzweap_adamantium_shot", "sn_adamantiumshot01");
scr_soundbank_addSound("hoopzweap_adamantium_shot", "sn_adamantiumshot02");
scr_soundbank_addSound("hoopzweap_adamantium_shot", "sn_adamantiumshot03");

// Silk Gun's Brast //
scr_soundbank_addSound("hoopzweap_silk_shot", "sn_silkshot01");
scr_soundbank_addSound("hoopzweap_silk_shot", "sn_silkshot02");
scr_soundbank_addSound("hoopzweap_silk_shot", "sn_silkshot03");

// Silk Gun's Impact //
scr_soundbank_addSound("hoopzweap_silk_impact", "sn_silkimpact01");
scr_soundbank_addSound("hoopzweap_silk_impact", "sn_silkimpact02");
scr_soundbank_addSound("hoopzweap_silk_impact", "sn_silkimpact03");

// Marble Gun's Shot //
scr_soundbank_addSound("hoopzweap_marble_shot", "sn_marbleshot01");
scr_soundbank_addSound("hoopzweap_marble_shot", "sn_marbleshot02");
scr_soundbank_addSound("hoopzweap_marble_shot", "sn_marbleshot03");

// Marble Gun's Shot // Alternative //
scr_soundbank_addSound("hoopzweap_marble_shot_alt", "sn_marbleshotvariant01");
scr_soundbank_addSound("hoopzweap_marble_shot_alt", "sn_marbleshotvariant02");
scr_soundbank_addSound("hoopzweap_marble_shot_alt", "sn_marbleshotvariant03");

// Rubber Gun's Brast //
scr_soundbank_addSound("hoopzweap_rubber_shot", "sn_rubbergunshot01");
scr_soundbank_addSound("hoopzweap_rubber_shot", "sn_rubbergunshot02");
scr_soundbank_addSound("hoopzweap_rubber_shot", "sn_rubbergunshot03");

// Rubber Bounce //
scr_soundbank_addSound("hoopzweap_rubber_bounce", "sn_rubberbounce01");
scr_soundbank_addSound("hoopzweap_rubber_bounce", "sn_rubberbounce02");
scr_soundbank_addSound("hoopzweap_rubber_bounce", "sn_rubberbounce03");

// Foil Gun's Brast //
scr_soundbank_addSound("hoopzweap_foil_shot", "sn_foilgun01");
scr_soundbank_addSound("hoopzweap_foil_shot", "sn_foilgun02");
scr_soundbank_addSound("hoopzweap_foil_shot", "sn_foilgun03");

// Blood //

// Silver //

// Chitin Gun's Brast //
scr_soundbank_addSound("hoopzweap_chitin_shot", "sn_chitlinshot01");
scr_soundbank_addSound("hoopzweap_chitin_shot", "sn_chitlinshot02");
scr_soundbank_addSound("hoopzweap_chitin_shot", "sn_chitlinshot03");

// Chitin Gun's Egg Hatch //
scr_soundbank_addSound("hoopzweap_chitin_hatch", "sn_chitlinhatch01");
scr_soundbank_addSound("hoopzweap_chitin_hatch", "sn_chitlinhatch02");
scr_soundbank_addSound("hoopzweap_chitin_hatch", "sn_chitlinhatch03");

// Chitin Gun's Critter Jump //
scr_soundbank_addSound("hoopzweap_chitin_jump", "sn_chitlinjump01");
scr_soundbank_addSound("hoopzweap_chitin_jump", "sn_chitlinjump02");
scr_soundbank_addSound("hoopzweap_chitin_jump", "sn_chitlinjump03");

// Chitin Gun's Debris // This is the debris that scatters after bullet impact //
scr_soundbank_addSound("hoopzweap_chitin_die", "sn_chitlindebris01");
scr_soundbank_addSound("hoopzweap_chitin_die", "sn_chitlindebris02");
scr_soundbank_addSound("hoopzweap_chitin_die", "sn_chitlindebris03");

// Sinew //

// Tin //

// Obsidian //

// Fungus Gun's Brast // 
scr_soundbank_addSound("fungi_spore_shot", "sn_fungusgunshot01"); 
scr_soundbank_addSound("fungi_spore_shot", "sn_fungusgunshot02"); 
scr_soundbank_addSound("fungi_spore_shot", "sn_fungusgunshot03");

// Fungus Gun's Growth // Shrooms grow out of the pollen //
scr_soundbank_addSound("fungi_spore_grow_mushroom", "sn_fungusgrowth01");
scr_soundbank_addSound("fungi_spore_grow_mushroom", "sn_fungusgrowth02");
scr_soundbank_addSound("fungi_spore_grow_mushroom", "sn_fungusgrowth03");
scr_soundbank_addSound("fungi_spore_grow_mushroom", "sn_fungusgrowth04");

// Damascus //

// Analog //

// Digital Gun's Brast //
scr_soundbank_addSound("digital_shot", "sn_digitalshot01");
scr_soundbank_addSound("digital_shot", "sn_digitalshot02");
scr_soundbank_addSound("digital_shot", "sn_digitalshot03");

// Digital Gun's Impact //
scr_soundbank_addSound("digital_impact", "sn_digitalhit01");
scr_soundbank_addSound("digital_impact", "sn_digitalhit02");
scr_soundbank_addSound("digital_impact", "sn_digitalhit03");

// Brain //

// Chobham //

// Bronze //

/* Blaster Gun's Brast //
scr_soundbank_addSound("hoopzweap_blaster_shot", "sn_blastershot01");
scr_soundbank_addSound("hoopzweap_blaster_shot", "sn_blastershot02");
scr_soundbank_addSound("hoopzweap_blaster_shot", "sn_blastershot03");

// Blaster Gun's Brast Alternative //
scr_soundbank_addSound("hoopzweap_blaster_shot", "sn_blastershotvar01");
scr_soundbank_addSound("hoopzweap_blaster_shot", "sn_blastershotvar02");
scr_soundbank_addSound("hoopzweap_blaster_shot", "sn_blastershotvar03");
*/

// Blaster Gun's Brast // - NOTE: BHROOM SWAPPED THE IMPACT AND SHOT SOUNDS, BUT DIDN'T RENAME THEM AS OF 9-27-2018
scr_soundbank_addSound("hoopzweap_blaster_shot", "sn_blasterimpact01");
scr_soundbank_addSound("hoopzweap_blaster_shot", "sn_blasterimpact02");
scr_soundbank_addSound("hoopzweap_blaster_shot", "sn_blasterimpact03");

// Blaster Gun's Impact // - NOTE: BHROOM SWAPPED THE IMPACT AND SHOT SOUNDS, BUT DIDN'T RENAME THEM AS OF 9-27-2018
scr_soundbank_addSound("hoopzweap_blaster_impact", "sn_blastershot01");
scr_soundbank_addSound("hoopzweap_blaster_impact", "sn_blastershot02");
scr_soundbank_addSound("hoopzweap_blaster_impact", "sn_blastershot03");


// Tungsten //

// Itano Rocket Sounds
scr_soundbank_addSound("hoopzweap_itano_minirocket", "sn_minirocketattack01");  ///machinegun-like rocket launchers
scr_soundbank_addSound("hoopzweap_itano_smallrocket", "sn_smallrocketattack01"); ///smaller rockets
scr_soundbank_addSound("hoopzweap_itano_bigrocket", "sn_largerocketattack01");  ///for big rocket launchers

// Pearl Gun's Brast //
scr_soundbank_addSound("hoopzweap_pearl_shot", "sn_pearlgunshot01");
scr_soundbank_addSound("hoopzweap_pearl_shot", "sn_pearlgunshot02");
scr_soundbank_addSound("hoopzweap_pearl_shot", "sn_pearlgunshot03");

// Pearl Gun's Trail //
scr_soundbank_addSound("hoopzweap_pearl_trail", "sn_pearlguntrail01");
scr_soundbank_addSound("hoopzweap_pearl_trail", "sn_pearlguntrail02");
scr_soundbank_addSound("hoopzweap_pearl_trail", "sn_pearlguntrail03");

// Pearl Gun's Brast Alternative //
scr_soundbank_addSound("hoopzweap_pearl_shot_alt", "sn_pearlgunvar01");
scr_soundbank_addSound("hoopzweap_pearl_shot_alt", "sn_pearlgunvar02");
scr_soundbank_addSound("hoopzweap_pearl_shot_alt", "sn_pearlgunvar03");

// Myrrh //

// Platinum //

// Gold //

// Mercury //

// Imaginary Gun's Brasting //
//TODO: this bank of "Imaginary" sounds have debug and need actual sounds
scr_soundbank_addSound("hoopzweap_imaginary_pistol", "sn_debug_three");
scr_soundbank_addSound("hoopzweap_imaginary_shotgun", "sn_debug_four");
scr_soundbank_addSound("hoopzweap_imaginary_tranquilizer", "sn_debug_six");
scr_soundbank_addSound("hoopzweap_imaginary_flamethrower", "sn_debug_seven");
scr_soundbank_addSound("hoopzweap_imaginary_crossbow", "sn_debug_eight");

scr_soundbank_addSound("hoopzweap_imaginary_bfg_chargeup", "sn_imaginaryBFGchargeup01");
scr_soundbank_addSound("hoopzweap_imaginary_bfg_chargeup", "sn_imaginaryBFGchargeup02");
scr_soundbank_addSound("hoopzweap_imaginary_bfg_chargeup", "sn_imaginaryBFGchargeup03");

scr_soundbank_addSound("hoopzweap_imaginary_bfg_shot", "sn_imaginaryBFGshot01");
scr_soundbank_addSound("hoopzweap_imaginary_bfg_shot", "sn_imaginaryBFGshot02");
scr_soundbank_addSound("hoopzweap_imaginary_bfg_shot", "sn_imaginaryBFGshot03");

scr_soundbank_addSound("hoopzweap_imaginary_bfg_explosion_large", "sn_imaginaryexplosionlarge01");
scr_soundbank_addSound("hoopzweap_imaginary_bfg_explosion_large", "sn_imaginaryexplosionlarge02");
scr_soundbank_addSound("hoopzweap_imaginary_bfg_explosion_large", "sn_imaginaryexplosionlarge03");

scr_soundbank_addSound("hoopzweap_imaginary_bfg_explosion_small", "sn_imaginaryexplosionsmall01");
scr_soundbank_addSound("hoopzweap_imaginary_bfg_explosion_small", "sn_imaginaryexplosionsmall02");
scr_soundbank_addSound("hoopzweap_imaginary_bfg_explosion_small", "sn_imaginaryexplosionsmall03");

scr_soundbank_addSound("hoopzweap_imaginary_gatling_gun", "sn_imaginarygatlingun01");
scr_soundbank_addSound("hoopzweap_imaginary_gatling_gun", "sn_imaginarygatlingun02");
scr_soundbank_addSound("hoopzweap_imaginary_gatling_gun", "sn_imaginarygatlingun03");

scr_soundbank_addSound("hoopzweap_imaginary_machine_gun", "sn_imaginarymachinegun01");
scr_soundbank_addSound("hoopzweap_imaginary_machine_gun", "sn_imaginarymachinegun02");
scr_soundbank_addSound("hoopzweap_imaginary_machine_gun", "sn_imaginarymachinegun03");

scr_soundbank_addSound("hoopzweap_imaginary_rocket", "sn_imaginaryrocketshot01");
scr_soundbank_addSound("hoopzweap_imaginary_rocket", "sn_imaginaryrocketshot02");
scr_soundbank_addSound("hoopzweap_imaginary_rocket", "sn_imaginaryrocketshot03");

scr_soundbank_addSound("hoopzweap_imaginary_winddown", "sn_imaginarywinddown01");
scr_soundbank_addSound("hoopzweap_imaginary_windsustain", "sn_imaginarywindsustain01");
scr_soundbank_addSound("hoopzweap_imaginary_windup", "sn_imaginarywindup01");

// Lead //

// Diamond //

// Polenta //

// Yggdrasil //

// Pinata Gun's Brast //
scr_soundbank_addSound("hoopzweap_pinata_shot", "sn_pinatashotsmall01");
scr_soundbank_addSound("hoopzweap_pinata_shot", "sn_pinatashotsmall02");
scr_soundbank_addSound("hoopzweap_pinata_shot", "sn_pinatashotsmall03");

// Pinata Gun's Brast Large //
scr_soundbank_addSound("hoopzweap_pinata_shot_large", "sn_pinatashotlarge01");
scr_soundbank_addSound("hoopzweap_pinata_shot_large", "sn_pinatashotlarge02");
scr_soundbank_addSound("hoopzweap_pinata_shot_large", "sn_pinatashotlarge03");

// Francium Gun's Brast //
scr_soundbank_addSound("hoopzweap_francium_shot", "sn_franciumshot01"); 
scr_soundbank_addSound("hoopzweap_francium_shot", "sn_franciumshot02"); 
scr_soundbank_addSound("hoopzweap_francium_shot", "sn_franciumshot03");

// Francium Gun's Orb sound // The Orb emits a looping sort of sound //
scr_soundbank_addSound("hoopzweap_francium_hum", "sn_franciumorbloop01"); 
scr_soundbank_addSound("hoopzweap_francium_hum", "sn_franciumorbloop02");

// Orb //

// Nanotube //

// Taxidermy //

// Porcelain //

// Antimatter Gun's Brast //
scr_soundbank_addSound("hoopzweap_antimatter_shot", "sn_antimattergun01"); 
scr_soundbank_addSound("hoopzweap_antimatter_shot", "sn_antimattergun02");
scr_soundbank_addSound("hoopzweap_antimatter_shot", "sn_antimattergun03");

// Antimatter Gun's Brast // Alternative //
scr_soundbank_addSound("hoopzweap_antimatter_rapidshot", "sn_antimattergunvariant01");  
scr_soundbank_addSound("hoopzweap_antimatter_rapidshot", "sn_antimattergunvariant02");
scr_soundbank_addSound("hoopzweap_antimatter_rapidshot", "sn_antimattergunvariant03");

// Aerogel //

// Denim //

// Untamonium //
scr_soundbank_addSound("untamonium_shot", "sn_untamoniumShot01");
scr_soundbank_addSound("untamonium_shot", "sn_untamoniumShot02");
scr_soundbank_addSound("untamonium_shot", "sn_untamoniumShot03");
scr_soundbank_addSound("untamonium_shot", "sn_untamoniumShot04");




// BFG Shots // Delay before the shot // Windup //
scr_soundbank_addSound("hoopzweap_BFG_charge", "sn_bfgchargeup01");  
scr_soundbank_addSound("hoopzweap_BFG_charge", "sn_bfgchargeup02");
scr_soundbank_addSound("hoopzweap_BFG_charge", "sn_bfgchargeup03");

// BFG Shots // The Brast itself //
scr_soundbank_addSound("hoopzweap_BFG_shot", "sn_bfgshot01");
scr_soundbank_addSound("hoopzweap_BFG_shot", "sn_bfgshot02");
scr_soundbank_addSound("hoopzweap_BFG_shot", "sn_bfgshot03");

// BFG Shots // Impact //
scr_soundbank_addSound("hoopzweap_BFG_explode", "sn_bfgexplode01");
scr_soundbank_addSound("hoopzweap_BFG_explode", "sn_bfgexplode02");
scr_soundbank_addSound("hoopzweap_BFG_explode", "sn_bfgexplode03");

// Rocket Launcher Sounds
scr_soundbank_addSound("hoopzweap_rocket_shot", "sn_rocketshot01");  /// Exhaust sound while Rocket Launcher rocket is travelling
scr_soundbank_addSound("hoopzweap_rocket_exhaust", "sn_rocketexhaust01");  /// Exhaust sound while Itano or Rocket Launcher rocket is travelling
scr_soundbank_addSound("hoopzweap_rocket_impact", "sn_rocketimpact01");  /// Explosion for rocket launcher

// Footsteps Normal //
scr_soundbank_addSound("hoopz_footstep", "sn_hoopz_footL2");
scr_soundbank_addSound("hoopz_footstep", "sn_hoopz_footR2");

// Footsteps while inside Oligarchy Online //
scr_soundbank_addSound("hoopz_footstep_vrw", "sn_footstep_vrw_00");
scr_soundbank_addSound("hoopz_footstep_vrw", "sn_footstep_vrw_01");
scr_soundbank_addSound("hoopz_footstep_vrw", "sn_footstep_vrw_02");

// Footsteps while wading in water //
scr_soundbank_addSound("hoopz_wadestep", "sn_hoopz_waterstep01");
scr_soundbank_addSound("hoopz_wadestep", "sn_hoopz_waterstep02");

// Footsteps while walking in a rain puddle //
scr_soundbank_addSound("hoopz_puddlestep", "sn_puddlestep01");
scr_soundbank_addSound("hoopz_puddlestep", "sn_puddlestep02");

// Hoopz dodge roll //
scr_soundbank_addSound("hoopz_dash_leap", "sn_hoopz_roll");

// Candy crunching //
scr_soundbank_addSound("hoopz_crunchcandy", "sn_hoopz_candy04");
scr_soundbank_addSound("hoopz_crunchcandy", "sn_hoopz_candy05");
scr_soundbank_addSound("hoopz_crunchcandy", "sn_hoopz_candy06");

scr_soundbank_addSound("hoopz_reload", "sn_shotgun_reload01");
scr_soundbank_addSound("hoopz_reload", "sn_shotgun_reload02");
scr_soundbank_addSound("hoopz_reload", "sn_shotgun_reload03");

scr_soundbank_addSound("hoopz_reloadcrossbow", "sn_guncrossbow_reload01");
scr_soundbank_addSound("hoopz_reloadcrossbow", "sn_guncrossbow_reload02");
scr_soundbank_addSound("hoopz_reloadcrossbow", "sn_guncrossbow_reload03");

scr_soundbank_addSound("hoopz_click", "sn_gun_click01");
scr_soundbank_addSound("hoopz_click", "sn_gun_click02");

scr_soundbank_addSound("hoopz_swapguns", "sn_gun_swap01");
scr_soundbank_addSound("hoopz_swapguns", "sn_gun_swap02");
scr_soundbank_addSound("hoopz_swapguns", "sn_gun_pickup01");
scr_soundbank_addSound("hoopz_swapguns", "sn_gun_pickup02");

scr_soundbank_addSound("hoopz_pickupgun", "sn_gun_pickup01");
scr_soundbank_addSound("hoopz_pickupgun", "sn_gun_pickup02");
scr_soundbank_addSound("hoopz_pickupgun", "sn_gun_pickup05");

scr_soundbank_addSound("hoopz_pickupMoney", "sn_hoopz_money1");
scr_soundbank_addSound("hoopz_pickupMoney", "sn_hoopz_money2");
scr_soundbank_addSound("hoopz_pickupMoney", "sn_hoopz_money3");

scr_soundbank_addSound("hoopz_shellcasing_light", "sn_gun_shellcasing_light_01");
scr_soundbank_addSound("hoopz_shellcasing_light", "sn_gun_shellcasing_light_02");
scr_soundbank_addSound("hoopz_shellcasing_light", "sn_gun_shellcasing_light_03");
scr_soundbank_addSound("hoopz_shellcasing_light", "sn_gun_shellcasing_light_04");
scr_soundbank_addSound("hoopz_shellcasing_light", "sn_gun_shellcasing_light_05");
scr_soundbank_addSound("hoopz_shellcasing_light", "sn_gun_shellcasing_light_06");
scr_soundbank_addSound("hoopz_shellcasing_light", "sn_gun_shellcasing_light_07");

scr_soundbank_addSound("hoopz_shellcasing_medium", "sn_gun_shellcasing_medium_01");
scr_soundbank_addSound("hoopz_shellcasing_medium", "sn_gun_shellcasing_medium_02");
scr_soundbank_addSound("hoopz_shellcasing_medium", "sn_gun_shellcasing_medium_03");
scr_soundbank_addSound("hoopz_shellcasing_medium", "sn_gun_shellcasing_medium_04");
scr_soundbank_addSound("hoopz_shellcasing_medium", "sn_gun_shellcasing_medium_05");
scr_soundbank_addSound("hoopz_shellcasing_medium", "sn_gun_shellcasing_medium_06");

scr_soundbank_addSound("hoopz_shellcasing_large", "sn_gun_shellcasing_large_01");
scr_soundbank_addSound("hoopz_shellcasing_large", "sn_gun_shellcasing_large_02");
scr_soundbank_addSound("hoopz_shellcasing_large", "sn_gun_shellcasing_large_03");
scr_soundbank_addSound("hoopz_shellcasing_large", "sn_gun_shellcasing_large_04");
scr_soundbank_addSound("hoopz_shellcasing_large", "sn_gun_shellcasing_large_05");
scr_soundbank_addSound("hoopz_shellcasing_large", "sn_gun_shellcasing_large_06");

scr_soundbank_addSound("hoopz_shellcasing_heavy", "sn_gun_shellcasing_heavy_01");
scr_soundbank_addSound("hoopz_shellcasing_heavy", "sn_gun_shellcasing_heavy_02");
scr_soundbank_addSound("hoopz_shellcasing_heavy", "sn_gun_shellcasing_heavy_03");
scr_soundbank_addSound("hoopz_shellcasing_heavy", "sn_gun_shellcasing_heavy_04");
scr_soundbank_addSound("hoopz_shellcasing_heavy", "sn_gun_shellcasing_heavy_05");
scr_soundbank_addSound("hoopz_shellcasing_heavy", "sn_gun_shellcasing_heavy_06");

scr_soundbank_addSound("hoopz_shellcasing_shell", "sn_gun_shellcasing_shell_01");
scr_soundbank_addSound("hoopz_shellcasing_shell", "sn_gun_shellcasing_shell_02");
scr_soundbank_addSound("hoopz_shellcasing_shell", "sn_gun_shellcasing_shell_03");
scr_soundbank_addSound("hoopz_shellcasing_shell", "sn_gun_shellcasing_shell_04");
scr_soundbank_addSound("hoopz_shellcasing_shell", "sn_gun_shellcasing_shell_05");
scr_soundbank_addSound("hoopz_shellcasing_shell", "sn_gun_shellcasing_shell_06");

/* Bhroom's note for EricW, these were the "large" rifle sounds that felt too "glassy"
I've swapped them out for medium sounds below and they seem fine ... the hooks for them
are still listed as large if we want to alter the original sounds later
scr_soundbank_addSound("hoopz_shellcasing_large", "sn_gun_shellcasing_medium_01");
scr_soundbank_addSound("hoopz_shellcasing_large", "sn_gun_shellcasing_medium_02");
scr_soundbank_addSound("hoopz_shellcasing_large", "sn_gun_shellcasing_medium_03");
scr_soundbank_addSound("hoopz_shellcasing_large", "sn_gun_shellcasing_medium_04");
scr_soundbank_addSound("hoopz_shellcasing_large", "sn_gun_shellcasing_medium_05");
scr_soundbank_addSound("hoopz_shellcasing_large", "sn_gun_shellcasing_medium_06");

*/

//////////////////
////AFFIX EFFECTS
scr_soundbank_addSound("affix_busting", "sn_busted01");

scr_soundbank_addSound("affix_carapacing", "sn_carapacing01");
scr_soundbank_addSound("affix_carapacing", "sn_carapacing02");
scr_soundbank_addSound("affix_carapacing", "sn_carapacing03");

scr_soundbank_addSound("affix_composting", "sn_composting01");
scr_soundbank_addSound("affix_composting", "sn_composting02");
scr_soundbank_addSound("affix_composting", "sn_composting03");

scr_soundbank_addSound("affix_eightarmed", "sn_eightarmed01");
scr_soundbank_addSound("affix_eightarmed", "sn_eightarmed02");
scr_soundbank_addSound("affix_eightarmed", "sn_eightarmed03");

scr_soundbank_addSound("affix_godless", "sn_godless01");
scr_soundbank_addSound("affix_godless", "sn_godless02");
scr_soundbank_addSound("affix_godless", "sn_godless03");

scr_soundbank_addSound("affix_malnourished", "sn_malnourishing01");
scr_soundbank_addSound("affix_malnourished", "sn_malnourishing02");
scr_soundbank_addSound("affix_malnourished", "sn_malnourishing03");

scr_soundbank_addSound("affix_partitioning", "sn_partitioning01");
scr_soundbank_addSound("affix_partitioning", "sn_partitioning02");
scr_soundbank_addSound("affix_partitioning", "sn_partitioning03");

scr_soundbank_addSound("affix_rebasing", "sn_rebasing01");
scr_soundbank_addSound("affix_rebasing", "sn_rebasing02");
scr_soundbank_addSound("affix_rebasing", "sn_rebasing03");

scr_soundbank_addSound("affix_thorns", "sn_thorns01");
scr_soundbank_addSound("affix_thorns", "sn_thorns02");
scr_soundbank_addSound("affix_thorns", "sn_thorns03");

scr_soundbank_addSound("affix_tubercular", "sn_tubercular01");
scr_soundbank_addSound("affix_tubercular", "sn_tubercular02");
scr_soundbank_addSound("affix_tubercular", "sn_tubercular03");

scr_soundbank_addSound("affix_withering", "sn_withering01");
scr_soundbank_addSound("affix_withering", "sn_withering02");
scr_soundbank_addSound("affix_withering", "sn_withering03");

scr_soundbank_addSound("affix_zaubric", "sn_zaubric01");
scr_soundbank_addSound("affix_zaubric", "sn_zaubric02");
scr_soundbank_addSound("affix_zaubric", "sn_zaubric03");

//////////////////
////GENERAL
scr_soundbank_addSound("cursor_back", "sn_cursor_back01");
scr_soundbank_addSound("cursor_error01", "sn_cursor_error01");
scr_soundbank_addSound("cursor_move01", "sn_cursor_digitalselect01");
scr_soundbank_addSound("cursor_select01", "sn_cursor_select01");
scr_soundbank_addSound("mouse_hover01", "sn_mouse_analoghover01");
scr_soundbank_addSound("mouse_select01", "sn_mouse_select01");

////Note from EricW These impact sounds are for when hoopz gets hit with a blunt weapon
////the general_impact needs to be changed to blunt_impact instead
//// didn't want to mess with the coding on the other end!
scr_soundbank_addSound("general_impact", "sn_hoopz_blunthit01");
scr_soundbank_addSound("general_impact", "sn_hoopz_blunthit02");
scr_soundbank_addSound("general_impact", "sn_hoopz_blunthit03");
scr_soundbank_addSound("general_impact", "sn_hoopz_blunthit04");

scr_soundbank_addSound("ricochet", "sn_bulletricochet01");
scr_soundbank_addSound("ricochet", "sn_bulletricochet02");
scr_soundbank_addSound("ricochet", "sn_bulletricochet03");
scr_soundbank_addSound("ricochet", "sn_bulletricochet04");

scr_soundbank_addSound("acid_impact", "sn_hoopz_acidhit01");
scr_soundbank_addSound("acid_impact", "sn_hoopz_acidhit02");
scr_soundbank_addSound("acid_impact", "sn_hoopz_acidhit03");

scr_soundbank_addSound("fire_impact", "sn_hoopz_firehit01");
scr_soundbank_addSound("fire_impact", "sn_hoopz_firehit02");
scr_soundbank_addSound("fire_impact", "sn_hoopz_firehit03");
scr_soundbank_addSound("fire_impact", "sn_hoopz_firehit04");

scr_soundbank_addSound("largebullet_impact", "sn_hoopz_largebullethit01");
scr_soundbank_addSound("largebullet_impact", "sn_hoopz_largebullethit02");
scr_soundbank_addSound("largebullet_impact", "sn_hoopz_largebullethit03");

scr_soundbank_addSound("mediumbullet_impact", "sn_hoopz_mediumbullethit01");
scr_soundbank_addSound("mediumbullet_impact", "sn_hoopz_mediumbullethit02");
scr_soundbank_addSound("mediumbullet_impact", "sn_hoopz_mediumbullethit03");

scr_soundbank_addSound("smallbullet_impact", "sn_hoopz_smallbullethit01");
scr_soundbank_addSound("smallbullet_impact", "sn_hoopz_smallbullethit02");
scr_soundbank_addSound("smallbullet_impact", "sn_hoopz_smallbullethit03");

scr_soundbank_addSound("slash_impact", "sn_hoopz_slashhit01");
scr_soundbank_addSound("slash_impact", "sn_hoopz_slashhit02");
scr_soundbank_addSound("slash_impact", "sn_hoopz_slashhit03");
scr_soundbank_addSound("slash_impact", "sn_hoopz_slashhit04");

//////////////////
////NOTE SELECTOR
scr_soundbank_addSound("note_light", "sn_mnu_noteFlipLight01");
scr_soundbank_addSound("note_medium", "sn_mnu_noteFlipMedium01");
scr_soundbank_addSound("note_heavy", "sn_mnu_noteFlipHeavy01");

//////////////////
////UTILITY STATION SOUNDS

scr_soundbank_addSound("utility_open", "sn_utility_open");
scr_soundbank_addSound("utility_close", "sn_utility_close");

scr_soundbank_addSound("utility_button_click", "sn_utilitycursor_buttonclick01");
scr_soundbank_addSound("utility_button_analogclick", "sn_utilitycursor_buttonanalogclick01");
scr_soundbank_addSound("utility_button_disabled", "sn_utilitycursor_buttondisabled01");


//////////////////
////PAUSE MENU SOUNDS

scr_soundbank_addSound("pausemenu_click", "sn_cursor_pausemenu01");


//////////////////
////HUD SOUNDS
scr_soundbank_addSound("periodic_charged", "sn_periodic_charged01");
scr_soundbank_addSound("periodic_released", "sn_periodic_released01");
scr_soundbank_addSound("periodic_charged_muted", "sn_periodic_charged_muted01");
scr_soundbank_addSound("periodic_released_muted", "sn_periodic_released_muted01");

/////////////////
////ENEMIES

///explosive rats
scr_soundbank_addSound("explosiverat_alert", "sn_sewers_explosiverats_alert01");
scr_soundbank_addSound("explosiverat_alert", "sn_sewers_explosiverats_alert02");
scr_soundbank_addSound("explosiverat_alert", "sn_sewers_explosiverats_alert03");
scr_soundbank_addSound("explosiverat_hurt", "sn_sewers_explosiverats_hurt01");
scr_soundbank_addSound("explosiverat_hurt", "sn_sewers_explosiverats_hurt02");
scr_soundbank_addSound("explosiverat_hurt", "sn_sewers_explosiverats_hurt03");
scr_soundbank_addSound("explosiverat_death", "sn_sewers_explosiverats_explode01");
scr_soundbank_addSound("explosiverat_death", "sn_sewers_explosiverats_explode02");
scr_soundbank_addSound("explosiverat_death", "sn_sewers_explosiverats_explode03");
scr_soundbank_addSound("explosiverat_stopandlook", "sn_sewers_explosiverats_alert01");
scr_soundbank_addSound("explosiverat_stopandlook", "sn_sewers_explosiverats_alert02");
scr_soundbank_addSound("explosiverat_stopandlook", "sn_sewers_explosiverats_alert03");

/// dark rats
scr_soundbank_addSound("darkrat_alert", "sn_enemy_cyberrat_alert01");
scr_soundbank_addSound("darkrat_hurt", "sn_enemy_cyberrat_hurt01");
scr_soundbank_addSound("darkrat_death", "sn_enemy_cyberrat_death01");
scr_soundbank_addSound("darkrat_stopandlook", "sn_enemy_cyberrat_alert01");

/// cyber rats
scr_soundbank_addSound("cyberrat_alert", "sn_enemy_cyberrat_alert01");
scr_soundbank_addSound("cyberrat_hurt", "sn_enemy_cyberrat_hurt01");
scr_soundbank_addSound("cyberrat_death", "sn_enemy_cyberrat_death01");
scr_soundbank_addSound("cyberrat_stopandlook", "sn_enemy_cyberrat_alert01");

///oildrum
scr_soundbank_addSound("oildrum_hurt", "sn_generic_thinmetal01");
scr_soundbank_addSound("oildrum_hurt", "sn_generic_thinmetal02");
scr_soundbank_addSound("oildrum_hurt", "sn_generic_thinmetal03");
scr_soundbank_addSound("oildrum_death", "sn_oilbarrel_explosion01");
scr_soundbank_addSound("oildrum_death", "sn_oilbarrel_explosion02");
scr_soundbank_addSound("oildrum_death", "sn_oilbarrel_explosion03");

///cybergremins
scr_soundbank_addSound("cGremlinSmall_alert", "sn_enemy_cybergremlin_battlecry01");
scr_soundbank_addSound("cGremlinSmall_alert", "sn_enemy_cybergremlin_battlecry02");
scr_soundbank_addSound("cGremlinSmall_attack", "sn_enemy_cybergremlin_atk01");
scr_soundbank_addSound("cGremlinSmall_attack", "sn_enemy_cybergremlin_atk02");
scr_soundbank_addSound("cGremlinSmall_attack", "sn_enemy_cybergremlin_atk03");
scr_soundbank_addSound("cGremlinSmall_gunattack", "sn_enemy_cybergremlin_gun01");
scr_soundbank_addSound("cGremlinSmall_gunattack", "sn_enemy_cybergremlin_gun02");
scr_soundbank_addSound("cGremlinSmall_gunattack", "sn_enemy_cybergremlin_gun03");
scr_soundbank_addSound("cGremlinSmall_gunattack", "sn_enemy_cybergremlin_gun04");
scr_soundbank_addSound("cGremlinSmall_death", "sn_enemy_cybergremlin_death01");
scr_soundbank_addSound("cGremlinSmall_death", "sn_enemy_cybergremlin_death02");
scr_soundbank_addSound("cGremlinSmall_death", "sn_enemy_cybergremlin_death03");
scr_soundbank_addSound("cGremlinSmall_grunt", "sn_enemy_cybergremlin_grunt01");
scr_soundbank_addSound("cGremlinSmall_grunt", "sn_enemy_cybergremlin_grunt02");
scr_soundbank_addSound("cGremlinSmall_grunt", "sn_enemy_cybergremlin_grunt03");
scr_soundbank_addSound("cGremlinSmall_grunt", "sn_enemy_cybergremlin_grunt04");
scr_soundbank_addSound("cGremlinSmall_scream", "sn_enemy_cybergremlin_scream01");
scr_soundbank_addSound("cGremlinSmall_scream", "sn_enemy_cybergremlin_scream02");
scr_soundbank_addSound("cGremlinSmall_swipe", "sn_enemy_cybergremlin_swipe01");
scr_soundbank_addSound("cGremlinSmall_swipe", "sn_enemy_cybergremlin_swipe02");
scr_soundbank_addSound("cGremlinSmall_swipe", "sn_enemy_cybergremlin_swipe03");
scr_soundbank_addSound("cGremlinSmall_swipe", "sn_enemy_cybergremlin_swipe04");
scr_soundbank_addSound("cGremlinJetpack_hover", "sn_enemy_cybergremlin_jetpack1");
scr_soundbank_addSound("cGremlinJetpack_hover", "sn_enemy_cybergremlin_jetpack2");
scr_soundbank_addSound("cGremlinJetpack_hover", "sn_enemy_cybergremlin_jetpack3");

///duergars
scr_soundbank_addSound("duergar_alert", "sn_enemy_duergar_battlecry01");
scr_soundbank_addSound("duergar_alert", "sn_enemy_duergar_battlecry02");                       
scr_soundbank_addSound("duergar_death", "sn_enemy_duergar_death01");
scr_soundbank_addSound("duergar_death", "sn_enemy_duergar_death02");
scr_soundbank_addSound("duergar_death", "sn_enemy_duergar_death03");
scr_soundbank_addSound("duergar_grunt", "sn_enemy_duergar_grunt01");
scr_soundbank_addSound("duergar_grunt", "sn_enemy_duergar_grunt02");
scr_soundbank_addSound("duergar_grunt", "sn_enemy_duergar_grunt03");
scr_soundbank_addSound("duergar_shot", "sn_enemy_duergar_shot01");
scr_soundbank_addSound("duergar_shot", "sn_enemy_duergar_shot02");
scr_soundbank_addSound("duergar_footstep", "sn_enemy_duergar_leftfoot");
scr_soundbank_addSound("duergar_footstep", "sn_enemy_duergar_rightfoot");
scr_soundbank_addSound("duergar_brute_swipe", "sn_enemy_duergar_swipe01");
scr_soundbank_addSound("duergar_brute_swipe", "sn_enemy_duergar_swipe02");
scr_soundbank_addSound("duergar_brute_swipe", "sn_enemy_duergar_swipe03");
scr_soundbank_addSound("duergar_brute_impact", "sn_enemy_duergar_impact01");
scr_soundbank_addSound("duergar_brute_impact", "sn_enemy_duergar_impact02");
scr_soundbank_addSound("duergar_brute_impact", "sn_enemy_duergar_impact03");
scr_soundbank_addSound("duergar_wizard_alert", "sn_enemy_duergar_wizardcry01");
scr_soundbank_addSound("duergar_wizard_fireball", "sn_enemy_duergars_wizardfireball01");
scr_soundbank_addSound("duergar_wizard_fireball", "sn_enemy_duergars_wizardfireball02");
scr_soundbank_addSound("duergar_wizard_fireball", "sn_enemy_duergars_wizardfireball03");
scr_soundbank_addSound("duergar_shield", "sn_generic_metalres01");
scr_soundbank_addSound("duergar_shield", "sn_generic_metalres02");
scr_soundbank_addSound("duergar_shield", "sn_generic_metalres03");

////sewerbeasts
scr_soundbank_addSound("sewerbeast_alert", "sn_enemy_sewerbeast_battlecry01");
scr_soundbank_addSound("sewerbeast_alert", "sn_enemy_sewerbeast_battlecry02");
scr_soundbank_addSound("sewerbeast_warn", "sn_enemy_sewerbeast_scream01");
scr_soundbank_addSound("sewerbeast_warn", "sn_enemy_sewerbeast_scream02");
scr_soundbank_addSound("sewerbeast_whip", "sn_sewerbeastwhip01");
scr_soundbank_addSound("sewerbeast_whip", "sn_sewerbeastwhip02");
scr_soundbank_addSound("sewerbeast_whip", "sn_sewerbeastwhip03");
scr_soundbank_addSound("sewerbeast_spit", "sn_enemy_sewerbeast_spit01");
scr_soundbank_addSound("sewerbeast_spit", "sn_enemy_sewerbeast_spit02");
scr_soundbank_addSound("sewerbeast_spit", "sn_enemy_sewerbeast_spit03");
scr_soundbank_addSound("sewerbeast_hit", "sn_enemy_sewerbeast_hit01");
scr_soundbank_addSound("sewerbeast_hit", "sn_enemy_sewerbeast_hit02");
scr_soundbank_addSound("sewerbeast_death", "sn_enemy_sewerbeast_death01");
scr_soundbank_addSound("sewerbeast_death", "sn_enemy_sewerbeast_death02");
scr_soundbank_addSound("sewerbeast_death", "sn_enemy_sewerbeast_death03");
scr_soundbank_addSound("sewerbeast_jump", "sn_enemy_sewerbeast_jump01");
////sewerbeast jr
scr_soundbank_addSound("sewerbeastJr_alert", "sn_enemy_sewerbeastjr_scream01");
scr_soundbank_addSound("sewerbeastJr_alert", "sn_enemy_sewerbeastjr_scream02");
scr_soundbank_addSound("swerebeastJr_warn", "sn_enemy_sewerbeast_battlecryjr01");
scr_soundbank_addSound("sewerbeastJr_warn", "sn_enemy_sewerbeast_battlecryjr02");
scr_soundbank_addSound("sewerbeastJr_warn", "sn_enemy_sewerbeast_battlecryjr03");
scr_soundbank_addSound("sewerbeastJr_hit", "sn_enemy_sewerbeast_hitjr01");
scr_soundbank_addSound("sewerbeastJr_hit", "sn_enemy_sewerbeast_hitjr02");
scr_soundbank_addSound("sewerbeastJr_hit", "sn_enemy_sewerbeast_hitjr03"); 
scr_soundbank_addSound("sewerbeastJr_spit", "sn_enemy_sewerbeastjr_spit01");
scr_soundbank_addSound("sewerbeastJr_spit", "sn_enemy_sewerbeastjr_spit02");
scr_soundbank_addSound("sewerbeastJr_spit", "sn_enemy_sewerbeastjr_spit03");
scr_soundbank_addSound("sewerbeastJr_death", "sn_enemy_sewerbeastjr_death01");
scr_soundbank_addSound("sewerbeastJr_death", "sn_enemy_sewerbeastjr_death02");
scr_soundbank_addSound("sewerbeastJr_death", "sn_enemy_sewerbeastjr_death03");
////swampman
scr_soundbank_addSound("swampman_alert", "sn_enemy_swampman_battlecry01");
scr_soundbank_addSound("swampman_alert", "sn_enemy_swampman_battlecry02");
scr_soundbank_addSound("swampman_alert", "sn_enemy_swampman_battlecry03");
scr_soundbank_addSound("swampman_warn", "sn_enemy_swampman_atk01");
scr_soundbank_addSound("swampman_warn", "sn_enemy_swampman_atk02");
scr_soundbank_addSound("swampman_warn", "sn_enemy_swampman_atk03");
scr_soundbank_addSound("swampman_strike", "sn_enemy_swampman_strike01"); 
scr_soundbank_addSound("swampman_strike", "sn_enemy_swampman_strike02"); 
scr_soundbank_addSound("swampman_strike", "sn_enemy_swampman_strike03"); 
scr_soundbank_addSound("swampman_footstepwater", "sn_enemy_swampman_leftfootwater01");
scr_soundbank_addSound("swampman_footstepwater", "sn_enemy_swampman_rightfootwater01");
scr_soundbank_addSound("swampman_footstepland", "sn_enemy_swampman_leftfootland01");
scr_soundbank_addSound("swampman_footstepland", "sn_enemy_swampman_rightfootland01");
scr_soundbank_addSound("swampman_death", "sn_enemy_swampman_death01");
scr_soundbank_addSound("swampman_death", "sn_enemy_swampman_death02");
scr_soundbank_addSound("swampman_death", "sn_enemy_swampman_death03");
scr_soundbank_addSound("swampman_hurt", "sn_enemy_swampman_grunt01");
scr_soundbank_addSound("swampman_hurt", "sn_enemy_swampman_grunt02");
scr_soundbank_addSound("swampman_hurt", "sn_enemy_swampman_grunt03");
////kobold
scr_soundbank_addSound("kobold_charge_small", "sn_enemy_kobold_small_atk01");
scr_soundbank_addSound("kobold_charge_small", "sn_enemy_kobold_small_atk02");
scr_soundbank_addSound("kobold_charge_small", "sn_enemy_kobold_small_atk03");

scr_soundbank_addSound("kobold_charge_med", "sn_enemy_kobold_medium_atk01");
scr_soundbank_addSound("kobold_charge_med", "sn_enemy_kobold_medium_atk02");
scr_soundbank_addSound("kobold_charge_med", "sn_enemy_kobold_medium_atk03");

scr_soundbank_addSound("kobold_grunt_small", "sn_enemy_kobold_small_grunt01");
scr_soundbank_addSound("kobold_grunt_small", "sn_enemy_kobold_small_grunt02");
scr_soundbank_addSound("kobold_grunt_small", "sn_enemy_kobold_small_grunt03");

scr_soundbank_addSound("kobold_death_small", "sn_enemy_kobold_small_death01");
scr_soundbank_addSound("kobold_death_small", "sn_enemy_kobold_small_death01");
scr_soundbank_addSound("kobold_death_small", "sn_enemy_kobold_small_death01");
scr_soundbank_addSound("kobold_death_small", "sn_enemy_kobold_small_death01");

scr_soundbank_addSound("kobold_splatter", "sn_enemy_kobold_splatter01");
scr_soundbank_addSound("kobold_splatter", "sn_enemy_kobold_splatter02");
scr_soundbank_addSound("kobold_splatter", "sn_enemy_kobold_splatter03");
scr_soundbank_addSound("kobold_splatter", "sn_enemy_kobold_splatter04");
scr_soundbank_addSound("kobold_splatter", "sn_enemy_kobold_splatter05");
scr_soundbank_addSound("kobold_splatter", "sn_enemy_kobold_splatter06");

scr_soundbank_addSound("kobold_spawn", "sn_enemy_kobold_clone01");
scr_soundbank_addSound("kobold_spawn", "sn_enemy_kobold_clone02");
scr_soundbank_addSound("kobold_spawn", "sn_enemy_kobold_clone03");

scr_soundbank_addSound("kobold_alert", "sn_enemy_kobold_medium_battlecry01");
scr_soundbank_addSound("kobold_alert", "sn_enemy_kobold_medium_battlecry02");
scr_soundbank_addSound("kobold_alert", "sn_enemy_kobold_medium_battlecry03");
scr_soundbank_addSound("kobold_alert", "sn_enemy_kobold_medium_battlecry04");
scr_soundbank_addSound("kobold_attack", "sn_enemy_kobold_medium_atk01");
scr_soundbank_addSound("kobold_attack", "sn_enemy_kobold_medium_atk02");
scr_soundbank_addSound("kobold_attack", "sn_enemy_kobold_medium_atk03");
scr_soundbank_addSound("kobold_attack", "sn_enemy_kobold_medium_atk04");
scr_soundbank_addSound("kobold_clone", "sn_enemy_kobold_clone01");
scr_soundbank_addSound("kobold_clone", "sn_enemy_kobold_clone02");
scr_soundbank_addSound("kobold_clone", "sn_enemy_kobold_clone03");
scr_soundbank_addSound("kobold_death", "sn_enemy_kobold_medium_death01");
scr_soundbank_addSound("kobold_death", "sn_enemy_kobold_medium_death02");
scr_soundbank_addSound("kobold_death", "sn_enemy_kobold_medium_death03");
scr_soundbank_addSound("kobold_death", "sn_enemy_kobold_medium_death04");
scr_soundbank_addSound("kobold_grunt", "sn_enemy_kobold_medium_grunt01");
scr_soundbank_addSound("kobold_grunt", "sn_enemy_kobold_medium_grunt02");
scr_soundbank_addSound("kobold_grunt", "sn_enemy_kobold_medium_grunt03");
scr_soundbank_addSound("kobold_swipe", "sn_enemy_kobold_swipe01");
scr_soundbank_addSound("kobold_swipe", "sn_enemy_kobold_swipe02");
scr_soundbank_addSound("kobold_swipe", "sn_enemy_kobold_swipe03");
scr_soundbank_addSound("kobold_spit", "sn_enemy_kobold_spit01");
scr_soundbank_addSound("kobold_spit", "sn_enemy_kobold_spit02");
scr_soundbank_addSound("kobold_spit", "sn_enemy_kobold_spit03");
///Plant Mimic
scr_soundbank_addSound("plantmimic_death", "sn_plantmimic_death01");
scr_soundbank_addSound("plantmimic_death", "sn_plantmimic_death02");
scr_soundbank_addSound("plantmimic_death", "sn_plantmimic_death03");
scr_soundbank_addSound("plantmimic_scream", "sn_plantmimic_battlecry01");
scr_soundbank_addSound("plantmimic_scream", "sn_plantmimic_battlecry02");
scr_soundbank_addSound("plantmimic_scream", "sn_plantmimic_battlecry03");
scr_soundbank_addSound("plantmimic_hurt", "sn_plantmimic_hurt01");
scr_soundbank_addSound("plantmimic_hurt", "sn_plantmimic_hurt02");
scr_soundbank_addSound("plantmimic_hurt", "sn_plantmimic_hurt03");
scr_soundbank_addSound("plantmimic_warn", "sn_plantmimic_warn01");
scr_soundbank_addSound("plantmimic_warn", "sn_plantmimic_warn02");
scr_soundbank_addSound("plantmimic_warn", "sn_plantmimic_warn03");
scr_soundbank_addSound("plantmimic_strike", "sn_plantmimic_strike01");
scr_soundbank_addSound("plantmimic_strike", "sn_plantmimic_strike02");
scr_soundbank_addSound("plantmimic_strike", "sn_plantmimic_strike03");

///vine monster
scr_soundbank_addSound("vinemonster_death", "sn_enemy_vinemonster_death01");
scr_soundbank_addSound("vinemonster_death", "sn_enemy_vinemonster_death02");
scr_soundbank_addSound("vinemonster_death", "sn_enemy_vinemonster_death03");
scr_soundbank_addSound("vinemonster_hurt", "sn_enemy_vinemonster_hurt01");
scr_soundbank_addSound("vinemonster_hurt", "sn_enemy_vinemonster_hurt02");
scr_soundbank_addSound("vinemonster_hurt", "sn_enemy_vinemonster_hurt03");
scr_soundbank_addSound("vinemonster_alert", "sn_enemy_vinemonster_alert01");
scr_soundbank_addSound("vinemonster_alert", "sn_enemy_vinemonster_alert02");
scr_soundbank_addSound("vinemonster_alert", "sn_enemy_vinemonster_alert03");
scr_soundbank_addSound("vinemonster_scream", "sn_enemy_vinemonster_scream01");
scr_soundbank_addSound("vinemonster_scream", "sn_enemy_vinemonster_scream02");
scr_soundbank_addSound("vinemonster_scream", "sn_enemy_vinemonster_scream03");
scr_soundbank_addSound("vinemonster_spit", "sn_enemy_vinemonster_spit01");
scr_soundbank_addSound("vinemonster_spit", "sn_enemy_vinemonster_spit02");
scr_soundbank_addSound("vinemonster_spit", "sn_enemy_vinemonster_spit03");



///junkbot
scr_soundbank_addSound("junkbot_death", "sn_junkbot_death01");
scr_soundbank_addSound("junkbot_death", "sn_junkbot_death02");
scr_soundbank_addSound("junkbot_death", "sn_junkbot_death03");
scr_soundbank_addSound("junkbot_hurt", "sn_junkbot_hurt01");
scr_soundbank_addSound("junkbot_hurt", "sn_junkbot_hurt02");
scr_soundbank_addSound("junkbot_hurt", "sn_junkbot_hurt03");
scr_soundbank_addSound("junkbot_hurt", "sn_junkbot_hurt04");
scr_soundbank_addSound("junkbot_hurt", "sn_junkbot_hurt05");
scr_soundbank_addSound("junkbot_hurt", "sn_junkbot_hurt06");
scr_soundbank_addSound("junkbot_hurt", "sn_junkbot_hurt07");
scr_soundbank_addSound("junkbot_hurt", "sn_junkbot_hurt08");
scr_soundbank_addSound("junkbot_chainsaw", "sn_junkbot_chainsaw01");
scr_soundbank_addSound("junkbot_chainsaw", "sn_junkbot_chainsaw02");
scr_soundbank_addSound("junkbot_chainsaw", "sn_junkbot_chainsaw03");
scr_soundbank_addSound("junkbot_pickuppart", "sn_junkbot_pickuppart01");
scr_soundbank_addSound("junkbot_pickuppart", "sn_junkbot_pickuppart02");
scr_soundbank_addSound("junkbot_pickuppart", "sn_junkbot_pickuppart03");
scr_soundbank_addSound("junkbot_connectpart", "sn_junkbot_connectpart01");
scr_soundbank_addSound("junkbot_connectpart", "sn_junkbot_connectpart02");
scr_soundbank_addSound("junkbot_connectpart", "sn_junkbot_connectpart03");
scr_soundbank_addSound("junkbot_death_partclink", "sn_junkbot_partclink01");
scr_soundbank_addSound("junkbot_death_partclink", "sn_junkbot_partclink02");
scr_soundbank_addSound("junkbot_death_partclink", "sn_junkbot_partclink03");
scr_soundbank_addSound("junkbot_death_partclink", "sn_junkbot_partclink04");
scr_soundbank_addSound("junkbot_death_partclink", "sn_junkbot_partclink05");
scr_soundbank_addSound("junkbot_death_partclink", "sn_junkbot_partclink06");
scr_soundbank_addSound("junkbot_death_partclink", "sn_junkbot_partclink07");
scr_soundbank_addSound("junkbot_death_partclink", "sn_junkbot_partclink08");
scr_soundbank_addSound("junkbot_death_partclink", "sn_junkbot_partclink09");
scr_soundbank_addSound("junkbot_death_partclink", "sn_junkbot_partclink10");
scr_soundbank_addSound("junkbot_death_partclink", "sn_junkbot_partclink11");
scr_soundbank_addSound("junkbot_death_partclink", "sn_junkbot_partclink12");
scr_soundbank_addSound("junkbot_death_partclink", "sn_junkbot_partclink13");
scr_soundbank_addSound("junkbot_death_partclink", "sn_junkbot_partclink14");
scr_soundbank_addSound("junkbot_death_partclink", "sn_junkbot_partclink15");
scr_soundbank_addSound("junkbot_death_partclink", "sn_junkbot_partclink16");
scr_soundbank_addSound("junkbot_tires_hop", "sn_junkbot_tires_hop01");
scr_soundbank_addSound("junkbot_tires_hop", "sn_junkbot_tires_hop02");
scr_soundbank_addSound("junkbot_tires_hop", "sn_junkbot_tires_hop03");
scr_soundbank_addSound("junkbot_tires_land", "sn_junkbot_tires_land01");
scr_soundbank_addSound("junkbot_tires_land", "sn_junkbot_tires_land02");
scr_soundbank_addSound("junkbot_tires_land", "sn_junkbot_tires_land03");
scr_soundbank_addSound("junkbot_washingmachine_rumble", "sn_junkbot_washingmachine01");
scr_soundbank_addSound("junkbot_washingmachine_rumble", "sn_junkbot_washingmachine02");
scr_soundbank_addSound("junkbot_washingmachine_rumble", "sn_junkbot_washingmachine03");
scr_soundbank_addSound("junkbot_washingmachine_rumble", "sn_junkbot_washingmachine04");
scr_soundbank_addSound("junkbot_washingmachine_rumble", "sn_junkbot_washingmachine05");
scr_soundbank_addSound("junkbot_missile_fire", "sn_junkbot_missile_fire01");
scr_soundbank_addSound("junkbot_missile_fire", "sn_junkbot_missile_fire02");
scr_soundbank_addSound("junkbot_missile_fire", "sn_junkbot_missile_fire03");
scr_soundbank_addSound("junkbot_missile_impact", "sn_junkbot_missile_impact01");
scr_soundbank_addSound("junkbot_missile_impact", "sn_junkbot_missile_impact02");
scr_soundbank_addSound("junkbot_missile_impact", "sn_junkbot_missile_impact03");
scr_soundbank_addSound("junkbot_gas_spray", "sn_junkbot_gas_spray01");
scr_soundbank_addSound("junkbot_gas_spray", "sn_junkbot_gas_spray02");
scr_soundbank_addSound("junkbot_gas_spray", "sn_junkbot_gas_spray03");
scr_soundbank_addSound("junkbot_flamethrower_flare", "sn_junkbot_flame01");
scr_soundbank_addSound("junkbot_flamethrower_flare", "sn_junkbot_flame02");
scr_soundbank_addSound("junkbot_flamethrower_flare", "sn_junkbot_flame03");
scr_soundbank_addSound("junkbot_flamethrower_breath", "sn_junkbot_breath01");
scr_soundbank_addSound("junkbot_flamethrower_breath", "sn_junkbot_breath02");
scr_soundbank_addSound("junkbot_flamethrower_breath", "sn_junkbot_breath03");

////brain menace
scr_soundbank_addSound("brainmenace_footstep", "sn_enemy_brainmenace_frontstride01");
scr_soundbank_addSound("brainmenace_attack", "sn_enemy_brainmenace_atk01");
scr_soundbank_addSound("brainmenace_attack", "sn_enemy_brainmenace_atk02");
scr_soundbank_addSound("brainmenace_attack", "sn_enemy_brainmenace_atk03");
scr_soundbank_addSound("brainmenace_attack", "sn_enemy_brainmenace_atk04");
scr_soundbank_addSound("brainmenace_grunt", "sn_enemy_brainmenace_grunt01");
scr_soundbank_addSound("brainmenace_grunt", "sn_enemy_brainmenace_grunt02");
scr_soundbank_addSound("brainmenace_grunt", "sn_enemy_brainmenace_grunt03");
scr_soundbank_addSound("brainmenace_grunt", "sn_enemy_brainmenace_grunt04");
scr_soundbank_addSound("brainmenace_death", "sn_enemy_brainmenace_death01");
scr_soundbank_addSound("brainmenace_death", "sn_enemy_brainmenace_death02");
scr_soundbank_addSound("brainmenace_death", "sn_enemy_brainmenace_death03");
scr_soundbank_addSound("brainmenace_scream", "sn_enemy_brainmenace_scream01");
scr_soundbank_addSound("brainmenace_scream", "sn_enemy_brainmenace_scream02");
scr_soundbank_addSound("brainmenace_tackle", "sn_enemy_brainmenace_tackle01");
scr_soundbank_addSound("brainmenace_tackle", "sn_enemy_brainmenace_tackle02");
scr_soundbank_addSound("brainmenace_tackle", "sn_enemy_brainmenace_tackle03");
scr_soundbank_addSound("brainmenace_slash", "sn_enemy_brainmenace_slash01");
scr_soundbank_addSound("brainmenace_slash", "sn_enemy_brainmenace_slash02");
scr_soundbank_addSound("brainmenace_slash", "sn_enemy_brainmenace_slash03");

scr_soundbank_addSound("brainmenace_death", "sn_enemy_brainmenace_death01");
scr_soundbank_addSound("brainmenace_death", "sn_enemy_brainmenace_death02");
scr_soundbank_addSound("brainmenace_death", "sn_enemy_brainmenace_death03");

scr_soundbank_addSound("brainmenace_hurt", "sn_enemy_brainmenace_grunt01");
scr_soundbank_addSound("brainmenace_hurt", "sn_enemy_brainmenace_grunt02");
scr_soundbank_addSound("brainmenace_hurt", "sn_enemy_brainmenace_grunt03");

scr_soundbank_addSound("brainmenace_fallonback", "sn_enemy_brainmenace_frontstride01");

scr_soundbank_addSound("brainmenace_leap_prepare", "sn_enemy_brainmenace_prepare01");
scr_soundbank_addSound("brainmenace_leap_prepare", "sn_enemy_brainmenace_prepare02");
scr_soundbank_addSound("brainmenace_leap_prepare", "sn_enemy_brainmenace_prepare03");
scr_soundbank_addSound("brainmenace_leap_jump", "sn_enemy_brainmenace_jump01");
scr_soundbank_addSound("brainmenace_leap_jump", "sn_enemy_brainmenace_jump02");
scr_soundbank_addSound("brainmenace_leap_jump", "sn_enemy_brainmenace_jump03");
scr_soundbank_addSound("brainmenace_leap_smash", "sn_enemy_brainmenace_smash01");
scr_soundbank_addSound("brainmenace_leap_smash", "sn_enemy_brainmenace_smash02");
scr_soundbank_addSound("brainmenace_leap_smash", "sn_enemy_brainmenace_smash03");

///// alien egg 
scr_soundbank_addSound("brainegg_hatch", "sn_enemy_babyalien_birth01");
scr_soundbank_addSound("brainegg_hatch", "sn_enemy_babyalien_birth02");

scr_soundbank_addSound("brainegg_hurt", "sn_enemy_babyalien_egghurt01");
scr_soundbank_addSound("brainegg_hurt", "sn_enemy_babyalien_egghurt02");
scr_soundbank_addSound("brainegg_hurt", "sn_enemy_babyalien_egghurt03");

scr_soundbank_addSound("brainegg_death", "sn_enemy_babyalien_death01");
scr_soundbank_addSound("brainegg_death", "sn_enemy_babyalien_death02");
scr_soundbank_addSound("brainegg_death", "sn_enemy_babyalien_death03");

/////baby alien
scr_soundbank_addSound("brainbaby_alert", "sn_enemy_babyalien_alert01");
scr_soundbank_addSound("brainbaby_alert", "sn_enemy_babyalien_alert02");
scr_soundbank_addSound("brainbaby_alert", "sn_enemy_babyalien_alert03");

scr_soundbank_addSound("brainbaby_hurt", "sn_enemy_babyalien_hurt01");
scr_soundbank_addSound("brainbaby_hurt", "sn_enemy_babyalien_hurt02");
scr_soundbank_addSound("brainbaby_hurt", "sn_enemy_babyalien_hurt03");

scr_soundbank_addSound("brainbaby_attack", "sn_enemy_babyalien_atk01");
scr_soundbank_addSound("brainbaby_attack", "sn_enemy_babyalien_atk02");
scr_soundbank_addSound("brainbaby_attack", "sn_enemy_babyalien_atk03");

scr_soundbank_addSound("brainbaby_birth", "sn_enemy_babyalien_birth01");
scr_soundbank_addSound("brainbaby_birth", "sn_enemy_babyalien_birth02");
scr_soundbank_addSound("brainbaby_death", "sn_enemy_babyalien_death01");
scr_soundbank_addSound("brainbaby_death", "sn_enemy_babyalien_death02");
scr_soundbank_addSound("brainbaby_death", "sn_enemy_babyalien_death03");

// NOT USED
//scr_soundbank_addSound("brainbaby_swipe", "sn_enemy_babyalien_swipe01");
//scr_soundbank_addSound("brainbaby_swipe", "sn_enemy_babyalien_swipe02");
//scr_soundbank_addSound("brainbaby_swipe", "sn_enemy_babyalien_swipe03");

////werecrocs
scr_soundbank_addSound("croc_death", "sn_werecroc_death01");
scr_soundbank_addSound("croc_death", "sn_werecroc_death02");
scr_soundbank_addSound("croc_death", "sn_werecroc_death03");
scr_soundbank_addSound("croc_grunt", "sn_werecroc_grunt01");
scr_soundbank_addSound("croc_grunt", "sn_werecroc_grunt02");
scr_soundbank_addSound("croc_grunt", "sn_werecroc_grunt03");
scr_soundbank_addSound("croc_attack", "sn_werecroc_attack01");
scr_soundbank_addSound("croc_attack", "sn_werecroc_attack02");
scr_soundbank_addSound("croc_attack", "sn_werecroc_attack03");
scr_soundbank_addSound("croc_hunger", "sn_werecroc_hunger01");
scr_soundbank_addSound("croc_hunger", "sn_werecroc_hunger02");
scr_soundbank_addSound("croc_hunger", "sn_werecroc_hunger03");
scr_soundbank_addSound("croc_snap_kill", "sn_werecroc_snapkill01");
scr_soundbank_addSound("croc_snap_kill", "sn_werecroc_snapkill02");
scr_soundbank_addSound("croc_snap_kill", "sn_werecroc_snapkill03");
scr_soundbank_addSound("croc_warn", "sn_werecroc_prehit01");
scr_soundbank_addSound("croc_warn", "sn_werecroc_prehit02");
scr_soundbank_addSound("croc_warn", "sn_werecroc_prehit03");

////weresnails
scr_soundbank_addSound("weresnail_death", "sn_weresnail_death01");
scr_soundbank_addSound("weresnail_death", "sn_weresnail_death02");
scr_soundbank_addSound("weresnail_death", "sn_weresnail_death03");
scr_soundbank_addSound("weresnail_hurt", "sn_weresnail_hurt01");
scr_soundbank_addSound("weresnail_hurt", "sn_weresnail_hurt02");
scr_soundbank_addSound("weresnail_hurt", "sn_weresnail_hurt03");
scr_soundbank_addSound("weresnail_battlecry", "sn_weresnail_battlecry01");
scr_soundbank_addSound("weresnail_battlecry", "sn_weresnail_battlecry02");
scr_soundbank_addSound("weresnail_battlecry", "sn_weresnail_battlecry03");
scr_soundbank_addSound("weresnail_warn", "sn_weresnail_attack01");
scr_soundbank_addSound("weresnail_warn", "sn_weresnail_attack02");
scr_soundbank_addSound("weresnail_warn", "sn_weresnail_attack03");
scr_soundbank_addSound("weresnail_shoot", "sn_weresnail_shotgun01");
scr_soundbank_addSound("weresnail_shoot", "sn_weresnail_shotgun02");
scr_soundbank_addSound("weresnail_shoot", "sn_weresnail_shotgun03");
scr_soundbank_addSound("weresnail_swim", "sn_weresnail_swim01");
scr_soundbank_addSound("weresnail_swim", "sn_weresnail_swim02");
scr_soundbank_addSound("weresnail_swim", "sn_weresnail_swim03");
scr_soundbank_addSound("weresnail_slime", "sn_weresnail_slime01");
scr_soundbank_addSound("weresnail_slime", "sn_weresnail_slime02");
scr_soundbank_addSound("weresnail_slime", "sn_weresnail_slime03");

/////Catfish
//##########//
//Catfish small
scr_soundbank_addSound("catfishsmall_death", "sn_catfishsmall_death01");
scr_soundbank_addSound("catfishsmall_death", "sn_catfishsmall_death02");
scr_soundbank_addSound("catfishsmall_death", "sn_catfishsmall_death03");
scr_soundbank_addSound("catfishsmall_grunt", "sn_catfishsmall_grunt01");
scr_soundbank_addSound("catfishsmall_grunt", "sn_catfishsmall_grunt02");
scr_soundbank_addSound("catfishsmall_grunt", "sn_catfishsmall_grunt03");
scr_soundbank_addSound("catfishsmall_alert", "sn_catfishsmall_alert01");
scr_soundbank_addSound("catfishsmall_alert", "sn_catfishsmall_alert02");
scr_soundbank_addSound("catfishsmall_alert", "sn_catfishsmall_alert03");
scr_soundbank_addSound("catfishsmall_attack", "sn_catfishsmall_atk01");
scr_soundbank_addSound("catfishsmall_attack", "sn_catfishsmall_atk02");
scr_soundbank_addSound("catfishsmall_attack", "sn_catfishsmall_atk03");
scr_soundbank_addSound("catfishsmall_shoot", "sn_catfishsmall_dart01");
scr_soundbank_addSound("catfishsmall_shoot", "sn_catfishsmall_dart02");
scr_soundbank_addSound("catfishsmall_shoot", "sn_catfishsmall_dart03");
scr_soundbank_addSound("catfishsmall_pegbreak", "sn_catfishsmall_pegbreak01");
scr_soundbank_addSound("catfishsmall_pegbreak", "sn_catfishsmall_pegbreak02");
scr_soundbank_addSound("catfishsmall_pegbreak", "sn_catfishsmall_pegbreak03");

//Catfish shield
scr_soundbank_addSound("catfishshield_death", "sn_catfishshield_death01");
scr_soundbank_addSound("catfishshield_death", "sn_catfishshield_death02");
scr_soundbank_addSound("catfishshield_death", "sn_catfishshield_death03");
scr_soundbank_addSound("catfishshield_grunt", "sn_catfishshield_grunt01");
scr_soundbank_addSound("catfishshield_grunt", "sn_catfishshield_grunt02");
scr_soundbank_addSound("catfishshield_grunt", "sn_catfishshield_grunt03");
scr_soundbank_addSound("catfishshield_alert", "sn_catfishsmall_alert01");
scr_soundbank_addSound("catfishshield_alert", "sn_catfishsmall_alert02");
scr_soundbank_addSound("catfishshield_alert", "sn_catfishsmall_alert03");
scr_soundbank_addSound("catfishshield_attack", "sn_catfishshield_atk01");
scr_soundbank_addSound("catfishshield_attack", "sn_catfishshield_atk02");
scr_soundbank_addSound("catfishshield_attack", "sn_catfishshield_atk03");
scr_soundbank_addSound("catfishshield_strike", "sn_catfishshield_meleeattack01");
scr_soundbank_addSound("catfishshield_strike", "sn_catfishshield_meleeattack02");
scr_soundbank_addSound("catfishshield_strike", "sn_catfishshield_meleeattack03");
scr_soundbank_addSound("catfishshield_netswing", "sn_catfishshield_netswing01");
scr_soundbank_addSound("catfishshield_netswing", "sn_catfishshield_netswing02");
scr_soundbank_addSound("catfishshield_netswing", "sn_catfishshield_netswing03");
scr_soundbank_addSound("catfishshield_netthrow", "sn_catfishshield_netthrow01");
scr_soundbank_addSound("catfishshield_netthrow", "sn_catfishshield_netthrow02");
scr_soundbank_addSound("catfishshield_netthrow", "sn_catfishshield_netthrow03");

// Catfish nets
scr_soundbank_addSound("catfish_net_impact", "sn_catfishshield_netimpact01");
scr_soundbank_addSound("catfish_net_impact", "sn_catfishshield_netimpact02");
scr_soundbank_addSound("catfish_net_impact", "sn_catfishshield_netimpact03");
scr_soundbank_addSound("catfish_net_netbreak", "sn_catfishshield_linebreak01");
scr_soundbank_addSound("catfish_net_netbreak", "sn_catfishshield_linebreak02");
scr_soundbank_addSound("catfish_net_netbreak", "sn_catfishshield_linebreak03");
scr_soundbank_addSound("catfish_net_netbreak", "sn_catfishshield_linebreak04");
scr_soundbank_addSound("catfish_net_netbreak", "sn_catfishshield_linebreak05");
scr_soundbank_addSound("catfish_net_pegbreak", "sn_catfishsmall_pegbreak01");
scr_soundbank_addSound("catfish_net_pegbreak", "sn_catfishsmall_pegbreak02");
scr_soundbank_addSound("catfish_net_pegbreak", "sn_catfishsmall_pegbreak03");
//##########//

scr_soundbank_addSound("catfish_guts_pickup", "sn_fishbonepickup01");


/////Junkbots
//##########//
//General
scr_soundbank_addSound("junkbot_alert", "sn_junkbot_alarm01");
scr_soundbank_addSound("junkbot_alert", "sn_junkbot_alarm02");
scr_soundbank_addSound("junkbot_alert", "sn_junkbot_alarm03");
scr_soundbank_addSound("junkbot_attack", "sn_junkbot_beatmatk01");
scr_soundbank_addSound("junkbot_shot", "sn_junkbot_laseratk01");
//Skirmisher
scr_soundbank_addSound("skirmisher_laser_warn", "sn_junkbot_laseratk01");
scr_soundbank_addSound("skirmisher_laser_active", "sn_junkbot_lasersustain01");
scr_soundbank_addSound("skirmisher_laser_end", "sn_junkbot_laserrealease01");

//Clamps
scr_soundbank_addSound("clamps_slash", "sn_debug_one");

/////Crabotron
//##########//
scr_soundbank_addSound("crab_leg_lift", "sn_crabtron_legmotor01");
scr_soundbank_addSound("crab_leg_lift", "sn_crabtron_legmotor02");
scr_soundbank_addSound("crab_leg_lift", "sn_crabtron_legmotor03");
scr_soundbank_addSound("crab_leg_land", "sn_crabtron_footstep01");
scr_soundbank_addSound("crab_leg_land", "sn_crabtron_footstep02");
scr_soundbank_addSound("crab_leg_land", "sn_crabtron_footstep03");
scr_soundbank_addSound("crab_leg_land", "sn_crabtron_footstep04");
scr_soundbank_addSound("crab_chatter", "sn_crabtron_alert01");
scr_soundbank_addSound("crab_chatter", "sn_crabtron_alert02");
scr_soundbank_addSound("crab_chatter", "sn_crabtron_alert03");
scr_soundbank_addSound("crab_chatter", "sn_crabtron_alert04");
// Jump
scr_soundbank_addSound("crab_jump", "sn_crabtron_jump01");
scr_soundbank_addSound("crab_jump", "sn_crabtron_jump02");
scr_soundbank_addSound("crab_jump", "sn_crabtron_jump03");
scr_soundbank_addSound("crab_land", "sn_crabtron_land01");
scr_soundbank_addSound("crab_land", "sn_crabtron_land02");
scr_soundbank_addSound("crab_land", "sn_crabtron_land03");
// Furnace
scr_soundbank_addSound("crab_furnace_flare", "sn_crabtron_furnaceflare01");
scr_soundbank_addSound("crab_furnace_flare", "sn_crabtron_furnaceflare02");
scr_soundbank_addSound("crab_furnace_flare", "sn_crabtron_furnaceflare03");
scr_soundbank_addSound("crab_furnace_breath", "sn_crabtron_furnacebreath01");
scr_soundbank_addSound("crab_furnace_breath", "sn_crabtron_furnacebreath02");
scr_soundbank_addSound("crab_furnace_breath", "sn_crabtron_furnacebreath03");
// Photon
scr_soundbank_addSound("crab_photon_spawnleg", "sn_crabtron_photonspawn01");
scr_soundbank_addSound("crab_photon_spawnleg", "sn_crabtron_photonspawn02");
scr_soundbank_addSound("crab_photon_spawnleg", "sn_crabtron_photonspawn03");
scr_soundbank_addSound("crab_photon_spawnleg", "sn_crabtron_photonspawn04");
scr_soundbank_addSound("crab_photon_spawnhead", "sn_crabtron_photonspawn01");
scr_soundbank_addSound("crab_photon_spawnhead", "sn_crabtron_photonspawn02");
scr_soundbank_addSound("crab_photon_spawnhead", "sn_crabtron_photonspawn03");
scr_soundbank_addSound("crab_photon_spawnhead", "sn_crabtron_photonspawn04");
scr_soundbank_addSound("crab_photon_land", "sn_crabtron_photonland01");
scr_soundbank_addSound("crab_photon_land", "sn_crabtron_photonland02");
scr_soundbank_addSound("crab_photon_land", "sn_crabtron_photonland03");
scr_soundbank_addSound("crab_photon_land", "sn_crabtron_photonland04");
scr_soundbank_addSound("crab_photon_looping", "sn_crabtron_photonloop01");
scr_soundbank_addSound("crab_photon_looping", "sn_crabtron_photonloop02");
scr_soundbank_addSound("crab_photon_looping", "sn_crabtron_photonloop03");
scr_soundbank_addSound("crab_photon_looping", "sn_crabtron_photonloop04");
// Bullet VS Metal
scr_soundbank_addSound("crab_hit_metal", "sn_crabtron_metalhit01");
scr_soundbank_addSound("crab_hit_metal", "sn_crabtron_metalhit02");
scr_soundbank_addSound("crab_hit_metal", "sn_crabtron_metalhit03");
scr_soundbank_addSound("crab_hit_metal", "sn_crabtron_metalhit04");
scr_soundbank_addSound("crab_hit_metal", "sn_crabtron_metalhit05");
scr_soundbank_addSound("crab_hit_metal", "sn_crabtron_metalhit06");

// Mynthos boss //
scr_soundbank_addSound("mynthos_totemhurt", "sn_mynthos_totemhurt01");
scr_soundbank_addSound("mynthos_totemhurt", "sn_mynthos_totemhurt02");
scr_soundbank_addSound("mynthos_totemhurt", "sn_mynthos_totemhurt03");
scr_soundbank_addSound("mynthos_totemdeath", "sn_mynthos_totembreak01");
scr_soundbank_addSound("mynthos_totemdeath", "sn_mynthos_totembreak02");
scr_soundbank_addSound("mynthos_totemdeath", "sn_mynthos_totembreak03");

// Padre of Bones boss //
scr_soundbank_addSound("padre_minionhurt", "sn_mynthos_totemhurt01");
scr_soundbank_addSound("padre_minionhurt", "sn_mynthos_totemhurt02");
scr_soundbank_addSound("padre_minionhurt", "sn_mynthos_totemhurt03");
scr_soundbank_addSound("padre_miniondeath", "sn_mynthos_totembreak01");
scr_soundbank_addSound("padre_miniondeath", "sn_mynthos_totembreak02");
scr_soundbank_addSound("padre_miniondeath", "sn_mynthos_totembreak03");


// Seagull //
scr_soundbank_addSound("seagull_caw", "sn_wasteland_seagull01");
scr_soundbank_addSound("seagull_caw", "sn_wasteland_seagull02");
scr_soundbank_addSound("seagull_caw", "sn_wasteland_seagull03");
scr_soundbank_addSound("seagull_wingflap", "sn_wingflap01");
scr_soundbank_addSound("seagull_wingflap", "sn_wingflap02");
scr_soundbank_addSound("seagull_wingflap", "sn_wingflap03");

// EXPLOSIONS //
// 0 is the lowest intensity explosion, 10 is the highest
scr_soundbank_addSound("explosion_generic_0", "sn_explosion_generic_00_01");
scr_soundbank_addSound("explosion_generic_0", "sn_explosion_generic_00_02");
scr_soundbank_addSound("explosion_generic_0", "sn_explosion_generic_00_03");
scr_soundbank_addSound("explosion_generic_1", "sn_explosion_generic_01_01");
scr_soundbank_addSound("explosion_generic_1", "sn_explosion_generic_01_02");
scr_soundbank_addSound("explosion_generic_1", "sn_explosion_generic_01_03");
scr_soundbank_addSound("explosion_generic_2", "sn_explosion_generic_02_01");
scr_soundbank_addSound("explosion_generic_2", "sn_explosion_generic_02_02");
scr_soundbank_addSound("explosion_generic_2", "sn_explosion_generic_02_03");
scr_soundbank_addSound("explosion_generic_3", "sn_explosion_generic_03_01");
scr_soundbank_addSound("explosion_generic_3", "sn_explosion_generic_03_02");
scr_soundbank_addSound("explosion_generic_3", "sn_explosion_generic_03_03");
scr_soundbank_addSound("explosion_generic_4", "sn_explosion_generic_04_01");
scr_soundbank_addSound("explosion_generic_4", "sn_explosion_generic_04_02");
scr_soundbank_addSound("explosion_generic_4", "sn_explosion_generic_04_03");
scr_soundbank_addSound("explosion_generic_5", "sn_explosion_generic_05_01");
scr_soundbank_addSound("explosion_generic_5", "sn_explosion_generic_05_02");
scr_soundbank_addSound("explosion_generic_5", "sn_explosion_generic_05_03");
scr_soundbank_addSound("explosion_generic_6", "sn_explosion_generic_06_01");
scr_soundbank_addSound("explosion_generic_6", "sn_explosion_generic_06_02");
scr_soundbank_addSound("explosion_generic_6", "sn_explosion_generic_06_03");
scr_soundbank_addSound("explosion_generic_7", "sn_explosion_generic_07_01");
scr_soundbank_addSound("explosion_generic_7", "sn_explosion_generic_07_02");
scr_soundbank_addSound("explosion_generic_7", "sn_explosion_generic_07_03");
scr_soundbank_addSound("explosion_generic_8", "sn_explosion_generic_08_01");
scr_soundbank_addSound("explosion_generic_8", "sn_explosion_generic_08_02");
scr_soundbank_addSound("explosion_generic_8", "sn_explosion_generic_08_03");
scr_soundbank_addSound("explosion_generic_9", "sn_explosion_generic_09_01");
scr_soundbank_addSound("explosion_generic_9", "sn_explosion_generic_09_02");
scr_soundbank_addSound("explosion_generic_9", "sn_explosion_generic_09_03");
scr_soundbank_addSound("explosion_generic_10", "sn_explosion_generic_10_01");
scr_soundbank_addSound("explosion_generic_10", "sn_explosion_generic_10_02");
scr_soundbank_addSound("explosion_generic_10", "sn_explosion_generic_10_03");

scr_soundbank_addSound("flintlock_fuse", "sn_debug_one");
scr_soundbank_addSound("musket_fuse", "sn_debug_two");

// DESTRUCTIBLE SOUNDS //
scr_soundbank_addSound("destructible_mtnpassJar", "sn_debug_one");

// BULB SMASH //
scr_soundbank_addSound("destructible_bustaBulb", "sn_bulb_smash01");
scr_soundbank_addSound("destructible_bustaBulb", "sn_bulb_smash02");
scr_soundbank_addSound("destructible_bustaBulb", "sn_bulb_smash03");
scr_soundbank_addSound("destructible_akiraBulb", "sn_bulb_smash01");
scr_soundbank_addSound("destructible_akiraBulb", "sn_bulb_smash02");
scr_soundbank_addSound("destructible_akiraBulb", "sn_bulb_smash03");
scr_soundbank_addSound("destructible_woodBarrel", "sn_wooden_barrel01");
scr_soundbank_addSound("destructible_woodBarrel", "sn_wooden_barrel02");
scr_soundbank_addSound("destructible_woodBarrel", "sn_wooden_barrel03");

//##########//

//////////////////
////BBALL TACTICS

