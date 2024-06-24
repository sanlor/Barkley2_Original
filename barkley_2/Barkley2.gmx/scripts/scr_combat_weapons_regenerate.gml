//// scr_combat_weapons_regenerate(gun)
/// Regenerate gun based on material, type, affixes and core stats.

var gun = argument0;

////reset stats
scr_combat_weapons_resetStats(gun);

////apply material and type stats
scr_combat_weapons_applyMaterial(gun, gun[? "pMaterial"]);
scr_combat_weapons_applyType(gun, gun[? "pType"]);
scr_combat_weapons_applyGraphic(gun);
scr_combat_weapons_prepareStats(gun);

////get random genes for the affixes
scr_combat_weapons_fusion_affixhood("generate", "prefix1", gun[? "pPrefix1"], gun);
scr_combat_weapons_fusion_affixhood("generate", "prefix2", gun[? "pPrefix2"], gun);
scr_combat_weapons_fusion_affixhood("generate", "suffix", gun[? "pSuffix"], gun);

////apply affix stat mods
scr_combat_weapons_Prefix1(gun[? "pPrefix1"],"applyStats", gun);
scr_combat_weapons_Prefix2(gun[? "pPrefix2"],"applyStats", noone, gun);
scr_combat_weapons_Suffix(gun[? "pSuffix"],"applyStats", noone, gun);

////apply affixes
scr_combat_weapons_Prefix1(gun[? "pPrefix1"],"apply", gun);
scr_combat_weapons_Prefix2(gun[? "pPrefix2"],"apply", noone, gun);
scr_combat_weapons_Suffix(gun[? "pSuffix"],"apply", noone, gun);

////prepare weapon pattern
scr_combat_weapons_prepPattern(gun);

////build weapon full name
scr_combat_weapons_buildName(gun);
