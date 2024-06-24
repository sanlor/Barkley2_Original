if (newStance) 
{
    newStance = false;
    tableRoll = 0;
    scr_entity_animation_setSpeed(ANIMATION_DEFAULT, 0);
    scr_entity_animation_setSpeedPerPixel(ANIMATION_DEFAULT, 0);
    
    // SUFFIX - of the Circus
    var curGun = scr_player_equip("object")
    if (curGun != NULL)
    {
        if (curGun[? "pSuffix"] == "of the Circus")
        {
            curGun[? "pChargeCur"] += curGun[? "pChargeMax"] * global.settingCircusRoll;
            curGun[? "pChargeCur"] = clamp(curGun[? "pChargeCur"], 0, curGun[? "pChargeMax"]);
            curGun[? "pChargeRatio"] = curGun[? "pChargeCur"] / curGun[? "pChargeMax"];
        }
    }
    
    // Get rid of one mosquito
    if (instance_exists(o_enemy_mosquito))
    {
        var mos = instance_nearest(x, y, o_enemy_mosquito);
        if (point_distance(x, y, mos.x, mos.y) <= 32)
        {
            with (mos) { repel = o_hoopz.id; repeat (60) event_user(1); }
        }
    }
    
    // Roll damage
    if (global.settingJarRoll > 0) instance_create(x, y, o_rollDamage);
    
    // Roll sound //
    audio_play_sound_ext("sn_hoopz_roll", 1, false);
    
    // Dodge direction
    var kl = scr_input_check_held(KEYID_LEFT, PLAYER1);
    var kr = scr_input_check_held(KEYID_RIGHT, PLAYER1)
    var ku = scr_input_check_held(KEYID_UP, PLAYER1);
    var kd = scr_input_check_held(KEYID_DOWN, PLAYER1);
    
    var kx = kr - kl; // X axis input
    var ky = kd - ku; // Y axis input
    
    // Dodge away from mouse
    if (kx == 0 && ky == 0) dodgeDir = scr_math_mod(look_dir + 180, 360);
    else dodgeDir = point_direction(0, 0, kx, ky); // Dodge in movement dir
    
    // Determine dodge distances and timings
    var agile = scr_stats_getEffectiveStat(id, STAT_BASE_AGILE);
    encumb = scr_stats_getEffectiveStat(id, STAT_EFFECTIVE_ENCUMBERANCE);
    encumb = abs(max(-9, encumb) / 10);
    var distRatio = (1 + 0.3 * (agile/100)) * (1 - (encumb * 0.5));
    
    dodgeLeapDist = 48 * distRatio;
    dodgeLeapTime = 2;
    dodgeLeapSpeed = dodgeLeapDist / dodgeLeapTime;
    
    dodgeRollDist = 30 * distRatio;
    dodgeRollTime = 3 + (encumb*2);
    dodgeRollSpeed = dodgeRollDist / dodgeRollTime;
    dodgeRollSmokeTime = 0.05;
    dodgeRollSmoke = dodgeRollSmokeTime;
    
    dodgeStopTime = (3 - ((agile/100) * 2.5)) * (1 + encumb*.6);
    
    dodgeStance = "leap";
    dodgeTimer = dodgeLeapTime;
    
    repeat (4) Smoke("puff", x + 6 - random(12), y + 6 - random(12), 0, 6 + random(2));
    
    audio_play_sound_on_actor(id, "hoopz_dash_leap", false, 100); 
}

if (dodgeStance == "leap") 
{
    scr_entity_setDirSpd(dodgeDir, dodgeLeapSpeed);
    scr_entity_animation_setFrame(ANIMATION_DEFAULT, median(0,2,3-(dodgeTimer / dodgeLeapTime)*3)); //1);
    if (tableRoll == 0 && position_meeting(x + move_x, y + move_y, oBossGuilderbergTable)) 
    {
        // Roll direction modify
        var spv = 45;
        if (o_hoopz.x > oBossGuilderbergTable.x + 32)
        {
            if (dodgeDir >= 90 - spv && dodgeDir <= 90 + spv) dodgeDir = 90 + spv;
            if (dodgeDir >= 270 - spv && dodgeDir <= 270 + spv) dodgeDir = 270 - spv;
        }
        else
        {
            if (dodgeDir >= 90 - spv && dodgeDir <= 90 + spv) dodgeDir = 90 - spv;
            if (dodgeDir >= 270 - spv && dodgeDir <= 270 + spv) dodgeDir = 270 + spv;
        }
        tableRoll = 1;
        invulnerable = 1;
        with (oBossGuilderbergTable) event_user(0);
    }
    dodgeTimer -= dt();
    if (dodgeTimer <= 0) 
    {
        dodgeStance = "roll";
        dodgeTimer = dodgeRollTime;
        audio_play_sound_on_actor(id, "hoopz_dash_land", false, 100); 
        if (tableRoll == 0)
        {
            repeat (8) Smoke("puff", x + 6 - random(12), y + 6 - random(12), 0, 6 + random(2));
        }
        if (encumb > .2) Shake("add", (encumb - .2) * 10, 300, x, y, .1 + (encumb - .2) / 3);
    }
}
else if (dodgeStance == "roll") 
{   
    dodgeRollSmoke -= dt_sec();
    while (dodgeRollSmoke <= 0)
    {
        dodgeRollSmoke += dodgeRollSmokeTime;
        if (tableRoll == 0) Smoke("puff", x + 5 - random(10), y + 5 - random(10), 0, 6 + random(2));
    }
    scr_entity_setDirSpd(dodgeDir, dodgeRollSpeed);
    // var rsb = min(2, (1 - (dodgeTimer / dodgeRollTime)*3)); // Old loop code
    var rsb = floor(1 - (dodgeTimer / dodgeRollTime)*3) mod 3;
    scr_entity_animation_setFrame(ANIMATION_DEFAULT, rsb);
    dodgeTimer -= dt();
    if (dodgeTimer <= 0) 
    {
        if (tableRoll && position_meeting(x, y, oBossGuilderbergTable)) { }
        else
        {
            if (tableRoll) 
            {
                invulnerable = 0;
                with (oBossGuilderbergTable) event_user(1);
            }
            dodgeStance = "stop";
            dodgeTimer = dodgeStopTime;
            audio_play_sound_on_actor(id, "hoopz_dash_stop", false, 100); 
        }
    }
    // Cancel into table if not in leap
    if (tableRoll == 0 && position_meeting(x + move_x, y + move_y, oBossGuilderbergTable)) 
        scr_entity_setMoveXY(0, 0);
}
else 
{
    tableRoll = 0;
    scr_entity_setDirSpd(dodgeDir, 0);
    scr_entity_animation_setFrame(ANIMATION_DEFAULT, median(0,2,3-(dodgeTimer / dodgeStopTime)*3));
    dodgeTimer -= dt();
    if (dodgeTimer <= 0) 
    {
        dodgeCooldown = 1
        if (global.stanceBeforeRoll != -1)
        {
            scr_player_setStance(global.stanceBeforeRoll);
            global.stanceBeforeRoll = -1;
        }
        else if (scr_player_getGunHolstered()) 
        {
            if (BodySwap() == "diaper") scr_player_setStance(scr_player_stance_diaper);
            else scr_player_setStance(scr_player_stance_standard);
        }
        else scr_player_setStance(scr_player_stance_gunmode);
    }
}

// Cancel roll into wading
if (not scr_collision_point_free(x + move_x, y + move_y, 0, COLLISION_WADING))
    scr_entity_setMoveXY(0, 0);

scr_player_setDrawScript(scr_player_draw_roll);

