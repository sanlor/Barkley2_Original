/// scr_combat_weapons_new()
/// Returns a new gun with default values
var gun = ds_map_create();

gun[? "used"] = false;

gun[? "pName"] = ""; // All guns start with no name, you must inscribe to give a gun a name
gun[? "pType"] = GUN_TYPE_SHOTGUN;
gun[? "pMaterial"] = "Plastic";
gun[? "pickupName"] = "";
gun[? "pickCol"] = c_white;

gun[? "gunmap_pos"] = -1;

gun[? "pPrefix1"] = "";
gun[? "pPrefix2"] = "";
gun[? "pSuffix"] = "";

gun[? "numberval"] = 0;
gun[? "rarity"] = 0;
gun[? "pointsUsed"] = 0;

///Weapon stats, thats what goes up as you fuse gun's and raise levels on em.
gun[? "sPower"] = 30;
gun[? "sSpeed"] = 30;
gun[? "sRange"] = 30;
gun[? "sAmmo"] = 30;
gun[? "sAffix"] = 30;

gun[? "sWeight"] = 3;
gun[? "sLevel"] = 1;

gun[? "pEquipped"] = false;

gun[? "periodic"] = ds_map_create();
ds_map_replace(gun[? "periodic"],"power",5);
scr_combat_weapons_resetStats(gun);
gun[? "periodic_mutlishot"] = 1;

// Set when fused
gun[? "favorite"] = 0;
gun[? "son"] = NULL; // ds_map of son
gun[? "lineage_top"] = NULL; // ds_map of parent
gun[? "lineage_bot"] = NULL; // ds_map of parent
gun[? "generation"] = 1; // Add 1 to highest gun value

return gun;
