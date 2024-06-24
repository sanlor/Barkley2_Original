if (newStance) {
    gunHolstered = true
    camera_speed = 12
    camera_move_dist_x = 16
    camera_move_dist_y = 48
    newStance = false
    wadesound = 0;
    shadow_visible = false;
}

if camera_speed < 48 then camera_speed += 1.5 * dt()


// Dodge
/*

// Draw gun
if (scr_input_check_pressed(KEYID_HOLSTER, PLAYER1))
{
    if (global.gunPacify == 0)
    {
        scr_player_setStance(scr_player_stance_gunmode);
        gunHolstered = false;
    }
    else
    {
        audio_play_sound_fresh("sn_pacify", 10, 0);
    }
}   

// Use / change item - gz
if (scr_input_check_pressed(KEYID_ITEM_NEXT, PLAYER1)) Candy("next");
if (scr_input_check_pressed(KEYID_ITEM_USE, PLAYER1)) {
    if (scr_items_count(ITEMTYPE_CANDY) > 0) {
        Candy("use", Candy("current"));
    }
}

// Change ability - gz
//@ if (scr_input_check_pressed(KEYID_ABILITY_NEXT, PLAYER1)) scr_items_zauber_next();

// Use ability - Denied when not in gun'smode
if (scr_input_check_pressed(KEYID_ABILITY_USE, PLAYER1)) {
    audio_play_sound_on_actor(o_hoopz,scr_soundbank_pickSound("hoopz_shellcasings"),false,90);
}    */
        
// walk keys // REVERSED // Slow deceleration of speed //
var sdt = 1; //dt() / 300;
var sdd = dt() / 2;
if (false)
{
    if (scr_input_check_held(KEYID_LEFT, PLAYER1) && !scr_input_check_held(KEYID_RIGHT, PLAYER1)) { move_x = -sdt; }
    else if (!scr_input_check_held(KEYID_LEFT, PLAYER1) && scr_input_check_held(KEYID_RIGHT, PLAYER1)) { move_x = sdt; }
    else 
    { 
        if (move_x < -sdd) { move_x += sdd; }
        else if (move_x > sdd) { move_x -= sdd; }
        else move_x = 0; 
    }
    
    if (scr_input_check_held(KEYID_UP, PLAYER1) && !scr_input_check_held(KEYID_DOWN, PLAYER1)) { move_y = -sdt; }
    else if (!scr_input_check_held(KEYID_UP, PLAYER1) && scr_input_check_held(KEYID_DOWN, PLAYER1)) { move_y = sdt; }
    else 
    {
        if (move_y <= -sdd) { move_y += sdd; }
        else if (move_y >= sdd) { move_y -= sdd; }
        else move_y = 0; 
    }
} 
else
{
    if (scr_input_check_held(KEYID_LEFT, PLAYER1) && !scr_input_check_held(KEYID_RIGHT, PLAYER1)) { move_x = -1; }
    else if (!scr_input_check_held(KEYID_LEFT, PLAYER1) && scr_input_check_held(KEYID_RIGHT, PLAYER1)) { move_x = 1; }
    else { move_x = 0; }
    
    if (scr_input_check_held(KEYID_UP, PLAYER1) && !scr_input_check_held(KEYID_DOWN, PLAYER1)) { move_y = -1; }
    else if (!scr_input_check_held(KEYID_UP, PLAYER1) && scr_input_check_held(KEYID_DOWN, PLAYER1)) { move_y = 1; }
    else { move_y = 0; }
}
//show_debug_message("X: " + string(move_x) + " - Y: " + string(move_y));

// Walk speed
spd = scr_stats_getEffectiveStat(self, STAT_BASE_SPEED);
spd *= max(abs(move_x), abs(move_y));
scr_path_setSpeed(spd);

// Delete path on key
if (abs(move_x)+abs(move_y) != 0) or !scr_collision_point_free(x,y,z, collision_check) {
    scr_path_delete();
}
  
// Determine movement speed!
if (!scr_path_active()) {
    scr_math_normalizeVector(move_x, move_y);
    scr_entity_setMoveXY(__vx * spd, __vy * spd);
} 

// Set facing angle
look_dir_discrete = round(look_dir/(360/aFaceCount))*(360/aFaceCount)
facing_prev = facing

if (move_dist > 0) {
    aiming = scr_math_mod(round(move_dir / (360/aFaceCount)), aFaceCount)
}
else {
    aiming = scr_math_mod(round(look_dir / (360/aFaceCount)), aFaceCount)
}
facing = aFace[aiming]
o_hud.charge = 0;

// Shuffle feet on turn
if shuffle = 0 and facing != facing_prev
    shuffle = 9
    
if shuffle > 0 {
    shuffle -= dt();
}

// Animate
if (move_dist > 0 or shuffle > 0) {
    scr_entity_animation_setSpeed("default", 1.2 - (shuffle > 0)*.5); //was .5
}
else {
    scr_entity_animation_setFrame("default", 0); // This is the 'standing still' frame
    scr_entity_animation_setSpeed("default", 0);
}
    
// Bob torso
if (move_dist > 0) {
    yoff = (floor(scr_entity_animation_getFrame("default")) mod 2)
}
else {
    yoff = 0
}

// Update lookdir
if (move_dist > 0) {
    look_dir = move_dir;
}

// Play step sounds
var frame = scr_entity_animation_getFrame("default");
var animspd = scr_entity_animation_getSpeed("default") * dt();
if (((frame >= 0 && frame - animspd < 0) ||
    (frame >= 2 && frame - animspd < 2)) &&
    move_dist > 0) {
    var _snd;
    if !scr_actor_isWading(o_hoopz) {_snd = audio_play_sound_on_actor(id, scr_soundbank_pickSound("hoopz_footstep_vrw"), false, 100); }
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
scr_player_setDrawScript(scr_player_draw_walking_untamo); //standard)
