/// scr_player_respawn()

// -------------------------------- // GUN BAG AND BANDOLIER EFFECTS // -------------------------------- // 
// Empty 40% of bag guns
var bagCount = scr_equipment_guns_bag_getSlotsUsed();
var bagTarget = ceil(bagCount * global.settingRespawnBagKeep);
while (bagCount > bagTarget) 
    {
    scr_equipment_guns_bag_removeGun(floor(random(bagCount)));
    bagCount--;
    }
    
//  Reset periodic of ALL bandolier gun's
for (var i = 0; i < scr_equipment_guns_bandolier_getSlotsUsed(); i++) 
{
    var gun = scr_equipment_guns_bandolier_getGun(i);
    gun[? "pChargeCur"] = 0;
    gun[? "pChargeRatio"] = gun[? "pChargeCur"] / gun[? "pChargeMax"];
}

// Bandolier guns have at least 25% of max ammo
for (var i = 0; i < scr_equipment_guns_bandolier_getSlotsUsed(); i++) 
    {
    var gun = scr_equipment_guns_bandolier_getGun(i);
    var ammoCurrent = gun[? "pCurAmmo"];
    var ammoMax = gun[? "pMaxAmmo"];
    var ammoMinimum = ceil(ammoMax * global.settingRespawnAmmo);
    if (ammoCurrent < ammoMinimum) then gun[? "pCurAmmo"] = ammoMinimum;
    }

// Equip bandolier gun #1
scr_equipment_guns_bandolier_equip(0);

// Holster weapon
scr_savedata_put("player.guns.holstered", true);

// Increase total deaths count //
var totDet = Quest("totalDeaths") + 1;
Quest("totalDeaths", totDet);

// -------------------------------- // PLAYER STATUS // -------------------------------- // 
// Update humanism
var humBio = scr_savedata_get("player.humanism.bio");
var humCyb = scr_savedata_get("player.humanism.cyber");
if (humBio - 2 > global.settingHoopzDeathSwap) 
{ 
    humCyb += global.settingHoopzDeathSwap;
    humBio -= global.settingHoopzDeathSwap;
}
scr_savedata_put("player.humanism.bio", humBio);
scr_savedata_put("player.humanism.cyber", humCyb);

// Lets Hoopz run the "Get Up" animation/Cutscene after death
Quest("respawnActive", 1);

// Reset player stats // This seems to only reset your health, stagger and knockback //
scr_stats_resetCurrentStats();
    
// Scrub status effects
scr_statusEffect_clearStatusEffects(self.id);

// -------------------------------- // OTHER THINGS // -------------------------------- // 
// Reset enemy spawn points
spawn_resetStates();

// Turn off the respawn flag at this point //
if (scr_savedata_get("player.respawn.do")) then scr_savedata_put("player.respawn.do", false);    

// During the Pelekryte escorting mission if you die, then Pelekryte dies with you //
if Quest("pelekryteState") == 2 or Quest("pelekryteState") == 4 then Quest("pelekryteState", 6);

// Go to the respawn room //
with (o_world) //Globals are set from Respawn() script
    {
    var new_room = scr_map_initialise_load_room(global.respawnRoom, global.respawnX, global.respawnY);
    room_goto(new_room);
    }
                
/*  Shit I cut out //
global.respawnLoc = scr_savedata_get("player.respawn.loc");
    global.respawnJunk = scr_savedata_get("player.respawn.junk");
    
     // Grab Current Data
    global.respawnRoom = asset_get_index(scr_savedata_get("player.respawn.room"));
    global.respawnX = scr_savedata_get("player.respawn.x");
    global.respawnY = scr_savedata_get("player.respawn.y");
