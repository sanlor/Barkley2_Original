///Pick affixes
var gun = scr_combat_weapons_new();
global.geneAffixChance = 25;
var random_chance=irandom_range(1,100);
if random_chance<=global.geneAffixChance
{
gun[? "pPrefix1"] = scr_combat_weapons_fusion_affixhood("prefix1", "name", 1 + floor(random(scr_combat_weapons_fusion_affixhood("prefix1", "size") - 1)));
}
else
    {
    gun[? "pPrefix1"] = scr_combat_weapons_fusion_affixhood("prefix1", "name", 0);
    }
random_chance=irandom_range(1,100);
if random_chance<=global.geneAffixChance
{
gun[? "pPrefix2"] = scr_combat_weapons_fusion_affixhood("prefix2", "name", 1 + floor(random(scr_combat_weapons_fusion_affixhood("prefix2", "size") - 1)));
}
else
    {
    gun[? "pPrefix2"] = scr_combat_weapons_fusion_affixhood("prefix2", "name", 0);
    }
random_chance=irandom_range(1,100);
if random_chance<=global.geneAffixChance
{
gun[? "pSuffix"] = scr_combat_weapons_fusion_affixhood("suffix", "name", 1 + floor(random(scr_combat_weapons_fusion_affixhood("suffix", "size") - 1)));
}
    else
    {
    gun[? "pSuffix"] = scr_combat_weapons_fusion_affixhood("suffix", "name", 0);
    }

//Get random genes that match up with the selected affix
scr_combat_weapons_fusion_affixhood("generate", "prefix1", gun[? "pPrefix1"], gun);
scr_combat_weapons_fusion_affixhood("generate", "prefix2", gun[? "pPrefix2"], gun);
scr_combat_weapons_fusion_affixhood("generate", "suffix", gun[? "pSuffix"], gun);

return gun;
