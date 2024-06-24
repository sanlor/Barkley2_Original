/// combat_gunwield_shoot(actor, gun, aimdir, shootFromGun?)
var actor = argument0;
var gun = argument1;
var _aimdir = argument2;
var _fromGun = argument3;

var _angle;
var _bullet = noone;

var windupSound = soundOrNullstring(gun[? "windupSound"]);
var sustainSound = soundOrNullstring(gun[? "sustainSound"]);
var soundId = soundOrNullstring(gun[? "soundId"]);

///check for flooding shot

var multigun = 1;
if(gun[? "pMaterial"]=="Dual")
{
    multigun = 2;
}

if(multigun==2)
{
    if(gun[? "pCurAmmo"]<=gun[? "pAmmoCost"])
    {
        multigun = 1;
    }
}
var gunCount = 1;

var malfunction = 0;
var _junkAmount = 0;
var _junkSize = 0;
    
repeat(multigun)
{
    // Prefix1 - Flooding
    var shotRepeats = 1;
    if (gun[? "pPrefix1"] == "Flooding") 
        shotRepeats = global.affixFloodingMin + irandom(global.affixFloodingMax - global.affixFloodingMin);
    
    // Prefix1 - NoScope360
    var nosDir = 0;
    var nosSpl = 0;
    if (gun[? "pPrefix1"] == "NoScope360") { shotRepeats = global.affixNoScope360; nosSpl = 360 / global.affixNoScope360; }
        
    var shotEffects = true; ///shot SFX and muzzle flash should be turned off after the first repeat
    
    var soilClog = false;
    if(gun[? "pMaterial"] == "Soiled")
    {
        if(irandom(3)==0)
        {
            soilClog = true;
        }
    }
    
    if(gun[? "pMaterial"] == "Broken")
    {
        if(irandom(3)==0)
        {
            var indicatorText = "";
            _junkAmount = 0;
            _junkSize = 3;
            var malfunctionDraw = irandom(100);
            var malfunctionCol = c_red;
            if(malfunctionDraw>90)///the gun makes a big spark and deals a bit of cyber damage to you and nearby enemies.
            {
                audio_play_sound_ext("hoopzweap_broken_misfire", 5, false);
                if(irandom(10)<=1){malfunction = 5; _junkSize = 6; _junkAmount = 8+irandom(12); indicatorText = "GUN EXPLODED!";}
                else{malfunction = 4;_junkAmount = 4+irandom(4); indicatorText = "ELECTRIC SHOCK!";} 
            }///the gun blows up in your hands, the explosion does a lot of damage to you and everyone nearby.
            else if(malfunctionDraw>70){malfunction=3; _junkAmount = 0; malfunctionCol = c_teal;} ///the powerful shot
            else if(malfunctionDraw>40){malfunction=2; _junkAmount = 1+irandom(2); malfunctionCol = c_orange; audio_play_sound_ext("hoopzweap_broken_misfire", 5, false);} ///the gun fails to fire, and a screw falls off
            else{malfunction=1; _junkAmount = 1;} ////the gun fires a wildly inaccurate shot
            show_debug_message("MALFUNCTION! "+string(malfunction));
            
            if(indicatorText != "")
            {
                var ind = instance_create(actor.x, actor.y - actor.ailmentTotem_head - 8, o_entity_indicatorText);
                ind.x = actor.x;
                ind.y = actor.y - actor.ailmentTotem_head - 8;
                ind.name = "";
                ind.color = malfunctionCol;
                ind.text = indicatorText;
            }
        }
    }
    
    if(gun[? "pMaterial"] == "Junk")
    {
        _junkSize = irandom(3) + irandom(floor(gun[? "pDamageMin"]/30));
        _junkAmount = 1;
    }
    
    
    repeat(shotRepeats)
    {
        if(gun[? "pCurAmmo"]>0 && (gun[? "pWindUp"]>60 || gun[? "pWindUpSpeed"]==0))
        {
            gun[? "reloaded"] = false;
    
            // Cursor animations on shooting if player is shooting
            if (object_is_ancestor(actor.object_index, PlayerCombatActor)) {
                o_curs.shoot_frame = 2;

                if(shotEffects)
                {
                    // Sound playing
                    if(sustainSound != NULL_STRING)
                    {
                        if( (windupSound!=NULL_STRING || !audio_is_playing_ext(windupSound)) && !audio_is_playing_ext(sustainSound))
                        {
                            audio_play_sound_on_actor(actor,sustainSound,true,90);
                        }
                    }
                }
            }
            
            // Wading depth
            var current = scr_statusEffect_getFromCombatActor(actor.id, statusEffect_wading);
            var swimmove = 0;
            if(current >0)
            {
                swimmove = ds_map_find_value(current, "wadingDepthCurrent");
            }
    
            // == Shoot bullets! ==
            actor.buckx = round(lengthdir_x(2,_aimdir+180));
            actor.bucky = round(lengthdir_y(2,_aimdir+180));
    
            if(gun[? "pMaterial"] != "Plantain")
            {
                gun[? "readyCasing"] += gun[? "pAmmoCost"]; ///ready bullet casing
            }
            
            ///shot anim
            var _aimdirQuant = actor.aiming * (360 / actor.aFaceCount);
            
            scr_player_getGunShifts(gun[? "pType"],gun[? "pMaterial"]=="Dual");
            var dir = actor.aiming*22.5 
            if (gun[? "pPrefix1"] == "Afterburner")
            {
                dir -= 180;
                _aimdirQuant -= 180;
                _aimdir -= 180;
            }
            var distx = lengthdir_x(heldDist,dir);
            var disty = lengthdir_y(heldDist,dir)*0.75;
            if(gun[? "pMaterial"]=="Dual" && heldHShift<6)
            {
                heldHShift = 8;
            }
            var xhshift = lengthdir_x(heldHShift,dir+90);
            var yhshift = lengthdir_y(heldHShift,dir+90)*0.75;
            
            if(gunCount==2)
            {
                xhshift = lengthdir_x(heldHShift,dir-90);
                yhshift = lengthdir_y(heldHShift,dir-90)*0.75;
            }
            
            var _barrel_x = lengthdir_x(heldBulletDist,_aimdirQuant) + distx + xhshift + actor.x;
            var _barrel_y = lengthdir_y(heldBulletDist,_aimdirQuant) + disty + yhshift + actor.y;
            var _barrel_z = actor.ARMS_HEIGHT + heldBullet_YShift + 1 - swimmove;
            
            if (shotEffects)
            {
                scr_player_muzzle_position(gun[? "pType"],gun[? "pMaterial"]=="Dual", actor, gun, gunCount);
            
                if (muzX == -999)
                {
                    _flash = instance_create(_barrel_x, _barrel_y, o_flash)
                    _flash.z = z + _barrel_z;
                }
                else
                {
                    _flash = instance_create(muzX, muzY, o_flash)
                    _flash.z = z + muzZ;
                }
                _flash.sprite_index = assetOrNull(gun[? "flashSprite"], asset_sprite);
                _flash.image_angle = _aimdir;
                if (_flash.sprite_index == s_Flash_BFG) {
                    with _flash scr_entity_animation_setSpeed(ANIMATION_DEFAULT, 1.5);
                }
            }
    
            _angle = gun[? "pSpreadAmount"]/gun[? "pShots"];
            
            var _i,_bulratio,_btype,_extra;
            _bulratio = 1;
            _extra = 0;
            if (gun[? "pShots"]<gun[? "pAmmoCost"]){_bulratio = gun[? "pCurAmmo"]/gun[? "pAmmoCost"];}
            // Below shouldn't exist, every bullet needs to be accounted for - Only existed in flooding
            //if (random(1)<gun[? "pExtraChance"]) _extra = 1 + irandom(gun[? "pExtraNumber"]);
            
            var bulletCount = floor(gun[? "pShots"]*_bulratio)+_extra;
            if(gun[? "periodic_mutlishot"]!=1 && gun[? "pChargeRatio"]==1)
            {
                bulletCount += ceil(gun[? "periodic_mutlishot"]*gun[? "pAffix"]/100);
            }
            
            if(malfunction==2){bulletCount = 0;}
    
            for(_i = 0; _i < bulletCount; _i+=1)
            {
                var _sx = 0;
                var _sy = 0;
                
                ///shot position?
                if(gun[? "pShots"]>1 && gun[? "pAccuracy"]<4 && gun[? "pSpreadAmount"]!=0)
                {
                    var sprd;
                    sprd = min(4,gun[? "pShots"]/2);
                    _sx = _sx-sprd+irandom(sprd*2);
                    _sy = _sy-sprd+irandom(sprd*2);
                }
    
                _btype = o_bullet;
                if(gun[? "bAdvanced"]) {_btype = o_advBullet;}
                if(malfunction>=4){_btype = o_advBullet;}
    
                /////SPAWN BULLET HERE
                if (gun[? "pPrefix1"] == "NoScope360")
                {
                    _aimdir = argument2 + nosDir;// - 180;
                    _bullet = instance_create(actor.x + lengthdir_x(global.affixNoScope360Distance, _aimdir), actor.y + lengthdir_y(global.affixNoScope360Distance, _aimdir), _btype);
                    nosDir += nosSpl;
                }
                else if gun[? "bMagician"]
                {
                    var magDir = _aimdir - (global.affixMagicianDegrees / 2) + random(global.affixMagicianDegrees);
                    var magLen = irandom(64);
                    _bullet = instance_create(_barrel_x+_sx + lengthdir_x(magLen, magDir), _barrel_y+_sy + lengthdir_y(magLen, magDir), _btype);
                    _bullet.z = z + _barrel_z;
                    Smoke("puff", _bullet.x, _bullet.y, _bullet.z, 20 + random(6), c_purple, 0.5);
                    //scr_fx_simple(_bullet.x, _bullet.y, _bullet.z, s_effect_magician_shot);
                }
                else _bullet = instance_create(_barrel_x+_sx, _barrel_y+_sy, _btype);
                _bullet.z = z + _barrel_z;
                
                if(gun[? "pType"] == "Crossbow")
                {
                    _bullet.arrowShot = true;
                }
                
                _bullet.colorBlend = gun[? "gunheldcol1"];
                if(gun[? "pType"]==GUN_TYPE_FLAMETHROWER)
                {
                    _bullet.colorBlend = gun[? "gunheldcol3"];
                    if(_bullet.colorBlend== c_white)
                    {
                        _bullet.colorBlend = gun[? "gunheldcol2"];
                    }
                    
                    if(gun[? "pMaterial"] != "Bone"){_bullet.colorBlend = gun[? "gunheldcol1"];}
                }
                
                // GZ FIX for rifles and pistols
                if (gun[? "pPrefix1"] != "NoScope360" && object_is_ancestor(actor.object_index, PlayerCombatActor)) 
                {
                    if (global.keyinput_type == KEYINPUT_KEYBOARD_MOUSE) 
                    {
                        curX = o_curs.x + view_xview;
                        curY = o_curs.y + view_yview + z + global.cursorShift;
                        curDir = scr_math_mod(point_direction(_bullet.x, _bullet.y, curX, curY), 360);
                        curDif = angle_difference(curDir, _aimdir);
                        curDif = clamp(curDif, -10, +10);
                        _aimdir += curDif;
                        if (_aimdir < 0) _aimdir += 360; else if (_aimdir >= 360) _aimdir -= 360;
                    }
                }

                _bullet.attack_from = actor.id;
                
                if (_fromGun) _bullet.weapon_from = gun; // bullet comes from a gun
                
                _bullet.deal_damage = gun[? "bDealDamage"];
    
                _bullet.move_dir = gun[? "pAimMod"] + _aimdir - (gun[? "pSpreadAmount"]/2) + _angle*_i;
                _bullet.move_dir = _bullet.move_dir - gun[? "pAccuracy"]/2 + random(gun[? "pAccuracy"]) + gun[? "bAimAjarMin"] + irandom(gun[? "bAimAjarMax"]);
                // Add a bit of extra wiggle to flooding bullets so you can see them better
                if (gun[? "pPrefix1"] == "Flooding") 
                    _bullet.move_dir += -(global.affixFloodingAim / 2) + random(global.affixFloodingAim);
                
                // Proximity //
                if (gun[? "bProximity"] && instance_exists(EnemyCombatActor))
                {
                    var objNer = instance_nearest(_bullet.x, _bullet.y, EnemyCombatActor);
                    _bullet.move_dir = point_direction(_bullet.x, _bullet.y, objNer.x, objNer.y);
                }
                
                ////broken gun malfunction 1: inaccurate shot
                if(malfunction==1){_bullet.move_dir += (35+random(35))*choose(1,-1);}
                if(malfunction>=4){_bullet.move_dir = _aimdir +180;}
                if(malfunction==5){gun[? "pCurAmmo"] = 0;} /// on malfunction 5, gun breaks
                
                _bullet.initDir = _bullet.move_dir;
    
                _vrand = lengthdir_y(10,gun[? "pAccuracy"]/2);
                _bullet.move_height = 0-_vrand/2+random(_vrand);
    
                // Spiraling // 
                _bullet.spiraldir = gun[? "bSpiraling"];                
                                           
                // Afterburner prefix1 //
                if gun[? "bAimAjarMin"] = 180 and gun[? "bAimAjarMax"] = 0 then
                    {
                    var atk = scr_stats_newAttackStats();
                    atk[? STAT_ATTACK_KNOCKBACK] = 40;
                    scr_stats_performAttack(atk, o_hoopz, true, _bullet.move_dir + 180, false, true);
                    ds_map_destroy(atk);
                    }
                
                if(gun[? "bLobDirection"]==0){_bullet.move_dist = gun[? "bSpeed"];}
                else
                {
                    if(gun[? "bLobEqualsRange"])
                    {
                        gun[? "bLobDirection"] = max(0,gun[? "bLobDirection"] - gun[? "pRange"]/4);
                    }
    
                    _bullet.move_dist = lengthdir_y(gun[? "bSpeed"],gun[? "bLobDirection"]);
                }
    
                _bullet.accel = gun[? "bAccel"];
                _bullet.maxspd = gun[? "bMaxSpeed"];
                _bullet.minspd = gun[? "bMinSpeed"];
                if (gun[? "pPrefix1"] == "Gravitational")
                {
                    _bullet.accel *= global.affixGravitationalSpeed;
                    _bullet.maxspd *= global.affixGravitationalSpeed;
                    _bullet.minspd *= global.affixGravitationalSpeed;
                }
                
                // Critical hits // NOTE: this is set to 1.00 so there should be no influence of LUCK on the shot
                var crit = 1;
                if (scr_stats_getEffectiveStat(actor, STAT_BASE_LUCK) / 2) >= irandom(99) then crit = global.critMultiplier;
                
                var dmg = gun[? "pDamageMin"] + random(gun[? "pDamageRand"]);
                
                if(gun[? "pMaterial"] == "Junk")
                {
                    if(random(30+dmg)>20){_junkAmount += random(dmg/30);}
                }
                
                _bullet.dmg_dir = _bullet.move_dir;
                _bullet.image_xscale = gun[? "pBulletScale"];
                _bullet.image_yscale = gun[? "pBulletScale"];
    
                if(gun[? "bLongTimeOut"])
                {
                    _bullet.distlife = -1;
                    _bullet.timelife = -1;
                }
                else
                {
                    if (gun[? "bDistanceLife"] > 0) {
                        _bullet.distlife = gun[? "bDistanceLife"] + irandom(8);
                    }
                    if (gun[? "bTimeLife"] > 0) {
                        _bullet.timelife = gun[? "bTimeLife"];
                    }
                }
                
                if(malfunction>=4)
                {
                    _bullet.timelife = 0.2;
                    _bullet.distlife = 2;
                }
    
                _bullet.image_xscale = gun[? "bulscale"];
                _bullet.image_yscale = gun[? "bulscale"];
    
                ////////////////
                with _bullet scr_entity_animation_setSpeed("default", 0);
                //_bullet.sprite_index  = assetOrNull(gun[? "pBulletSprite"], asset_sprite);
                _bullet.bulletBurst = assetOrNull(gun[? "pBulletBurst"], asset_sprite);
    
                _bullet.col = gun[? "col"];
                _bullet.shadow = gun[? "bShadow"];
    
                _bullet.show_hiteffect = gun[? "bShowHiteffect"];
    
                // Set bullet attack properties
                ds_list_clear(_bullet.target_list);
                ds_list_copy(_bullet.target_list, actor.target_list);
                ds_list_add(_bullet.target_list, DestructibleCombatActor);
                ds_list_add(_bullet.target_list, BlockingCombatActor);
                ds_list_add(_bullet.target_list, o_hoopz); // Added April 14 2017
                
                var finalDmg = dmg * gun[? "damageRatio"];
                
                if (gun[? "pPrefix1"] == "Ghostic") finalDmg *= global.affixGhosticDamage;
                scr_stats_setAttackStat(_bullet, STAT_ATTACK_DMG_NORMAL, finalDmg * crit);
                scr_stats_setAttackStat(_bullet, STAT_ATTACK_KNOCKBACK, gun[? "pKnockback"]);
                scr_stats_setAttackStat(_bullet, STAT_ATTACK_STAGGER, gun[? "pStagger"]);
                scr_stats_setAttackStat(_bullet, STAT_ATTACK_STAGGER_HARDNESS, gun[? "pStaggerHardness"]);
                
                // Boss alignment: send MORAL modifier out with bullet
                if (global.alignmentDamageDealt != 1)
                {
                    var dmgNor = scr_stats_getAttackStat(_bullet, STAT_ATTACK_DMG_NORMAL);
                    var dmgBio = scr_stats_getAttackStat(_bullet, STAT_ATTACK_DMG_BIO);
                    var dmgCyb = scr_stats_getAttackStat(_bullet, STAT_ATTACK_DMG_CYBER);
                    var dmgMen = scr_stats_getAttackStat(_bullet, STAT_ATTACK_DMG_MENTAL);
                    var dmgKos = scr_stats_getAttackStat(_bullet, STAT_ATTACK_DMG_COSMIC);
                    var dmgZau = scr_stats_getAttackStat(_bullet, STAT_ATTACK_DMG_ZAUBER);
                    scr_stats_setAttackStat(_bullet, STAT_ATTACK_DMG_NORMAL, dmgNor * global.alignmentDamageDealt);
                    scr_stats_setAttackStat(_bullet, STAT_ATTACK_DMG_BIO, dmgBio * global.alignmentDamageDealt);
                    scr_stats_setAttackStat(_bullet, STAT_ATTACK_DMG_CYBER, dmgCyb * global.alignmentDamageDealt);
                    scr_stats_setAttackStat(_bullet, STAT_ATTACK_DMG_MENTAL, dmgMen * global.alignmentDamageDealt);
                    scr_stats_setAttackStat(_bullet, STAT_ATTACK_DMG_COSMIC, dmgKos * global.alignmentDamageDealt);
                    scr_stats_setAttackStat(_bullet, STAT_ATTACK_DMG_ZAUBER, dmgZau * global.alignmentDamageDealt);
                }
    
                _bullet.matName = gun[? "pMaterial"];
                /////plantain casings spawn based on whole bananas fired
                if(gun[? "pMaterial"] == "Plantain")
                {
                    var casingAdd = 0.05;
                    if(finalDmg >70){casingAdd = 1;}
                    else{casingAdd = finalDmg/100+0.05;}
                    gun[? "readyCasing"] += casingAdd; ///ready bullet casing
                }
                
                if(gun[? "pMaterial"] == "Chitin")
                {
                    _bullet.guntype = gun[? "pType"];
                }
                
                _bullet.dotlineAffix = gun[? "bDotline"];
                _bullet.returning = gun[? "bReturning"];
                _bullet.lobDirection = gun[? "bLobDirection"];
                _bullet.lobGravity = gun[? "bLobGravity"];
                _bullet.rangeEndGrav = gun[? "bRangeEndGrav"];
                var is_lob = 0;
                is_lob = (gun[? "pType"] == GUN_TYPE_FLAREGUN) || (gun[? "pPrefix1"] == "Lobbing");
                if (object_is_ancestor(actor.object_index, PlayerCombatActor) && is_lob)
                {
                    show_debug_message("combat_gunwield_shoot - lobbing " + string(actor.cursor_distance_from_player));
                    //_bullet.rangeEndGrav = 3.25 - (actor.cursor_distance_from_player / 100);
                    //_bullet.destinationX = view_xview[0] + o_curs.x;
                    //_bullet.destinationY = view_yview[0] + o_curs.y;
                    _bullet.destinationDistance = actor.cursor_distance_from_player;
                    _bullet.rangeEndGrav = 1; //max(0.4, _bullet.rangeEndGrav);
                    _bullet.lobDirection = 40 + (actor.cursor_distance_from_player / 15);
                    var booster = 0.6 + (actor.cursor_distance_from_player / 250);
                    //gun[? "bLobDirection"] = max(0,gun[? "bLobDirection"] - actor.cursor_distance_from_player/4);
                    _bullet.move_dist = lengthdir_y(gun[? "bSpeed"], _bullet.lobDirection) * booster; //gun[? "bLobDirection"]);
                }
                //gun[? "bLobDirection"]);
                if (gun[? "pType"] == GUN_TYPE_FLAREGUN) && (gun[? "pPrefix1"] == "Lobbing")
                {
                    _bullet.move_z = _bullet.move_z - lengthdir_y(gun[? "bSpeed"] * 2, _bullet.lobDirection);
                    _bullet.rangeEndGrav = 2;
                }
                else // Normal lob
                {
                    _bullet.move_z = _bullet.move_z - lengthdir_y(gun[? "bSpeed"], _bullet.lobDirection);
                }
                ///prefix 2 apply
                /*
                scr_statusEffect_addToCombatAttack(statusEffect_burning, self.id);
                */
    
                //Rifles get speed bonus applied in type
                scr_combat_weapons_Prefix2(gun[? "pPrefix2"],"applyBullet", _bullet, gun);
                scr_combat_weapons_Suffix(gun[? "pSuffix"],"applyBullet", _bullet, gun);
                _bullet.sprite_index = assetOrNull(gun[? "pBulletSprite"], asset_sprite);
                _bullet.colorBasic = gun[? "pBulletColor"];
                if (gun[? "pPrefix1"] != "Pensioner's" && is_lob == 0) _bullet.speedBonus = gun[? "speedBonus"];
                
                if(gun[? "pMaterial"] == "Diamond")
                {
                    if(gun[? "pCurAmmo"] mod 2 == 0)
                    {
                        _bullet.startAngle = 0;
                    }
                    else
                    {
                        _bullet.startAngle = 45;
                    }
                }
                if(_btype == o_advBullet)
                {    
                    _bullet.barrierDist = gun[? "bBarrierDist"];
                    _bullet.barrierRotSpd = gun[? "bBarrierRotSpd"];
                    if(gun[? "bBarrierRotCount"]>0)
                    {
                        _bullet.barrierRotCount = gun[? "bBarrierRotCount"] - 0.5 + random(1);
                    }
                    else
                    {
                        _bullet.barrierRotCount = 0;
                    }
                    _bullet.enemySeek = gun[? "bEnemySeek"];
                    _bullet.enemyTarget = gun[? "bEnemyTarget"];
                    _bullet.enemySeekRange = gun[? "bEnemySeekRange"];
                    _bullet.enemySeekTime = gun[? "bEnemySeekTime"];
                    _bullet.enemySeekAccel = gun[? "bEnemySeekAccel"];
    
                    _bullet.turning = gun[? "bTurning"];
                    _bullet.roaming = gun[? "bRoaming"];
                    _bullet.wave = gun[? "bWave"];
                    _bullet.waveAmp = gun[? "bWaveAmp"];
                    _bullet.throughWalls = gun[? "bThroughWalls"];
                    _bullet.enemyPierce = gun[? "bEnemyPierce"];
                    _bullet.noDestroyOnHit = gun[? "bNoDestroyOnHit"];
                    _bullet.wallRicochet = gun[? "bWallRicochet"];
                    _bullet.enemyRicochet = gun[? "bEnemyRicochet"];
                    _bullet.ricochetRandom = gun[? "bRicochetRandom"];
    
                    _bullet.enemyChain = gun[? "bEnemyChain"];
                    _bullet.enemyChainRange = gun[? "bEnemyChainRange"];
                    _bullet.chainLeft = gun[? "bEnemyChain"];
    
                    if(gun[? "bEnemyChain"]>0)
                    {
                        _bullet.chainedEnemies = ds_list_create();
                    }
    
                    _bullet.lobBounceCount = gun[? "bLobBounceCount"];
                    _bullet.lobBounce = gun[? "bLobBounce"];
    
    
                    if(assetOrNull(gun[? "bTrail"], asset_object) != NULL)
                    {
                        _bullet.trailObject = assetOrNull(gun[? "bTrail"], asset_object);
                        _bullet.trailSprite = assetOrNull(gun[? "bTrailExplosion"], asset_sprite);
                        _bullet.trailAcc = gun[? "bTrailAcc"];
                        _bullet.trailAmount = gun[? "bTrailAmount"];
                        _bullet.trailInterval = gun[? "bTrailInterval"];
                    }
    
                    if(malfunction>=4)///add gun explosion if malfunction 4 or 5, and if no explosion already
                    {
                        if(assetOrNull(gun[? "bExplode"], asset_object) == NULL)
                        {
                            _bullet.explodeOnGround = true;
                            _bullet.explodeOnTimeout = true;
                            _bullet.explodeOnWall = true;
                            _bullet.explodeOnEnemy = true;
                            _bullet.explodeGunType = GUN_TYPE_ROCKET;
                            _bullet.explodeObject = o_explosion_rocket;
                            _bullet.explodeSprite = s_effect_explo_32;
                            _bullet.explodeDamage = dmg;
                            if(malfunction==4){_bullet.explodeDamageMod = 1.2; _bullet.explodeDamage +=5;}
                            else{_bullet.explodeDamageMod = 2; _bullet.explodeDamage +=10;}
                        }
                    }
                    
                    if(assetOrNull(gun[? "bExplode"], asset_object) != NULL)
                    {
                        var _expl;
                        _bullet.explodeObject = assetOrNull(gun[? "bExplode"], asset_object);
                        _bullet.explodeSprite = assetOrNull(gun[? "bExplosion"], asset_sprite);
                        _bullet.explodeDamageMod = gun[? "bExplodeDamageMod"]; // finalDmg * - 
                        _bullet.explodeOnGround = gun[? "bExplodeOnGround"];
                        _bullet.explodeOnTimeout = gun[? "bExplodeOnTimeout"];
                        _bullet.explodeOnWall = gun[? "bExplodeOnWall"];
                        _bullet.explodeOnEnemy = gun[? "bExplodeOnEnemy"];
                        _bullet.explodeOnEnemyProx = gun[? "bExplodeOnEnemyProx"];
                        _bullet.explodeGunType = gun[? "pType"]; // For intensity
                        _bullet.explodeDamage = dmg; // Damage of bullet / POWER
                        
                        if(malfunction>4)///add gun explosion if malfunction 4 or 5, and if no explosion already
                        {
                            _bullet.explodeOnTimeout = true;
                        }
                    }
                    
                    
                    
                    if (is_string(gun[? "bExplodeEffect"]) or gun[? "bExplodeEffect"] != NULL) {
                        _bullet.explodeEffect = gun[? "bExplodeEffect"];
                    }
                }
                
                _bullet.matName = gun[? "pMaterial"];
                if(gun[? "pMaterial"]=="Francium")
                {
                    _bullet.franciumShot = true;
                    _bullet.deal_damage = false;
                    _bullet.event_user_on_hit = 6;
                }
                
                if(gun[? "pType"] == GUN_TYPE_FLAREGUN)
                {
                    _bullet.flaregun = true;
                }
                
                if(gun[? "pType"] == GUN_TYPE_ROCKET)
                {
                    _bullet.rocketShot = true;
                }
                
                if(gun[? "pType"] == GUN_TYPE_BFG)
                {
                    _bullet.bfgShot = true;
                }
    
                // Is this a periodic shot?
                if(gun[? "pChargeRatio"]==1)
                {
                    _bullet.superShot = true;
                    // Super attacks can last longer for some prefixes, and have a bigger movement hitbox
                    if (gun[? "pType"] != GUN_TYPE_FLAREGUN) _bullet.distlife *= 1 + gun[? "pAffix"]/100;
                    else _bullet.glowEffect = true;
                    with (_bullet) scr_entity_setMovementCollisionShape_rectangle(8, 8); // GZ ADD Periodic movement-collision increase
                }
    
                scr_combat_weapons_specialshot(gun, _bullet);
    
                // Set bullet direction and speed
                with _bullet
                {
                    // Dir+dist already stored in right variables, but Entity must be refreshed to take notice
                    scr_entity_setDirSpd(move_dir, move_dist);
                    // Store player X/Y speed as movement offset
                    if gun[? "bUseMoveOffset"] = true then
                        {
                        move_x_offset = actor.move_x;
                        move_y_offset = actor.move_y;
                        }
                    else
                        {
                        move_x_offset = 0;
                        move_y_offset = 0;
                        }
                }
                
                // Apply knockback to shooter
                if (gun[? "pPrefix1"] != "NoScope360" || global.affixNoScope360Knockback)
                {
                    var knockback_force = scr_stats_getAttackStat(_bullet, STAT_ATTACK_KNOCKBACK) * gun[? "pRecoil"];
                    var knockback_dir = _aimdir + gun[? "pAimMod"] + 180;
                    if (gun[? "pPrefix1"] == "Afterburner") knockback_force *= 4;
                    scr_stats_knockback_add(actor, knockback_force, knockback_dir);
                }
    
                // Play sound
                if (soundId != NULL_STRING)
                {
                    var _snd = noone;
                    if (gun[? "pChargeRatio"] == 1)
                    {
                        audio_play_sound_on_actor(actor, "periodic_released", false, 100);
                        // Use this if there is no prefix 2
                        // audio_play_sound_on_actor(id, "periodic_released_muted", false, 100);
                    }
                    else if (gun[? "soundLoop"]) {
                        if (!audio_is_playing_ext(soundId)) {
                            _snd = audio_play_sound_on_actor(actor, soundId, true, 100);
                        }
                    }
                    else {
                        if(soilClog)
                        {
                            soundId = soundOrNullstring("hoopzweap_rotten_shot");
                        }

                            if (bulletCount > 1) {
                                // was audio_play_sound_fresh(
                                _snd = audio_play_sound_ext(soundId, 100, false); // Make sure only one sound at a time plays (shotguns etc)
                            }
                            else {
                                _snd = audio_play_sound_ext(soundId, 100, false); // Other gun'ii, allow sound overlap
                            }
                        
                    }
                    var shotPitch = 0.8;
                    var shotPitchRand = 0.4;
                    var dmgPitchNormal = gun[? "sound_normalPitchDmg"];
                    //finalDmg
                    
                    
                    if(!is_undefined(dmgPitchNormal))
                    {
                        shotPitchRand = 0.05;
                        shotPitch *= ((((dmgPitchNormal/max(1,finalDmg))-1)/2)+1);
                    }
                    
                    audio_sound_pitch(_snd,shotPitch+random(shotPitchRand));
                }
    
                // Enemy AI can hear player shots
                scr_AI_hearing_makeSound(actor, actor.x, actor.y, 150, 100)
    
            }
            
            if(soilClog)
            {
                if(gun[? "pType"] == GUN_TYPE_FLAREGUN)
                {
                    _bullet.move_dist *= 0.4;
                    _bullet.lobAngledSprite = true;
                }
                else
                {
                    _bullet.lobGravity = 3;
                    _bullet.rangeEndGrav = 20;
                    _bullet.move_dist /= 2;
                    _bullet.distlife /= 2; 
                    _bullet.timelife /= 2;
                }
                _bullet.sprite_index = s_bull_soiled;
                
                with(_bullet){scr_entity_setDirSpd(move_dir, move_dist);}
                scr_stats_setAttackStat(_bullet, STAT_ATTACK_DMG_NORMAL,scr_stats_getAttackStat(_bullet, STAT_ATTACK_DMG_NORMAL)*0.75);
            }
// Reduce ammo
            if (Quest("infiniteAmmo") == 0) gun[? "pCurAmmo"] = clamp(gun[? "pCurAmmo"] - gun[? "pAmmoCost"], 0, gun[? "pMaxAmmo"]);
            gun[? "pChargeShot"] +=1;
            if(gun[? "pChargeRatio"]==1){gun[? "pChargeCur"] = 0;gun[? "pChargeShot"] =0;} ///reset super timer if this was a super attack
    
            
        }
        shotEffects = false; ///turn off shot effects after first repeat.
    
    }
    
    
    ///soilClog
    gunCount +=1;
}

