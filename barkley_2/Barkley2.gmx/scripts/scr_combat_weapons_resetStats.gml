/// scr_combat_weapons_resetStats(gun)

var gun = argument0;

// Charge variables
gun[? "pChargeGain"] = "cg_shot";
gun[? "pChargeGainAmount"] = "ga_gainOne";
gun[? "pChargeLoss"] = "cl_none";
gun[? "pChargeLossAmount"] = "la_loseOne";

gun[? "pChargeMax"] = 6;
gun[? "pChargeCur"] = 0;
gun[? "pChargeRatio"] = 0;
gun[? "pChargeEffect"] = NULL_STRING;

gun[? "pChargeAccum"] = 1;
gun[? "pChargeIncAccum"] = 1.05;
gun[? "pChargeMaxAccum"] = 6;
gun[? "pChargeLossAccum"] = 1;
gun[? "pChargeGainAmmoMax"] = 1;
gun[? "pChargeGainAmmoMin"] = 12;
gun[? "pChargeGainTime"] = 1;

gun[? "pChargeGainVar"] = 0;
gun[? "pChargeLossVar"] = 0;

gun[? "pChargeShot"] = 0;
gun[? "pChargeDamage"] = 0;
gun[? "pChargeHurt"] = 0;
gun[? "pChargeHits"] = 0;
gun[? "pChargeKilled"] = 0;
gun[? "pChargeKilledPow"] = 0;
gun[? "pChargeMissed"] = 0;
gun[? "pChargeCandy"] = 0;

// Sprites
gun[? "gunHeldSprite"] = sprite_get_name(s_Pistol);
gun[? "hudIconSprite"] = sprite_get_name(s_hud_pistols);
gun[? "hudIconFrame"] = 0;
gun[? "flashSprite"] = sprite_get_name(s_Flash);
gun[? "pBulletColor"] = c_white;
gun[? "pBulletScale"] = 1;
gun[? "pBulletSprite"] = sprite_get_name(s_bull);
gun[? "pBulletBurst"] = sprite_get_name(s_ricochet);

gun[? "col"] = c_white; ////blend color of gun sprite in the hud
gun[? "gunheldcol"] = c_white; ////blend color of gun held in hoopz hands
gun[? "bulscale"] = 1;

// Bullet casings
gun[? "readyCasing"] = 0;
gun[? "bcasing"] = sprite_get_name(s_casing);
gun[? "bcasingDir"] = 240;
gun[? "bcasingSpd"] = 12;
gun[? "bcasingRot"] = 30;
gun[? "bcasingSpin"] = 60;
gun[? "bcasingHeight"] = -16;
gun[? "bcasingVertSpd"] = -12;
gun[? "bcasingScale"] = 0.5;
gun[? "bcasingCol"] = c_yellow;

////Position into gunspace
gun[? "pGunspaceX"] = 0;
gun[? "pGunspaceY"] = 0;

gun[? "pBurstSpeed"] = 0;

////stat ratios. Modified by weapon material, type and affixes.
gun[? "pPowerMod"] = 1;
gun[? "pPowerMaxMod"] = 1;
gun[? "pSpeedMod"] = 1;
gun[? "pRangeMod"] = 1;
gun[? "pAmmoMod"] = 1;
gun[? "pAmmoBase"] = 0;

gun[? "pAccMod"] = 1;

gun[? "pWeightMod"] = 1;
gun[? "pAffixMod"] = 1;

gun[? "pKnockback"] = 0;
gun[? "pStagger"] = 1;
gun[? "pRecoil"] = 0.3;

////Stats used directly for the weapon behavior. Built from the weapon stats, ratios and affixes.
gun[? "pPattern"] = "pt_norm" ///basic pattern of shooting

gun[? "pSpreadAmount"] = 0; ///angle of shooting spread, in degrees. Low accuracy means the bullets are less predictable in the spread.
gun[? "pShots"] = 1; ///maximum number of shots fired at a time. They are evenly distributed on the spread amount. If more than one shot is fired, they have a random start position.
            ///So that the individual shots appear separate and arnt all just one blob of superposed shots if accuracy is high.
