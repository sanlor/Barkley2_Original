/// scr_combat_weapons_prepPattern(gun)
/// SPECIAL WEAPON SHOT PATTERNS FROM MATERIALS, WEAPON TYPES AND AFFIXES(right now mostly from weapon type)

var gun = argument0;

switch(gun[? "pPattern"])
{
    case "pt_burst":
        gun[? "pBurstAmount"] = 3;
        gun[? "pBurstSpeed"] = gun[? "pFireSpeed"] * 2;
        gun[? "pFireSpeed"] = gun[? "pFireSpeed"] * 0.4;
        break;
        
    case "pt_longburst":
        break;
        
    case "pt_multishot":
        break;
        
    case "pt_flintlock":
        gun[? "pShots"] = 3;
        gun[? "pDamageMin"] = gun[? "pDamageMin"]/3;
        gun[? "pSpreadAmount"] = 25;
        break;
    
    case "pt_musket":
        gun[? "pShots"] = 2;
        gun[? "pDamageMin"] = gun[? "pDamageMin"]/2;
        gun[? "pSpreadAmount"] = 20;
        break;
        
    case "pt_scopespread":
        gun[? "pShots"] = 4;
        gun[? "pDamageMin"] = gun[? "pDamageMin"]/4;
        gun[? "pSpreadAmount"] = 15;
        break;
        
    case "pt_spread":
        gun[? "pShots"] = 6;
        gun[? "pDamageMin"] = gun[? "pDamageMin"]/4;
        gun[? "pSpreadAmount"] = 30;
        break;
        
    case "pt_doublespread":
        gun[? "pShots"] = 12;
        gun[? "pDamageMin"] = gun[? "pDamageMin"]/8;
        gun[? "pSpreadAmount"] = 60;
        gun[? "pAmmoCost"] = 2;
        break;
}

if(gun[? "pMaterial"]=="Fungus")
{
    gun[? "bAdvanced"] = true;
    
    gun[? "pAccuracy"]+=15;
    gun[? "pAccuracy"]*=1.5;
    gun[? "pRecoil"] *= 0.2;
    
    
    if(gun[? "pType"]!=GUN_TYPE_BFG)
    {
        gun[? "pShots"] = gun[? "pShots"]+2;
        gun[? "pDamageMin"] = gun[? "pDamageMin"]/10;
        gun[? "pDamageRand"] = gun[? "pDamageRand"]/2;
        gun[? "pSpreadAmount"] = gun[? "pSpreadAmount"]*1.5 + 5;
    }
    
    gun[? "pKnockback"] = 0;
    gun[? "pStagger"] *= 0;
    
    gun[? "bWallRicochet"] += 2;
    gun[? "bEnemySeek"] += 8;
    gun[? "bEnemySeekRange"] += 32;
    gun[? "bEnemySeekTime"] = .5;
    gun[? "bRoaming"] += 300;
    
    if(gun[? "pType"] != GUN_TYPE_FLAMETHROWER && gun[? "pType"] != GUN_TYPE_FLAREGUN){
    gun[? "bSpeed"] *= .20;
    gun[? "bMinSpeed"] = 2;
    gun[? "bAccel"] = -1;
    }

    gun[? "bExplodeOnWall"] = true;
    gun[? "bExplodeOnEnemy"] = false;
    gun[? "bExplodeOnGround"] = true;
    gun[? "bExplodeOnTimeout"] = true;
    gun[? "bExplodeEffect"] = NULL;
    
    if(gun[? "pType"]==GUN_TYPE_BFG)
    {
        gun[? "bExplode"] = object_get_name(o_fungiBFG);
        gun[? "bExplosion"] = "";
        gun[? "bExplodeDamageMod"] = 1;
    }
    else
    {
        gun[? "bExplode"] = object_get_name(o_shroom);
        gun[? "bExplosion"] = sprite_get_name(s_fungus_shroomgrow);
        gun[? "bExplodeDamageMod"] = 1.5;
    }
    
    gun[? "bTimeLife"] += 64;
    gun[? "bTimeLife"] *= 4;
    
    gun[? "bDistanceLife"] += 32;
    gun[? "bDistanceLife"] *= 1.5;
    
    if(gun[? "pType"] == GUN_TYPE_FLAREGUN){gun[? "bLobGravity"] = 0.01;}
    else{gun[? "bLobGravity"] = 0.005;}
    gun[? "bRangeEndGrav"] = 0.1;
}

if(gun[? "pMaterial"]=="Origami")
{
    gun[? "bAdvanced"] = true;
    if(gun[? "pType"]==GUN_TYPE_FLAREGUN && gun[? "pType"]==GUN_TYPE_ROCKET && gun[? "pType"]==GUN_TYPE_BFG )
    {
        gun[? "bRoaming"] += 20;
        gun[? "bSpeed"] *= .50;
        gun[? "pAccuracy"]+=10
    }
    else
    {
        gun[? "pAccuracy"]+=30
        gun[? "pAccuracy"]*=2;
        gun[? "bSpeed"] *= .20;
        gun[? "bAccel"] = 1.5;
        gun[? "bMinSpeed"] = 2;
        gun[? "bRoaming"] += 60;
        gun[? "bTimeLife"] += 990;
        gun[? "bDistanceLife"] += 16;
        gun[? "bDistanceLife"] *= 1.25;
        gun[? "bLobGravity"] = 0.5;
        gun[? "bRangeEndGrav"] = 2;
    }
}

