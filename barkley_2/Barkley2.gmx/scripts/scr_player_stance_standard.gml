if (newStance) {
    scr_player_setGunHolstered(true);
    sprite_index = s_HoopzWalkSE; // Fix for #1898 Desynced Footstep?
    camera_speed = 12
    camera_move_dist_x = 16
    camera_move_dist_y = 48
    newStance = false
    wadesound = 0;
    slipTimer = 0;
    ladderDelay = 0;
    zauberDelay = 0;
}

if camera_speed < 48 then camera_speed += 1.5 * dt()

// Allow climbing ladders
if (scr_player_stanceUtil_checkZLadder()) return 0;

// Dodge
if(dodgeCooldown<=0)
{
    if(scr_input_check_pressed(KEYID_RUN, PLAYER1) && !scr_actor_isWading(o_hoopz))
    {
        global.stanceBeforeRoll = scr_player_stance_standard;
        scr_player_setStance(scr_player_stance_roll);
        script_execute(stance)
        return 0;
    }
}

// Draw gun
if (scr_input_check_pressed(KEYID_HOLSTER, PLAYER1))
{
    if (!global.gunPacify && scr_player_equip("object") != NULL)
    {
        //scr_player_setStance(scr_player_stance_gunmode);
        scr_player_setGunHolstered(false);
        with (o_hoopz)
        {
            scr_player_setStance(scr_player_stance_drawing);
            script_execute(stance);
            return 0;
        }
    }
    else
    {
        audio_play_sound_fresh("sn_pacify", 10, 0);
    }
}

// CANDY
if (scr_input_check_pressed(KEYID_ITEM_NEXT, PLAYER1)) Candy("next");
if (scr_input_check_pressed(KEYID_ITEM_USE, PLAYER1)) 
{
    if (scr_items_count(ITEMTYPE_CANDY) > 0) Candy("use", Candy("current"));
}

// ZAUBER
if (scr_input_check_pressed(KEYID_ABILITY_NEXT, PLAYER1)) Zauber("slot next");
if (scr_input_check_pressed(KEYID_ABILITY_USE, PLAYER1) && zauberDelay) 
{
    if (scr_actor_isWading(o_hoopz)) audio_play_sound_fresh("sn_pacify", 10, 0);
    else if (!global.gunPacify && Zauber("slot") != NULL)
    {
        global.stanceBeforeZauber = scr_player_stance_standard;
        scr_player_setStance(scr_player_stance_zauber);
        script_execute(stance)
        return 0;
    }
    else audio_play_sound_fresh("sn_pacify", 10, 0);
}
zauberDelay = 1;
        
// walk keys
var input_x;
var input_y;

if (scr_input_check_held(KEYID_LEFT, PLAYER1) && !scr_input_check_held(KEYID_RIGHT, PLAYER1)) { input_x = -1; }
else if (!scr_input_check_held(KEYID_LEFT, PLAYER1) && scr_input_check_held(KEYID_RIGHT, PLAYER1)) { input_x = 1; }
else { input_x = 0; }

if (scr_input_check_held(KEYID_UP, PLAYER1) && !scr_input_check_held(KEYID_DOWN, PLAYER1)) { input_y = -1; }
else if (!scr_input_check_held(KEYID_UP, PLAYER1) && scr_input_check_held(KEYID_DOWN, PLAYER1)) { input_y = 1; }
else { input_y = 0; }

// Walk speed
spd = scr_stats_getEffectiveStat(self, STAT_BASE_SPEED);
scr_path_setSpeed(spd);

// Delete path on key
if (abs(move_x)+abs(move_y) != 0) or !scr_collision_point_free(x,y,z, collision_check) {
    scr_path_delete();
}

// Get target speed, and dist to it
scr_math_normalizeVector(input_x, input_y);
var tx = __vx * spd;
var ty = __vy * spd;
var tdir = point_direction(move_x, move_y, tx, ty);
var tdist = point_distance(move_x, move_y, tx, ty);

// Convert to direction and speed
input_dir = point_direction(0, 0, tx, ty);
input_dist = point_distance(0, 0, tx, ty);
  
