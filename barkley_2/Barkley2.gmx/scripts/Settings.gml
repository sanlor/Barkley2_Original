///Put variable things in here, like marquee speed, etc
global.settingVersion = "0.1.5.285";

//Debug Log Printing
global.lastLog = "";
global.logRepeatCount = 0;
global.logfile = file_text_open_write(working_directory + "\log.txt")

// IMPORTANT SCRIPTS
// TextSpecial - Contains the text effects

global.settingDeferred = 1; // If 0, disable deferred render
global.DEBUGMODE = 1; // debug_mode || DEBUG_MODE; // enables in-game developper tools
global.demoBlocker = 1; //Check DemoMapCheck() to see if area is on White List, disable to open entire game

global.settingFadeIn = 0.25;
global.settingFadeDelay = 1; // Time to wait between rooms, will scale based on room load time to make it consistent
global.settingFadeOut = 0.25;

// Max distance you can be from someone to click them in PIXELS
global.settingInteractiveDistance = 64; // For KEYBOARD // Was 100
global.settingInteractiveDistanceGamepad = 48; // For GAMEPAD // Was 64

// Holster / Draw time
global.settingHolsterMinimum = 0.10;
global.settingHolsterMaximum = 0.75;

// In seconds how long time freezes when Hoopz gets hit
global.settingFreezeTime = 0; // 0.1; Disabled because of ticket 2053

// Turn speed - In degrees the player can turn a second
// If the base were 400 and the player had no acro, it would take
// 0.45 seconds to do a 180 degree change in aim direction
global.settingTurnSpeedBase = 400; // 9999 effectively disables
global.settingTurnSpeedBonus = 10; // For every ACRO, multiply it by this number and add to turn speed

global.settingMarqueeQuest = 25; // Percent chance of a quest notification (if you have one)
global.settingMarqueeSpeed = 3.0; //Default value is 3
global.pistolAutoFire = 0; //If 1 can hold to shoot auto for all guns
global.ladderDelay = 0.25; //Time in seconds to go up ladder
global.ladderSpeed = 5.00; //Was 4.00, speed hoopz climbs ladder
global.ladderAnimSpeed = 4; //Was 3, the higher the slower it animates when on ladder

// Zauber testing room // This is where you will be taken when you leave the zauber test area //
global.zauberRoomName = r_gau_01_entrance01;
global.zauberRoomNameX = 264;
global.zauberRoomNameY = 224;

// Combat Settings
global.ammoBooster = 0.25; //% boost to all ammo counts
global.rateBooster = 0.5; //% boost of all gun's firing rate
global.pietyBonus = 1; // Gain this for every point of PIETY for resist
global.baseSpeed = 8.5; //previously 9
global.lethargyMod = 0.05;
global.encumbranceMod = 0.5; // loss of speed for each point of weight over - OLD = 0.05
global.logWeight = 1;
global.baseShake = 1;
global.marksmanMod = 17.5;

//Text Colors
global.textcolorMainquest = make_color_rgb(255, 190, 40);
global.textcolorSidequest = make_color_rgb(140, 160, 255);
global.textcolorKeyword = make_color_rgb(110, 250, 150);
global.textcolorRegular = make_color_rgb(255, 255, 255);
global.textcolorCurses = make_color_rgb(255, 210, 210);
global.textcolorNames = make_color_rgb(200, 200, 255); 
global.textcolorTime = make_color_rgb(220, 220, 20); 
global.textcolorFlavor = make_color_rgb(255, 230, 255);
global.textcolorEncounter = make_color_rgb(255, 255, 150);
global.textcolorQuote = make_color_rgb(230, 255, 240);

global.textcolorCuchulainn = make_color_rgb(40, 90, 220);
global.textcolorCyberdwarf = make_color_rgb(255, 185, 80);

global.textcolorHoopzBanter = make_color_rgb(255, 255, 255);
global.textcolorHoopzDamage = make_color_rgb(255, 50, 100);
global.textcolorHoopzCandy = make_color_rgb(100, 50, 255);

// Utility Menu Settings
global.settingUtilitySmelt = 50; // How much smelt you get per gun - balance 30->50 on 031719 - bhroom
global.settingUtilityTextAlpha = 0.8; // Alpha of all text
global.settingUtilitySpriteAlpha = 0.8; // Alpha of all sprites
global.settingUtilityAlphaBack = 0.05; // Alpha of grid BG
global.settingUtilityAlphaGlow = 0.075; // Alpha of glowing (text, grid)
global.settingUtilityAlphaBorder = 0.15; // Alpha of foreground grids, lines, etc
//global.settingUtilityHue = 80; // Menu hue - Set in player identity by gumball
global.settingUtilityMono = 0.15; // How colorful the menu is, 0 being more B&W 1 being full color
global.utilityAlpha = 0;

