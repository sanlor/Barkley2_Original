/// scr_combat_weapons_prepareStats(gun)
/// Setup script for weapons. Run this after the weapon is generated
/// and after a new weapon is fused.

var gun = argument0;

///bullet color, temporary fix until we figure out bullet appearance better
if (gun[? "pBulletColor"] == c_white)
{
    gun[? "pBulletColor"] = make_color_hsv(
            color_get_hue(gun[? "col"]),
            color_get_saturation(gun[? "col"]),
            255 - ((255 - color_get_value(gun[? "col"]))/3));
}

///make basic stats from core stats, type and material
gun[? "pDamageMin"] = gun[? "sPower"]*gun[? "pPowerMod"];
gun[? "pDamageRand"] = (gun[? "sPower"]*gun[? "pPowerMaxMod"]) - gun[? "pDamageMin"];
gun[? "pFireSpeed"] = gun[? "sSpeed"]*gun[? "pSpeedMod"];
gun[? "pRange"] = (gun[? "sRange"]*gun[? "pRangeMod"]);
gun[? "pMaxAmmo"] = round(gun[? "sAmmo"]*gun[? "pAmmoMod"]*1.2) + gun[? "pAmmoBase"]; // Balanced the max ammo UP to 1.2 instead of 1.0 (06/06/15)
gun[? "pCurAmmo"] = round(gun[? "pMaxAmmo"]); // * random_range(0.2, 0.65) is a possibility for dropped gun's...?
gun[? "pAffix"] = gun[? "sAffix"]*gun[? "pAffixMod"];
gun[? "pWeight"] = gun[? "sWeight"]*gun[? "pWeightMod"];

gun[? "numberval"] = gun[? "sPower"] + gun[? "sSpeed"] + gun[? "sAmmo"] + gun[? "sAffix"];
///Affixes no longer add to the point value of the gun
//numberval += scr_combat_weapons_Prefix1(_gn.pPrefix1,"checkval");
//numberval += scr_combat_weapons_Prefix2(_gn.pPrefix2,"checkval");
//numberval += scr_combat_weapons_Suffix(_gn.pSuffix,"checkval");

if (gun[? "bDistanceLife"] != -1) {
    // If bullet has distance limit, increase it with gun range
    gun[? "bDistanceLife"] += gun[? "pRange"]*2;
}
if (gun[? "bTimeLife"] == -1) {
    // If bullet has no lifetime set, calulate it based on distance and speed
    gun[? "bTimeLife"] = (gun[? "bDistanceLife"]/gun[? "bSpeed"])*4;
}

gun[? "bShadow"] = 0//1.5*pBulletScale; ////bullet shadow