// Determine movement speed!
if (!scr_path_active()) {// Calculate inertia
    var inertia_time = max(0.1, 2 - (scr_stats_getEffectiveStat(id, STAT_BASE_AGILE)*0.019));
    var inertia = ((2*spd) / (inertia_time)) * dt()
    
    // Add movement
    if (inertia >= tdist) {
        scr_entity_setMoveXY(tx, ty);
        slipTimer = 0;
    } else {
        scr_entity_addDirSpd(tdir, inertia);
        slipTimer -= dt();
        if (slipTimer <= 0 && scr_collision_place_free(x, y, COLLISION_WADING)) 
        { // GZ FIX for wading water smoke
            Smoke("puff", x + 3 - random(6), y + 3 - random(6), 0, 6 + random(2));
            slipTimer = .5;
        }
    }
}

// Set facing angle
look_dir_discrete = round(look_dir/(360/aFaceCount))*(360/aFaceCount)
facing_prev = facing

if (input_dist > 0) {
    aiming = scr_math_mod(round(input_dir / (360/aFaceCount)), aFaceCount)
}
else {
    aiming = scr_math_mod(round(look_dir / (360/aFaceCount)), aFaceCount)
}
if (global.event == 0 && oBlack.alpha == 0) facing = aFace[aiming]; // Added to fix "Bootybass Error" where o_hoopz did not take facing of o_cts_hoopz after an event
//if (faceCount > 30) 
//faceCount += dt();
if (instance_exists(o_hud)) o_hud.charge = 0;

// Shuffle feet on turn
if (shuffle == 0 and facing != facing_prev) shuffle = 9;
if (shuffle > 0) shuffle -= 1;

// Animate
if (input_dist > 0 or shuffle > 0) 
{
    var modifier = 1 - (shuffle > 0)*.5;
    scr_entity_animation_setSpeed(ANIMATION_DEFAULT, 0.2 * modifier);
    scr_entity_animation_setSpeedPerPixel(ANIMATION_DEFAULT, (1/13) * modifier);
}
else {
    scr_entity_animation_setFrame(ANIMATION_DEFAULT, 0);
    scr_entity_animation_setSpeed(ANIMATION_DEFAULT, 0);
    scr_entity_animation_setSpeedPerPixel(ANIMATION_DEFAULT, 0);
}
    
// Bob torso
if (move_dist > 0) yoff = (floor(scr_entity_animation_getFrame(ANIMATION_DEFAULT)) mod 2)
else yoff = 0

// Update lookdir
if (move_dist > 0) {
    look_dir = move_dir;
}

// Play step sounds
if ((scr_entity_animation_onFrame(ANIMATION_DEFAULT, 0) or
     scr_entity_animation_onFrame(ANIMATION_DEFAULT, 2)) &&
     move_dist > 0) {
    var _snd;
    if !scr_actor_isWading(o_hoopz) 
        {
        // Check for rain, which then leads to a puddle check //
        if instance_exists(o_effect_rain) then
            {
            // Check for rain puddles (TNN puddles for example) //
            if instance_exists(o_rain_puddle) and o_effect_rain.rain = true then
                {
                if place_meeting(x, y, o_rain_puddle) then _snd = audio_play_sound_on_actor(id, scr_soundbank_pickSound("hoopz_puddlestep"), false, 100); 
                else _snd = audio_play_sound_on_actor(id, scr_soundbank_pickSound("hoopz_footstep"), false, 100);
                }
            else _snd = audio_play_sound_on_actor(id, scr_soundbank_pickSound("hoopz_footstep"), false, 100); 
            }
        else _snd = audio_play_sound_on_actor(id, scr_soundbank_pickSound("hoopz_footstep"), false, 100); 
        }
    else 
        {
        if wadesound = 0 then 
            {
            _snd = audio_play_sound_on_actor(id, "sn_hoopz_waterstep01", false, 100); 
            wadesound = 1;
            }
        else
            {
            _snd = audio_play_sound_on_actor(id, "sn_hoopz_waterstep02", false, 100); 
            wadesound = 0;
            }
        }
    
    //else {_snd = audio_play_sound_on_actor(id, scr_soundbank_pickSound("hoopz_wadestep"), false, 100); }     
    //audio_sound_pitch(_snd,0.8+random(0.4));
}

// Trigger InteractiveActors on mouse click
scr_player_interact();

// Set draw script
scr_player_setDrawScript(scr_player_draw_walking_standard)