// Game
global.settingGameFPSMax = 60;
global.settingLoadRoom = r_debugGreets01; // First room to do
global.settingLoadX = 36;
global.settingLoadY = 36;

// Stagger
global.settingStaggerSoft = 0.3; // Time in seconds (from 0.2)
global.settingStaggerMedium = 0.4; // Time in seconds (from 0.3)
global.settingStaggerHard = 1.0; // Time in seconds (from 0.8)

// Big Enemy Height / Flying Height - TRAC Ticket #1880 Standardize Flying Enemies
// Big = Catfish Shield / Mounted, Junkbot, Kobold Medium / Large, Crabbold, 
// Big = Sewer Beast Large, Crabotron, Swamp Man, Bugflower
global.settingEnemyBigHeight = 48; // Big enemy z height hitbox
// Fly = CGrem Jetpack, Tengu Normal / Crossbow
global.settingEnemyFlyHeight = 48; // Flying enemy z height

// Hoopz
global.settingGunsbagDrawEmpty = 0; // If 0, only draw guns with ammo
global.settingRespawnBagKeep = 0.25; // down from .6 (bhroom) Percentage of guns bag guns kept on death
global.settingRespawnAmmo = 0.25; // Bandolier guns get this much ammo on respawn
// JUNKLORD HAS CODE THAT EDITS THIS
global.settingHoopzBio = 90; //80;
global.settingHoopzCyber = 10; //20;
global.settingHoopzCosmic = 0;
global.settingHoopzZauber = 0;
global.settingHoopzDeathSwap = 2; // Loss of bio per life

// Drop settings
global.settingDropScale = 0.7; // Scale (of gun drawn on floor) of dropped guns
global.settingFuseCompatibility = 0.95; // Range guns can be within, 0.95 = 5%
global.settingFuseWeight = 0.75; // Weight gain for every fuse
global.settingDropWeightPercent = 0.10; // 10% - Percent of gunsvalue that is weight for new gun
global.settingDropWeightAdd = 1.0; // was 1.5 - Add this to percent of gunsvalue on fresh gun
global.settingDropAmmo = 0.25; // (down from 0.5, bhroom) How much ammo dropped guns have (0.5 = 50%)
global.settingDropTimeMin = 4; // Minimum time an item stays on the ground
global.settingDropTimeLuck = 8; // Add this number * (Luck / 100) in seconds to min time

// Drop percentages - Make values under 100 total, any remaining of the 100 will drop nothing
// (change quest variable dropTable to define which table is used)
// Normal drop table
global.settingDropGun[0] = 85;      // (up from 60, bhroom)
global.settingDropCandy[0] = 10;    // 
global.settingDropWildAmmo[0] = 5; // Wild Ammo - Either FULL for one gun, or 20% for BANDO
// Boss fighting drop table 
global.settingDropGun[1] = 25;      // (up from 55, bhroom) Gun + Candy + Nothing must equal 100
global.settingDropCandy[1] = 25;    // (bhroom) Gun + Candy + Nothing must equal 100
global.settingDropWildAmmo[1] = 50; // Wild Ammo - Either FULL for one gun, or 20% for BANDO
// scr_combat_weapons_buildName has cryptic names for dropped guns
global.settingAmmoRandom = 50; // Percent chance it will give 100% to current gun

//Dialog text speed
global.dialogSpeed = 2; //1 = Slow, 2 = Medium, 3 = Fast, 1000 = Instant
global.dialogFaceSpeed = 10; //Higher means they animate faster

//Breakout
//global.breakoutX = 8; //Breakout on left side
global.breakoutX = 384 - 8; //Breakout on right side
global.breakoutY = 92 + 4;
//global.breakoutY = 92 + 16; //Merge breakout into dialog box

//STAIR SLOW DOWN - Higher means slower
global.stairLR0 = .33; // 0.75 - Take this percent off X movement when walking up stairs (ie. .6 is 40% speed)
global.stairLR1 = .33; // 0.50 - Take this percent off Y movement
global.stairUD  = .50; // 0.33 - 

