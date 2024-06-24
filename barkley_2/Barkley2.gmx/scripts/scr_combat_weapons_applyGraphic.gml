// Gun in question //
var gun = argument0;

// Main gun color //
col = c_white;

// Gun decal colors //
gunheldcol1 = c_white;
gunheldcol2 = c_white;
gunheldcol3 = c_white;

// Gun type, aka PISTOL, SHOTGUN, RIFLE etc. //
var type = gun[? "pType"];

// Gun material, aka Steel, Grass, Candy etc. //
var material = gun[? "pMaterial"];

// Decal sprites //
var secondSprite = "";
var thirdSprite = "";

// Some sort of a bullet alpha multiplier //
var overlayAlpha = 1;

// Use decals or not //
var displaySpots = false;
var displayParts = false;

// Hoopz's torso sprite for this particular gun //
var torsoFrame = s_HoopzTorsoAim;

// Use default BFG and Flamethrower bullet sprites or not //
var specialBFG = false;
var specialFlame = false;
var normalFlame = true;
var specialFlaregun = false;
var specialRocket = false;

// Stuff applied to materials //
switch(material)
{
    case "Candy":
        gun[? "pBulletSprite"] = sprite_get_name(s_bull_candyShot);
        col = make_color_rgb(190,200,190);
        gunheldcol1= col;
        col = c_white;
        displaySpots = true; gunheldcol3 = make_color_rgb(40,200,70);
        displayParts = true; gunheldcol2 = make_color_rgb(255,50,80);
        gun[? "soundId"] = "candy_shot";
        gun[? "bcasing"] = "";
        break;
                
    case "3D Printed":
        col = make_color_rgb(142,180,198);
        gunheldcol1= col;
        col = c_white;        
        gun[? "pBulletColor"] = make_color_rgb(55, 215, 195);
        if(type != GUN_TYPE_FLAMETHROWER && type != GUN_TYPE_FLAREGUN){gun[? "bSpeed"] *= 0.4;}  
        break;
                
    case "Soiled":
        col = make_color_rgb(187,230,255);
        gunheldcol1= col;
        col = c_white;
        gunheldcol3 = make_color_rgb(222,91,204);
        displaySpots = true;
        normalFlame = true; specialFlame = false;
        gun[? "soundId"] = "hoopzweap_soiled_shot";
        break;
                
    case "Rotten":
        col = make_color_rgb(187,250,230);
        gunheldcol1= col;
        col = c_white;
        gun[? "pBulletSprite"] = sprite_get_name(s_bull_goo_med);
        gun[? "pBulletColor"] = make_color_rgb(30, 160, 20);
        gun[? "bRangeEndGrav"] = 7;
        if(type != GUN_TYPE_FLAMETHROWER && type != GUN_TYPE_FLAREGUN){gun[? "bSpeed"] *= 0.65;}
        gun[? "bShadow"] = 2;
        gun[? "bcasing"] = "";
        gun[? "soundId"] = "hoopzweap_rotten_shot";
        gun[? "sound_normalPitchDmg"] = 15;
        gun[? "bExplodeEffect"] = NULL;
        switch(type)
        {
            case GUN_TYPE_FLAREGUN: gun[? "bExplosion"] = sprite_get_name(s_effect_explo_rotten); break;
            case GUN_TYPE_ROCKET: gun[? "bExplosion"] = sprite_get_name(s_effect_explo_rotten); break;
            case GUN_TYPE_BFG:
                gun[? "pBulletSprite"] = sprite_get_name(s_bull_goo_bfg);
                gun[? "bExplodeOnWall"] = true;
                gun[? "bExplodeOnEnemy"] = true;
                gun[? "bExplodeOnEnemyProx"] = false;
                gun[? "bExplodeOnGround"] = true;
                gun[? "bExplodeOnTimeout"] = true;
                gun[? "bDealDamage"] = true;
        
                gun[? "bExplode"] = object_get_name(o_explosion_rocket);
                gun[? "bExplodeDamageMod"] = 1;
                gun[? "bExplosion"] = sprite_get_name(s_effect_explo_rotten);
                break;
        }
        
        displaySpots = true; gunheldcol3 = make_color_rgb(3,201,40);
        normalFlame = false; specialFlame = false;
        specialBFG = true;
        specialFlaregun = true;
        specialRocket = true;
        break;
                
    case "Broken":
        col = make_color_rgb(167,210,235);
        gunheldcol1= col;
        col = c_white;
        gun[? "soundId"] = "hoopzweap_broken_shot";
        if type != GUN_TYPE_SHOTGUN or type != GUN_TYPE_DOUBLESHOTGUN or type != GUN_TYPE_REVOLVERSHOTGUN then gun[? "soundId"] = "hoopzweap_broken_wideshot";
        gun[? "pBulletColor"] = make_color_rgb(105, 55, 55);
        gunheldcol3 = make_color_rgb(30,30,30);
        displaySpots = true;
        normalFlame = true; specialFlame = false;
        break;
                
    case "Carbon":
        _kbc = 0.9;
        _stn = 0.9;
        col = make_color_rgb(80,80,80);
        gunheldcol1= col;
        col = c_white;
        if(type != GUN_TYPE_FLAMETHROWER && type != GUN_TYPE_FLAREGUN){gun[? "bSpeed"] *= 0.75;}
        gun[? "pBulletSprite"] = sprite_get_name(s_bull_carbon);
        gun[? "pBulletColor"] = make_color_rgb(105, 20, 125);
        switch(type)
        {
            case GUN_TYPE_PISTOL: gun[? "gunHeldSprite"] = sprite_get_name(s_Pistol_Luger); break;
        }
        normalFlame = false; specialFlame = false;
        specialFlaregun = true; specialRocket = true;
        break;
                
    case "Mythril":
        col = make_color_rgb(140,160,255);
        gunheldcol1= col;
        col = c_white;
        gun[? "pBulletColor"] = make_color_rgb(230, 240, 255);
        displayParts = true; gunheldcol2 = make_color_rgb(240,240,255);
        normalFlame = true; specialFlame = false;
        break;

    case "Rusty":
        col = make_color_rgb(200,160,190);
        gunheldcol1= col;
        col = c_white;
        gun[? "pBulletColor"] = make_color_rgb(250, 115, 65);
        displaySpots = true; gunheldcol3 = make_color_rgb(230,120,60);
        normalFlame = true; specialFlame = false;
        break;
                
    case "Junk":
        col = make_color_rgb(110,60,50);
        gunheldcol1= col;
        col = c_white;
        gun[? "pBulletSprite"] = sprite_get_name(s_bull_junk);
        gun[? "bRangeEndGrav"] = 7;
        if(type != GUN_TYPE_FLAMETHROWER && type != GUN_TYPE_FLAREGUN){gun[? "bSpeed"] *= 0.65;}
        gun[? "bShadow"] = 2;
        gun[? "soundId"] = "hoopzweap_junk_shot";
        gun[? "sound_normalPitchDmg"] = 17;
        gun[? "bcasing"] = "";
        
        switch(type)
        {
            case GUN_TYPE_FLAREGUN:
            case GUN_TYPE_ROCKET:
            case GUN_TYPE_BFG:
                gun[? "bExplodeDamageMod"] = 0.2;
                gun[? "bDealDamage"] = false;
                gun[? "bExplosion"] = "";
                break;
        }
        gun[? "bExplodeEffect"] = NULL;
        
        specialBFG = true;
        displaySpots = true; gunheldcol3 = make_color_rgb(150,40,40);
        displayParts = true; gunheldcol2 = make_color_rgb(140,140,190);
        normalFlame = true; specialFlame = false;
        specialFlaregun = true; specialRocket = true;
        break;
                
                
    case "Neon":
        col = make_color_rgb(117,60,150);
        gunheldcol1= col;
        col = c_white;
        displaySpots = true; gunheldcol3 = make_color_rgb(65,170,80);
        displayParts = true; gunheldcol2 = make_color_rgb(255,135,180);
        gun[? "soundId"] = "hoopzweap_neon_shot";
        gun[? "sound_normalPitchDmg"] = 20;
        gun[? "bExplodeEffect"] = NULL;
        gun[? "pBulletSprite"] = sprite_get_name(s_bull_neon);
        
        switch(type)
        {
            case GUN_TYPE_FLAREGUN:
                gun[? "bExplosion"] = ""
                gun[? "pBulletSprite"] = sprite_get_name(s_bull_neonGloworb);
                break;
            case GUN_TYPE_ROCKET:
                gun[? "bExplosion"] = ""
                gun[? "pBulletSprite"] = sprite_get_name(s_bull_neonGloworb);
                break;
            case GUN_TYPE_BFG:
                gun[? "pBulletSprite"] = sprite_get_name(s_bull_neonGloworb);
                gun[? "bExplodeOnWall"] = true;
                gun[? "bExplodeOnEnemy"] = true;
                gun[? "bExplodeOnEnemyProx"] = false;
                gun[? "bExplodeOnGround"] = true;
                gun[? "bExplodeOnTimeout"] = true;
                gun[? "bDealDamage"] = true;        
                gun[? "bExplode"] = object_get_name(o_explosion_rocket);
                gun[? "bExplodeDamageMod"] = 1;
                gun[? "bExplosion"] = ""
                break;
        }
        
        specialBFG = true;
        normalFlame = true; specialFlame = false;
        specialFlaregun = true; specialRocket = true;
        break;
                               
    case "Salt":
        col = make_color_rgb(255,255,255);
        _kbc = 1.2;
        _stn = 1.2;
        gunheldcol1= col;
        gun[? "pBulletSprite"] = sprite_get_name(s_bull_salt);
        if(type != GUN_TYPE_FLAMETHROWER && type != GUN_TYPE_FLAREGUN){gun[? "bSpeed"] *= .6;}
        gun[? "bcasing"] = "";
        gun[? "soundId"] = "hoopzweap_salt_shot";
        gun[? "sound_normalPitchDmg"] = 10;
        gun[? "bExplodeEffect"] = NULL;
        switch(type)
        {
            case GUN_TYPE_FLAREGUN: gun[? "bExplosion"] = ""; break;
            case GUN_TYPE_ROCKET:
                gun[? "bExplosion"] = "";
                gun[? "bExplodeDamageMod"] = 0.2;
                gun[? "bEnemyPierce"] += 2;
                gun[? "bDealDamage"] = false;
                break;
            case GUN_TYPE_BFG:
                gun[? "bExplodeOnWall"] = true;
                gun[? "bExplodeOnEnemy"] = true;
                gun[? "bExplodeOnEnemyProx"] = false;
                gun[? "bExplodeOnGround"] = true;
                gun[? "bExplodeOnTimeout"] = true;
                gun[? "bExplodeDamageMod"] = 0.2;
                gun[? "bEnemyPierce"] += 2;
                gun[? "bDealDamage"] = false;
                gun[? "bExplode"] = object_get_name(o_explosion_rocket);
                gun[? "bExplodeDamageMod"] = 1;
                gun[? "bExplosion"] = sprite_get_name("");               
                break;
        }
        
        specialBFG = true;
        col = c_white;
        normalFlame = false; specialFlame = true;
        specialFlaregun = true; specialRocket = true;
        break;
                                
    case "Wood":
        col = make_color_rgb(205,70,54);
        gunheldcol1= col;
        col = c_white;
        gun[? "pBulletColor"] = make_color_rgb(180, 100, 40);
        if(type = GUN_TYPE_FLAMETHROWER)
            {
            gun[? "bSpeed"] *= 2;
            gun[? "bDistanceLife"] = 2000;
            gun[? "bTimeLife"] = 5;
            }
        displayParts = true; gunheldcol2 = make_color_rgb(205,170,110);
        normalFlame = true; specialFlame = false;
        break;
                               
    case "Aluminum":
        col = make_color_rgb(162,190,218);
        gunheldcol1= col;
        col = c_white;
        gun[? "pBulletColor"] = make_color_rgb(210, 210, 205);
        normalFlame = true; specialFlame = false;
        break;
                                
    case "Glass":
        col = make_color_rgb(55,75,170);
        gunheldcol1= col;
        gun[? "pBulletSprite"] = sprite_get_name(s_bull_glass_light);
        gun[? "soundId"] = "hoopzweap_glass_shot";
        gun[? "sound_normalPitchDmg"] = 20;
        displaySpots = true; gunheldcol3 = make_color_rgb(220,230,255);
        displayParts = true; gunheldcol2 = make_color_rgb(170,200,225);
        if(type != GUN_TYPE_FLAMETHROWER && type != GUN_TYPE_FLAREGUN){gun[? "bSpeed"] *= .6;}
        normalFlame = true; specialFlame = false;
        specialFlaregun = true; specialRocket = true;
        break; 
                                
    case "Plastic":
        col = make_color_rgb(30,160,255);
        gunheldcol1= col;
        gun[? "pBulletSprite"] = sprite_get_name(s_bull_foam);
        col = c_white;
        gun[? "soundId"] = "hoopzweap_foamdart_shot";
        gun[? "bRangeEndGrav"] = 7;
        gun[? "sound_normalPitchDmg"] = 15;
        if(type != GUN_TYPE_FLAMETHROWER && type != GUN_TYPE_FLAREGUN){gun[? "bSpeed"] *= .65;}
        gun[? "bShadow"] = 2;
        gun[? "bcasing"] = "";
        
        switch(type)
        {
            case GUN_TYPE_FLAREGUN:
                gun[? "bExplode"] = "";
                gun[? "bDealDamage"] = true;
                break;
                
            case GUN_TYPE_ROCKET:
                gun[? "bExplode"] = "";
                gun[? "bDealDamage"] = true;
                break;
                
            case GUN_TYPE_BFG:
                gun[? "bExplode"] = "";
                gun[? "bDealDamage"] = false;
                break;
        }
        
        displayParts = true; gunheldcol2 = make_color_rgb(230,100,210);
        normalFlame = true; specialFlame = false;
        specialFlaregun = true; specialRocket = true;
        specialBFG = true;
        break;
                                
    case "Leather":
        col = make_color_rgb(196,70,60);
        gunheldcol1= col;
        col = c_white;
        gun[? "pBulletColor"] = make_color_rgb(230, 190, 70);
        displaySpots = true; gunheldcol3 = make_color_rgb(230,200,30);
        displayParts = true; gunheldcol2 = make_color_rgb(180,140,105);
        normalFlame = true; specialFlame = false;
        break;
                                
    case "Studded":
        col = make_color_rgb(90,30,60);
        gunheldcol1= col;
        gun[? "pBulletColor"] = make_color_rgb(180, 60, 30);
        switch(type)
        {
            case GUN_TYPE_PISTOL: col = c_white; break;
            default: col = c_dkgray; break;
        }
        displaySpots = true; gunheldcol3 = make_color_rgb(240,240,230);
        displayParts = true; gunheldcol2 = make_color_rgb(195,65,55);
        normalFlame = true; specialFlame = false;
        break;
                               
    case "Dual":
        col = make_color_rgb(160,210,255);
        gunheldcol1= col;
        displayParts = true; gunheldcol2 = make_color_rgb(215,220,255);
        gunheldcol1= col;
        col = c_white;
        normalFlame = true; specialFlame = false;
        break;
                                
    case "Plantain":
        col = make_color_rgb(246,195,20);
        gunheldcol1= col;
        col = c_white;
        gun[? "pBulletColor"] = make_color_rgb(230, 225, 30);
        gun[? "bExplodeEffect"] = NULL;
        switch(type)
        {
            case GUN_TYPE_FLAREGUN: gun[? "bExplosion"] = ""; break;
            case GUN_TYPE_ROCKET:
                gun[? "bExplosion"] = "";
                gun[? "bDealDamage"] = true;
                gun[? "bExplodeDamageMod"] = 0.2;
                break;
            case GUN_TYPE_BFG:
                gun[? "bDealDamage"] = false;
                gun[? "bExplode"] = "";
                gun[? "bExplosion"] = "";
                gun[? "bExplodeDamageMod"] = 0.2;
                break;
            default:
                gun[? "bAccel"] = -1;
                break;
        }
        gun[? "soundId"] = "hoopzweap_plantain_shot";
        gun[? "sound_normalPitchDmg"] = 20;
        specialBFG = true;
        gun[? "bSpeed"] *= .5;
        gun[? "bMinSpeed"] = 2;
        gun[? "pBulletSprite"] = sprite_get_name(s_bull_plantain);
        gun[? "bcasing"] = "s_plantainPeel";
        normalFlame = false; specialFlame = false;
        specialFlaregun = true; specialRocket = true;
        break;
                                
    case "Bone":
        col = make_color_rgb(250,250,250);
        gunheldcol1= col;
        gun[? "bRangeEndGrav"] = 7;
        if(type != GUN_TYPE_FLAMETHROWER && type != GUN_TYPE_FLAREGUN){gun[? "bSpeed"] *= .65;}
        gun[? "bMinSpeed"] = 2;
        
        gun[? "bLobGravity"] = 0.3;
        gun[? "bRangeEndGrav"] = 15;
        gun[? "bShadow"] = 2;
        gun[? "soundId"] = "hoopzweap_bone_shot";
        gun[? "sound_normalPitchDmg"] = 20;
        gun[? "pBulletSprite"] = sprite_get_name(s_bull_bone);
        gun[? "bcasing"] = "";
        
        switch(type)
        {
            case GUN_TYPE_FLAREGUN:
                gun[? "bExplosion"] = "";
                gun[? "bExplodeDamageMod"] = 0.25;
                gun[? "bDealDamage"] = false;
                break;
            case GUN_TYPE_ROCKET:
                 gun[? "bExplosion"] = "";
                 gun[? "bExplodeDamageMod"] = 0.25;
                gun[? "bDealDamage"] = true;
                break;
            case GUN_TYPE_BFG:
                gun[? "bDealDamage"] = false;
                gun[? "bExplode"] = "";
                gun[? "bExplosion"] = "";
                gun[? "bSpeed"] = 24;
                gun[? "bAdvanced"] = true;
                break;
        }
        
        specialBFG = true;
        displaySpots = true; gunheldcol2 = make_color_rgb(0,0,0);
        normalFlame = false; specialFlame = false;
        specialFlaregun = true; specialRocket = true;
        break;
                                
    case "Aluminium":
        col = make_color_rgb(255,255,255);
        gunheldcol1= col;
        col = c_white;
        gun[? "pBulletColor"] = make_color_rgb(255, 240, 255);
        normalFlame = true; specialFlame = false;
        break;
                
    case "Titanium":
        col = make_color_rgb(120,70,155);
        gunheldcol1= col;
        gun[? "pBulletColor"] = make_color_rgb(220, 225, 225);
        switch(type)
        {
            case GUN_TYPE_PISTOL: col = c_white; break;
            case GUN_TYPE_SUBMACHINEGUN: col = c_white; break;
            default: break;
        }
        displaySpots = true; gunheldcol3 = make_color_rgb(230,220,130);
        displayParts = true; gunheldcol2 = make_color_rgb(140,160,250);
        normalFlame = true; specialFlame = false;
        break;
                
    case "Stone":
        _kbc = 1.2;
        _stn = 1.2;
        col = make_color_rgb(140,130,190);
        gunheldcol1= col;
        gun[? "pBulletSprite"] = sprite_get_name(s_bull_stone);
        if(type != GUN_TYPE_FLAMETHROWER)
        {
            gun[? "bSpeed"] *= .65;
            gun[? "bMinSpeed"] = 2;
            col = c_white;
            
            gun[? "bLobGravity"] = 2;
            gun[? "bRangeEndGrav"] = 15;
            gun[? "bLobDirection"] = 0;
        }
        
        gun[? "soundId"] = "hoopzweap_stone_shot";
        gun[? "sound_normalPitchDmg"] = 22;
        switch(type)
        {
            case GUN_TYPE_FLAREGUN:
                gun[? "bExplosion"] = "";
                gun[? "bExplodeDamageMod"] = 0.25;
                gun[? "bDealDamage"] = false;
                break;
            case GUN_TYPE_ROCKET:
                 gun[? "bExplosion"] = "";
                 gun[? "bExplodeDamageMod"] = 0.25;
                gun[? "bDealDamage"] = true;
                break;
            case GUN_TYPE_BFG:
                gun[? "bDealDamage"] = false;
                gun[? "bExplode"] = "";
                gun[? "bExplosion"] = "";
                gun[? "bSpeed"] = 12;
                gun[? "bMinSpeed"] = 2;
                gun[? "bRoaming"] += 5;
                gun[? "bEnemySeek"] -= 10;
                gun[? "bEnemySeekRange"] += 96;
                gun[? "bEnemySeekTime"] = .1;
                gun[? "bLobGravity"] = 0.4;
                gun[? "bRangeEndGrav"] = 10;
                gun[? "bAdvanced"] = true;
                break;
        }
        
        specialBFG = true;
        gun[? "bShadow"] = 2;
        gun[? "bcasing"] = "";
        gun[? "bAdvanced"] = true;
        displayParts = true; gunheldcol2 = make_color_rgb(140,190,215);
        displaySpots = true; gunheldcol3 = make_color_rgb(100,65,150);
        normalFlame = false; specialFlame = true;
        specialFlaregun = true; specialRocket = true;
        break;     
                
    case "Chrome":
        col = make_color_rgb(115,65,155);
        gunheldcol1= col;
        col = c_white;
        gun[? "pBulletColor"] = make_color_rgb(235, 230, 235);
        displaySpots = true; gunheldcol3 = make_color_rgb(240,240,240);
        displayParts = true; gunheldcol2 = make_color_rgb(190,200,240);
        normalFlame = true; specialFlame = false;
        break;                
                
    case "Frankincense":
        col = make_color_rgb(230,160,22);
        gunheldcol1= col;
        gun[? "pBulletSprite"] = sprite_get_name(s_bull_frankincense);
        if(type != GUN_TYPE_FLAMETHROWER && type != GUN_TYPE_FLAREGUN){gun[? "bSpeed"] *= .4;}
        gun[? "bcasing"] = "";
        col = c_white;
        displaySpots = true; gunheldcol3 = make_color_rgb(100,60,40);
        displayParts = true; gunheldcol2 = make_color_rgb(255,255,60);
        normalFlame = false; specialFlame = true;
        specialFlaregun = true; specialRocket = true;
        break;
                                
    case "Iron":
        col = make_color_rgb(110,64,150);
        gunheldcol1= col;
        col = c_white;
        displayParts = true; gunheldcol2 = make_color_rgb(150,142,200);
        normalFlame = true; specialFlame = false;
        break;
                                
    case "Cobalt":
        col = make_color_rgb(140,165,255);
        gunheldcol1= col;
        gun[? "pBulletSprite"] = sprite_get_name(s_bull_cobalt);
        if(type != GUN_TYPE_FLAMETHROWER && type != GUN_TYPE_FLAREGUN){gun[? "bSpeed"] *= .7;}
        gun[? "bMinSpeed"] = 3;
        displayParts = true; gunheldcol2 = make_color_rgb(230,210,225);
        normalFlame = true; specialFlame = false;
        specialFlaregun = true; specialRocket = true;
        break;
                                
    case "Nickel":
        col = make_color_rgb(235,215,225);
        gunheldcol1= col;
        col = c_white;
        gun[? "pBulletColor"] = make_color_rgb(200, 190, 140);
        normalFlame = true; specialFlame = false;
        break;
                                
    case "Copper":
        col = make_color_rgb(160,63,63);
        gunheldcol1= col;
        col = c_white;
        gun[? "pBulletSprite"] = sprite_get_name(s_bull_copper);
        if(type != GUN_TYPE_FLAMETHROWER && type != GUN_TYPE_FLAREGUN){gun[? "bSpeed"] *= .7;}
        displayParts = true; gunheldcol2 = make_color_rgb(210,150,80);
        normalFlame = true; specialFlame = false;
        specialFlaregun = true; specialRocket = true;
        break;
                                
    case "Zinc":
        col = make_color_rgb(130,86,176);
        gunheldcol1= col;
        col = c_white;
        gun[? "pBulletColor"] = make_color_rgb(90, 90, 80);
        displaySpots = true; gunheldcol3 = make_color_rgb(225,203,217);
        displayParts = true; gunheldcol2 = make_color_rgb(160,190,200);
        normalFlame = true; specialFlame = false;
        break;
        
    case "Fiberglass":
        col = make_color_rgb(142,130,180);
        gunheldcol1= col;
        col = c_white;
        gun[? "pBulletColor"] = make_color_rgb(240, 250, 240);
        displaySpots = true; gunheldcol3 = make_color_rgb(152,190,210);
        displayParts = true; gunheldcol2 = make_color_rgb(152,210,255);
        normalFlame = true; specialFlame = false;
        break;
                
    case "Grass":
        col = make_color_rgb(119,65,42);
        gunheldcol1= col;
        col = c_white;
        if(type != GUN_TYPE_FLAMETHROWER && type != GUN_TYPE_FLAREGUN){gun[? "bSpeed"] *= .5;
        gun[? "bMinSpeed"] = 2;}
        gun[? "bcasing"] = "";
        gun[? "soundId"] = "hoopzweap_grass_shot";
        gun[? "sound_normalPitchDmg"] = 25;
        gun[? "pBulletSprite"] = sprite_get_name(s_bull_grass);
        switch(type)
        {
            case GUN_TYPE_FLAREGUN:
                gun[? "bExplosion"] = "";
                gun[? "bExplodeDamageMod"] = 0.20;
                gun[? "bDealDamage"] = false;
                break;
            case GUN_TYPE_ROCKET:
                 gun[? "bExplosion"] = "";
                 gun[? "bExplodeDamageMod"] = 0.20;
                gun[? "bDealDamage"] = true;
                break;
            case GUN_TYPE_BFG:
                gun[? "bDealDamage"] = false;
                gun[? "bExplode"] = "";
                gun[? "bExplosion"] = "";
                gun[? "bSpeed"] = 24;
                break;
        }
        specialBFG = true;
        displaySpots = true; gunheldcol3 = make_color_rgb(30,230,40);
        displayParts = true; gunheldcol2 = make_color_rgb(75,137,81);
        normalFlame = false; specialFlame = true;
        specialFlaregun = true; specialRocket = true;
        break;
                
    case "Soy":
        col = make_color_rgb(255,200,187);
        gunheldcol1= col;
        col = c_white;
        gun[? "soundId"] = "hoopzweap_soy_shot";
        displaySpots = true; gunheldcol3 = make_color_rgb(255,255,255);
        displayParts = true; gunheldcol2 = make_color_rgb(248,244,239);
        gun[? "pBulletSprite"] = sprite_get_name(s_bull_tofu1);
        if(type != GUN_TYPE_FLAMETHROWER && type != GUN_TYPE_FLAREGUN){gun[? "bSpeed"] *= .3;}
        gun[? "bMinSpeed"] = 2;
        gun[? "bLobGravity"] = 0.5;
        gun[? "bRangeEndGrav"] = 20;
        gun[? "bcasing"] = "";
        normalFlame = false; specialFlame = true;
        specialFlaregun = true; specialRocket = true;
        break;

    case "Steel":
        col = make_color_rgb(160,210,255);
        gunheldcol1= col;
        displayParts = true; gunheldcol2 = make_color_rgb(215,220,255);
        normalFlame = true; specialFlame = false;
        break;
                
    case "Brass":
        col = make_color_rgb(197,68,58);
        gunheldcol1= col;
        col = c_white;
        if(type != GUN_TYPE_FLAMETHROWER && type != GUN_TYPE_FLAREGUN){gun[? "bSpeed"] *= .5;}
        gun[? "pBulletSprite"] = sprite_get_name(s_bull_brass);
        displayParts = true; gunheldcol2 = make_color_rgb(142,132,186);
        displaySpots = true; gunheldcol3 = make_color_rgb(238,195,22);
        normalFlame = true; specialFlame = false;
        specialFlaregun = true; specialRocket = true;
        break;
                 
    case "Orichalcum":
        col = make_color_rgb(30,80,30);
        gunheldcol1= col;
        col = c_white;
        displayParts = true; gunheldcol2 = make_color_rgb(50,147,80);
        displaySpots = true; gunheldcol3 = make_color_rgb(240,230,30);
        gun[? "pBulletSprite"] = sprite_get_name(s_bull_orichal);
        gun[? "soundId"] = "hoopzweap_orichalcum_shot";
        gun[? "sound_normalPitchDmg"] = 30;
        if(type != GUN_TYPE_FLAMETHROWER && type != GUN_TYPE_FLAREGUN){gun[? "bSpeed"] *= .4;
        gun[? "bMinSpeed"] = 2;
        gun[? "bLobGravity"] = 6;
        gun[? "bWallRicochet"] += 2;
        gun[? "bRicochetRandom"] = true;}
        gun[? "bAdvanced"] = true;
        gun[? "bcasing"] = "";
        
        switch(type)
        {
            case GUN_TYPE_FLAREGUN:
                gun[? "bExplosion"] = "";
                gun[? "bExplodeDamageMod"] = 0.20;
                gun[? "bDealDamage"] = false;
                break;
            case GUN_TYPE_ROCKET:
                 gun[? "bExplosion"] = "";
                 gun[? "bExplodeDamageMod"] = 0.20;
                gun[? "bDealDamage"] = true;
                break;
            case GUN_TYPE_BFG:
                gun[? "bDealDamage"] = false;
                gun[? "bExplode"] = "";
                gun[? "bExplosion"] = "";
                gun[? "bSpeed"] = 24;
                break;
        }
        
        specialBFG = true;
        normalFlame = false; specialFlame = true;
        specialFlaregun = true; specialRocket = true;
        break;  
                
    case "Napalm":
        col = make_color_rgb(20,174,255);
        gunheldcol1= col;
        displayParts = true; gunheldcol2 = make_color_rgb(232,100,214);
        gun[? "pBulletSprite"] = sprite_get_name(s_bull_flamethrower);
        gun[? "bcasing"] = "";
        gun[? "soundId"] = "hoopzweap_napalm_shot";
        if(type != GUN_TYPE_FLAMETHROWER){gun[? "bAccel"] = -4;
        gun[? "bMinSpeed"] = 2;
        gun[? "bRangeEndGrav"] = 0;}
        gun[? "sound_normalPitchDmg"] = 20;
        gun[? "speedBonus"] = 1;
        switch(type)
        {
            case GUN_TYPE_FLAREGUN:
                gun[? "bExplosion"] = "";
                gun[? "bExplodeDamageMod"] = 0.20;
                gun[? "bDealDamage"] = false;
                gun[? "bAccel"] = 0;
                break;
            case GUN_TYPE_ROCKET:
                gun[? "bExplosion"] = "";
                gun[? "bExplodeDamageMod"] = 0.20;
                gun[? "bAccel"] = 0.1;
                gun[? "bDealDamage"] = true;
                break;
            case GUN_TYPE_BFG:
                gun[? "bDealDamage"] = false;
                gun[? "bExplode"] = "";
                gun[? "bExplosion"] = "";
                gun[? "bSpeed"] = 20;
                gun[? "bAccel"] = 0;
                break;
                
            case GUN_TYPE_FLAMETHROWER:
            case GUN_TYPE_MACHINEPISTOL:
            case GUN_TYPE_HEAVYMACHINEGUN:
            case GUN_TYPE_MINIGUN:
            case GUN_TYPE_GATLINGGUN:
            case GUN_TYPE_MITRAILLEUSE:
                gun[? "soundId"] = "hoopzweap_napalm_shot_alt";
                gun[? "sound_normalPitchDmg"] = 10;
                gun[? "bSpeed"] *= .5;
                gun[? "bDistanceLife"] = -1;
                gun[? "bTimeLife"] = 7;
                break;
            default:
                gun[? "bSpeed"] *= .5;
                gun[? "bDistanceLife"] = -1;
                gun[? "bTimeLife"] = 7;
                break;
        }
        specialBFG = true;
        normalFlame = false; specialFlame = true;
        specialFlaregun = true; specialRocket = true;
        break;
                
    case "Origami":
        col = make_color_rgb(150,130,160);
        gunheldcol1= col;
        col = c_white;
        displayParts = true; gunheldcol2 = make_color_rgb(255,255,255);
        displaySpots = true; gunheldcol3 = make_color_rgb(255,255,255);
        gun[? "pKnockback"] = 0;
        gun[? "pStagger"] *= 0;
        gun[? "bcasing"] = "";
        gun[? "pBulletSprite"] = sprite_get_name(s_bull_paper);
        gun[? "soundId"] = "hoopzweap_origami_shot";
        gun[? "sound_normalPitchDmg"] = 25;
        switch(type)
        {
            case GUN_TYPE_FLAREGUN:
                gun[? "bExplosion"] = "";
                gun[? "bExplodeDamageMod"] = 0.20;
                gun[? "bDealDamage"] = false;
                gun[? "bAccel"] = 0;
                break;
            case GUN_TYPE_ROCKET:
                gun[? "bExplosion"] = "";
                gun[? "bExplodeDamageMod"] = 0.20;
                gun[? "bAccel"] = 0.1;
                gun[? "bDealDamage"] = true;
                break;
            case GUN_TYPE_BFG:
                gun[? "bDealDamage"] = false;
                gun[? "bExplode"] = "";
                gun[? "bExplosion"] = "";
                gun[? "bSpeed"] = 20;
                gun[? "bAccel"] = 0;
                break;
                
            default:
                break;
        }
        specialBFG = true;
        
        normalFlame = false; specialFlame = true;
        specialFlaregun = true; specialRocket = true;
        break;
                
    case "Offal":
        col = make_color_rgb(150,40,40);
        gunheldcol1= col;
        col = c_white;
        gun[? "pBulletSprite"] = sprite_get_name(s_bull_offal);
        if(type != GUN_TYPE_FLAMETHROWER && type != GUN_TYPE_FLAREGUN){gun[? "bSpeed"] *= .4;
        gun[? "bMinSpeed"] = 2;}
        gun[? "soundId"] = "hoopzweap_offal_shot";
        gun[? "sound_normalPitchDmg"] = 30;
        gun[? "bcasing"] = "";
        switch(type)
        {
            case GUN_TYPE_FLAREGUN:
                gun[? "bExplosion"] = "";
                gun[? "bExplodeDamageMod"] = 0.20;
                gun[? "bDealDamage"] = false;
                gun[? "bAccel"] = 0;
                break;
            case GUN_TYPE_ROCKET:
                gun[? "bExplosion"] = "";
                gun[? "bExplodeDamageMod"] = 0.20;
                gun[? "bAccel"] = 0.1;
                gun[? "bDealDamage"] = true;
                break;
            case GUN_TYPE_BFG:
                gun[? "bDealDamage"] = false;
                gun[? "bExplode"] = "";
                gun[? "bExplosion"] = "";
                gun[? "bSpeed"] = 20;
                gun[? "bAccel"] = 0;
                break;
                
            default:
                break;
        }
        specialBFG = true;
        normalFlame = false; specialFlame = true;
        specialFlaregun = true; specialRocket = true;
        displayParts = true; gunheldcol2 = make_color_rgb(255,40,20);
        displaySpots = true; gunheldcol3 = make_color_rgb(160,20,190);
        break;
                
    case "Crystal":
        col = make_color_rgb(190,78,95);
        gunheldcol1= col;
        col = c_white;
        if(type != GUN_TYPE_FLAMETHROWER && type != GUN_TYPE_FLAREGUN){gun[? "bSpeed"] *= .5;
        gun[? "bMinSpeed"] = 4;}
        gun[? "bcasing"] = "";
        gun[? "pBulletSprite"] = sprite_get_name(s_bull_crystalshot);
        gun[? "soundId"] = "hoopzweap_crystal_shot";
        gun[? "sound_normalPitchDmg"] = 30;
        switch(type)
        {
            case GUN_TYPE_FLAREGUN:
                gun[? "bExplosion"] = "";
                gun[? "bExplodeDamageMod"] = 0.20;
                gun[? "bDealDamage"] = false;
                gun[? "bAccel"] = 0;
                break;
            case GUN_TYPE_ROCKET:
                gun[? "bExplosion"] = "";
                gun[? "bExplodeDamageMod"] = 0.20;
                gun[? "bAccel"] = 0.1;
                gun[? "bDealDamage"] = true;
                break;
            case GUN_TYPE_BFG:
                gun[? "bDealDamage"] = false;
                gun[? "bExplode"] = "";
                gun[? "bExplosion"] = "";
                gun[? "bSpeed"] = 20;
                gun[? "bAccel"] = 0;
                break;
                
            case GUN_TYPE_FLAMETHROWER:
            case GUN_TYPE_MACHINEPISTOL:
            case GUN_TYPE_HEAVYMACHINEGUN:
            case GUN_TYPE_MINIGUN:
            case GUN_TYPE_GATLINGGUN:
            case GUN_TYPE_MITRAILLEUSE:
                gun[? "soundId"] = "hoopzweap_crystal_shot_alt";
                gun[? "sound_normalPitchDmg"] = 15;
                break;
                
            default:
                break;
        }
        specialBFG = true;
        displayParts = true; gunheldcol2 = make_color_rgb(152,190,210);
        displaySpots = true; gunheldcol3 = make_color_rgb(20,165,255);
        normalFlame = false; specialFlame = true;
        specialFlaregun = true; specialRocket = true;
        break; 
                
    case "Adamantium":
        col = make_color_rgb(255,245,235);
        gunheldcol1= col;
        col = c_white;
        gun[? "soundId"] = "hoopzweap_adamantium_shot";
        gun[? "pBulletSprite"] = sprite_get_name(s_bull_adamant);
        if(type != GUN_TYPE_FLAMETHROWER && type != GUN_TYPE_FLAREGUN){gun[? "bSpeed"] *= .4;
        gun[? "bMinSpeed"] = 3;}
        gun[? "bAdvanced"] = true;
        gun[? "bEnemyPierce"] += 3;
        gun[? "bcasing"] = "";
        gun[? "pAccuracy"] = gun[? "pAccuracy"]*0.5;
        gun[? "bDistanceLife"] = gun[? "bDistanceLife"]*0.6;
        displayParts = true; gunheldcol2 = make_color_rgb(20,165,255);
        normalFlame = true; specialFlame = false;
        specialFlaregun = true; specialRocket = true;
        break;
                
    case "Silk":
        col = make_color_rgb(150,190,210);
        gun[? "pBulletColor"] = col;
        gunheldcol1= col;
        if(type != GUN_TYPE_FLAMETHROWER)
        {
            gun[? "bSpeed"] *= .65;
            gun[? "bMinSpeed"] = 2;
            col = c_white;
            
            gun[? "bLobGravity"] = 2;
            gun[? "bRangeEndGrav"] = 15;
            gun[? "bLobDirection"] = 0;
        }
        col = c_white;
        gun[? "sound_normalPitchDmg"] = 25;
        gun[? "soundId"] = "hoopzweap_silk_shot";
        gun[? "bcasing"] = "";
        displayParts = true; gunheldcol2 = make_color_rgb(235,215,225);
        displaySpots = true; gunheldcol3 = make_color_rgb(255,255,255);
        normalFlame = false; specialFlame = false;
        break;
                
    case "Marble":
        col = make_color_rgb(190,145,110);
        gunheldcol1= col;
        col = c_white;
        displayParts = true; gunheldcol2 = make_color_rgb(255,255,255);
        displaySpots = true; gunheldcol3 = make_color_rgb(255,200,40);
        gun[? "bcasing"] = "";
        gun[? "soundId"] = "hoopzweap_marble_shot";
        gun[? "sound_normalPitchDmg"] = 30;
        gun[? "pBulletSprite"] = sprite_get_name(s_bull_angelCore);
        switch(type)
        {
            case GUN_TYPE_FLAREGUN:
                gun[? "bExplosion"] = "";
                gun[? "bExplodeDamageMod"] = 0.20;
                gun[? "bDealDamage"] = false;
                gun[? "bAccel"] = 0;
                gun[? "bLobGravity"] = 1.5;
                break;
            case GUN_TYPE_ROCKET:
                gun[? "bExplosion"] = "";
                gun[? "bExplodeDamageMod"] = 0.20;
                gun[? "bAccel"] = 0.1;
                gun[? "bDealDamage"] = true;
                break;
            case GUN_TYPE_BFG:
                gun[? "bDealDamage"] = false;
                gun[? "bExplode"] = "o_angelBFG";
                gun[? "bExplosion"] = "";
                gun[? "bSpeed"] = 20;
                gun[? "bAccel"] = 0;
                gun[? "bExplodeOnWall"] = true;
                gun[? "bExplodeOnEnemy"] = true;
                gun[? "bExplodeOnEnemyProx"] = false;
                gun[? "bExplodeOnGround"] = true;
                gun[? "bExplodeOnTimeout"] = true;
                gun[? "bDealDamage"] = true;
                gun[? "bExplodeDamageMod"] = 1;
                break;
                
            case GUN_TYPE_FLAMETHROWER:
            case GUN_TYPE_MACHINEPISTOL:
            case GUN_TYPE_HEAVYMACHINEGUN:
            case GUN_TYPE_MINIGUN:
            case GUN_TYPE_GATLINGGUN:
            case GUN_TYPE_MITRAILLEUSE:
                gun[? "soundId"] = "hoopzweap_marble_shot_alt";
                gun[? "sound_normalPitchDmg"] = 15;
                break;
            default:
                break;
        }
        specialBFG = true;
        normalFlame = false; specialFlame = true;
        specialFlaregun = true; specialRocket = true;
        break;
                
    case "Rubber":
        col = make_color_rgb(40,30,70);
        gunheldcol1= col;
        gun[? "soundId"] = "hoopzweap_rubber_shot";
        gun[? "pBulletSprite"] = sprite_get_name(s_bull_rubber);
        gun[? "pBulletColor"] = make_color_rgb(200, 40, 215);
        gun[? "bAdvanced"] = true;        
        gun[? "bRicochetRandom"] = false;
        if(type != GUN_TYPE_FLAMETHROWER && type != GUN_TYPE_FLAREGUN){
        gun[? "bSpeed"] *= .5;
        gun[? "bWallRicochet"] += 2;
        gun[? "bMinSpeed"] = 2;
        }
        
        switch(type)
        {
            case GUN_TYPE_FLAREGUN:
                gun[? "bExplosion"] = "";
                gun[? "bExplodeDamageMod"] = 0.20;
                gun[? "bDealDamage"] = false;
                gun[? "bAccel"] = 0;
                break;
            case GUN_TYPE_ROCKET:
                gun[? "bExplosion"] = "";
                gun[? "bExplodeDamageMod"] = 0.20;
                gun[? "bAccel"] = 0.1;
                gun[? "bDealDamage"] = true;
                break;
            case GUN_TYPE_BFG:
                gun[? "bDealDamage"] = false;
                gun[? "bExplode"] = "";
                gun[? "bExplosion"] = "";
                gun[? "bSpeed"] = 20;
                gun[? "bAccel"] = 0;
                break;
                
            default:
                break;
        }
        specialBFG = true;
        
        col = c_white;
        displayParts = true; gunheldcol2 = make_color_rgb(100,60,150);
        displaySpots = true; gunheldcol3 = make_color_rgb(230,100,210);
        normalFlame = false; specialFlame = false;
        specialFlaregun = true; specialRocket = true;
        break;
                
    case "Foil":
        col = make_color_rgb(110,67,150);
        gunheldcol1= col;
        col = c_white;
        gun[? "soundId"] = "hoopzweap_foil_shot";
        gun[? "pBulletSprite"] = sprite_get_name(s_bull_foil);
        if(type != GUN_TYPE_FLAMETHROWER && type != GUN_TYPE_FLAREGUN){gun[? "bSpeed"] *= .6;}
        gun[? "bcasing"] = "";
        displayParts = true; gunheldcol2 = make_color_rgb(190,210,255);
        displaySpots = true; gunheldcol3 = make_color_rgb(240,240,235);
        normalFlame = true; specialFlame = false;
        specialFlaregun = true; specialRocket = true;
        break;
                
    case "Blood":
        col = make_color_rgb(100,60,140);
        gunheldcol1= col;
        col = c_white;
        gun[? "pBulletSprite"] = sprite_get_name(s_bull_blood);
        gun[? "pBulletColor"] = make_color_rgb(250, 60, 40);
        gun[? "bcasing"] = "";
        switch(type)
        {
            case GUN_TYPE_FLAREGUN:
                gun[? "bExplosion"] = "";
                gun[? "bExplodeDamageMod"] = 0.20;
                gun[? "bDealDamage"] = false;
                gun[? "bAccel"] = 0;
                break;
            case GUN_TYPE_ROCKET:
                gun[? "bExplosion"] = "";
                gun[? "bExplodeDamageMod"] = 0.20;
                gun[? "bAccel"] = 0.1;
                gun[? "bDealDamage"] = true;
                break;
            case GUN_TYPE_BFG:
                gun[? "bDealDamage"] = false;
                gun[? "bExplode"] = "";
                gun[? "bExplosion"] = "";
                gun[? "bSpeed"] = 20;
                gun[? "bAccel"] = 0;
                gun[? "bSpeed"] *= .5;
                break;
                
            default:
                break;
        }
        specialBFG = true;
        displayParts = true; gunheldcol2 = make_color_rgb(180,122,140);
        displaySpots = true; gunheldcol3 = make_color_rgb(245,30,15);
        normalFlame = false; specialFlame = false;
        specialFlaregun = true; specialRocket = true;
        break;
                
    case "Silver":
        col = make_color_rgb(100,50,130);
        gunheldcol1= col;
        col = c_white;
        gun[? "pBulletColor"] = make_color_rgb(210, 210, 215);
        if(type != GUN_TYPE_FLAMETHROWER && type != GUN_TYPE_FLAREGUN)
        {
            gun[? "bSpeed"] = 1;
            gun[? "bMaxSpeed"] = 80;
            gun[? "bMinSpeed"] = 1;
            gun[? "bAccel"] = 15;
        }
        gun[? "pBulletSprite"] = sprite_get_name(s_bull_silver);
        displayParts = true; gunheldcol2 = make_color_rgb(150,190,210);
        displaySpots = true; gunheldcol3 = make_color_rgb(255,255,255);
        normalFlame = false; specialFlame = false;
        specialFlaregun = true; specialRocket = true;
        break;
                
    case "Chitin":
        col = make_color_rgb(222,100,200);
        gunheldcol1= col;
        col = c_white;
        gun[? "bcasing"] = "";
        gun[? "soundId"] = "hoopzweap_chitin_shot";
        gun[? "sound_normalPitchDmg"] = 25;
        gun[? "pBulletSprite"] = sprite_get_name(s_bull_chitin_egg);
        displayParts = true; gunheldcol2 = make_color_rgb(255,160,255);
        displaySpots = true; gunheldcol3 = make_color_rgb(255,160,255);
        normalFlame = true; specialFlame = false;
        specialFlaregun = true; specialRocket = true;
        break;
                
                
    case "Sinew":
        col = make_color_rgb(150,40,30);
        gun[? "bcasing"] = "";
        gun[? "pBulletSprite"] = sprite_get_name(s_bull_sinew);
        gun[? "pBulletColor"] = make_color_rgb(120, 20, 20);
        if(type != GUN_TYPE_FLAMETHROWER && type != GUN_TYPE_FLAREGUN){gun[? "bSpeed"] *= 0.5;}
        gunheldcol1= col;
        col = c_white;
        displayParts = true; gunheldcol2 = make_color_rgb(231,40,10);
        displaySpots = true; gunheldcol3 = make_color_rgb(230,160,20);
        normalFlame = false; specialFlame = false;
        specialFlaregun = true; specialRocket = true;
        break;
                
                
    case "Tin":
        col = make_color_rgb(120,70,160);
        gunheldcol1= col;
        col = c_white;
        if(type != GUN_TYPE_FLAMETHROWER && type != GUN_TYPE_FLAREGUN){gun[? "bSpeed"] *= 0.5;
        gun[? "bMinSpeed"] = 2;}
        gun[? "pBulletSprite"] = sprite_get_name(s_bull_tin);
        gun[? "bSpiraling"] = 15;
        gun[? "bWallRicochet"] += 1;
        gun[? "bAdvanced"] = true;
        gun[? "bRicochetRandom"] = false;
        gun[? "bcasing"] = "";
        displayParts = true; gunheldcol2 = make_color_rgb(160,200,210);
        normalFlame = true; specialFlame = false;
        specialFlaregun = true; specialRocket = true;
        break;
                
                
    case "Obsidian":
        col = make_color_rgb(40,15,25);
        gunheldcol1= col;
        col = c_white;
        displayParts = true; gunheldcol2 = make_color_rgb(120,50,90);
        displaySpots = true; gunheldcol3 = make_color_rgb(255,120,45);
        if(type != GUN_TYPE_FLAMETHROWER && type != GUN_TYPE_FLAREGUN){gun[? "bSpeed"] *= 0.3;
        gun[? "bMaxSpeed"] = 80;
        gun[? "bMinSpeed"] = 2;}
        gun[? "bcasing"] = "";
        gun[? "pBulletSprite"] = sprite_get_name(s_bull_magma);
        switch(type)
        {
            case GUN_TYPE_FLAREGUN:
                gun[? "bExplosion"] = "";
                gun[? "bExplodeDamageMod"] = 0.20;
                gun[? "bDealDamage"] = false;
                gun[? "bAccel"] = 0;
                break;
            case GUN_TYPE_ROCKET:
                gun[? "bExplosion"] = "";
                gun[? "bExplodeDamageMod"] = 0.20;
                gun[? "bAccel"] = 0.1;
                gun[? "bDealDamage"] = true;
                break;
            case GUN_TYPE_BFG:
                gun[? "bDealDamage"] = false;
                gun[? "bExplode"] = "o_obsidianBFG";
                gun[? "bLobGravity"] = 4;
                gun[? "bExplosion"] = "";
                gun[? "bSpeed"] = 14;
                gun[? "bAccel"] = -1;
                gun[? "bExplodeOnWall"] = true;
                gun[? "bExplodeOnEnemy"] = true;
                gun[? "bExplodeOnEnemyProx"] = false;
                gun[? "bExplodeOnGround"] = true;
                gun[? "bExplodeOnTimeout"] = true;
                gun[? "bDealDamage"] = true;
                gun[? "bExplodeDamageMod"] = 1;
                break;
                
            default:
                break;
        }
        specialBFG = true;
        normalFlame = true; specialFlame = false;
        specialFlaregun = true; specialRocket = true;
        break;
                
                
    case "Fungus":
        col = make_color_rgb(150,190,210);
        gunheldcol1= col;
        gun[? "pBulletSprite"] = sprite_get_name(s_bull_spore);
        col = c_white;
        gun[? "soundId"] = "fungi_spore_shot";
        gun[? "sound_normalPitchDmg"] = 25;
        gun[? "bcasing"] = "";
        specialBFG = true;
        displayParts = true; gunheldcol2 = make_color_rgb(255,250,255);
        displaySpots = true; gunheldcol3 = make_color_rgb(245,30,10);
        normalFlame = false; specialFlame = true;
        specialFlaregun = true; specialRocket = true;
        break;
                                
    case "Damascus":
        col = make_color_rgb(110,65,150);
        gunheldcol1= col;
        col = c_white;
        gun[? "pBulletColor"] = make_color_rgb(175, 170, 170);
        displayParts = true; gunheldcol2 = make_color_rgb(195,210,255);
        displaySpots = true; gunheldcol3 = make_color_rgb(110,65,150);
        normalFlame = true; specialFlame = false;
        break;                
                
    case "Analog":
        col = make_color_rgb(90,30,90);
        gunheldcol1= col;
        col = c_white;
        displayParts = true; gunheldcol2 = make_color_rgb(132,132,160);
        normalFlame = true; specialFlame = false;
        break;                
                
    case "Digital":
        col = make_color_rgb(110,70,150);
        gunheldcol1= col;
        col = c_white;
        gun[? "soundId"] = "digital_shot";
        gun[? "bcasing"] = "";
        gun[? "sound_normalPitchDmg"] = 30;
        gun[? "pBulletSprite"] = sprite_get_name(s_bull_digitalLaser);        
        displayParts = true; gunheldcol2 = make_color_rgb(150,190,210);        
        specialBFG = true;
        normalFlame = true; specialFlame = false;
        specialFlaregun = true; specialRocket = true;
        break;
                
    case "Brain":
        col = make_color_rgb(160,25,190);
        gunheldcol1= col;
        col = c_white;
        gun[? "bcasing"] = "";
        gun[? "pBulletSprite"] = sprite_get_name(s_bull_brainshot);
        displayParts = true; gunheldcol2 = make_color_rgb(255,160,255);
        displaySpots = true; gunheldcol3 = make_color_rgb(230,175,200);
        normalFlame = false; specialFlame = true;
        specialFlaregun = true; specialRocket = true;
        break;
                
    case "Chobham":
        col = make_color_rgb(80,30,120);
        gunheldcol1= col;
        col = c_white;
        displayParts = true; gunheldcol2 = make_color_rgb(44,68,140);
        gun[? "pBulletSprite"] = sprite_get_name(s_bull_chobham);
        if(type != GUN_TYPE_FLAMETHROWER && type != GUN_TYPE_FLAREGUN){gun[? "bSpeed"] *= 0.6;}
        normalFlame = true; specialFlame = false;
        specialFlaregun = true; specialRocket = true;
        break;
                
    case "Bronze":
        col = make_color_rgb(139,76,52);
        gunheldcol1= col;
        gun[? "pBulletSprite"] = sprite_get_name(s_bull_bronze);
        if(type != GUN_TYPE_FLAMETHROWER && type != GUN_TYPE_FLAREGUN){gun[? "bSpeed"] *= 0.6;}
        col = c_white;
        displayParts = true; gunheldcol2 = make_color_rgb(187,146,104);
        displaySpots = true; gunheldcol3 = make_color_rgb(133,77,47);
        normalFlame = true; specialFlame = false;
        specialFlaregun = true; specialRocket = true;
        break;
                
    case "Blaster":
        col = make_color_rgb(75,70,85);
        gunheldcol1= col;
        col = c_white;
        gun[? "soundId"] = "hoopzweap_blaster_shot";
        displayParts = true; gunheldcol2 = make_color_rgb(140,164,255);
        gun[? "bcasing"] = "";
        if(type != GUN_TYPE_FLAMETHROWER && type != GUN_TYPE_FLAREGUN){gun[? "bSpeed"] *= 0.75;}
        gun[? "pBulletSprite"] = sprite_get_name(s_bull_blaster);
        gun[? "bExplodeEffect"] = NULL;
        switch(type)
        {
            case GUN_TYPE_FLAREGUN:
                gun[? "bExplosion"] = "s_bull_blasterBlast";
                gun[? "bExplodeDamageMod"] = 0.20;
                gun[? "bDealDamage"] = false;
                gun[? "bAccel"] = 0;
                break;
            case GUN_TYPE_ROCKET:
                gun[? "bExplosion"] = "s_bull_blasterBlastMed";
                gun[? "bExplodeDamageMod"] = 0.20;
                gun[? "bAccel"] = 0.1;
                gun[? "bDealDamage"] = true;
                break;
            case GUN_TYPE_BFG:
                gun[? "bDealDamage"] = true;
                gun[? "bExplode"] = "o_explosion";
                gun[? "bSpeed"] = 14;
                gun[? "bExplosion"] = "s_bull_blasterBlastMed";
                gun[? "bExplodeOnWall"] = true;
                gun[? "bExplodeOnEnemy"] = true;
                gun[? "bExplodeOnEnemyProx"] = false;
                gun[? "bExplodeOnGround"] = true;
                gun[? "bExplodeOnTimeout"] = true;
                gun[? "bExplodeDamageMod"] = 1;
                break;
                
            default:
                break;
        }        
        specialBFG = true;
        normalFlame = false; specialFlame = true;
        specialFlaregun = true; specialRocket = true;
        break;
                
    case "Tungsten":
        col = make_color_rgb(140,130,186);
        gunheldcol1= col;
        col = c_white;
        gun[? "pBulletColor"] = make_color_rgb(165, 160, 160);
        displayParts = true; gunheldcol2 = make_color_rgb(155,200,210);
        normalFlame = true; specialFlame = false;
        break;

    case "Itano":
        col = make_color_rgb(110,65,155);
        gunheldcol1= col;
        gun[? "pBulletSprite"] = sprite_get_name(s_bull_rocket);
        normalFlame = true; specialFlame = false;
        switch(type)
        {
            case GUN_TYPE_MACHINEPISTOL:
            case GUN_TYPE_SUBMACHINEGUN:
            case GUN_TYPE_HEAVYMACHINEGUN:
            case GUN_TYPE_ASSAULTRIFLE:
            case GUN_TYPE_TRANQRIFLE:
                gun[? "soundId"] = "hoopzweap_itano_minirocket";
                gun[? "sound_normalPitchDmg"] = 10;
                break;
                
            case GUN_TYPE_GATLINGGUN:
            case GUN_TYPE_MINIGUN:
            case GUN_TYPE_MITRAILLEUSE:
            case GUN_TYPE_FLAMETHROWER:
            case GUN_TYPE_CROSSBOW:
            case GUN_TYPE_BFG:
            case GUN_TYPE_ROCKET:
                    /////no change
                    gun[? "sound_normalPitchDmg"] = 30;
                break;
                
            case GUN_TYPE_RIFLE:
            case GUN_TYPE_PISTOL:
            case GUN_TYPE_MUSKET:
            case GUN_TYPE_FLINTLOCK:
            case GUN_TYPE_HUNTINGRIFLE:
            case GUN_TYPE_FLAREGUN:
            case GUN_TYPE_SHOTGUN:
            case GUN_TYPE_DOUBLESHOTGUN:
            case GUN_TYPE_REVOLVERSHOTGUN:
                gun[? "soundId"] = "hoopzweap_itano_smallrocket";
                gun[? "sound_normalPitchDmg"] = 20;
                break;
                
            case GUN_TYPE_REVOLVER:
            case GUN_TYPE_MAGNUM:
            case GUN_TYPE_SNIPERRIFLE:
            case GUN_TYPE_ELEPHANTGUN:
                gun[? "soundId"] = "hoopzweap_itano_bigrocket";
                gun[? "sound_normalPitchDmg"] = 40;
            break;           
        }
        
        col = c_white;
        gun[? "bcasing"] = "";
        displayParts = true; gunheldcol2 = make_color_rgb(196,210,255);
        displaySpots = true; gunheldcol3 = make_color_rgb(250,30,10);
        specialBFG = true;
        specialFlaregun = true; specialRocket = true;
        break;
                                
    case "Pearl":
        col = make_color_rgb(120,65,151);
        gunheldcol1= col;
        col = c_white;
        specialBFG = true;
        gun[? "soundId"] = "hoopzweap_pearl_shot";
        gun[? "bAdvanced"] = true;
        gun[? "pBulletSprite"] = sprite_get_name(s_bull_pearl_ghostShot);
        displayParts = true; gunheldcol2 = make_color_rgb(250,240,225);
        displaySpots = true; gunheldcol3 = make_color_rgb(0,160,255);
        if(type != GUN_TYPE_FLAMETHROWER){gun[? "bSpeed"] *= 0.3;}
        gun[? "bcasing"] = "";
        if(gun[? "bSpeed"] <8){gun[? "bSpeed"] = 8;}
        normalFlame = false; specialFlame = true;
        specialFlaregun = true; specialRocket = true;
        break;
                
    case "Myrrh":
        col = make_color_rgb(170,80,100);
        gunheldcol1= col;
        gun[? "pBulletColor"] = make_color_rgb(210,150,140);
        gun[? "pBulletSprite"] = sprite_get_name(s_bull_myrrh);
        if(type != GUN_TYPE_FLAMETHROWER && type != GUN_TYPE_FLAREGUN){gun[? "bSpeed"] *= 0.4;}
        gun[? "bcasing"] = "";
        col = c_white;
        displayParts = true; gunheldcol2 = make_color_rgb(230,150,115);
        displaySpots = true; gunheldcol3 = make_color_rgb(150,130,180);
        normalFlame = false; specialFlame = false;
        specialFlaregun = true; specialRocket = true;
        break;
                
    case "Platinum":
        col = make_color_rgb(240,240,240);
        gunheldcol1= col;
        col = c_white;
        displayParts = true; gunheldcol2 = make_color_rgb(150,190,200);
        displaySpots = true; gunheldcol3 = make_color_rgb(245,245,245);
        normalFlame = true; specialFlame = false;
        break;
                
    case "Gold":
        _kbc = 1.3;
        _stn = 1.3;
        col = make_color_rgb(200,80,50);
        gunheldcol1= col;
        col = c_white;
        if(type != GUN_TYPE_FLAMETHROWER && type != GUN_TYPE_FLAREGUN)
        {
            gun[? "bSpeed"] = 1;
            gun[? "bMaxSpeed"] = 80;
            gun[? "bMinSpeed"] = 1;
            gun[? "bAccel"] = 15;
        }
        gun[? "pBulletSprite"] = sprite_get_name(s_bull_gold);
        displayParts = true; gunheldcol2 = make_color_rgb(255,245,40);
        displaySpots = true; gunheldcol3 = make_color_rgb(255,245,200);
        normalFlame = true; specialFlame = false;
        specialFlaregun = true; specialRocket = true;
        break;
                
    case "Mercury":
        col = make_color_rgb(100,60,140);
        gunheldcol1= col;
        gun[? "pBulletSprite"] = sprite_get_name(s_bull_mercury);
        gun[? "bcasing"] = "";
        if(type != GUN_TYPE_FLAMETHROWER){gun[? "bSpeed"] *= .6;}
        col = c_white;
        displayParts = true; gunheldcol2 = make_color_rgb(160,190,210);
        displaySpots = true; gunheldcol3 = make_color_rgb(255,255,255);
        normalFlame = false; specialFlame = true;
        specialFlaregun = true; specialRocket = true;
        break;
                
    case "Imaginary":
        gun[? "pBulletSprite"] = sprite_get_name(emptySprite);
        gun[? "bcasing"] = "";
        switch(type)
        {
            case GUN_TYPE_MACHINEPISTOL:
            case GUN_TYPE_SUBMACHINEGUN:
            case GUN_TYPE_HEAVYMACHINEGUN:
            case GUN_TYPE_ASSAULTRIFLE:
                gun[? "soundId"] = "hoopzweap_imaginary_machine_gun";
                break;
                
            case GUN_TYPE_GATLINGGUN:
            case GUN_TYPE_MINIGUN:
            case GUN_TYPE_MITRAILLEUSE:
                gun[? "soundId"] = "hoopzweap__imaginary_gatling_gun";
                gun[? "windupSound"] = "hoopzweap__imaginary_windup";
                gun[? "winddownSound"] = "hoopzweap__imaginary_winddown";
                gun[? "sustainSound"] = "hoopzweap__imaginary_windsustain";
                break;
                
            case GUN_TYPE_RIFLE:
            case GUN_TYPE_PISTOL:
            case GUN_TYPE_MUSKET:
            case GUN_TYPE_FLINTLOCK:
            case GUN_TYPE_HUNTINGRIFLE:
            case GUN_TYPE_FLAREGUN:
            case GUN_TYPE_REVOLVER:
            case GUN_TYPE_MAGNUM:
            case GUN_TYPE_SNIPERRIFLE:
                gun[? "soundId"] = "hoopzweap_imaginary_pistol";
            
            case GUN_TYPE_SHOTGUN:
            case GUN_TYPE_DOUBLESHOTGUN:
            case GUN_TYPE_REVOLVERSHOTGUN:
            case GUN_TYPE_ELEPHANTGUN:
                gun[? "soundId"] = "hoopzweap_imaginary_shotgun";
                break;
            
            case GUN_TYPE_BFG:
                //TODO: this needs to be expanded to the chargeup, shot, explosion sounds
                gun[? "soundId"] = "hoopzweap_imaginary_bfg_shot";
                break;
            
          case GUN_TYPE_FLAMETHROWER:
                gun[? "soundId"] = "hoopzweap_imaginary_flamethrower";
                break;
                
            case GUN_TYPE_CROSSBOW:
                gun[? "soundId"] = "hoopzweap_imaginary_crossbow";
                break;
            
          case GUN_TYPE_TRANQRIFLE:
                gun[? "soundId"] = "hoopzweap_imaginary_tranquilizer";
                break;

         case GUN_TYPE_ROCKET:
                gun[? "soundId"] = "hoopzweap_imaginary_rocket";
                break;
        }
        col = make_color_rgb(255,255,255);
        gunheldcol1= col;
        col = c_white;
        normalFlame = false; specialFlame = true;
        specialFlaregun = true; specialRocket = true;
        break;
                
    case "Lead":
        col = make_color_rgb(138,40,40);
        gunheldcol1= col;
        col = c_white;
        gun[? "pBulletSprite"] = sprite_get_name(s_bull_lead);
        gun[? "bAdvanced"] = true;
        gun[? "bWallRicochet"] += 1;
        gun[? "bRicochetRandom"] = false;
        if(type != GUN_TYPE_FLAMETHROWER){gun[? "bSpeed"] *= .6;
        gun[? "bMinSpeed"] = 2;
        gun[? "bLobGravity"] = 5;
        gun[? "bRangeEndGrav"] = 15;
        gun[? "bEnemyPierce"] += 2;
        }
        gun[? "bShadow"] = 2;
        gun[? "bcasing"] = "";
        displayParts = true; gunheldcol2 = make_color_rgb(235,120,70);
        displaySpots = true; gunheldcol3 = make_color_rgb(150,170,255);
        normalFlame = true; specialFlame = false;
        specialFlaregun = true; specialRocket = true;
        break;
                
    case "Diamond":
        _kbc = 0.8;
        _stn = 0.8;
        col = make_color_rgb(150,190,210);
        gunheldcol1= col;
        col = c_white;
        if(type != GUN_TYPE_FLAMETHROWER){gun[? "bSpeed"] *= .5;
        gun[? "bMinSpeed"] = 4;}
        gun[? "bcasing"] = "";
        gun[? "pBulletSprite"] = sprite_get_name(s_bull_diamond);
        displayParts = true; gunheldcol2 = make_color_rgb(240,210,225);
        displaySpots = true; gunheldcol3 = make_color_rgb(255,255,255);
        normalFlame = false; specialFlame = true;
        specialFlaregun = true; specialRocket = true;
        break;
                
    case "Polenta":
        col = make_color_rgb(255,205,40);
        gunheldcol1= col;
        col = c_white;
        gun[? "pBulletColor"] = make_color_rgb(240,255,30);
        gun[? "pBulletSprite"] = sprite_get_name(s_bull_polenta);
        if(type != GUN_TYPE_FLAMETHROWER && type != GUN_TYPE_FLAREGUN){gun[? "bSpeed"] *= .35;
        gun[? "bcasing"] = "";
        gun[? "bLobGravity"] = 0.5;
        gun[? "bRangeEndGrav"] = 20;}
        displayParts = true; gunheldcol2 = make_color_rgb(255,255,20);
        displaySpots = true; gunheldcol3 = make_color_rgb(240,190,30);
        normalFlame = false; specialFlame = false;
        specialFlaregun = true; specialRocket = true;
        break;
                
    case "Yggdrasil":
        col = make_color_rgb(90,25,65);
        gunheldcol1= col;
        specialBFG = true;
        gun[? "pBulletSprite"] = sprite_get_name(s_bull_yggShot);
        if(type != GUN_TYPE_FLAMETHROWER && type != GUN_TYPE_FLAREGUN){gun[? "bSpeed"] *= .4;}
        gun[? "bcasing"] = "";
        col = c_white;
        displayParts = true; gunheldcol2 = make_color_rgb(70,150,90);
        displaySpots = true; gunheldcol3 = make_color_rgb(55,180,60);
        normalFlame = false; specialFlame = true;
        specialFlaregun = true; specialRocket = true;
        break;
                
    case "Pinata":
        col = make_color_rgb(255,255,20);
        gunheldcol1= col;
        col = c_white;
        gun[? "soundId"] = "hoopzweap_pinata_shot";
        gun[? "pBulletSprite"] = sprite_get_name(s_bull_pinataShot);
        if(type != GUN_TYPE_FLAMETHROWER && type != GUN_TYPE_FLAREGUN){gun[? "bSpeed"] *= .4;}
        gun[? "bcasing"] = "";
        displayParts = true; gunheldcol2 = make_color_rgb(255,20,20);
        displaySpots = true; gunheldcol3 = make_color_rgb(0,90,255);
        normalFlame = false; specialFlame = true;
        specialFlaregun = true; specialRocket = true;
        break;
                
    case "Francium":
        col = make_color_rgb(10,225,50);
        gunheldcol1= col;
        gun[? "pBulletSprite"] = sprite_get_name(s_bull_francium);
        gun[? "pBulletColor"] = make_color_rgb(100,255,70);
        gun[? "bAdvanced"] = true;
        gun[? "bExplosion"] = sprite_get_name(s_effect_franciumExplo);        
        gun[? "soundId"] = "hoopzweap_francium_shot";
        gun[? "sound_normalPitchDmg"] = 30;
        if(gun[? "pType"] !=GUN_TYPE_FLAREGUN && type != GUN_TYPE_FLAMETHROWER)
        {
            gun[? "bRangeEndGrav"] = 0;
            gun[? "bSpeed"] *= .30;
            gun[? "bMaxSpeed"] = 40;
            gun[? "bMinSpeed"] = 2;
            gun[? "bAccel"] = -3;
        }

        gun[? "bShadow"] = 0;
        gun[? "bcasing"] = "";
        col = c_white;
        displayParts = true; gunheldcol2 = make_color_rgb(40,255,60);
        displaySpots = true; gunheldcol3 = make_color_rgb(255,255,50);
        normalFlame = false; specialFlame = false;
        specialFlaregun = true; specialRocket = true;
        break;

    case "Orb":
        col = make_color_rgb(120,30,70);
        gunheldcol1= col;
        col = c_white;
        gun[? "pBulletColor"] = make_color_rgb(180,255,230);
        if(type != GUN_TYPE_FLAMETHROWER){gun[? "bSpeed"] *= .8;}
        gun[? "bDistanceLife"] = gun[? "bDistanceLife"]*1.8;
        gun[? "bShadow"] = 0;
        gun[? "bcasing"] = "";
        gun[? "pBulletSprite"] = sprite_get_name(s_bull_orb);
        displayParts = true; gunheldcol2 = make_color_rgb(132,122,170);
        displaySpots = true; gunheldcol3 = make_color_rgb(20,255,20);
        normalFlame = false; specialFlame = false;
        specialFlaregun = true; specialRocket = true;
        break;
        
    case "Nanotube":
        col = make_color_rgb(90,50,140);
        gunheldcol1= col;
        col = c_white;
        gun[? "pBulletColor"] = make_color_rgb(50, 10, 255);
        displayParts = true; gunheldcol2 = make_color_rgb(140,130,190);
        normalFlame = false; specialFlame = false;
        break;

    case "Taxidermy":
        col = make_color_rgb(30,30,30);
        gunheldcol1= col;
        col = c_white;
        gun[? "bcasing"] = "";
        gun[? "pBulletSprite"] = sprite_get_name(s_bull_flyshot);
        displayParts = true; gunheldcol2 = make_color_rgb(150,120,105);
        displaySpots = true; gunheldcol3 = make_color_rgb(130,40,40);
        normalFlame = false; specialFlame = true;
        specialFlaregun = true; specialRocket = true;
        break;
        
    case "Porcelain":
        col = make_color_rgb(20,160,255);
        gunheldcol1= col;
        gun[? "bcasing"] = "";
        if(type != GUN_TYPE_FLAMETHROWER){gun[? "bSpeed"] *= .6;
        gun[? "bDistanceLife"] = gun[? "bDistanceLife"]*0.6;
        gun[? "bLobGravity"] = 0.5;
        gun[? "bRangeEndGrav"] = 30;
        }
        gun[? "pBulletSprite"] = sprite_get_name(s_bull_teashot);
        col = c_white;
        displayParts = true; gunheldcol2 = make_color_rgb(230,230,255);
        displaySpots = true; gunheldcol3 = make_color_rgb(10,130,230);
        normalFlame = false; specialFlame = true;
        specialFlaregun = true; specialRocket = true;
        break;
    
    case "Anti-Matter":
        col = make_color_rgb(0,0,0);
        gunheldcol1= col;
        col = c_white;
        gun[? "bcasing"] = "";
        displaySpots = true; gunheldcol3 = make_color_rgb(5,5,70);
        gun[? "pBulletSprite"] = sprite_get_name(s_bull_antimatter);
        gun[? "soundId"] = "hoopzweap_antimatter_shot";
        gun[? "bShadow"] = 0;
        gun[? "sound_normalPitchDmg"] = 30;
        switch(type)
        {
            case GUN_TYPE_FLAMETHROWER:
            case GUN_TYPE_MACHINEPISTOL:
            case GUN_TYPE_HEAVYMACHINEGUN:
            case GUN_TYPE_MINIGUN:
            case GUN_TYPE_GATLINGGUN:
            case GUN_TYPE_MITRAILLEUSE:
                gun[? "soundId"] = "hoopzweap_antimatter_rapidshot";
                gun[? "sound_normalPitchDmg"] = 15;
                break;
        }
        if(type != GUN_TYPE_FLAMETHROWER){gun[? "bSpeed"] *= 0.45;}
        normalFlame = false; specialFlame = true;
        specialFlaregun = true; specialRocket = true;
        break;
        
    case "Aerogel":
        col = make_color_rgb(20,160,255);
        gunheldcol1= col;
        col = c_white;
        gun[? "pBulletSprite"] = sprite_get_name(s_bull_aerogel);
        gun[? "pBulletColor"] = make_color_rgb(215,235,255);
        gun[? "bcasing"] = "";
        if(type != GUN_TYPE_FLAMETHROWER){gun[? "bSpeed"] *= .75;}
        displayParts = true; gunheldcol2 = make_color_rgb(180,210,255);
        displaySpots = true; gunheldcol3 = make_color_rgb(215,235,255);
        normalFlame = false; specialFlame = false;
        specialFlaregun = true; specialRocket = true;
        break;
        
    case "Denim":
        col = make_color_rgb(95,100,200);
        gunheldcol1= col;
        col = c_white;
        gun[? "pBulletColor"] = make_color_rgb(170,230,235);
        displayParts = true; gunheldcol2 = make_color_rgb(140,160,255);
        displaySpots = true; gunheldcol3 = make_color_rgb(255,255,40);
        normalFlame = true; specialFlame = false;
        break;
        
    case "Untamonium":
        col = make_color_rgb(70,140,80);
        gunheldcol1= col;
        col = c_white;
        gun[? "pBulletColor"] = make_color_rgb(200, 190, 140);
        col = make_color_rgb(235,215,225);
        if(type != GUN_TYPE_FLAMETHROWER && type != GUN_TYPE_FLAREGUN){gun[? "bSpeed"] *= 2.5;}
        gun[? "bShadow"] = 1;
        gun[? "bcasing"] = "";
        gun[? "soundId"] = "untamonium_shot";       
        displayParts = true; gunheldcol2 = make_color_rgb(40,230,65);
        displaySpots = true; gunheldcol3 = make_color_rgb(255,40,154);                        
        normalFlame = false; specialFlame = false;
        break;
}