if(gun[? "pMaterial"]=="Chitin")
{
    gun[? "bAdvanced"] = true;
    gun[? "bExplodeDamageMod"] = 1.5;
    
    gun[? "bSpeed"] *= .4;
    gun[? "bMinSpeed"] = 2;
    gun[? "bLobGravity"] = 6;
}

if(gun[? "pMaterial"]=="Marble")
{
    if(gun[? "pType"] != GUN_TYPE_FLAMETHROWER && gun[? "pType"] != GUN_TYPE_FLAREGUN)
    {
        gun[? "bSpeed"] *= .20;
        gun[? "bAccel"] = 1.5;
    }
    gun[? "bMinSpeed"] = 1;
    gun[? "bTimeLife"] += 990;
    gun[? "bDistanceLife"] *= 1.25;
    gun[? "bRoaming"] += 120;
    gun[? "bEnemySeek"] += 12;
    gun[? "bEnemySeekRange"] += 96;
    gun[? "bEnemySeekTime"] = .5;
}

if(gun[? "pMaterial"]=="Salt")
{
    if(gun[? "pType"]!=GUN_TYPE_ROCKET && gun[? "pType"]!=GUN_TYPE_BFG )
    {
        gun[? "pShots"] = gun[? "pShots"]*3;
        gun[? "pDamageMin"] = gun[? "pDamageMin"]/3;
        gun[? "pDamageRand"] = gun[? "pDamageRand"]/2;
        gun[? "pSpreadAmount"] = gun[? "pSpreadAmount"]*1.75 + 10;
    }
}

if(gun[? "pMaterial"]=="Napalm")
{
    var ptype = gun[? "pType"];
    if(ptype != GUN_TYPE_FLAREGUN && ptype != GUN_TYPE_ROCKET && ptype != GUN_TYPE_BFG)
    {
        gun[? "pShots"] = gun[? "pShots"]*2;
        gun[? "pDamageMin"] = gun[? "pDamageMin"]/3;
        gun[? "pDamageRand"] = gun[? "pDamageRand"]/3;
        gun[? "pSpreadAmount"] = gun[? "pSpreadAmount"]*1.5 + 6;
    }
}

if(gun[? "pMaterial"]=="Digital")
{
    gun[? "pAccuracy"]+=15;
    gun[? "bAdvanced"] = true;
    gun[? "bEnemyPierce"] += 2;
}

if(gun[? "pMaterial"]=="Silver")
{
    gun[? "bAdvanced"] = true;
    gun[? "bEnemyPierce"] += 1;
}

if(gun[? "pMaterial"]=="Dual")
{
    
}

if(gun[? "pMaterial"]=="Taxidermy")
{
    gun[? "bAdvanced"] = true;
    gun[? "pAccuracy"]+=20
    gun[? "pAccuracy"]*=2;
    if(gun[? "pType"] != GUN_TYPE_FLAMETHROWER && gun[? "pType"] != GUN_TYPE_FLAREGUN){gun[? "bSpeed"] *= .4;}
    gun[? "bAccel"] = -1.5;
    gun[? "bMinSpeed"] = 3;
    gun[? "bRoaming"] += 80;
    gun[? "bTimeLife"] += 700;
    gun[? "bDistanceLife"] += 16;
    gun[? "bDistanceLife"] *= 1.25;
    
    gun[? "bRangeEndGrav"] = 2;
    
    gun[? "bEnemySeek"] += 8;
    gun[? "bEnemySeekRange"] += 32;
    gun[? "bEnemySeekTime"] = .5;
}


if(gun[? "pMaterial"]=="Itano")  ///ITANO
{
    gun[? "bEnemySeek"] += 16;
    gun[? "bEnemySeekRange"] += 64;
    gun[? "bEnemySeekTime"] = .5;
    
    if(gun[? "pType"] != GUN_TYPE_FLAMETHROWER && gun[? "pType"] != GUN_TYPE_FLAREGUN){gun[? "bSpeed"] *= .15;}
    gun[? "bMaxSpeed"] = 80;
    gun[? "bMinSpeed"] = 2;
    gun[? "bAccel"] = 2;
    
    gun[? "bExplodeOnWall"] = true;
    gun[? "bExplodeOnEnemy"] = true;
    gun[? "bExplodeOnEnemyProx"] = false;
    gun[? "bExplodeOnGround"] = true;
    gun[? "bExplodeOnTimeout"] = true;
    gun[? "bDealDamage"] = false;
    
    gun[? "pAccuracy"]+=30
    gun[? "pAccuracy"]*=2;
    gun[? "pRangeMod"]*=1.5;
    gun[? "bTimeLife"] += 32;
    gun[? "bDistanceLife"] += 48;
    
    gun[? "bTrail"] = object_get_name(o_explEffect);
    gun[? "bTrailExplosion"] = sprite_get_name(s_pixel); //effect_itanosmoke);
    gun[? "bTrailAcc"] = 0;
    gun[? "bTrailAmount"] = 1;
    gun[? "bTrailInterval"] = 2;
    
    if(assetOrNull(gun[? "bExplode"], asset_object) == NULL)
    {
        gun[? "bExplode"] = object_get_name(o_explosion);
        gun[? "bExplosion"] = sprite_get_name(s_effect_explo_32);
        gun[? "bExplodeDamageMod"] = 0.8;
    }
    
    if(gun[? "pType"] == GUN_TYPE_FLAREGUN){gun[? "bLobGravity"] = 2.5;}
    gun[? "bAdvanced"] = true;
}
