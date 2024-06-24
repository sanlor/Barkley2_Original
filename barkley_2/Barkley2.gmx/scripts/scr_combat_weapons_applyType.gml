/// scr_combat_weapons_applyType(gun, type)

var gun = argument0;
var guntype = argument1;

var _pow,_pmx,_spd,_acc,_rng,_amm,_afx,_kbc,_stn,_pattern,_bscale,_riflebonus;
gun[? "speedBonus"] = 1; //1 is no bonus at all
_riflebonus = 1.5;
_pow = 1;
_pmx = 1;
_spd = 1;
_amm = 1;
_amb = 0;
_afx = 1;

_rng = 1;

_acc = 0;
_kbc = 1;

_stn = 0; // Stagger value
_stnh = STAGGER_HARDNESS_SOFT; // Stagger hardness

_recoil = 0.3;

_pattern = "";
_bscale = 1;
_delayed = 0;

gun[? "swapSound"] = scr_soundbank_pickSound("hoopz_swapguns");

gun[? "bAdvanced"] = true; // All bullets are advanced so I can riccochet

switch(guntype)
{
    case GUN_TYPE_PISTOL:
        //_pow = 0.75;
        _pow = 0.7; // - balanced for GoG Build - bhroom
        _pmx = 1.0;
        //_spd = 1.2;
        _spd = 1.0 // - balanced for Gog Build
        _amm = 1.7;
        _amb = 10;
        _afx = 1.2;
        _rng = 1.3;

        _kbc = 20;
        _stn = 50;
        
        _recoil = 0.5;

        _acc = 0;

        gun[? "bAutomatic"] = false;

        gun[? "gunHeldSprite"] = sprite_get_name(s_Pistol);
        gun[? "hudIconSprite"] = sprite_get_name(s_hud_pistols);
        gun[? "flashSprite"] = sprite_get_name(s_Flash3);
        _bscale = 0.8

        gun[? "bcasingSpd"] = 6;
        gun[? "bcasingScale"] = 0.5;
        gun[? "bcasingCol"] = c_yellow;

        gun[? "pChargeGain"] = "cg_hit";
        gun[? "pChargeMax"] = 6;
        gun[? "pChargeGainAmount"] = "ga_gainOne";
        gun[? "pChargeLoss"] = "cl_shotmissed";
        gun[? "pChargeLossAmount"] = "la_loseOne";

        gun[? "soundId"] = scr_soundbank_pickSound("hoopzweap_pistol3");
        gun[? "soundLoop"] = false;
        gun[? "casingSound"] = "hoopz_shellcasing_light";

        break;

    case GUN_TYPE_FLINTLOCK:
        _pow = 0.8;
        //_pmx = 1.5;
        _pmx = 1.25; //numbing power down for GOG Build (6/6/15) - bhroom
        //_spd = 0.4;
        _spd = 0.65; // wilmer's first gun, so speeding up from 0.4 for GOG build (6/6/15) - bhroom
        _rng = 1;
        _amm = 1;
        _afx = 1.6;

        _kbc = 25;
        _stn = 100;

        _acc = 30;
        
        _delayed = 0.4;
        _pattern = "pt_flintlock";
        gun[? "bAutomatic"] = false;

        gun[? "gunHeldSprite"] = sprite_get_name(s_Flintlock);
        gun[? "hudIconSprite"] = sprite_get_name(s_hud_flintlock);
        gun[? "flashSprite"] = sprite_get_name(s_Flash3);
        _bscale = 0.8

        gun[? "bcasingSpd"] = 1;
        gun[? "bcasingScale"] = 0.5;
        gun[? "bcasingCol"] = c_yellow;

        gun[? "pChargeGain"] = "cg_hit";
        gun[? "pChargeMax"] = 3;
        gun[? "pChargeGainAmount"] = "ga_gainOne";
        gun[? "pChargeLoss"] = "cl_shotmissed";
        gun[? "pChargeLossAmount"] = "la_loseOne";

        gun[? "soundId"] = scr_soundbank_pickSound("hoopzweap_flintlock");
        gun[? "soundLoop"] = false;
        break;

    case GUN_TYPE_FLAREGUN:
        _pow = 2;
        _pmx = 4;
        _spd = 0.25;
        _rng = 1.2;
        _amm = 0.3;
        _afx = 3;

        _kbc = 80;
        _stn = 200;
        _stnh = STAGGER_HARDNESS_HARD;
        
        _recoil = 0.1;

        _acc = 0;
        
        _delayed = 0.2;

        gun[? "bAutomatic"] = false;
        gun[? "bLongTimeOut"] = true;

        gun[? "gunHeldSprite"] = sprite_get_name(s_FlareGun);
        gun[? "hudIconSprite"] = sprite_get_name(s_hud_flaregun);
        gun[? "flashSprite"] = sprite_get_name(s_Flash6);
        gun[? "pBulletSprite"] = sprite_get_name(s_flareshot);
        _bscale = 1;

        gun[? "bcasingSpd"] = 1;
        gun[? "bcasingScale"] = 0.7;
        gun[? "bcasingCol"] = c_yellow;

        gun[? "pChargeGain"] = "cg_enemyProximity"; // combat_gunwield_step
        gun[? "pChargeMax"] = 40; //15;
        gun[? "pChargeGainAmount"] = "ga_none";
        gun[? "pChargeLoss"] = "cl_shot";
        gun[? "pChargeLossAmount"] = "la_loseAll";

        gun[? "bLobGravity"] = 2;//2;
        gun[? "bRangeEndGrav"] = 1.5;//3; // combat_gunwield_shoot has code for flaregun
        gun[? "bLobDirection"] = 70;
        gun[? "bShadow"] = 8;

        gun[? "bRoaming"] = 1;

        gun[? "bSpeed"] = 10;
        gun[? "bAccel"] = -0.20;
        gun[? "bMinSpeed"] = 0.5;
        
        gun[? "bExplodeOnWall"] = true;
        gun[? "bExplodeOnEnemy"] = true;
        gun[? "bExplodeOnGround"] = true;
        gun[? "bExplodeOnTimeout"] = true;
        gun[? "bExplode"] = object_get_name(o_explosion_flaregun);
        gun[? "bExplodeEffect"] = "flaregun"; // Nullified by dynamic size from bullet power
        gun[? "bExplodeDamageMod"] = 1;
        gun[? "bDealDamage"] = false; // Only explosion deals dmg, not bullet

        gun[? "bTrail"] = object_get_name(o_explEffect);
        gun[? "bTrailExplosion"] = sprite_get_name(s_flareshot);
        gun[? "bTrailAcc"] = 0;
        gun[? "bTrailAmount"] = 1;
        gun[? "bTrailInterval"] = 4;

        gun[? "bAdvanced"] = true;
        gun[? "bUseMoveOffset"] = false;
        gun[? "bMagician"] = false;
        gun[? "bSpiraling"] = 0;

        gun[? "soundId"] = scr_soundbank_pickSound("hoopzweap_flaregun");
        gun[? "reloadSound"] = scr_soundbank_pickSound("hoopz_click");
        gun[? "soundLoop"] = false;

        gun[? "casingSound"] = "hoopz_shellcasing_medium";

        gun[? "periodic_mutlishot"] = 1;//4;
        break;

    case GUN_TYPE_REVOLVER:
        _pow = 1.45;
        _pmx = 1.60;
        _spd = 0.8;
        _rng = 1.5;
        _amm = 1.3;
        _afx = 1.6;

        _kbc = 25;
        _stn = 100;
        _stnh = STAGGER_HARDNESS_MEDIUM;

        _acc = 0;
        
        _recoil = 0.7;

        gun[? "bAutomatic"] = false;

        gun[? "gunHeldSprite"] = sprite_get_name(s_Revolver);
        gun[? "hudIconSprite"] = sprite_get_name(s_hud_revolvers);
        gun[? "flashSprite"] = sprite_get_name(s_Flash6);
        _bscale = 1;

        gun[? "bcasingSpd"] = 6;
        gun[? "bcasingScale"] = 0.7;
        gun[? "bcasingCol"] = c_yellow;

        gun[? "pChargeGain"] = "cg_shot";
        gun[? "pChargeMax"] = 6;
        gun[? "pChargeGainAmount"] = "ga_gainOne";
        gun[? "pChargeLoss"] = "cl_none";

        gun[? "soundId"] = scr_soundbank_pickSound("hoopzweap_revolver");
        gun[? "reloadSound"] = scr_soundbank_pickSound("hoopz_click");
        gun[? "soundLoop"] = false;

        gun[? "casingSound"] = "hoopz_shellcasing_medium";

        break;

    case GUN_TYPE_MAGNUM:
        _pow = 1.6;
        _pmx = 1.8;
        _spd = 0.75;
        _rng = 1.7;
        _amm = 1.0;
        _afx = 1.6;

        _kbc = 30;
        _stn = 120;
        _stnh = STAGGER_HARDNESS_MEDIUM;

        _acc = 0;
        
        _recoil = 0.8;

        gun[? "bAutomatic"] = false;

        gun[? "gunHeldSprite"] = sprite_get_name(s_Magnum);
        gun[? "hudIconSprite"] = sprite_get_name(s_hud_magnum);
        gun[? "flashSprite"] = sprite_get_name(s_Flash6);
        _bscale = 1;

        gun[? "bcasingSpd"] = 1;
        gun[? "bcasingScale"] = 0.7;
        gun[? "bcasingCol"] = c_yellow;

        gun[? "pChargeGain"] = "cg_shot";
        gun[? "pChargeMax"] = 3;
        gun[? "pChargeGainAmount"] = "ga_gainOne";
        gun[? "pChargeLoss"] = "cl_none";

        gun[? "soundId"] = scr_soundbank_pickSound("hoopzweap_magnum");
        gun[? "reloadSound"] = scr_soundbank_pickSound("hoopz_click");
        gun[? "soundLoop"] = false;

        gun[? "casingSound"] = "hoopz_shellcasing_medium";

        break;

    case GUN_TYPE_MACHINEPISTOL:
        _pow = 0.7;
        _pmx = 0.8;
        _spd = 1.5;
        _rng = 1.4;
        _amm = 2.5;
        _afx = 0.8;

        _kbc = 10;
        _stn = 40;
        _stnh = STAGGER_HARDNESS_SOFT;
        
        _recoil = 0.2;

        _pattern = "pt_burst";
        gun[? "bAutomatic"] = true;

        _acc = 15;
        gun[? "gunHeldSprite"] = sprite_get_name(s_Machpistol);
        gun[? "hudIconSprite"] = sprite_get_name(s_hud_machinepistol);
        gun[? "flashSprite"] = sprite_get_name(s_Flash2);
        _bscale = 0.6

        gun[? "bcasingSpd"] = 6;
        gun[? "bcasingScale"] = 0.5;
        gun[? "bcasingCol"] = c_aqua;

        gun[? "pChargeGain"] = "cg_shot_2xhit";
        gun[? "pChargeMax"] = 18;
        gun[? "pChargeGainAmount"] = "ga_gainOne";
        gun[? "pChargeLoss"] = "cl_none";

        gun[? "soundId"] = scr_soundbank_pickSound("hoopzweap_pistol6");
        gun[? "soundLoop"] = false;
        gun[? "casingSound"] = "hoopz_shellcasing_light";

        break;

    case GUN_TYPE_SUBMACHINEGUN:
        _pow = 0.45;
        _pmx = 0.6;
        _spd = 1.4;
        _amm = 3;
        _amb = 15;
        _afx = 0.6;
        _rng = 1.1;

        _kbc = 10;
        _stn = 20;
        _stnh = STAGGER_HARDNESS_SOFT;
        
        _recoil = 0.4;

        _acc = 20;
        gun[? "bAutomatic"] = true;

        gun[? "gunHeldSprite"] = sprite_get_name(s_Smg);
        gun[? "hudIconSprite"] = sprite_get_name(s_hud_smg);
        gun[? "flashSprite"] = sprite_get_name(s_Flash3);
        _bscale = 0.5;

        gun[? "bcasingSpd"] = 6;
        gun[? "bcasingScale"] = 0.4;
        gun[? "bcasingCol"] = c_white;

        gun[? "pChargeGain"] = "cg_shot";
        gun[? "pChargeMax"] = 18;
        gun[? "pChargeGainAmount"] = "ga_gainOne";
        gun[? "pChargeLoss"] = "cl_none";

        gun[? "soundId"] = scr_soundbank_pickSound("hoopzweap_smg");
        gun[? "soundLoop"] = false;
        gun[? "casingSound"] = "hoopz_shellcasing_light";

        break;

    case GUN_TYPE_HEAVYMACHINEGUN:
        _pow = 0.5;
        _pmx = 0.7;
        _spd = 1.6;
        _rng = 1.3;
        _amm = 2;
        _afx = 0.6;

        _kbc = 7;
        _stn = 30;
        _stnh = STAGGER_HARDNESS_SOFT;
        
        _recoil = 0.4;

        _acc = 20;
        gun[? "bAutomatic"] = true;

        gun[? "gunHeldSprite"] = sprite_get_name(s_HeavyMg);
        gun[? "hudIconSprite"] = sprite_get_name(s_hud_heavymachinegun);
        gun[? "flashSprite"] = sprite_get_name(s_Flash3);
        _bscale = 0.5;

        gun[? "bcasingSpd"] = 6;
        gun[? "bcasingScale"] = 0.4;
        gun[? "bcasingCol"] = c_white;

        gun[? "pChargeGain"] = "cg_shot";
        gun[? "pChargeMax"] = 18;
        gun[? "pChargeGainAmount"] = "ga_gainOne";
        gun[? "pChargeLoss"] = "cl_none";

        gun[? "soundId"] = scr_soundbank_pickSound("hoopzweap_hmg");
        gun[? "soundLoop"] = false;

        gun[? "casingSound"] = "hoopz_shellcasing_heavy";

        break;

    case GUN_TYPE_GATLINGGUN:
        _pow = 0.3;
        _pmx = 0.5;
        _spd = 3;
        _rng = 1.4;
        _amm = 5;
        _afx = 0.7;

        _kbc = 5;
        _stn = 10;
        _stnh = STAGGER_HARDNESS_SOFT;
        
        _recoil = 0.15;

        _acc = 22;
        gun[? "bAutomatic"] = true;

        gun[? "gunHeldSprite"] = sprite_get_name(s_GatlingGun);
        gun[? "hudIconSprite"] = sprite_get_name(s_hud_gatlinggun);
        gun[? "flashSprite"] = sprite_get_name(s_Flash5);
        _bscale = 0.6;
        gun[? "pWindUpSpeed"] = 24;

        gun[? "bcasingSpd"] = 12;
        gun[? "bcasingScale"] = 0.3;
        gun[? "bcasingCol"] = c_white;

        gun[? "pChargeGain"] = "cg_shot";
        gun[? "pChargeMax"] = 60;
        gun[? "pChargeGainAmount"] = "ga_gainAccum";
        gun[? "pChargeIncAccum"] = 1.05;
        gun[? "pChargeMaxAccum"] = 7;
        gun[? "pChargeLoss"] = "cl_none";

        gun[? "soundId"] = scr_soundbank_pickSound("hoopzweap_minigun");
        switch(choose(2,4))
        {
            case 2:
                gun[? "windupSound"] = "sn_windup02"; //AGN()
                gun[? "sustainSound"] = "sn_sustain02"; //AGN()
                gun[? "winddownSound"] = "sn_winddown02"; //AGN()
                break;
            case 4:
                gun[? "windupSound"] = "sn_windup04"; //AGN()
                gun[? "sustainSound"] = "sn_sustain04"; //AGN()
                gun[? "winddownSound"] = "sn_winddown04"; //AGN()
                break;
        }
        /*
        gun[? "windupSound"] = //scr_soundbank_pickSound("hoopzweap_minig_windup");
        gun[? "sustainSound"] = //scr_soundbank_pickSound("hoopzweap_minig_sustain");
        gun[? "winddownSound"] = //scr_soundbank_pickSound("hoopzweap_minig_winddown");
        */
        gun[? "soundLoop"] = false;

        gun[? "casingSound"] = "hoopz_shellcasing_heavy";

        break;


    case GUN_TYPE_MINIGUN:
        _pow = 0.4;
        _pmx = 0.525;
        _spd = 2.5;
        _amm = 4;
        _amb = 20;
        _afx = 0.6;
        _rng = 1.5;

        _kbc = 5;
        _stn = 15;
        _stnh = STAGGER_HARDNESS_SOFT;
        
        _recoil = 0.15;

        _acc = 20;
        gun[? "bAutomatic"] = true;

        gun[? "gunHeldSprite"] = sprite_get_name(s_Minigun);
        gun[? "hudIconSprite"] = sprite_get_name(s_hud_minigun);
        gun[? "flashSprite"] = sprite_get_name(s_Flash5);
        _bscale = 0.8;
        gun[? "pWindUpSpeed"] = 12;

        gun[? "bcasingSpd"] = 15;
        gun[? "bcasingScale"] = 0.4;
        gun[? "bcasingCol"] = c_yellow;

        gun[? "pChargeGain"] = "cg_shot";
        gun[? "pChargeMax"] = 60;
        gun[? "pChargeGainAmount"] = "ga_gainAccum";
        gun[? "pChargeIncAccum"] = 1.1;
        gun[? "pChargeMaxAccum"] = 12;
        gun[? "pChargeLoss"] = "cl_none";

        gun[? "soundId"] = scr_soundbank_pickSound("hoopzweap_minigun");
        gun[? "windupSound"] = "sn_windup06"; //AGN()
        gun[? "sustainSound"] = "sn_sustain06"; //AGN()
        gun[? "winddownSound"] = "sn_winddown06"; //AGN()
        /*
        gun[? "windupSound"] = scr_soundbank_pickSound("hoopzweap_minig_windup");
        gun[? "sustainSound"] = scr_soundbank_pickSound("hoopzweap_minig_sustain");
        gun[? "winddownSound"] = scr_soundbank_pickSound("hoopzweap_minig_winddown");*/
        gun[? "soundLoop"] = false;

        gun[? "casingSound"] = "hoopz_shellcasing_heavy";

        break;

    case GUN_TYPE_MITRAILLEUSE:
        _pow = 0.2;
        _pmx = 0.3;
        _spd = 3.5;
        _rng = 1.1;
        _amm = 8;
        _afx = 0.4;

        _kbc = 5;
        _stn = 7;
        _stnh = STAGGER_HARDNESS_SOFT;
        
        _recoil = 0.1;

        _acc = 25;
        gun[? "bAutomatic"] = true;

        gun[? "gunHeldSprite"] = sprite_get_name(s_Mitrailleuse);
        gun[? "hudIconSprite"] = sprite_get_name(s_hud_mitrailleuse);
        gun[? "flashSprite"] = sprite_get_name(s_Flash5);
        _bscale = 0.4;
        gun[? "pWindUpSpeed"] = 36;

        gun[? "bcasingSpd"] = 12;
        gun[? "bcasingScale"] = 0.2;
        gun[? "bcasingCol"] = c_white;

        gun[? "pChargeGain"] = "cg_mitrailleuse";
        gun[? "pChargeMax"] = 60;
        gun[? "pChargeGainAmount"] = "ga_gainOne";
        gun[? "pChargeLoss"] = "cl_none";

        gun[? "soundId"] = scr_soundbank_pickSound("hoopzweap_minigun");
        gun[? "windupSound"] = "sn_windup01"; //AGN()
        gun[? "sustainSound"] = "sn_sustain01"; //AGN()
        gun[? "winddownSound"] = "sn_winddown01"; //AGN()
        /*
        gun[? "windupSound"] = scr_soundbank_pickSound("hoopzweap_minig_windup"));
        gun[? "sustainSound"] = scr_soundbank_pickSound("hoopzweap_minig_sustain"));
        gun[? "winddownSound"] = scr_soundbank_pickSound("hoopzweap_minig_winddown"));*/
        gun[? "soundLoop"] = false;

        gun[? "casingSound"] = "hoopz_shellcasing_heavy";

        break;

    case GUN_TYPE_ASSAULTRIFLE:
        _pow = 0.80;
        _pmx = 0.9;
        _spd = 1.1;
        _rng = 1.5;
        _amm = 2;
        _afx = 1.2;

        _kbc = 15;
        _stn = 50;
        _stnh = STAGGER_HARDNESS_SOFT;
        
        _recoil = 0.3;

        _pattern = "pt_burst";
        _acc = 12;
        gun[? "bAutomatic"] = true;

        gun[? "gunHeldSprite"] = sprite_get_name(s_AssaultRifle);
        gun[? "hudIconSprite"] = sprite_get_name(s_hud_assaultrifle);
        gun[? "flashSprite"] = sprite_get_name(s_Flash4);
        _bscale = 0.7;

        gun[? "speedBonus"] = _riflebonus; //Doubles shot speed
        //maxspd *= _riflebonus;
        gun[? "bcasingSpd"] = 6;
        gun[? "bcasingScale"] = 0.5;
        gun[? "bcasingCol"] = c_yellow;

        gun[? "pChargeGain"] = "cg_hurt";
        gun[? "pChargeGainAmount"] = "ga_gainOne";
        gun[? "pChargeLoss"] = "cl_none";
        gun[? "pChargeMax"] = 5;

        gun[? "soundId"] = scr_soundbank_pickSound("hoopzweap_assaultrifle");
        gun[? "soundLoop"] = false;

        gun[? "casingSound"] = "hoopz_shellcasing_large";

        break;

    case GUN_TYPE_RIFLE:
        _pow = 1.3;
        _pmx = 1.5;
        //_spd = 0.6;
        _spd = 0.5; //balanced for GOG Build (6/6/15) - bhroom
        _amm = 0.8;
        _amb = 4;
        _afx = 1.3;
        _rng = 2.1;

        _kbc = 50;
        _stn = 100;
        _stnh = STAGGER_HARDNESS_MEDIUM;
        
        _recoil = 0.2;

        _acc = 0;
        gun[? "bAutomatic"] = false;

        _pattern = "pt_scope";
        gun[? "gunHeldSprite"] = sprite_get_name(s_Rifle);
        gun[? "hudIconSprite"] = sprite_get_name(s_hud_rifle);
        gun[? "flashSprite"] = sprite_get_name(s_Flash4);
        _bscale = 1;

        gun[? "speedBonus"] = _riflebonus; //Doubles shot speed
        //maxspd *= _riflebonus;
        gun[? "bcasingSpd"] = 3;
        gun[? "bcasingScale"] = 0.8;
        gun[? "bcasingCol"] = c_green;

        gun[? "pChargeGain"] = "cg_candy";
        gun[? "pChargeGainAmount"] = "ga_gainAll";
        gun[? "pChargeLoss"] = "cl_none";
        gun[? "pChargeMax"] = 1;

        gun[? "soundId"] = scr_soundbank_pickSound("hoopzweap_rifle");
        gun[? "reloadSound"] = scr_soundbank_pickSound("hoopz_reload");
        gun[? "soundLoop"] = false;

        gun[? "casingSound"] = "hoopz_shellcasing_large";

        break;

    case GUN_TYPE_MUSKET:
        _pow = 1.0;
        _pmx = 1.7;
        _spd = 0.35;
        _rng = 1.8;
        _amm = 0.7;
        _afx = 1.8;

        _kbc = 60;
        _stn = 120;
        _stnh = STAGGER_HARDNESS_MEDIUM;
        
        _recoil = 0.2;

        _acc = 8;
        
        _delayed = 0.7;
        
        gun[? "bAutomatic"] = false;

        _pattern = "pt_musket";
        gun[? "gunHeldSprite"] = sprite_get_name(s_Musket);
        gun[? "hudIconSprite"] = sprite_get_name(s_hud_musket);
        gun[? "flashSprite"] = sprite_get_name(s_Flash4);
        _bscale = 1;

        gun[? "speedBonus"] = _riflebonus; //Doubles shot speed
        //maxspd *= _riflebonus;
        gun[? "bcasingSpd"] = 0.5;
        gun[? "bcasingScale"] = 0.8;
        gun[? "bcasingCol"] = c_green;

        gun[? "pChargeGain"] = "cg_aim";
        gun[? "pChargeGainAmount"] = "ga_gainOne";
        gun[? "pChargeLoss"] = "cl_time";
        gun[? "pChargeLossAmount"] = "la_loseOverTime";
        gun[? "pChargeLossTime"] = 0.5;
        gun[? "pChargeMax"] = 4;

        gun[? "soundId"] = scr_soundbank_pickSound("hoopzweap_musket");
        gun[? "reloadSound"] = scr_soundbank_pickSound("hoopz_reload");
        gun[? "soundLoop"] = false;

        gun[? "casingSound"] = "hoopz_shellcasing_large";

        break;

    case GUN_TYPE_HUNTINGRIFLE:
        _pow = 1.1;
        _pmx = 1.1;
        //_spd = 1;
        _spd = 0.85; //balanced for GOG Build (6/6/15) - bhroom
        _rng = 2.95;
        _amm = 2;
        _afx = 1.5;
        
        _recoil = 0.2;

        _kbc = 60;
        _stn = 150;
        _stnh = STAGGER_HARDNESS_MEDIUM;

        _acc = 0;
        gun[? "bAutomatic"] = false;

        _pattern = "pt_scope";
        gun[? "gunHeldSprite"] = sprite_get_name(s_HuntRifle);
        gun[? "hudIconSprite"] = sprite_get_name(s_hud_huntingrifle);
        gun[? "flashSprite"] = sprite_get_name(s_Flash4);
        _bscale = 1.2;

        gun[? "speedBonus"] = _riflebonus; //Doubles shot speed
        //maxspd *= _riflebonus;
        gun[? "bcasingSpd"] = 3;
        gun[? "bcasingScale"] = 1;
        gun[? "bcasingCol"] = c_green;

        gun[? "pChargeGain"] = "cg_nomove";
        gun[? "pChargeGainAmount"] = "ga_gainTime";
        gun[? "pChargeGainTime"] = 1;
        gun[? "pChargeMax"] = 25;
        gun[? "pChargeLoss"] = "cl_move";
        gun[? "pChargeLossAmount"] = "la_loseOverTime";
        gun[? "pChargeLossTime"] = 6;

        gun[? "soundId"] = scr_soundbank_pickSound("hoopzweap_huntingrifle");
        gun[? "reloadSound"] = scr_soundbank_pickSound("hoopz_reload");
        gun[? "soundLoop"] = false;

        gun[? "casingSound"] = "hoopz_shellcasing_large";

        break;

    case GUN_TYPE_TRANQRIFLE:
        _pow = 0.1;
        _pmx = 0.3;
        _spd = 0.6;
        _rng = 2.5;
        _amm = 0.5;
        _afx = 2;

        _kbc = 0;
        _stn = 0;
        
        _recoil = 0;

        _acc = 0;

        gun[? "bAutomatic"] = false;

        _pattern = "pt_scope";
        gun[? "gunHeldSprite"] = sprite_get_name(s_TranqRifle);
        gun[? "hudIconSprite"] = sprite_get_name(s_hud_tranqrifle);
        gun[? "flashSprite"] = "";
        _bscale = 1.4;

        gun[? "speedBonus"] = _riflebonus; //Doubles shot speed
        //maxspd *= _riflebonus;
        gun[? "bcasingSpd"] = 3;
        gun[? "bcasingScale"] = 1;
        gun[? "bcasingCol"] = c_green;
        gun[? "bcasing"] = "";

        gun[? "pChargeGain"] = "cg_nomove_enemyProximity";
        gun[? "pChargeGainAmount"] = "ga_gainTime";
        gun[? "pChargeGainTime"] = 1;
        gun[? "pChargeMax"] = 20;
        gun[? "pChargeLoss"] = "cl_move";
        gun[? "pChargeLossAmount"] = "la_loseOverTime";
        gun[? "pChargeLossTime"] = 6;

        gun[? "soundId"] = scr_soundbank_pickSound("hoopzweap_tranqrifle");
        gun[? "reloadSound"] = scr_soundbank_pickSound("hoopz_reload");
        gun[? "soundLoop"] = false;

        gun[? "casingSound"] = "hoopz_shellcasing_large";

        break;

    case GUN_TYPE_SNIPERRIFLE:
        _pow = 2.0;
        _pmx = 2.0;
        _spd = 0.4;
        _rng = 3.5;
        _amm = 0.4;
        _afx = 1.5;

        _kbc = 75;
        _stn = 150;
        _stnh = STAGGER_HARDNESS_MEDIUM;
        
        _recoil = 0.2;

        _acc = 0;
        gun[? "bAutomatic"] = false;

        _pattern = "pt_scope";
        gun[? "gunHeldSprite"] = sprite_get_name(s_Sniper);
        gun[? "hudIconSprite"] = sprite_get_name(s_hud_sniper);
        gun[? "flashSprite"] = sprite_get_name(s_Flash4);
        _bscale = 1.4;

        gun[? "speedBonus"] = _riflebonus; //Doubles shot speed
        //maxspd *= _riflebonus;
        gun[? "bcasingSpd"] = 3;
        gun[? "bcasingScale"] = 1;
        gun[? "bcasingCol"] = c_green;

        gun[? "pChargeGain"] = "cg_heartbeat";
        gun[? "pChargeMax"] = 1;
        gun[? "pChargeLoss"] = "cl_none";
        
        gun[? "soundId"] = scr_soundbank_pickSound("hoopzweap_sniperrifle");
        gun[? "reloadSound"] = scr_soundbank_pickSound("hoopz_reload");
        gun[? "soundLoop"] = false;

        gun[? "casingSound"] = "hoopz_shellcasing_large";

        break;

    case GUN_TYPE_SHOTGUN:
        _pow = 1.3;
        _pmx = 1.4;
        //_spd = 0.5;
        _spd = 0.4; // - balanced for GOG (6/6/15)-bhroom
        _amm = 0.6;
        _amb = 3;
        _afx = 1;
        _rng = 0.7;

        _kbc = 10;
        _stn = 20;
        _stnh = STAGGER_HARDNESS_SOFT;
        
        _recoil = 0.3;

        _acc = 12;
        gun[? "bAutomatic"] = false;

        _pattern = "pt_spread";
        gun[? "gunHeldSprite"] = sprite_get_name(s_Shotgun);
        gun[? "hudIconSprite"] = sprite_get_name(s_hud_shotgun);
        gun[? "flashSprite"] = sprite_get_name(s_Flash);
        _bscale = 0.7;

        gun[? "bcasingSpd"] = 3;
        gun[? "bcasingScale"] = 1;
        gun[? "bcasingCol"] = c_red;

        gun[? "pChargeGain"] = "cg_damage";
        gun[? "pChargeGainAmount"] = "ga_gainOne";
        gun[? "pChargeLoss"] = "cl_none";
        gun[? "pChargeMax"] = 22;

        gun[? "soundId"] = scr_soundbank_pickSound("hoopzweap_shotgun");
        gun[? "reloadSound"] = scr_soundbank_pickSound("hoopz_reload");
        gun[? "soundLoop"] = false;

        gun[? "periodic_mutlishot"] = 8;

        gun[? "casingSound"] = "hoopz_shellcasing_shell";

        break;

    case GUN_TYPE_DOUBLESHOTGUN:
        _pow = 1.6;
        _pmx = 1.7;
        //_spd = 0.30;
        _spd = 0.25; //balanced for GOG (6/6/15)- bhroom
        _rng = 0.65;
        _amm = 0.7;
        _afx = 1;

        _kbc = 15;
        _stn = 20;
        _stnh = STAGGER_HARDNESS_MEDIUM;
        
        _recoil = 0.5;

        _acc = 12;
        gun[? "bAutomatic"] = false;

        _pattern = "pt_doublespread";
        gun[? "gunHeldSprite"] = sprite_get_name(s_DoubleShotgun);
        gun[? "hudIconSprite"] = sprite_get_name(s_hud_doubleshotgun);
        gun[? "flashSprite"] = sprite_get_name(s_Flash);
        _bscale = 0.7;

        gun[? "bcasingSpd"] = 3;
        gun[? "bcasingScale"] = 1;
        gun[? "bcasingCol"] = c_red;

        gun[? "pChargeGain"] = "cg_damage";
        gun[? "pChargeGainAmount"] = "ga_gainOne";
        gun[? "pChargeLoss"] = "cl_none";
        gun[? "pChargeMax"] = 44;

        gun[? "soundId"] = scr_soundbank_pickSound("hoopzweap_doublebarreledshotgun");
        gun[? "reloadSound"] = scr_soundbank_pickSound("hoopz_reload");
        gun[? "soundLoop"] = false;

        gun[? "periodic_mutlishot"] = 12;

        gun[? "casingSound"] = "hoopz_shellcasing_shell";

        break;

    case GUN_TYPE_REVOLVERSHOTGUN:
        _pow = 0.8;
        _pmx = 1.2;
        _spd = 0.8;
        _rng = 0.5;
        _amm = 1;
        _afx = 1;

        _kbc = 10;
        _stn = 20;
        _stnh = STAGGER_HARDNESS_SOFT;
        
        _recoil = 0.3;

        _acc = 20;
        gun[? "bAutomatic"] = true;

        _pattern = "pt_spread";
        gun[? "gunHeldSprite"] = sprite_get_name(s_RevShotgun);
        gun[? "hudIconSprite"] = sprite_get_name(s_hud_revshotgun);
        gun[? "flashSprite"] = sprite_get_name(s_Flash);
        _bscale = 0.7;

        gun[? "bcasingSpd"] = 0.5;
        gun[? "bcasingScale"] = 1;
        gun[? "bcasingCol"] = c_red;

        gun[? "pChargeGain"] = "cg_shot";
        gun[? "pChargeGainAmount"] = "ga_gainOne";
        gun[? "pChargeLoss"] = "cl_none";
        gun[? "pChargeMax"] = 6;

        gun[? "soundId"] = scr_soundbank_pickSound("hoopzweap_revolvershotgun");
        gun[? "reloadSound"] = scr_soundbank_pickSound("hoopz_reload");
        gun[? "soundLoop"] = false;

        gun[? "periodic_mutlishot"] = 6;

        gun[? "casingSound"] = "hoopz_shellcasing_shell";

        break;

    case GUN_TYPE_ELEPHANTGUN:
        _pow = 1.6;
        _pmx = 1.8;
        _spd = 0.35;
        _rng = 1.8;
        _amm = 0.4;
        _afx = 1.6;

        _kbc = 90;
        _stn = 200;
        _stnh = STAGGER_HARDNESS_HARD;
        
        _recoil = 0.2;

        _acc = 0;
        gun[? "bAutomatic"] = false;

        _pattern = "pt_scopespread";
        gun[? "gunHeldSprite"] = sprite_get_name(s_ElephantGun);
        gun[? "hudIconSprite"] = sprite_get_name(s_hud_elephantgun);
        gun[? "flashSprite"] = sprite_get_name(s_Flash);
        _bscale = 1.2;

        gun[? "bcasingSpd"] = 0.5;
        gun[? "bcasingScale"] = 1;
        gun[? "bcasingCol"] = c_green;

        gun[? "pChargeGain"] = "cg_kill";
        gun[? "pChargeGainAmount"] = "ga_gainAll";
        gun[? "pChargeLoss"] = "cl_none";
        gun[? "pChargeMax"] = 1;

        gun[? "soundId"] = scr_soundbank_pickSound("hoopzweap_elephantgun");
        gun[? "reloadSound"] = scr_soundbank_pickSound("hoopz_reload");
        gun[? "soundLoop"] = false;
        
        gun[? "periodic_mutlishot"] = 5;

        gun[? "casingSound"] = "hoopz_shellcasing_shell";

        break;


    case GUN_TYPE_FLAMETHROWER:
        // In addition to damage per bullet, flamethrower also deals (5 * bullet damage) in DoT
        // after you stop shooting the enemy, thanks to Burning.
        // Both _pow and _pmx must be the same or damage might behave unexpectedly for flamethrower.
        _pow = 0.2;
        _pmx = 0.2;
        
        _spd = 2.5;
        _rng = 1; // This has no effect for flamethrower, see bSpeed and bAccel below instead
        _amm = 5;
        _afx = 0.5;

        _kbc = 0;
        _stn = 0;
        _stnh = STAGGER_HARDNESS_SOFT;
        
        _recoil = 0.0;

        _acc = 30;

        gun[? "bAutomatic"] = true;

        gun[? "pWindUpSpeed"] = 60;

        gun[? "gunHeldSprite"] = sprite_get_name(s_Flamethrower_Gun);
        gun[? "hudIconSprite"] = sprite_get_name(s_hud_flamethrower);
        gun[? "flashSprite"] = "";

        gun[? "bcasing"] = "";
        
        gun[? "bSpeed"] = 30;
        gun[? "bMinSpeed"] = 2;
        gun[? "bAccel"] = -4;
        gun[? "bRangeEndGrav"] = 0;
        
        gun[? "bDistanceLife"] = -1;
        gun[? "bTimeLife"] = 7;

        gun[? "pChargeGain"] = "cg_shot";
        gun[? "pChargeMax"] = 60;
        gun[? "pChargeGainAmount"] = "ga_gainAmmoLevel";
        gun[? "pChargeGainAmmoMax"] = 1;
        gun[? "pChargeGainAmmoMin"] = 12;
        gun[? "pChargeLoss"] = "cl_none";

        gun[? "bAdvanced"] = true;
        gun[? "pBulletSprite"] = sprite_get_name(s_bull_flamethrower);
        gun[? "bShowHiteffect"] = false;
        gun[? "bNoDestroyOnHit"] = true;

        gun[? "constantSound"] = "hoopzweap_flamethrower_gas";
        gun[? "triggerSound"] = "hoopzweap_flamethrower_trigger";
        gun[? "windupSound"] = "hoopzweap_flamethrower_attack";
        gun[? "sustainSound"] = "hoopzweap_flamethrower_sustain";
        gun[? "winddownSound"] = "hoopzweap_flamethrower_release";
        gun[? "soundLoop"] = false;
        break;

    case GUN_TYPE_CROSSBOW:
        _pow = 0.8;
        _pmx = 1.2;
        _spd = 0.3;
        _rng = 2;
        _amm = 0.3;
        _afx = 1;

        _kbc = 10;
        _stn = 40;
        _stnh = STAGGER_HARDNESS_SOFT;
        
        _recoil = 0.2;

        _acc = 0;
        gun[? "bAutomatic"] = false;
        
        _delayed = 0.05;

        gun[? "gunHeldSprite"] = sprite_get_name(s_Crossbow_Gun);
        gun[? "hudIconSprite"] = sprite_get_name(s_hud_crossbow);
        gun[? "flashSprite"] = "";
        _bscale = 1;
        gun[? "pBulletSprite"] = sprite_get_name(s_bull_arrowHead);
        gun[? "bcasing"] = "";

        gun[? "pChargeGain"] = "cg_full";
        gun[? "pChargeLoss"] = "cl_none";
        gun[? "pChargeMax"] = 1;

        gun[? "soundId"] = scr_soundbank_pickSound("hoopzweap_crossbow");
        gun[? "reloadSound"] = scr_soundbank_pickSound("hoopz_reloadcrossbow");
        gun[? "soundLoop"] = false;

        gun[? "periodic_mutlishot"] = 1;
        break;

    case GUN_TYPE_ROCKET:
        _pow = 2;
        _pmx = 2.4;
        _spd = 0.2;
        _rng = 2.4;
        _amm = 0.3;
        _afx = 1.5;

        _kbc = 100;
        _stn = 200;
        _stnh = STAGGER_HARDNESS_HARD;
        
        _recoil = 0.2;
        _acc = 0;
        
        _delayed = 0.1;
        
        gun[? "bSpeed"] *= .30;
        gun[? "bMinSpeed"] = 2;
        gun[? "bAccel"] = 1;
        
        gun[? "bAutomatic"] = false;
        gun[? "bAdvanced"] = true;
        
        gun[? "gunHeldSprite"] = sprite_get_name(s_Rocket);
        gun[? "hudIconSprite"] = sprite_get_name(s_hud_rocket);
        gun[? "flashSprite"] = sprite_get_name(s_Flash);
        _bscale = 1;

        gun[? "bcasing"] = "";

        gun[? "pChargeGain"] = "cg_loaded";
        gun[? "pChargeGainAmount"] = "ga_gainTime";
        gun[? "pChargeMax"] = 30;
        gun[? "pChargeLoss"] = "cl_shot";
        gun[? "pChargeLossAmount"] = "la_loseAll";

        gun[? "soundId"] = scr_soundbank_pickSound("hoopzweap_rocket_shot");
        gun[? "reloadSound"] = scr_soundbank_pickSound("hoopz_reload");
        gun[? "soundLoop"] = false;
        gun[? "pBulletSprite"] = sprite_get_name(s_bull_rocket);
        gun[? "casingSound"] = "hoopz_shellcasing_shell";
        
        gun[? "bTrail"] = object_get_name(o_explEffect);
        gun[? "bTrailExplosion"] = sprite_get_name(s_pixel); //effect_itanosmoke);
        gun[? "bTrailAcc"] = 0;
        gun[? "bTrailAmount"] = 1;
        gun[? "bTrailInterval"] = 2;
        
        gun[? "bExplodeOnWall"] = true;
        gun[? "bExplodeOnEnemy"] = true;
        gun[? "bExplodeOnEnemyProx"] = false;
        gun[? "bExplodeOnGround"] = true;
        gun[? "bExplodeOnTimeout"] = true;
        gun[? "bDealDamage"] = true;

        gun[? "bExplode"] = object_get_name(o_explosion_rocket);
        gun[? "bExplodeEffect"] = "rocket"; // Nullified by variable explosion from bullet power
        gun[? "bExplodeDamageMod"] = 0.8;
        
        gun[? "bUseMoveOffset"] = false;
        break;

    case GUN_TYPE_BFG:
        _pow = 2.0;
        _pmx = 1.8;
        _spd = 0.1;
        _rng = 3.0;
        _amm = 0.4;
        _afx = 1.6;

        _kbc = 50;
        _stn = 400;
        _stnh = STAGGER_HARDNESS_HARD;
        
        _recoil = 0.2;
        _delayed = 0.3;
        
        _acc = 6;
        
        gun[? "bAutomatic"] = false;

        gun[? "gunHeldSprite"] = sprite_get_name(s_BFG);
        gun[? "hudIconSprite"] = sprite_get_name(s_hud_bfg);
        gun[? "flashSprite"] = sprite_get_name(s_Flash_BFG);
        _bscale = 0.6;

        gun[? "bcasing"] = "";
        
        gun[? "bSpeed"] = 12;
        gun[? "bMinSpeed"] = 1;

        gun[? "pChargeGain"] = "cg_none";
        gun[? "pChargeLoss"] = "cl_none";
        gun[? "pChargeMax"] = 1;

        gun[? "soundId"] = scr_soundbank_pickSound("hoopzweap_elephantgun");
        gun[? "reloadSound"] = scr_soundbank_pickSound("hoopz_reload");
        gun[? "soundLoop"] = false;

        gun[? "pBulletSprite"] = sprite_get_name(s_bull_bfg);
        
        break;
}