// Certain gun type's bullets override most materials
switch (type)
{
    // Use default rocket if no special one is defined //
    case GUN_TYPE_ROCKET:
        if(!specialRocket)
            {
            gun[? "pBulletSprite"] = sprite_get_name(s_bull_itanoRocket);
            gun[? "pBulletColor"] = c_white;
            }
        else gun[? "pBulletColor"] = c_white;
        break;
        
    // Use default flaregun if no special one is defined //
    case GUN_TYPE_FLAREGUN:
        if(!specialFlaregun)
            {
            gun[? "pBulletSprite"] = sprite_get_name(s_flareshot);
            gun[? "pBulletColor"] = c_white;
            }
        else gun[? "pBulletColor"] = c_white;
        break;

    // Use special flamethrower flames or default ones? //
    /*case GUN_TYPE_FLAMETHROWER:
        if(!specialFlame)
        {gun[? "pBulletSprite"] = sprite_get_name(s_bull_spFlame);}
        break;*/
        
    case GUN_TYPE_FLAMETHROWER:
        if(!specialFlame)
        {
            if(normalFlame)
                {
                gun[? "pBulletSprite"] = sprite_get_name(s_bull_flamethrower);
                gun[? "pBulletColor"] = c_white;
                }
            else if(!specialFlame)
                {
                gun[? "pBulletSprite"] = sprite_get_name(s_bull_spFlame);
                }
        }
        break;
        
    // Use special BFG brast or a default one? //
    case GUN_TYPE_BFG:
        if(!specialBFG)
            {
            gun[? "pBulletSprite"] = sprite_get_name(s_bull_bfg);
            gun[? "pBulletColor"] = c_white;
            }
        else gun[? "pBulletColor"] = c_white;
        break;
        
    default:
        break;
}