if(_junkAmount>0 || malfunction>0)
{
    scr_player_getGunShifts( gun[? "pType"],gun[? "pMaterial"]=="Dual");
    var current = scr_statusEffect_getFromCombatActor(actor, statusEffect_wading);
    var swimmove = 0;
    if(current >0){swimmove = ds_map_find_value(current, "wadingDepthCurrent");}
    var __dir = actor.aiming*22.5 
    var __distx = lengthdir_x(actor.heldDist,__dir);
    var __disty = lengthdir_y(actor.heldDist,__dir)*0.75;
    var __xhshift = lengthdir_x(actor.heldHShift,__dir+90);
    var __yhshift = lengthdir_y(actor.heldHShift,__dir+90)*0.75;
    var _aimdirQuant = actor.aiming * (360 / actor.aFaceCount);
    var _barrel_x = lengthdir_x(heldBulletDist,_aimdirQuant) + distx/5 + xhshift + actor.x;
    var _barrel_y = lengthdir_y(heldBulletDist,_aimdirQuant) + disty/5 + yhshift + actor.y;
    var _barrel_z = actor.ARMS_HEIGHT+heldBullet_YShift+2 - swimmove;
    
    repeat(_junkAmount) ///spawn junk flying out of the gun
    {
        var _barrel_z = actor.ARMS_HEIGHT + actor.heldBullet_YShift + 1 - swimmove;
        _casing = instance_create(actor.x +__distx+__xhshift, actor.y + __disty +__yhshift, o_casings);
        _casing.z = actor.z + _barrel_z + 1;
        _casing.sprite_index = s_bull_junk;
        _casing.image_speed = 0; _casing.image_index = min(20,_junkSize+irandom(10));
        __dir = random(360);
        var __spd = 2+random(12);
        with _casing scr_entity_setDirSpd(__dir,__spd);
        _casing.rot = irandom(180);
        _casing.rotspd = 0.2;
        _casing.scale = 1;
        _casing.col = c_white;
        _casing.move_z = 2 -random(48);
    }
    
    if(malfunction==4) ////gun shock
    {
        _flash = instance_create(_barrel_x, _barrel_y - (_barrel_z+4), o_FX)
        _flash.image_speed = 0.2;
        _flash.sprite_index = s_bull_gunShock;
        _flash.dny = -64;
        _flash.image_angle = choose(0,90,180,270);
    }
    
    if(malfunction==5)
    {
        combat_gunwield_unequip(actor,gun);
        scr_combat_weapons_destroygun(gun);
    }
}

