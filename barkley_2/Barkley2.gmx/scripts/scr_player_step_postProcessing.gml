// Calculate weight
scr_player_calculateWeight();

// Frankie's AI Target
if dodgingTimer <= 0
{
    targx = x;
    targy = y;
}

// Decrease certain timers
dodgeCooldown = max(0, dodgeCooldown - dt())
dfire = max(0, dfire - 1);
swaptick = max(0,swaptick -1);

// Clear zauber visual
//var zauberVisual = scr_statusEffect_getFromCombatActor(self.id, statusEffect_zauberCastingVisual);
//if (zauberVisual != NULL && stance != scr_player_stance_zauber) {
//    ds_list_delete(list_status_effect, ds_list_find_index(list_status_effect, zauberVisual));
//}

// Death handling
var life;
life = scr_stats_getCurrentStat(self, STAT_CURRENT_HP);
// was if (life < 0
if (life <= 0 and stance != scr_player_stance_death) {
    if(global.godMode)
    {
        scr_stats_setCurrentStat(self,STAT_CURRENT_HP,scr_stats_getEffectiveStat(self,STAT_EFFECTIVE_MAX_HP));
    }
    else
    {
        // You had the Forever man gun equipped, it saved you from death //
        if global.gunsacrifice_affix = true then
            {
            // Return player to 50% health //
            scr_stats_setCurrentStat(o_hoopz, STAT_CURRENT_HP, scr_stats_getEffectiveStat(o_hoopz, STAT_EFFECTIVE_MAX_HP) * 0.5);
            
            // Stagger and Holster the player //
            scr_player_setGunHolstered(true);
            var atk = scr_stats_newAttackStats();
            atk[? STAT_ATTACK_KNOCKBACK] = 10;
            atk[? STAT_ATTACK_STAGGER] = 100;
            atk[? STAT_ATTACK_STAGGER_HARDNESS] = STAGGER_HARDNESS_MEDIUM;
            scr_stats_performAttack(atk, o_hoopz, true, facing + 180, false, true);
            
            // Remove the gun //
            var current_gun = scr_equipment_guns_getCurrentGun();
            if scr_equipment_guns_bandolier_getSlot(current_gun) != NULL then scr_equipment_guns_bandolier_removeGun(scr_equipment_guns_bandolier_getSlot(current_gun))
            else if scr_equipment_guns_bag_getSlot(current_gun) != NULL then scr_equipment_guns_bag_removeGun(scr_equipment_guns_bag_getSlot(current_gun)) 
            global.gunsacrifice_affix = false;
            }
        else
            {
            // Death script
            lock_stance = false;
            scr_player_setStance(scr_player_stance_death);
            lock_stance = true;
            scr_player_stance_death(); // Execute immediately to get data
            
            // Save game immediately on death
            scr_savedata_put("player.respawn.do", true); // Do respawn if game is reloaded at this point
            scr_savedata_put("player.respawn.room", room_get_name(global.respawnRoom));
            scr_savedata_put("player.respawn.x", global.respawnX);
            scr_savedata_put("player.respawn.y", global.respawnY);
            //scr_savedata_put("player.respawn.loc", global.respawnLoc); //bortrespawn
            //scr_savedata_put("player.respawn.junk", global.respawnJunk); //bortrespawn
            if (Quest("saveDisabled") == 0) scr_savedata_save();
            }
    }
}

// Delete paths in states which don't use them
if (stance != scr_player_stance_standard) {
    scr_path_delete();
}

// Render depth
scr_dny(4)

// Shadow  
if (in_shadow) {
    shadow += .2
}
else {
    shadow -= .2
}
    
shadow = max(0,min(1,shadow))
image_blend = make_color_rgb(255-72*shadow,255-72*shadow,255-72*shadow)

// Time elapsed is going up while game isnt paused
// OPTIMIZE: Yet another thing which shouldn't be in Player at all....... #2098
timeMillis += dt_msec();
if(timeMillis >= 1000) {
    timeMillis -= 1000;
    timeSeconds++;
    if (timeSeconds >= 60) {
        timeSeconds -= 60;
        timeMinutes++;
    }
}

// Update Quest XP
var time = ClockTime("get");
scr_savedata_put("player.xp.questxp", ceil(time * 60));

// Set sound listener position and orientation
audio_listener_position(x, y, z);
audio_listener_orientation(x, y, 1000,0,0,1);
//audio_listener_velocity(move_x, move_y, move_z);