// Gun-in-hand decal sprite //
if(displayParts)
{
    switch(type)
    {
        case GUN_TYPE_REVOLVER: secondSprite =s_Revolver_Parts; break;
        case GUN_TYPE_PISTOL: secondSprite = s_Pistol_Parts; break;
        case GUN_TYPE_FLINTLOCK: secondSprite =s_Flintlock_Parts; break;
        case GUN_TYPE_FLAREGUN: secondSprite =s_Flaregun_Parts; break;
        case GUN_TYPE_MAGNUM: secondSprite =s_Magnum_Parts; break;
        case GUN_TYPE_MACHINEPISTOL: secondSprite =s_Machpistol_Parts; break;
    
        case GUN_TYPE_SUBMACHINEGUN: secondSprite =s_SMG_Parts;  break;
        case GUN_TYPE_HEAVYMACHINEGUN: secondSprite =s_HeavyMg_Parts;  break;
        case GUN_TYPE_GATLINGGUN: secondSprite =s_Gatling_Parts;  break;
        case GUN_TYPE_MINIGUN: secondSprite =s_Minigun_Parts;  break;
        case GUN_TYPE_MITRAILLEUSE: secondSprite =s_Mitrailleuse_Parts;  break;
    
        case GUN_TYPE_RIFLE: secondSprite =s_Rifle_Parts;  break;
        case GUN_TYPE_MUSKET: secondSprite =s_Musket_Parts;  break;
        case GUN_TYPE_HUNTINGRIFLE: secondSprite =s_Huntrifle_Parts;  break;
        case GUN_TYPE_TRANQRIFLE: secondSprite =s_Tranq_Parts;  break;
        case GUN_TYPE_SNIPERRIFLE: secondSprite =s_Sniper_Parts;  break;
        case GUN_TYPE_ASSAULTRIFLE: secondSprite =s_AssaultRifle_Parts; break;
    
        case GUN_TYPE_SHOTGUN: secondSprite =s_Shotgun_Parts;  break;
        case GUN_TYPE_DOUBLESHOTGUN: secondSprite =s_DbarrelShotgun_Parts;  break;
        case GUN_TYPE_REVOLVERSHOTGUN: secondSprite =s_RevShgun_Parts;  break;
        case GUN_TYPE_ELEPHANTGUN: secondSprite =s_ElephantGun_Parts; break;
    
        case GUN_TYPE_CROSSBOW: secondSprite =s_Crossbow_Parts; break;
        case GUN_TYPE_FLAMETHROWER: secondSprite =s_Flamethrower_GunParts;  break;
        case GUN_TYPE_ROCKET: secondSprite =s_Rocket_Parts;  break;
        case GUN_TYPE_BFG: secondSprite =s_Supergun_Parts;  break;
    }
}

