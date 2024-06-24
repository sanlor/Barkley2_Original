if (newStance) 
{
    newStance = false;
    camera_speed = 12
    wadesound = 0;
    slipTimer = 0;
    ladderDelay = 0;
    scr_player_calculateWeight();
    scr_stats_genEffectiveStats();
    var weight = scr_stats_getEffectiveStat(id, STAT_BASE_WEIGHT);
    var acro = scr_stats_getEffectiveStat(id, STAT_BASE_AGILE);
    var rng = clamp((weight - acro), 1, 11);
    holsterDelay = global.settingHolsterMinimum + (((rng - 1) / 10) * (global.settingHolsterMaximum - global.settingHolsterMinimum));
}

if camera_speed < 72 then camera_speed += 3 * dt() // Instant aiming! In a second that is //

camera_move_dist_x = 48
camera_move_dist_y = 80

shooting = false;

if (scr_player_stanceUtil_checkZLadder()) {
    return 0;
}

//if(dodgeCooldown<=0)
//{
//    if(scr_input_check_pressed(KEYID_RUN, PLAYER1) && !scr_actor_isWading(o_hoopz))
//    {
//        // Execute dodge
//        scr_player_setStance(scr_player_stance_roll);
//        script_execute(stance)
//        return 0;
//    }
//}

// Use / change item
//if (scr_input_check_pressed(KEYID_ITEM_NEXT, PLAYER1)) Candy("next");
//if (scr_input_check_pressed(KEYID_ITEM_USE, PLAYER1)) {
//    if (scr_items_count(ITEMTYPE_CANDY) > 0) {
//        Candy("use", Candy("current"));
//    }
//}

// change ability 
//if (scr_input_check_pressed(KEYID_ABILITY_NEXT, PLAYER1)) scr_items_zauber_next();
    
// walk keys
var input_x;
var input_y;

if (scr_input_check_held(KEYID_LEFT, PLAYER1) && !scr_input_check_held(KEYID_RIGHT, PLAYER1)) { input_x = -1; }
else if (!scr_input_check_held(KEYID_LEFT, PLAYER1) && scr_input_check_held(KEYID_RIGHT, PLAYER1)) { input_x = 1; }
else { input_x = 0; }

if (scr_input_check_held(KEYID_UP, PLAYER1) && !scr_input_check_held(KEYID_DOWN, PLAYER1)) { input_y = -1; }
else if (!scr_input_check_held(KEYID_UP, PLAYER1) && scr_input_check_held(KEYID_DOWN, PLAYER1)) { input_y = 1; }
else { input_y = 0; }

// walk speed
spd = scr_stats_getEffectiveStat(self, STAT_BASE_SPEED);
  
// Determine movement speed!
if scr_path_active() {
    // No path walking in gunmode
    scr_path_delete();
}


// Get target speed, and dist to it
scr_math_normalizeVector(input_x, input_y);
var tx = __vx * spd;
var ty = __vy * spd;
var tdir = point_direction(move_x, move_y, tx, ty);
var tdist = point_distance(move_x, move_y, tx, ty);

// Convert to direction and speed
input_dir = point_direction(0, 0, tx, ty)
input_dist = point_distance(0, 0, tx, ty)

// Calculate inertia
var inertia_time = max(0.1, 2 - (scr_stats_getEffectiveStat(id, STAT_BASE_AGILE)*0.019));
var inertia = ((2*spd) / (inertia_time)) * dt()

// Add movement
if (inertia >= tdist) {
    scr_entity_setMoveXY(tx, ty);
    slipTimer = 0;
} else {
    scr_entity_addDirSpd(tdir, inertia);
    slipTimer -= dt();
    if (slipTimer <= 0 && scr_collision_place_free(x, y, COLLISION_WADING)) { // GZ FIX for dust in water
        Smoke("puff", x + 3 - random(6), y + 3 - random(6), 0, 6 + random(2));
        slipTimer = .5;
    }
}

// Set facing angle
look_dir_discrete = round(look_dir/(360/aFaceCount))*(360/aFaceCount)
facing_prev = facing
aiming = scr_math_mod(round(look_dir_discrete / (360/aFaceCount)) - 1, aFaceCount)
facing = aFace[aiming]

// Set leg angle
if (input_dist > 0) {
    legdir = scr_math_mod(round(input_dir / (360 / 8)), 8)
}
else {
    legdir = scr_math_mod(round(look_dir_discrete / (360 / 8)), 8)
}

// Shuffle feet on turn
if shuffle = 0 and facing != facing_prev
    shuffle = 9
    
if shuffle > 0 {
    shuffle -= 1
}

// Animate
if (move_dist != 0 or shuffle > 0) {
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
if (move_dist > 0) {
    yoff = (floor(scr_entity_animation_getFrame(ANIMATION_DEFAULT)) mod 2)
}
else {
    yoff = 0
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
}

/*if ((scr_entity_animation_onFrame(ANIMATION_DEFAULT, 0) or
     scr_entity_animation_onFrame(ANIMATION_DEFAULT, 2)) &&
     move_dist > 0) {
    var _snd;
    if !scr_actor_isWading(o_hoopz) {_snd = audio_play_sound_on_actor(id, scr_soundbank_pickSound("hoopz_footstep"), false, 100); }
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
    //audio_sound_pitch(_snd,0.8+random(0.4));
}  */


// Back-pedal
if (scr_math_mod((facing+1) - legdir,8) > 3) {
    legdir = scr_math_mod(legdir + 4, 8)
}

// Holster gun
//if (scr_input_check_pressed(KEYID_HOLSTER, PLAYER1) or scr_player_getGunHolstered())
//{
//    scr_player_setStance(scr_player_stance_standard);
//    scr_player_setGunHolstered(true);
//    return 0;
//}

// Perform attacking code
var gunCurrent = scr_equipment_guns_getCurrentGun();
//combat_gunwield_step(gunCurrent);
//combat_gunwield_attacking(gunCurrent, id,
//        scr_input_check_pressed(KEYID_ACTION, PLAYER1),
//        scr_input_check_held(KEYID_ACTION, PLAYER1));

if (gunCurrent != NULL)
    o_hud.charge = gunCurrent[? "pChargeRatio"];
else
    o_hud.charge = 0
    
holsterDelay -= dt_sec();
if (holsterDelay <= 0)
{
    //var curGun = scr_player_equip("object");
    //show_debug_message("scr_player_stance_drawing() - Drawing END with " + curGun[? "pModel"] + ".");
    scr_player_setStance(scr_player_stance_gunmode);
    script_execute(stance);
    return 0;
}

// Set draw script
scr_player_setDrawScript(scr_player_draw_walking_gunmode);