// pos is -1 on new gun, this will give it a pos when none exists
if (gun[? "gunmap_pos"] == -1) gun[? "gunmap_pos"] = Gunsmap("get dot", Gunsmap("type to index", guntype));

if (_pattern != "") scr_combat_weapons_setPattern(gun, _pattern);

gun[? "pShotDelay"] = _delayed;

gun[? "pPowerMod"] = gun[? "pPowerMod"]*_pow;
gun[? "pPowerMaxMod"] = gun[? "pPowerMaxMod"]*_pmx;
gun[? "pSpeedMod"] = gun[? "pSpeedMod"]*(_spd+(_spd*global.rateBooster)); //added rate booster, in Settings()

gun[? "sRange"] = 40*_rng;

gun[? "pAmmoMod"] = gun[? "pAmmoMod"]*(_amm+(_amm*global.ammoBooster)); //added ammo booster
gun[? "pAffixMod"] = gun[? "pAffixMod"]*_afx;
gun[? "pAmmoBase"] = _amb;

gun[? "pWeightMod"] = gun[? "pWeightMod"]*scr_combat_weapons_getTypeWeight(guntype);

gun[? "bulscale"] = gun[? "bulscale"]*_bscale;

gun[? "pAccuracy"] = _acc;

gun[? "pKnockback"] = _kbc;
gun[? "pStagger"] = _stn;
gun[? "pStaggerHardness"] = _stnh;

gun[? "pRecoil"] = _recoil;
