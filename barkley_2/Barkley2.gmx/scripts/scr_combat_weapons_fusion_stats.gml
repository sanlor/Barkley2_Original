/// scr_combat_weapons_fusion_stats(weapon_1, weapon_2, fuse_result_weapon)
scr_combat_weapons_fusion_prestats(argument[0], argument[1]);
var fuseResult = argument[2];
fuseResult[? "sPower"] = gunPowerNoiseTotal;
fuseResult[? "sSpeed"] = gunROFNoiseTotal;
fuseResult[? "sAmmo"] = gunAmmoNoiseTotal;
fuseResult[? "sAffix"] = gunAffixNoiseTotal;
fuseResult[? "sWeight"] = gunWeightNoiseTotal;