gun[? "pExtraChance"] = 0;////chance to fire extra bullets
gun[? "pExtraNumber"] = 0;////max extra bullets fired upon chance
gun[? "pBurstAmount"] = 1; ///Number of times shots are fired in a row in bursts automatically.
gun[? "pBurstInterval"] = 6; ///Interval between shots during a burst. Supercedes fire interval, which is the time BETWEEN bursts. On weapons permitting it, it is a
                    ///RATIO of the actual firing interval.
gun[? "pAmmoCost"] = 1;
gun[? "pDamageMin"] = 10;
gun[? "pDamageRand"] = 2;
gun[? "pAccuracy"] = 1;
gun[? "bAimAjarMin"] = 0;
gun[? "bAimAjarMax"] = 0;
gun[? "pRange"] = 1;
gun[? "pFireSpeed"] = 0;
gun[? "pFireDelay"] = 0;
gun[? "pAimMod"] = 0;
gun[? "bRangeEndGrav"] = 7;
gun[? "pAffix"] = 0;

gun[? "pWindUp"] = 0;
gun[? "pWindUpSpeed"] = 0;

// balanced! adjuster to 300 for GoG (6/6/15) - bhroom
gun[? "pFireTimer"] = 300;
gun[? "pFireTimerTarget"] = 300;

gun[? "pFireDelay"] = 0;

gun[? "pCurAmmo"] = 0;
gun[? "pMaxAmmo"] = 0;
gun[? "pWeight"] = 0;
gun[? "pRatioAmmo"] = 1;

////properties passed on to the bullets
///MOVEMENT PATTERNS
gun[? "bType"] = "b_norm";//bullet type. Sets some default values on the bullets. Can be a shorthand for weapon types or element types that have specific defaults
                ///some affixes or weapon types may just manually modify individual values tho.

///the following values are the NORMAL bullet defaults.
///FOLLOWING NUMBERS ARE THE SIMPLE BULLET STATS.
gun[? "bLongTimeOut"] = false;
gun[? "bDistanceLife"] = 30; ///distance the bullet travels before destroying itself.
gun[? "bTimeLife"] = -1; ///number of steps before the bullet destroys itself

gun[? "bSpeed"] = 56;// initial speed the bullet travels at every step. I feel 56 is a good starting point! Bhroom
gun[? "bAccel"] = 0; ///bullet acceleration at every step (or deceleration)
gun[? "bMaxSpeed"] = 86; //doubled from 48 (after Bisse's bullet code fix 120414)
gun[? "bMinSpeed"] = 24; //doubled as well

gun[? "damageRatio"] = 1;

gun[? "bAutomatic"] = false;
gun[? "bShowHiteffect"] = true;

gun[? "bAdvanced"] = false; ///set this to true so the weapon creates the proper bullet type if handling a more advanced bullet.
///FOLLOWING NUMBERS ARE ADVANCED BULLET STATS ONLY.
gun[? "bEnemySeek"] = 0;///speed of turning to find enemy. negative value means it avoids enemies.
gun[? "bEnemyTarget"] = noone; ///target of the seeking. -1 to find nearest enemy, or put an instance ID there to seek specific enemy (ex, enemy clicked)
gun[? "bEnemySeekRange"] = 96; ///minimum distance from enemy for seeking to occur.
gun[? "bEnemySeekTime"] = 1; ///time before bullet starts seeking. 0 means immediate seek.
gun[? "bEnemySeekAccel"] = 0; /// Acceleration added when bullet finds enemy to seek.

gun[? "bBarrierDist"] = 0;
gun[? "bBarrierRotSpd"] = 0;
gun[? "bBarrierRotCount"] = 0;