if(_bullet != noone and object_is_ancestor(actor.object_index, PlayerCombatActor)) {
    //baseShake = 2;
    //marksmanMod = 17.5;

    var agile = scr_stats_getEffectiveStat(o_hoopz, STAT_BASE_AGILE);
    var weight = scr_stats_getEffectiveStat(o_hoopz, STAT_BASE_WEIGHT);

    var lethargy = max(((agile - weight) * global.lethargyMod), -1);

    var speed_log = max(log10(lethargy + global.logWeight), -1); // lethargy

    var marksmanship = abs(speed_log);//min( abs(speed_log), 0);
    //if(lethargy > 0) marksmanship = 0;

    var shakiness = marksmanship * global.marksmanMod + global.baseShake;
    var effectiveShake = shakiness; //irandom(shakiness);

    /*show_message(string(agile)+" "+
        string(weight)+" "+
        string(lethargy)+" "+
        string(speed_log)+" "+
        string(marksmanship)+" "+
        string(shakiness)+" "+
        string(effectiveShake)+" ");*/

    /*var shaker = instance_create(actor.x, actor.y, oShaker);
    shaker.shakePower = effectiveShake;
    shaker.shakeRadius = effectiveShake;
    shaker.shakeTotalDuration = max(effectiveShake/2, 1); // in 0.1s
    shaker.shakeCurrentDuration = shaker.shakeTotalDuration;*/
    Shake("add", effectiveShake, 999, actor.x, actor.y, max(effectiveShake/2, 1)/10);
}

return _bullet;