// Gun-in-hand display Spots
if(displaySpots)
{
    switch(type)
    {
        case GUN_TYPE_REVOLVER: thirdSprite =s_Revolver_Spots; break;
        case GUN_TYPE_PISTOL: thirdSprite = s_Pistol_Spots; break;
        case GUN_TYPE_FLINTLOCK: thirdSprite =s_Flintlock_Spots; break;
        case GUN_TYPE_FLAREGUN: thirdSprite =s_Flaregun_Spots; break;
        case GUN_TYPE_MAGNUM: thirdSprite =s_Magnum_Spots; break;
        case GUN_TYPE_MACHINEPISTOL: thirdSprite =s_Machpistol_Spots; break;
    
        case GUN_TYPE_SUBMACHINEGUN: thirdSprite =s_Smg_Spots; break;
        case GUN_TYPE_HEAVYMACHINEGUN: thirdSprite =s_HeavyMG_Spots; break;
        case GUN_TYPE_GATLINGGUN: thirdSprite =s_GatlingGun_Spots; break;
        case GUN_TYPE_MINIGUN: thirdSprite =s_Minigun_Spots; break;
        case GUN_TYPE_MITRAILLEUSE: thirdSprite =s_Mitrailleuse_Spots; break;
    
        case GUN_TYPE_RIFLE: thirdSprite =s_Rifle_Spots; break;
        case GUN_TYPE_MUSKET: thirdSprite =s_Musket_Spots; break;
        case GUN_TYPE_HUNTINGRIFLE: thirdSprite =s_HuntRifle_Spots; break;
        case GUN_TYPE_TRANQRIFLE: thirdSprite =s_TranqGun_Spots; break;
        case GUN_TYPE_SNIPERRIFLE: thirdSprite =s_Sniper_Spots; break;
        case GUN_TYPE_ASSAULTRIFLE: thirdSprite =s_AssaultRifle_Spots; break;
    
        case GUN_TYPE_SHOTGUN: thirdSprite =s_Shotgun_Spots; break;
        case GUN_TYPE_DOUBLESHOTGUN: thirdSprite =s_SuperShot_Spots; break;
        case GUN_TYPE_REVOLVERSHOTGUN: thirdSprite =s_RevShotgun_Spots; break;
        case GUN_TYPE_ELEPHANTGUN: thirdSprite =s_Elephantgun_Spots; break;
    
        case GUN_TYPE_CROSSBOW: thirdSprite =s_Crossbow_Spots; break;
        case GUN_TYPE_FLAMETHROWER: thirdSprite =s_FlameGun_Spots; break;
        case GUN_TYPE_ROCKET: thirdSprite =s_Rocket_Spots; break;
        case GUN_TYPE_BFG: thirdSprite =s_Supergun_Spots; break;
    }
}

// Apply Gun decal colors //
gun[? "gunheldcol1"] = gunheldcol1;
gun[? "gunheldcol2"] = gunheldcol2;
gun[? "gunheldcol3"] = gunheldcol3;

// Apply Gun decal sprite //
if (secondSprite == "") gun[? "gunHeldSprite2"] = "";
else gun[? "gunHeldSprite2"] = sprite_get_name(secondSprite);

// Apply Gun decal sprite //
if (thirdSprite == "") gun[? "gunHeldSprite3"] = "";
else gun[? "gunHeldSprite3"] = sprite_get_name(thirdSprite);

// Apply some alpha multiplier //
gun[? "gunHeldSprite2Alpha"] = overlayAlpha;
