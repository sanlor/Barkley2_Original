/// scr_combat_weapons_generate(type,material,points,rarity)

var _typegen = argument0;
var _matgen = argument1;
var _points = argument2;
var _rarity = argument3;

var gun = scr_combat_weapons_new();

gun[? "pType"] = _typegen;
gun[? "pMaterial"] = _matgen;
gun[? "numberval"] = _points;
gun[? "rarity"] = _rarity;

////Pick weapon type if not specified
if(gun[? "pType"] == "random" || gun[? "pType"] == "")
{
    var pickType = random(gun[? "rarity"]);
    if(pickType<80)
    {gun[? "pType"] = choose(GUN_TYPE_PISTOL,GUN_TYPE_RIFLE,GUN_TYPE_HUNTINGRIFLE,GUN_TYPE_MACHINEPISTOL,GUN_TYPE_SUBMACHINEGUN,GUN_TYPE_SHOTGUN,GUN_TYPE_MUSKET,GUN_TYPE_FLINTLOCK);}
    else if (pickType<90)
    {gun[? "pType"] = choose(GUN_TYPE_REVOLVER,GUN_TYPE_TRANQRIFLE,GUN_TYPE_GATLINGGUN,GUN_TYPE_DOUBLESHOTGUN,GUN_TYPE_REVOLVERSHOTGUN,GUN_TYPE_HEAVYMACHINEGUN,GUN_TYPE_MITRAILLEUSE,GUN_TYPE_ASSAULTRIFLE,GUN_TYPE_CROSSBOW);}
    else
    {gun[? "pType"] = choose(GUN_TYPE_MINIGUN,GUN_TYPE_ELEPHANTGUN,GUN_TYPE_MAGNUM,GUN_TYPE_SNIPERRIFLE,GUN_TYPE_FLAREGUN);}
    // Not given at random:  Bio-Force Gun, Rocket Launcher, Flamethrower
}

gun[? "matGeneric"] = false;

// Pick material
// So here is halfass balance for gun's drops while we wait for Enemy and Area specific drops coming up soon.

if(gun[? "pMaterial"] == "random" || gun[? "pMaterial"] == "")
{
    var pickMat = random(gun[? "rarity"]);
    // changing drop occurences to favor much lower gun's materials
    if (pickMat<60) // Poor Materials Row 2
        {gun[? "pMaterial"] = choose("Soiled", "Rotten", "Broken", "Carbon", "Mythril", "Rusty", "Junk", "Neon");}
    else if (pickMat<80) // Weak materials Row 3
        {gun[? "pMaterial"] = choose("Salt", "Wood", "Aluminum", "Glass", "Plastic", "Leather"); gun[? "matGeneric"] = true;}
    else if (pickMat<100) // Elemental Materials Row 4
        {gun[? "pMaterial"] = choose("Bone", "Aluminium", "Titanium", "Chrome", "Iron", "Cobalt", "Nickel", "Copper", "Zinc", "Grass", "Brass");}
    else // Testing a super rare 1 in 100 drop of a 5th Row - bhroom
        {gun[? "pMaterial"] = choose("Muscle", "Crystal", "Blood", "Chitin", "Sinew", "Obsidian", "Fungus");}
    
}

///Pick affixes
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

  
///apply material and type to get mod ratios
scr_combat_weapons_applyMaterial(gun, gun[? "pMaterial"]);
scr_combat_weapons_applyType(gun, gun[? "pType"]);
scr_combat_weapons_applyGraphic(gun);
///distribute 5/8ths of starting CORE STAT POINTS based on initial type and material mods
var ptsleft,ptsEach;
ptsleft = 0;
ptsleft = gun[? "numberval"] - gun[? "pointsUsed"];
ptsEach = ptsleft/7;

gun[? "sPower"] = ceil(ptsEach * (((gun[? "pPowerMod"]-1)/2)+1));
gun[? "sSpeed"] = ceil(ptsEach * (((gun[? "pSpeedMod"]-1)/2)+1));
gun[? "sAmmo"] = ceil(ptsEach * (((gun[? "pAmmoMod"]-1)/2)+1));
gun[? "sAffix"] = ceil(ptsEach * (((gun[? "pAffixMod"]-1)/2)+1));

if(gun[? "sPower"]>90){gun[? "sPower"]=90;}
if(gun[? "sSpeed"]>90){gun[? "sSpeed"]=90;}
if(gun[? "sAmmo"]>90){gun[? "sAmmo"]=90;}
if(gun[? "sAffix"]>90){gun[? "sAffix"]=90;}

///distribute remaining core points randomly
var remainpts = ptsEach*2 + (ptsEach*5 - (gun[? "sPower"] + gun[? "sSpeed"] + gun[? "sAmmo"] + gun[? "sAffix"]));

tries = 10;

while(remainpts>0)
{
    switch(irandom(3))
    {
        case 0: gun[? "sPower"]+=1; break;
        case 1: gun[? "sSpeed"]+=1; break;
        case 2: gun[? "sAmmo"]+=1; break;
        case 3: gun[? "sAffix"]+=1; break;
    }
    
    tryit = false; ////if a weapon generates an individual stat above 90, it tries again
    if(gun[? "sPower"]>90){gun[? "sPower"]=90; tryit = true;}
    if(gun[? "sSpeed"]>90){gun[? "sSpeed"]=90; tryit = true;}
    if(gun[? "sAmmo"]>90){gun[? "sAmmo"]=90; tryit = true;}
    if(gun[? "sAffix"]>90){gun[? "sAffix"]=90; tryit = true;}
    
    if(!tryit||tries<=0){remainpts-=1;}else{tries-=1;} //after 10 tries it gives up on fitting the points, and points are lost.
}


scr_combat_weapons_prepareStats(gun);

///AFFIXES MODIFY THE BASIC STATS HERE
scr_combat_weapons_Prefix1(gun[? "pPrefix1"],"applyStats", gun);
scr_combat_weapons_Prefix2(gun[? "pPrefix2"],"applyStats", noone, gun);
scr_combat_weapons_Suffix(gun[? "pSuffix"],"applyStats", noone, gun);

///THEN APPLY SPECIAL AFFIX EFFECTS
///(done separately and after because some of them might take basic stats into account)
scr_combat_weapons_Prefix1(gun[? "pPrefix1"],"apply", gun);
scr_combat_weapons_Prefix2(gun[? "pPrefix2"],"apply", noone, gun);
scr_combat_weapons_Suffix(gun[? "pSuffix"],"apply", noone, gun);

scr_combat_weapons_prepPattern(gun);
scr_combat_weapons_buildName(gun);

show_debug_message("Gun Type = " + string(gun[? "pType"]));
show_debug_message("Explode object = " + string(gun[? "bExplode"]));

return gun;
