_gun = Drop("generate", scr_savedata_get("player.stats.effective." + STAT_BASE_LUCK), "generic pistol", "SCRL");

_gun[? "pDamageMin"] = 40;
_gun[? "pDamageRand"] = 20;

_gun[? "flashSprite"] = "";
_gun[? "pBulletSprite"] = sprite_get_name(s_bull_scrollWeapon);
_gun[? "bcasing"] = "";

_gun[? "bEnemyPierce"] += 6;
_gun[? "bThroughWalls"] = 16;
_gun[? "bAdvanced"] = true;

_gun[? "pChargeGain"] = "cg_full";
_gun[? "pChargeLoss"] = "cl_none";
_gun[? "pChargeMax"] = 1;
_gun[? "bRangeEndGrav"] = 0;

_gun[? "bMaxSpeed"] = 60; //doubled from 48 (after Bisse's bullet code fix 120414)
_gun[? "bMinSpeed"] = 8; //doubled as well
_gun[? "bSpeed"] = 8;
_gun[? "bAccel"] = 2;

//_gun[? "soundId"] = scr_soundbank_pickSound("hoopzweap_crossbow");
//_gun[? "reloadSound"] = scr_soundbank_pickSound("hoopz_reloadcrossbow");
_gun[? "soundLoop"] = false;

return _gun;
