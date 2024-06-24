/// scr_player_stance_zauber()
if (newStance) 
{
    zauber_stance = old_stance;
    scr_player_setGunHolstered(1);
    scr_player_calculateWeight();
    scr_stats_genEffectiveStats();
    //zauber_holster = scr_player_getGunHolstered();
    if (global.stanceBeforeZauber == scr_player_stance_gunmode) zauber_holster = 0;
    else zauber_holster = 1;
    zauber_charge = 0;
    zauber_casting = Zauber("slot ref");
    sprite_index = s_HoopzWalkSE; // Fix for #1898 Desynced Footstep?
    newStance = false;
    wadesound = 0;
}

// Camera controls
if (camera_speed < 72) camera_speed += 3 * dt(); // Instant aiming! In a second that is //
camera_move_dist_x = 48
camera_move_dist_y = 80

// CANDY
if (scr_input_check_pressed(KEYID_ITEM_NEXT, PLAYER1)) Candy("next");
if (scr_input_check_pressed(KEYID_ITEM_USE, PLAYER1)) 
{
    if (scr_items_count(ITEMTYPE_CANDY) > 0) Candy("use", Candy("current"));
}

// CANCEL OUT
var did = -1;
var skp = 0;
//if (zauber_charge != 0 && scr_input_check_pressed(KEYID_ABILITY_USE, PLAYER1)) did = old_stance;
if (scr_input_check_pressed(KEYID_HOLSTER, PLAYER1)) { skp = 1; did = global.stanceBeforeZauber; }
if (scr_input_check_pressed(KEYID_RUN, PLAYER1)) { global.stanceBeforeRoll = scr_player_stance_zauber; did = scr_player_stance_roll; }
if (did != -1) 
{
    if (scr_player_getGunHolstered() != zauber_holster) 
    {
        scr_player_setGunHolstered(zauber_holster);
        scr_player_calculateWeight();
        scr_stats_genEffectiveStats();
    }
    scr_player_setStance(did);
    if (skp == 0) script_execute(stance);
    return 0; 
}

// walk keys
var input_x = 0;
var input_y = 0;
if (scr_input_check_held(KEYID_LEFT, PLAYER1) && !scr_input_check_held(KEYID_RIGHT, PLAYER1)) input_x = -1;
else if (!scr_input_check_held(KEYID_LEFT, PLAYER1) && scr_input_check_held(KEYID_RIGHT, PLAYER1)) input_x = 1;
if (scr_input_check_held(KEYID_UP, PLAYER1) && !scr_input_check_held(KEYID_DOWN, PLAYER1)) input_y = -1;
else if (!scr_input_check_held(KEYID_UP, PLAYER1) && scr_input_check_held(KEYID_DOWN, PLAYER1)) input_y = 1;

// Walk speed
spd = scr_stats_getEffectiveStat(self, STAT_BASE_SPEED);
scr_path_setSpeed(spd);

// Determine movement speed!
scr_path_delete();
scr_math_normalizeVector(input_x, input_y);
var tx = __vx * spd;
var ty = __vy * spd;
var tdir = point_direction(move_x, move_y, tx, ty);
var tdist = point_distance(move_x, move_y, tx, ty);
//scr_entity_setMoveXY(__vx * spd, __vy * spd);

// Determine movement speed! // Calculate inertia
if (!scr_path_active())
{
    var inertia_time = max(0.1, 2 - (scr_stats_getEffectiveStat(id, STAT_BASE_AGILE)*0.019));
    var inertia = ((2*spd) / (inertia_time)) * dt()
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
o_hud.charge = 0;

// Convert to direction and speed
//move_dir = point_direction(0, 0, move_x, move_y);
//move_dist = point_distance(0, 0, move_x, move_y);

// Set facing angle
look_dir_discrete = round(look_dir/(360/aFaceCount))*(360/aFaceCount)
facing_prev = facing
aiming = scr_math_mod(round(look_dir_discrete / (360/aFaceCount)), aFaceCount)
facing = aFace[aiming]

// Set leg angle
if (move_dist > 0) legdir = scr_math_mod(round(move_dir / (360 / 8)), 8);
else legdir = scr_math_mod(round(look_dir_discrete / (360 / 8)), 8);

// Animate - soley for bobbing
//if (input_dist > 0 or shuffle > 0) {
//if (move_dist != 0 or shuffle > 0) {
if (move_dist > 0 or shuffle > 0) 
{
    var modifier = 1 - (shuffle > 0)*.5;
    scr_entity_animation_setSpeed(ANIMATION_DEFAULT, 0.2 * modifier);
    scr_entity_animation_setSpeedPerPixel(ANIMATION_DEFAULT, (1/13) * modifier);
}
else 
{
    scr_entity_animation_setFrame(ANIMATION_DEFAULT, 0);
    scr_entity_animation_setSpeed(ANIMATION_DEFAULT, 0);
    scr_entity_animation_setSpeedPerPixel(ANIMATION_DEFAULT, 0);
}

// Shuffle feet on turn
if (shuffle = 0 && facing != facing_prev) shuffle = 9
if (shuffle > 0) shuffle -= 1

// Bob torso
if (move_dist > 0) yoff = (floor(scr_entity_animation_getFrame(ANIMATION_DEFAULT)) mod 2);
else yoff = 0;

// Play step sounds
//var frame = scr_entity_animation_onFrame(ANIMATION_DEFAULT); // was get frame
//var animspd = scr_entity_animation_getSpeed(ANIMATION_DEFAULT) * dt();
//if (((frame >= 0 && frame - animspd < 0) ||
//    (frame >= 2 && frame - animspd < 2)) &&
//    move_dist > 0) {
if ((scr_entity_animation_onFrame(ANIMATION_DEFAULT, 0) || 
    scr_entity_animation_onFrame(ANIMATION_DEFAULT, 2)) && 
    move_dist > 0) 
{
    if (scr_actor_isWading(o_hoopz) == 0) 
    {
        audio_play_sound_on_actor(id, scr_soundbank_pickSound("hoopz_footstep"), false, 100); 
    }
}

// Back-pedal
if (scr_math_mod((facing+1) - legdir,8) > 3) legdir = scr_math_mod(legdir + 4, 8);
// WALKING
///////////////////////////////////////////////////////////////////////////

// Can't move into water
if (not scr_collision_point_free(x + move_x, y + move_y, 0, COLLISION_WADING))
{
    scr_entity_setMoveXY(0, 0);
}

scr_player_setDrawScript(scr_player_draw_zauber);

// Bounce sound
var zac = floor((zauber_charge mod 1) * 6);
var castTry = scr_input_check_pressed(KEYID_ACTION, PLAYER1) || scr_input_check_held(KEYID_ACTION, PLAYER1);
zauber_charge += dt_sec() / global.zauberDribbleTime;
if (zac != floor((zauber_charge mod 1) * 6) && zac == 1 && (move_dist > 0 || zauber_charge < 1)) 
    audio_play_sound_on_actor(id, "sn_debug_one", false, 100);
if (zauber_charge >= 1 && (castTry || global.zauberCastAuto))
{
    if (Zauber("slot") != NULL) 
    {
        scr_player_setStance(scr_player_stance_zauber_cast);
        script_execute(stance);
        return 0;
    }
}
