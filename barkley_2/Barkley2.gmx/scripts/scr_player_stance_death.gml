// Death sequence setup //
if (newStance) then
    {
    // Stance is set and it is locked and can't be changed beyond this point //
    newStance = false;
    lock_stance = true;
    respawnJunklord = false;
    with (o_hoopz)
    {
        invulnerable = true;
        scr_entity_setCollisionType(COLLISION_NONE);
        scr_actor_setActorPushType(ACTOR_COLLISIONPUSH_NONE);
    }
    // Stop sounds from gun
    scr_player_setGunHolstered(true);
        
    // Remove teleports to avoid accidentally being knocked into one while dead //
    if instance_exists(o_teleport) then with o_teleport instance_destroy();
    if instance_exists(o_doorlight) then with o_doorlight instance_destroy();

    // Setup some variables to be used here //
    // Timer used for the death sequence itself, the grayscale/haiku //
    deathTimer = 0;
    
    // Timer for animations //
    animTimer = 0;
        
    // A variable used as a tool to run scripts only once //
    respawner = false;
    
    // Deltatime slowdown, not in use at the moment //
    slowdown = 1;
    
    // Delay for the death sound, the horrific grunts hoopz makes when his lifeless carcass hits the floor //
    deathSoundDelay = 2;
    
    // Set death animation of hoopz //
    sprite_index = s_HoopzDeath;
    scr_entity_animation_setFrame(ANIMATION_DEFAULT, 0);
    scr_entity_animation_setSpeed(ANIMATION_DEFAULT, .75);
    scr_entity_animation_setSpeedPerPixel(ANIMATION_DEFAULT, 0);
    
    // Number of deaths + 1, this is a mere statistic that can be utilized for whatever //
    scr_savedata_put("player.deaths.total", scr_savedata_get("player.deaths.total") + 1);
    
    // Get respawn destination //
    RespawnLocation();  
        
    // Save game immediately on death // Do respawn if game is reloaded at this point  
    scr_savedata_put("player.respawn.do", true);  
    Quest("playerBlueFace", 0);   
    if (Quest("saveDisabled") == 0) scr_savedata_save();    
    
    // Set deathTimers // This picks the death times for the three latest deaths // This is used to check if a Babyzone respawn is needed //
    if global.deathTimeFirst = 0 then global.deathTimeFirst = global.deathClock;
    else if global.deathTimeSecond = 0 then global.deathTimeSecond = global.deathClock;
    else if global.deathTimeThird = 0 then global.deathTimeThird = global.deathClock;
    else
        {
        // Move the data along to their next tiers //
        global.deathTimeFirst = global.deathTimeSecond;
        global.deathTimeSecond = global.deathTimeThird;
        global.deathTimeThird = global.deathClock;
        }
    }

// Play death sound //
if deathSoundDelay > 0 then 
    {
    // Tick down //
    deathSoundDelay -= dt();
    
    // Death grunt //
    if deathSoundDelay <= 0 then audio_play_sound_at_xy("hoopz_demise", false, 10, x, y);        
    }
    
// Movement speed stopped //
move_x = 0
move_y = 0

// Process the death animation //
if (scr_entity_animation_getFrame(ANIMATION_DEFAULT) >= sprite_get_number(s_HoopzDeath) - 1) then scr_entity_animation_setSpeed(ANIMATION_DEFAULT, 0);    
else animTimer += dt_sec();

// Tick up the death Timer //
deathTimer += dt_sec();

// Create the hoopz grayscale death object //
if (deathTimer + animTimer >= 4) then 
    { 
    if !instance_exists(o_hoopz_death_grayscale) then 
        {
        var current = scr_statusEffect_getFromCombatActor(id, statusEffect_wading);
        var swimmove = 0;
        if (current > 0) swimmove = ds_map_find_value(current, "wadingDepthCurrent");
        grayscale = instance_create(o_hoopz.x, o_hoopz.y, o_hoopz_death_grayscale);     
        if respawnJunklord = true then grayscale.junklord = true;
        if (string(Quest("junklordSpecial")) != "0") grayscale.junklord = true;
        if (swimmove == 10) grayscale.alpha_wading = 0;
        }
    }

// Run respawn script after X time has passed //
if ((deathTimer + animTimer >= 14) and respawnJunklord = false) then // was 14 for the gscale object
    {
    // Run only once //
    if respawner = false then
        {
        with (o_fade) instance_destroy();
        scr_player_respawn();
        respawner = true;
        }
    }
    
// Draw hoopz //
scr_player_setDrawScript(scr_player_draw_death);
