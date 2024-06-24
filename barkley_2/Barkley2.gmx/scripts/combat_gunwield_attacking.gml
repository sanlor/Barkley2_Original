/// combat_gunwield_attacking(gun, actor, triggerPressed, triggerHeld)
/*
This script does not 'perform one attack', rather it processes
everything to do with attacking - cooldown timers, angles, etc.

Bullet spawning is delegated to a script for each specific weapon.
*/

var gun            = argument0;
var actor          = argument1;
var triggerPressed = argument2;
var triggerHeld    = argument3;


actor.initiateShoot = false;
    
// Return gun sprite from recoil
with (actor) {
    if buckx != 0
        buckx = lerp(buckx,0,0.3 * dt())
    if bucky != 0
        bucky = lerp(bucky,0,0.3 * dt())
}

if (gunBursting > 0) {
    actor.initiateShoot = true;
}

if (gun != NULL) {
    // Play constant sound if specified
    var constantSound = soundOrNullstring(gun[? "constantSound"]);
    if (constantSound != NULL_STRING)
    {
        if (!audio_is_playing_ext(constantSound))
        {
            audio_play_sound_on_actor(actor, constantSound, true, 90);
        }
    }


    if (gun[? "pCurAmmo"] <= 0) //Make gun play click sound when out of ammo
    {
        if (triggerPressed)
        {
            o_hud.ammoNone = 1;
            audio_play_sound_on_actor(actor,scr_soundbank_pickSound("hoopz_click"),false,90);
        }
    }
    else //Key methods for shooting (automatic gun / manual gun)
    {
        if(gun[? "bAutomatic"] || global.pistolAutoFire)
        {
            if (triggerHeld)
            {
                actor.initiateShoot = true;
            }
        }
        else
        {
            if (triggerPressed)
            {
                actor.initiateShoot = true;
            }
        }
        
        if (triggerPressed)
        {
            var triggerSound = soundOrNullstring(gun[? "triggerSound"]);
            if (triggerSound != NULL_STRING)
            {
                audio_play_sound_on_actor(actor, triggerSound, false, 0);
            }
        }
    }
    
    var fireTimer = gun[? "pFireTimerTarget"] * ( 1-gun[? "pShotDelay"]);
    
    if(gun[? "pFireTimer"]<fireTimer)
    {
        if(gunBursting)
        {
            gun[? "pFireTimer"] += (15 + power(1 + gun[? "pBurstSpeed"],1.75)/4) * dt();
        }
        else
        {
            gun[? "pFireTimer"] += (15 + power(1 + gun[? "pFireSpeed"],1.75)/4) * dt();
        }
        
        if(gun[? "pFireTimer"]>fireTimer/4*3 && !gun[? "reloaded"])
        {
            var reloadSound = soundOrNullstring(gun[? "reloadSound"]);
            if(reloadSound != NULL_STRING)
            {
                audio_play_sound_on_actor(actor,reloadSound,false,90)
                gun[? "reloaded"] = true;
            }
        }
    }

    if(!gunBursting)
    {
        var casing = assetOrNull(gun[? "bcasing"], asset_sprite);
        if(casing != NULL && gun[? "pFireTimer"]>=gun[? "pFireTimerTarget"]*0.99)
        {
            if(gun[? "readyCasing"]>=1)
            {
            
                var _casing, _dir, _spd;
                scr_player_getGunShifts( gun[? "pType"],gun[? "pMaterial"]=="Dual");
                var __dir = actor.aiming*22.5 
                var __distx = lengthdir_x(actor.heldDist,__dir);
                var __disty = lengthdir_y(actor.heldDist,__dir)*0.75;
                var __xhshift = lengthdir_x(actor.heldHShift,__dir+90);
                var __yhshift = lengthdir_y(actor.heldHShift,__dir+90)*0.75;
                
                var current = scr_statusEffect_getFromCombatActor(actor, statusEffect_wading);
                var swimmove = 0;
                if(current >0)
                {
                    swimmove = ds_map_find_value(current, "wadingDepthCurrent");
                }
                
                var _barrel_z = actor.ARMS_HEIGHT + actor.heldBullet_YShift + 1 - swimmove;
                
                _casing = instance_create(actor.x +__distx+__xhshift, actor.y + __disty +__yhshift, o_casings);
                _casing.z = actor.z + _barrel_z + 1;
                _casing.casingSound = gun[? "casingSound"];//"hoopz_shellcasings";
                _casing.sprite_index = casing;
                _dir = actor.look_dir_discrete + gun[? "bcasingDir"] -10+random(20);
                _spd = gun[? "bcasingSpd"]+random(1);
                with _casing scr_entity_setDirSpd(_dir, _spd);
                _casing.rot = gun[? "bcasingRot"];
                _casing.rotspd = gun[? "bcasingSpin"];
                
                _casing.scale = gun[? "bcasingScale"];
                _casing.move_z = (- gun[? "bcasingVertSpd"] - random(1));
                _casing.col = gun[? "bcasingCol"];
                gun[? "readyCasing"] -=1;
            }
            if(gun[? "readyCasing"] >5){gun[? "readyCasing"] = 5;}
        }
    }
    
    if (!actor.initiateShoot && gun[? "soundLoop"]) {
        var sound = soundOrNullstring(gun[? "soundId"]);
        if (audio_is_playing_ext(sound)) {
            audio_stop_sound_ext(sound);
        }
    }
    
    // Muket / flintlock force cool
    if (gun[? "pShotDelay"] > 0) { if (gun[? "pFireTimer"] < fireTimer) exit; }
    if(actor.initiateShoot || gun[? "pWindUp"]>0 || gun[? "pFireDelay"]>0)
    {
        combat_gunwield_firing(actor, gun, actor.look_dir, triggerPressed);
    }
}