gun[? "bReturning"] = false;///slows down and reverses speed at the end of distance
gun[? "bTurning"] = 0; ///direction the bullet turns to every step.
gun[? "bRoaming"] = 0; ///random amount of direction the bullet turns every step
gun[? "bWave"] = 0//choose(10,20,30,40); ///bullet moves in a wave pattern. number is size of the wave.
gun[? "bWaveAmp"] = 0//choose(10,20,30,40,50,60,70,80); /// 0.25-0.5-0.75-1-2-3
gun[? "bThroughWalls"] = 0; ///bullet moves through solids
gun[? "bEnemyPierce"] = 0; ///Bullet keeps going after piercing enemy
gun[? "bNoDestroyOnHit"] = false; //Bullet is never destroyed on hit
gun[? "bWallRicochet"] = 0; //amount of times a bullet will bounce off walls
gun[? "bEnemyRicochet"] = 0; //amount of times a bullet will bounce of enemies
gun[? "bMagician"] = 0;
gun[? "bRicochetRandom"] = choose(true,false); //bounce direction will be random instead of based on collision direction
gun[? "bEnemyChain"] = 0;
gun[? "bEnemyChainRange"] = 96;
gun[? "bProximity"] = false;

gun[? "bSpiraling"] = false;
gun[? "bAmmoChange"] = 0;
gun[? "bAmmoChangeTimer"] = 0;

gun[? "bDealDamage"] = true; // Set to false and the main bullet will not deal damage (but explosions,affixes,e.g. will)

gun[? "bShadow"] = 0; ///bullet will cast a round shadow if that size on the ground. 0 for no shadow.

gun[? "bTrail"] = NULL_STRING; //object the bullet will leave behind at regular intervals
gun[? "bTrailAcc"] = 8;  ///random shift of trail explosion away from bullet
gun[? "bTrailAmount"] = 2; ///number of trail explosions to create per interval
gun[? "bTrailInterval"] = 4; ///pixel interval the bullet leaves a trail behind
gun[? "bTrailElement"] = "phys"; ///damage type of the trail
gun[? "bTrailExplosion"] = sprite_get_name(s_FireTrail);

gun[? "bLobEqualsRange"] = false; ///calculates the shot angle so it hits the floor at the end of the range
gun[? "bLobDirection"] = 0; ///bullet will seem like it is travelling in a lob-like trajectory.
gun[? "bLobBounce"] = 0.8; ///bounce power the bullet has if in a lob.
gun[? "bLobBounceCount"] = 0; ///number of bounces before the bullet crashes
gun[? "bLobGravity"] = 0; ///gravity effect on the bullet
gun[? "bDotline"] = false; //bullet changes direction at specific interavals
gun[? "bExplode"] = NULL_STRING;//o_explosion; ///object the bullet leaves behind after distance or time runs out.
gun[? "bExplodeEffect"] = NULL; ///explosion effect bullet spawns on impact
gun[? "bExplodeOnGround"] = false; ///object will explode when hitting the ground when out of bounces
gun[? "bExplodeOnTimeout"] = false; ///object will explode when projectile times out.
gun[? "bExplodeOnWall"] = false; ///object will explode if it hits a wall after being out of ricochets.
gun[? "bExplodeOnEnemy"] = false; ///object will explode if it hits an enemy after being out of enemy bounces.
gun[? "bExplodeOnEnemyProx"] = -1; ///object will explode if an enemy is within range. -1 means ignore range.

gun[? "bExplodeDamage"] = 40;
gun[? "bExplodeElement"] = "phys";
gun[? "bExplosion"] = sprite_get_name(s_MBlast);

// Sounds
gun[? "reloaded"] = false;
gun[? "soundId"] = NULL_STRING;
gun[? "constantSound"] = NULL_STRING;
gun[? "triggerSound"] = NULL_STRING;
gun[? "windupSound"] = NULL_STRING;
gun[? "sustainSound"] = NULL_STRING;
gun[? "winddownSound"] = NULL_STRING;
gun[? "reloadSound"] = NULL_STRING;
gun[? "swapSound"] = NULL_STRING;
gun[? "pickupSound"] = NULL_STRING;
gun[? "casingSound"] = NULL_STRING;
gun[? "emptySound"] = NULL_STRING;

// Script to perform each step
gun[? "stepScript"] = NULL_STRING;
