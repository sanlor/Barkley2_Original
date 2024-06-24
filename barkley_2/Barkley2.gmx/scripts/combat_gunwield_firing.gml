/// combat_gunwield_firing(actor, gun, aimdir, triggerPressed)
///handles weapon windup, firing delay, burst fire, etc

var actor = argument0;
var gun = argument1;
var _aimdir = argument2;
var triggerPressed = argument3;

var _flash;
_bullet = noone;

var windupSound = soundOrNullstring(gun[? "windupSound"]);
var winddownSound = soundOrNullstring(gun[? "winddownSound"]);
var sustainSound = soundOrNullstring(gun[? "sustainSound"]);

fireTimer = gun[? "pFireTimerTarget"] * ( 1-gun[? "pShotDelay"]);
delayTimer = gun[? "pFireTimerTarget"] * (gun[? "pShotDelay"]);

if (gun[? "pChargeRatio"] >= 1 and actor.gunBursting > 0 and (
        gun[? "pType"] == GUN_TYPE_MACHINEPISTOL or
        gun[? "pType"] == GUN_TYPE_ASSAULTRIFLE)) {
    actor.gunBursting = 0;
}

if(gun[? "pWindUpSpeed"]>0)
{
    if(actor.initiateShoot)
    {
        if (gun[? "pWindUp"] > 60 && winddownSound != NULL_STRING) audio_stop_sound_ext(winddownSound);
        if(gun[? "pWindUp"]<100) {
            if(!gun[? "reloaded"])
            {
                if(windupSound != NULL_STRING)
                {
                    if (triggerPressed || !audio_is_playing_ext(windupSound))
                    {
                    audio_stop_sound_ext(windupSound);
                    if(gun[? "pWindUp"] <= 60) 
                    {
                    audio_play_sound_on_actor(actor,windupSound,false,90);
                    audio_sound_gain_ext(windupSound,1,0);
                    }
                    }
                }
                gun[? "reloaded"] = true;
            }
            // Wind up gun
            gun[? "pWindUp"] += max(3,gun[? "pWindUpSpeed"]/(gun[? "pWeight"]*0.5)) * dt() * global.windupModifier;
            gun[? "pWindUp"] = min(100, gun[? "pWindUp"]);
        }
        else {
            gun[? "pWindUp"] = 100;
        }
    }
    else
    {
        if(windupSound != NULL_STRING) {
            audio_sound_gain_ext(windupSound,0,500);
        }
        if(gun[? "pWindUp"] > 60)
        {
            if(winddownSound != NULL_STRING && !audio_is_playing_ext(winddownSound)) {
                audio_play_sound_on_actor(actor,winddownSound,false,90);
            }
        }
        gun[? "reloaded"] = false;
        if(gun[? "pWindUp"] > 4) {
            gun[? "pWindUp"] -= 24 * dt() * global.windupModifier;
            gun[? "pWindUp"] = max(0, gun[? "pWindUp"]);
        } else {
            gun[? "pWindUp"] = 0;
            if(windupSound != NULL_STRING) {
                audio_stop_sound_ext(windupSound);
            }
        }
        if(sustainSound != NULL_STRING)
        {
            //audio_stop_sound_ext(windupSound);
            if(audio_is_playing_ext(sustainSound))
            {
                audio_stop_sound_ext(sustainSound);
            }
        }
    }
}
    
