_id = argument0;
staggerDir = argument1;
stats_attack = argument2;

var dmg_normal = ds_map_find_value(stats_attack, STAT_ATTACK_DMG_NORMAL);
var dmg_bio = ds_map_find_value(stats_attack, STAT_ATTACK_DMG_BIO);
var dmg_cyber = ds_map_find_value(stats_attack, STAT_ATTACK_DMG_CYBER);
var dmg_mental = ds_map_find_value(stats_attack, STAT_ATTACK_DMG_MENTAL);
var dmg_cosmic = ds_map_find_value(stats_attack, STAT_ATTACK_DMG_COSMIC);
var dmg_zauber = ds_map_find_value(stats_attack, STAT_ATTACK_DMG_ZAUBER);
var do_kb = ds_map_find_value(stats_attack, STAT_ATTACK_STAGGER);

var totalDamage = dmg_normal + dmg_bio + dmg_cyber + dmg_mental + dmg_cosmic + dmg_zauber;

//Todo: make globals once is completed

//FREEZE FRAME + ACTION LINES	
var canFreezeFrame = global.DELTA_TOTAL > lastFreezeFrameTime;
if(canFreezeFrame and global.DELTA_TIME_MOD != 0 and totalDamage > 10){
	frameFreezer = instance_create(0, 0, oFrameFreezer);
	actionLines = instance_create(o_hoopz.x+ (5-irandom(10)), o_hoopz.y-12 + (5-irandom(10)), oActionLines);

	if(totalDamage <= 30) {
		frameFreezer.frameTimer = current_time + 100;
		actionLines.alphaMultiplier = 0.3;
		actionLines.fadeSpeed = 0.7;
	} else if (totalDamage > 30 and totalDamage <= 60) {
		frameFreezer.frameTimer = current_time + 150;
		actionLines.alphaMultiplier = 0.6;
		actionLines.fadeSpeed = 0.6;
	} else if (totalDamage > 60) {
		frameFreezer.frameTimer = current_time + 200;
		actionLines.alphaMultiplier = 1;
		actionLines.fadeSpeed = 0.5;
	}
	lastFreezeFrameTime = global.DELTA_TOTAL + freezeTimeDelay;
}

//HIT SFX
var canPlaySfx = global.DELTA_TOTAL > lastHitSfxTime;
if(canPlaySfx) lastHitSfxTime = global.DELTA_TOTAL + hitSfxDelay;

var highestDmgType = max(dmg_normal, dmg_bio, dmg_cyber, dmg_mental, dmg_cosmic, dmg_zauber);
if(highestDmgType == dmg_normal){
	if(canPlaySfx) {
		if(do_kb) audio_play_sound_fresh(scr_soundbank_pickSound(dmgSoundNormalKb), 90, false);
		else audio_play_sound_fresh(scr_soundbank_pickSound(dmgSoundNormal), 90, false);
	}

} else if(highestDmgType == dmg_bio){
	if(canPlaySfx) {
		if(do_kb) audio_play_sound_fresh(scr_soundbank_pickSound(dmgSoundBioKb), 90, false);
		else audio_play_sound_fresh(scr_soundbank_pickSound(dmgSoundBio), 90, false);
	}

} else if(highestDmgType == dmg_cyber){
	if(canPlaySfx) {
		if(do_kb) audio_play_sound_fresh(scr_soundbank_pickSound(dmgSoundCyberKb), 90, false);
		else audio_play_sound_fresh(scr_soundbank_pickSound(dmgSoundCyber), 90, false);
	}

} else if(highestDmgType == dmg_mental){
	if(canPlaySfx) {
		if(do_kb) audio_play_sound_fresh(scr_soundbank_pickSound(dmgSoundMentalKb), 90, false);
		else audio_play_sound_fresh(scr_soundbank_pickSound(dmgSoundMental), 90, false);
	}

} else if(highestDmgType == dmg_cosmic){
	if(canPlaySfx) {
		if(do_kb) audio_play_sound_fresh(scr_soundbank_pickSound(dmgSoundCosmicKb), 90, false);
		else audio_play_sound_fresh(scr_soundbank_pickSound(dmgSoundCosmic), 90, false);
	}

} else if(highestDmgType == dmg_zauber){
	if(canPlaySfx) {
		if(do_kb) audio_play_sound_fresh(scr_soundbank_pickSound(dmgSoundZauberKb), 90, false);
		else audio_play_sound_fresh(scr_soundbank_pickSound(dmgSoundZauber), 90, false);
	}
}

//BLOOD
{
	var i;
	var n = 1+irandom(round(totalDamage/15));
	for (i = 0; i < n; i += 1) {
	   instance_create(o_hoopz.x+ (5-irandom(10)), o_hoopz.y-12 + (5-irandom(10)), o_effect_blooddrop);
	}
}

/*show_message("hoopz is hit "+string(do_kb)+
									" "+string(dmg_normal)+
									" "+string(dmg_bio)+
									" "+string(dmg_cyber)+
									" "+string(dmg_mental)+
									" "+string(dmg_cosmic)+
									" "+string(dmg_zauber));*/
/*
if(_bullet != noone and object_is_ancestor(actor.object_index, PlayerCombatActor)) {
    var shaker = instance_create(actor.x, actor.y, oShaker);
    shaker.shakePower = 190;
    shaker.shakeRadius = 190;
    shaker.shakeTotalDuration = 2; // in 90.1s
    shaker.shakeCurrentDuration = shaker.shakeTotalDuration;
}
*/
