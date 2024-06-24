/// scr_combat_weapons_fusion(gun_a,gun_b)
/// Master script for weapon fusion!!!
/// Returns the resulting gun object, or NULL

var gunA,gunB;

gunA = argument0;
gunB = argument1;

if (gunA == NULL or gunB == NULL) {
    return NULL;
}

fuseResult = scr_combat_weapons_new();

ratio = 0.5; // Will be gunspower

scr_combat_weapons_fusion_stats(gunA,gunB, fuseResult);
// ratio gets set in script above

// Get new type and gunsmap data
var topInd = Gunsmap("type to index", gunA[? "pType"]);
var topPos = gunA[? "gunmap_pos"];
var botInd = Gunsmap("type to index", gunB[? "pType"]);
var botPos = gunB[? "gunmap_pos"];
Gunsmap("fuse", topInd, topPos, botInd, botPos, ratio); // Returns globals
fuseResult[? "pType"] = global.gunsmapFuseType;
fuseResult[? "gunmap_pos"] = global.gunsmapFusePosition;

// Get new material
fuseResult[? "pMaterial"] = scr_combat_weapons_fusion_material(gunA[? "pMaterial"],gunB[? "pMaterial"]);

scr_combat_weapons_fusion_affix(gunA,gunB,fuseResult);

///Weapon setup---
scr_combat_weapons_applyMaterial(fuseResult, fuseResult[? "pMaterial"]);
scr_combat_weapons_applyType(fuseResult,fuseResult[? "pType"]);
scr_combat_weapons_applyGraphic(fuseResult);

scr_combat_weapons_prepareStats(fuseResult);

scr_combat_weapons_Prefix1(fuseResult[? "pPrefix1"],"applyStats", fuseResult);
scr_combat_weapons_Prefix2(fuseResult[? "pPrefix2"],"applyStats", noone, fuseResult);
scr_combat_weapons_Suffix(fuseResult[? "pSuffix"],"applyStats", noone, fuseResult);

scr_combat_weapons_Prefix1(fuseResult[? "pPrefix1"],"apply", fuseResult);
scr_combat_weapons_Prefix2(fuseResult[? "pPrefix2"],"apply", noone, fuseResult);
scr_combat_weapons_Suffix(fuseResult[? "pSuffix"],"apply", noone, fuseResult);

scr_combat_weapons_prepPattern(fuseResult);
scr_combat_weapons_buildName(fuseResult);

fuseResult[? "pName"] = "FUZE";

// Set ammo (not capacity) to weighted average of previous gun's ammo.
var ammoA, ammoB;
if (gunA[? "pMaxAmmo"] != 0) {
    ammoA = gunA[? "pCurAmmo"] / gunA[? "pMaxAmmo"];
} else {
    ammoA = 0.0;
}
if (gunB[? "pMaxAmmo"] != 0) {
    ammoB = gunB[? "pCurAmmo"] / gunB[? "pMaxAmmo"];
} else {
    ammoB = 0.0;
}

fuseResult[? "pCurAmmo"] = ceil(fuseResult[? "pMaxAmmo"] * (ammoA * 0.5 + ammoB * 0.5)); 

Lineage("history", gunA, gunB, fuseResult);

return fuseResult;