////delayed shot: flintlocks etc
if(delayTimer>0)
{
    if(gun[? "pFireDelay"]<delayTimer)
    {
        if(gun[? "pFireDelay"] == 0)
        {
            ///spawn spark!
            var _aimdirQuant = actor.aiming * (360 / actor.aFaceCount);
            scr_player_getGunShifts(gun[? "pType"],gun[? "pMaterial"]=="Dual");
            var dir = actor.aiming*22.5 
            var distx = lengthdir_x(heldDist,dir);
            var disty = lengthdir_y(heldDist,dir)*0.75;
            var xhshift = lengthdir_x(heldHShift,dir+90);
            var yhshift = lengthdir_y(heldHShift,dir+90)*0.75;
            
            var _barrel_x = lengthdir_x(heldBulletDist,_aimdirQuant) + distx/5 + xhshift + actor.x;
            var _barrel_y = lengthdir_y(heldBulletDist,_aimdirQuant) + disty/5 + yhshift + actor.y;

            if (gun[? "pType"]==GUN_TYPE_MUSKET)
            {
                _barrel_x = lengthdir_x(heldBulletDist,_aimdirQuant) - distx*0.7 + xhshift + actor.x;
                _barrel_y = lengthdir_y(heldBulletDist,_aimdirQuant) - disty*0.7 + yhshift + actor.y;
                audio_play_sound_on_actor(actor, "musket_fuse", 0, 0);
            }
            else if (gun[? "pType"]==GUN_TYPE_FLINTLOCK) audio_play_sound_on_actor(actor, "flintlock_fuse", 0, 0);
            else if (gun[? "pType"]==GUN_TYPE_BFG) audio_play_sound_on_actor(actor, "hoopzweap_BFG_charge", 0, 0);
            var current = scr_statusEffect_getFromCombatActor(actor.id, statusEffect_wading);
            var swimmove = 0;
            if(current >0)
            {
                swimmove = ds_map_find_value(current, "wadingDepthCurrent");
            }
            
            var _barrel_z = actor.ARMS_HEIGHT+heldBullet_YShift+2 - swimmove;
            
            //scr_player_muzzle_position(gun[? "pType"],gun[? "pMaterial"]=="Dual", 
            //    actor.x, actor.y, actor.aiming, actor.aFaceCount, actor);
            //if (muzX != -999) _flash = instance_create(muzX, muzY, o_flash);
            //else 
            _flash = instance_create(_barrel_x, _barrel_y - (_barrel_z+4), o_flash);
            _flash.sprite_index = s_GunSpark;
            _flash.dny = -64;
            _flash.image_angle = 0;
            _flash.fused = 2;
            _flash.fusedType = gun[? "pType"];
            _flash.fusedGun = gun;
            _flash.dad = actor.id; // added
        }
        
        if(gunBursting)
        {
            gun[? "pFireDelay"] += (15 + power(1 + gun[? "pBurstSpeed"],1.75)/4) * dt();
        }
        else
        {
            gun[? "pFireDelay"] += (15 + power(1 + gun[? "pFireSpeed"],1.75)/4) * dt();
        }
        
    }
}

while((delayTimer==0 && gun[? "pFireTimer"]>= fireTimer && actor.initiateShoot) || (delayTimer>0 && gun[? "pFireDelay"]>delayTimer))
{
    if (gun[? "pWindUpSpeed"]>0)
    {
        gun[? "pFireTimer"] -= fireTimer*(2-(gun[? "pWindUp"]-50)/50);
    }
    else
    {
        gun[? "pFireTimer"] -= fireTimer;
    }
    
    gun[? "pFireDelay"] = 0;
    
    if (gun[? "pShotDelay"] > 0) //gun[? "pFireDelay"] = -30; //gun[? "pFireDelay"] += gun[? "pShotDelay"] * 10;
    {
        with (o_flash)
        {
            if (fusedGun == gun) fused = 0;
        }
    }
    
    if(actor.gunBursting>0)
    {
        actor.gunBursting-=1;
    }
    else
    {
        if(gun[? "pBurstAmount"]>1)
        {
            //gun[? "pFireTimer"] = gun[? "pBurstInterval"];
            actor.gunBursting = gun[? "pBurstAmount"]-1;
        }
        else
        {
            //gun[? "pFireTimer"] = gun[? "pFireInterval"];
        }
    }
    if (gun[? "pWindUp"] > 60 && windupSound != NULL_STRING) audio_stop_sound_ext(windupSound);
    combat_gunwield_shoot(actor,gun,_aimdir,true);
    
}
