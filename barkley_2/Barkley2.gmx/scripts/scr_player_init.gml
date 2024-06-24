/// initialize hoopz

//Select whether or not Hoopz is active or not in cutscenes
_active=true; 

// Temp camera solution: create camera on Hoopz creation
with o_camera instance_destroy(); // Destroy all existing cameras
instance_create(x, y, o_camera_hoopz);
instance_create(x,y,o_debugMenu);

view_xview = x - SCREEN_WIDTH/2
view_yview = y - SCREEN_HEIGHT/2

// Collision
scr_entity_setMovementCollisionShape_circle(12);

// Constants
MASS_CENTER_X = 0;
MASS_CENTER_Y = 16;

scr_entity_setZHitbox(0, 32);

// Read things from Savedata
ds_map_destroy(stats_base);
ds_map_destroy(stats_effective);
ds_map_destroy(stats_current);
stats_base = scr_savedata_get("player.stats.base");
stats_effective = scr_savedata_get("player.stats.effective");
stats_current = scr_savedata_get("player.stats.current");

ds_list_destroy(list_status_effect);
list_status_effect = scr_savedata_get("player.stats.statuseffects");

//Pouch capacity and gun bag capacity moved to player identity

gunPouchSelected = 0;
gunPouchShow = 0;
gunCountShow = 0;


// Facing directions depending on look dir
aFaceCount = 16;
aFace[0] = 0;
aFace[1] = 1;
aFace[2] = 1;
aFace[3] = 2;
aFace[4] = 2;
aFace[5] = 2;
aFace[6] = 3;
aFace[7] = 3;
aFace[8] = 4;
aFace[9] = 5;
aFace[10] = 5;
aFace[11] = 6;
aFace[12] = 6;
aFace[13] = 6;
aFace[14] = 7;
aFace[15] = 7;

// Leg and walk sprites depending on facing dir
aLegsS[0] = s_HoopzLegsE;
aLegsS[1] = s_HoopzLegsNE;
aLegsS[2] = s_HoopzLegsN;
aLegsS[3] = s_HoopzLegsNW;
aLegsS[4] = s_HoopzLegsW;
aLegsS[5] = s_HoopzLegsSW;
aLegsS[6] = s_HoopzLegsS;
aLegsS[7] = s_HoopzLegsSE;

dLegsS[0] = s_HoopzDiaperLegsE;
dLegsS[1] = s_HoopzDiaperLegsNE;
dLegsS[2] = s_HoopzDiaperLegsN;
dLegsS[3] = s_HoopzDiaperLegsNW;
dLegsS[4] = s_HoopzDiaperLegsW;
dLegsS[5] = s_HoopzDiaperLegsSW;
dLegsS[6] = s_HoopzDiaperLegsS;
dLegsS[7] = s_HoopzDiaperLegsSE;

aWalkS[0] = s_HoopzWalkE;
aWalkS[1] = s_HoopzWalkNE;
aWalkS[2] = s_HoopzWalkN;
aWalkS[3] = s_HoopzWalkNW;
aWalkS[4] = s_HoopzWalkW;
aWalkS[5] = s_HoopzWalkSW;
aWalkS[6] = s_HoopzWalkS;
aWalkS[7] = s_HoopzWalkSE;

// Arm depth depending on aiming dir, changed from facing dir
aArmDepth[0] = 1;
aArmDepth[1] = 1;
aArmDepth[2] = 1;
aArmDepth[3] = 1;
aArmDepth[4] = 1;
aArmDepth[5] = 1;
aArmDepth[6] = 1;
aArmDepth[7] = 1;
aArmDepth[8] = 1;
aArmDepth[9] = 1;
aArmDepth[10] = 0;
aArmDepth[11] = 0;
aArmDepth[12] = 0;
aArmDepth[13] = 0;
aArmDepth[14] = 0;
aArmDepth[15] = 0;

// Combat hooks
scr_stats_hook_onDamage(scr_player_onDamageHook);
scr_stats_hook_onStagger(scr_player_staggerHook);
scr_stats_hook_hitfx(scr_player_hitfxHook);
scr_stats_hook_onInstantKill(scr_player_instantKillHook);
scr_stats_hook_genEffectiveStats(scr_player_genEffectiveStats);
scr_player_reset();

// Combat target list
ds_list_clear(target_list);
ds_list_add(target_list, EnemyCombatActor);
ds_list_add(target_list, DestructibleCombatActor);
ds_list_add(target_list, BlockingCombatActor);

//Sfx on hit
dmgSoundNormal = "hoopzDmgSoundNormal";
dmgSoundNormalKb = "hoopzDmgSoundNormalKb";
dmgSoundBio = "hoopzDmgSoundBio";
dmgSoundBioKb = "hoopzDmgSoundBioKb";
dmgSoundCyber = "hoopzDmgSoundCyber";
dmgSoundCyberKb = "hoopzDmgSoundCyberKb";
dmgSoundMental = "hoopzDmgSoundMental";
dmgSoundMentalKb = "hoopzDmgSoundMentalKb";
dmgSoundCosmic = "hoopzDmgSoundCosmic";
dmgSoundCosmicKb = "hoopzDmgSoundCosmicKb";
dmgSoundZauber = "hoopzDmgSoundZauber";
dmgSoundZauberKb = "hoopzDmgSoundZauberKb";
lastHitSfxTime = global.DELTA_TOTAL;
hitSfxDelay = 500; //in milliseconds

lastFreezeFrameTime = global.DELTA_TOTAL;
freezeTimeDelay = 0;
