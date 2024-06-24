///scr_hud_gun_init()
global.gunSwap = ds_map_create();
global.gunWidth = 49;
global.gunHeight = 24;
global.gunPerSheet = 9; //Number of guns to put per sheet. If loading a sheet takes too long, lower this number.
global.gunMaterials = 81; //Maximum number of gun materials in game
global.gunTypes = 26; //Maximum number of types of guns we'll have
global.gunSheets = floor(global.gunMaterials / global.gunPerSheet); //Calculates how many gun sheets we have
for (_i = 0; _i < global.gunSheets; _i += 1) { global.gunSheetSprite[_i] = -1; }
global.gunSwap[? s_hud_pistols] = 0;
global.gunSwap[? s_hud_flintlock] = 1;
global.gunSwap[? s_hud_machinepistol] = 2;
global.gunSwap[? s_hud_revolvers] = 3;
global.gunSwap[? s_hud_magnum] = 4;
global.gunSwap[? s_hud_flaregun] = 5;
global.gunSwap[? s_hud_rifle] = 6;
global.gunSwap[? s_hud_musket] = 7;
global.gunSwap[? s_hud_huntingrifle] = 8;
global.gunSwap[? s_hud_tranqrifle] = 9;
global.gunSwap[? s_hud_sniper] = 10;
global.gunSwap[? s_hud_assaultrifle] = 11;
global.gunSwap[? s_hud_smg] = 12;
global.gunSwap[? s_hud_heavymachinegun] = 13;
global.gunSwap[? s_hud_gatlinggun] = 14;
global.gunSwap[? s_hud_minigun] = 15;
global.gunSwap[? s_hud_mitrailleuse] = 16;
global.gunSwap[? s_hud_shotgun] = 17;
global.gunSwap[? s_hud_doubleshotgun] = 18;
global.gunSwap[? s_hud_revshotgun] = 19;
global.gunSwap[? s_hud_elephantgun] = 20;
//NOT CURRENTLY IMPLEMENTED IN FRANKIES SHEET
global.gunSwap[? s_hud_crossbow] = 21;
global.gunSwap[? s_hud_flamethrower] = 22;
global.gunSwap[? s_hud_rocket] = 23;
global.gunSwap[? s_hud_leafblower] = 24;
