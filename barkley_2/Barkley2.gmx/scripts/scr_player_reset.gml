// Remove pacify
if !instance_exists(o_room_pacify) {
    global.gunPacify = false;
}
global.battleMode = 0;

// Set initial hoopz Stance
lock_stance = false
if (scr_player_getGunHolstered() or global.gunPacify) {
    stance = scr_player_stance_standard;
    scr_player_setStance(stance);
    scr_player_setDrawScript(scr_player_draw_walking_standard);
} else {
    stance = scr_player_stance_gunmode;
    scr_player_setStance(stance);
    scr_player_setDrawScript(scr_player_draw_walking_gunmode);
}
if (BodySwap() != "hoopz") BodySwap("refresh"); //If Matthias, Governor, or VRW, swap bodies


// Initialize vectors
look_x = 0
look_y = 0
look_dir = 0
look_dist = 0

camera_target_x = 0
camera_target_y = 0

camera_move_dist_x = 0
camera_move_dist_y = 0

// Frankie's AI Target
////targx targy
targx = x;
targy = y;

// Initialize random assortment of variables
camera_speed = 12;
dodgeCooldown = 0;
dodgingTimer = 0;
aiming = 0;
facing = 0;
legdir = 0;
shuffle = 0;
yoff = 0;
dimage_index = 0;

moved = 0;

p_Sresistances = true;
p_Sarmors = true;
p_attackMultiType = true;
p_attackType = "norm";
p_attackStatus =true;

totalDmg = 0;
aimoffset = 0;
swaptick = 0;
dfire = 0;

spd = 0;

timeMillis = 0;
timeSeconds = 0;
timeMinutes = 0;

timeQuest = 0; ///Quest timeline position

combat_gunwield_reset();
ARMS_HEIGHT = 13;

scr_dny(4);

scr_entity_animation_setSpeed(ANIMATION_DEFAULT, 0);
shadow = 0;
input_active = 1;
    
scr_path_init();
hold_count = 0;
pth_dir = 0;