//Scanlines POST EFFECT - Only works with surfaces enabled
global.scanlines = 1;

// Default fade times
global.fadeRoom = 0.25;
global.fadeDeath = 6;

// Room cache / rTree size
global.rtreeCache = 0; // When 1, cache rtrees
global.rtreeSize = 64; // We used to use 16 for solids, 8 for wading and shadows (obsolete)

// Gun decal settings
global.bulletCasings = 200; // 0 sets it to old style where it fades over time

// Misc settings
global.elevatorBorkSpeed = 30;

// DO NOT TOUCH SETTINGS BELOW
global.fadeRoomTemp = -1; //For custom fade times

global.dialogFrame = s_diag_frame;
global.dialogCorner = s_diag_corner;
global.dialogReturn = s_return;
global.dialogEdge = s_diag_edge;
global.dialogBG = s_diag_bg;
global.dialogBGalt = s_diag_bg_alt;

global.CACHEcollision = 0; // Temp variable. When 1, don't add collisions
global.CACHEc_tree = ds_map_create();
global.CACHEc_alltree = ds_map_create();
global.CACHEc_ostree = ds_map_create();
global.CACHEc_stree = ds_map_create();
global.CACHEc_wadetree = ds_map_create();

global.dslCasings = ds_list_create();

//Changing this to 1, as we don't necessarily need this for LUCK
global.critMultiplier = 1.00; //1.75 - old value

// Junkpile shadow density //
global.junkShadow = 0.25;

// AFIIX STUFF
global.settingCircusRoll = 0.1; // How much you get per roll
global.settingJarRoll = 1; // If 1 Hoopz can break jars on roll



///////////////////////////////////
////////// Gene Settings //////////
///////////////////////////////////
global.geneAffixChance = 25;     // Range = 1-100% | Rolled 3 times per gun, 1 for each affix slot.

global.geneAffixThreshold = 30;  // Range = 1-100  | Value all penchants must be above for an affix to be applied.
global.geneMinimumVariance = 20; // Range = 1-100
global.geneMaximumBase = 20;     // Range = 1-100
global.geneMaximumVariance = 30; // Range = 1-100
// ^^^ The above works by doing AffixThreshold + random(MinimumVariance) = MinimumValue a gene can get in this affix generation
// ^^^ The maximum is the MinimumValue + global.geneMaximumBase + random(global.geneMaximumVariance) = MaximumValue
// ^^^ Using the formula above, the lowest a gene could get is a range of 30 to 50 and the highest is 50 to 100

global.geneSecondaryValue = .6;    // All penchant genes get this modifier
global.geneOtherValue = .45;       // All non-penchant genes get this modifier
global.genePrimaryValue = .85;     // NOT USED - IGNORE
global.geneDistributedValue = .62; // NOT USED - IGNORE


///////////////////////////////////
///////// AFFIX Settings //////////
///////////////////////////////////

// Magician
global.affixMagicianDegrees = 210; // Deviation in degrees it can shoot from barrel 

// Flooding - Set the lowest bullets it can shoot and highest per shot
global.affixFloodingMin = 2;
global.affixFloodingMax = 8;
global.affixFloodingAim = 20; // In degrees, aim penalty of flooding

// NoScope360
global.affixNoScope360 = 8; // Number of bullets to shoot
global.affixNoScope360Distance = 12; // Distance to generate bullets from player
global.affixNoScope360Knockback = 0; // If 0, shooting with noscope360 has no knockback

// Ghostic
global.affixGhosticDamage = 0.6; // Multiplier for bullet damage, 0.6 = 60%

// Gravitational
global.affixGravitationalSpeed = 0.4;
global.affixGravitationalSeek = 64; // Higher number = more seeking
global.affixGravitationalSeekRange = 200; // In pixels from bullet

// Chaining
global.affixChainingRange = 200; // Distance to next enemy to get chain
global.affixChainingEnemies = 3; // How many enemies it can hit
global.affixChainingReduction = 0.5; // How much to lose damage per hit, 0.5 = 50% reduce

// Power
global.powerMinesLight = 0.5; // Darkness in mines


global.colorGuilderberg = c_cosmic;







// DO NOT TOUCH
global.whiplash = 0; // For camera cursor tweening
// OLD INFO
// When a signifier is lower case it gets this value (note: currently all sigs are lower case)
// When a SIGNIFIER is all CAPS it gets this value (note: currently all sigs are lower case)
// When something is "distributed" / skip, give all in that pool this value
