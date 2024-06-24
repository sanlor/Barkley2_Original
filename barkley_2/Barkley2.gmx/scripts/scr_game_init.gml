/// scr_game_init()
// Call ONCE on game initialization
live_init(1, "http://127.0.0.1:5100", ""); //TODO: remove me

randomize();
Settings();
Balance();
Sound("init");
paused(0);
scr_deltatime_init();
scr_deltatime_update();
audio_bgm_init();

// Debug toggles
global.godMode = false;
global.pacifyMode = false;

// load config
//scr_load_config();
Config("init");

global.currentSaveSlot = -1;

instance_create(0, 0, oBlack);
instance_create(0, 0, o_input);
instance_create(0, 0, oZoneName);
instance_create(0, 0, oPrisonVitals);

scr_input_keymap_init();
Key("init");

// load resource list
scr_savedata_init();
scr_soundbanks_init();
scr_enemyList();
scr_combat_weapons_bfgNames("init");
Enemy("init");
Attack("init");
Duergar("init");
Map("init");
EffectLightning("init");
Smoke("init");
Drop("init");
Jerkin("init");
Gunsmap("init");
Gun("init");
Zauber("init");
Candy("init");
Cyberspear("init");
scr_combat_weapons_fusion_affixhood("init");
scr_combat_weapons_fusion_material("init");
Material("init");
scr_time_db("init");
Vidcon("init");
Draw("init");
Cinema("init");
Border("init");
Item("init");
Shop("init");
CC("init");
spawn_init();

// Audio configurations
audio_falloff_set_model(audio_falloff_linear_distance_clamped);

global.sfx_rain_intensity = 0;
Music("init");

// Rain //
global.it_rained_on_previous_map = false;

// Death respawn clock //
global.deathClock = 0;
global.deathTimeFirst = 0;
global.deathTimeSecond = 0;
global.deathTimeThird = 0;

// Affix things //
global.gunsacrifice_affix = false;

// Useless stuff //
global.deathTimerCount = 0;
global.pedestrianSprite = 0;
PEDESTRIAN(true);
global.cursorShift = 16;


// prep inventory
ls_inventory = ds_list_create();
money = 5000;
bullets = 999;

idvisible = 1;

// fonts
global.fn_1 = font_add_sprite_ext(s_fn1, ' !"' + "#$%&'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\]¨_´abcdefghijklmnopqrstuvwxyz{|}~ ÿÓíüú£§", 1, -1); //was 0 spacing - Note font
global.fn_1b = font_add_sprite(s_fn1b, ord(" "), 1, -1);
global.fn_1o = font_add_sprite(s_fn1o, ord(" "), 1, 1); //was 0 spacing
//global.fn_2 = font_add_sprite(s_fn2, ord(" "), 1, 0); //was 0 spacing
global.fn_2 = font_add_sprite_ext(s_fn2, ' !"' + "#$%&'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\]¨_´abcdefghijklmnopqrstuvwxyz{|}~ ÿÓíüú£§", 1, 0); //was 0 spacing

global.fn_3 = font_add_sprite(s_fn3, ord("!"), 0, 1); // PROGRESSION IS - '!"' + "    '  *+,-. 0123456789:    ? ABCDEFGHIJKLMNOPQRSTUVWXYZ"
global.fn_small = font_add_sprite_ext(s_fn_small, ' !"' + "#$%&'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\]^_`abcdefghijklmnopqrstuvwxyz{|}~", 0, 1); //was 0,2 spacing, and string was was ord("!") for second argument befoer 1.4.9999
global.fn_smallc = font_add_sprite_ext(s_fn_small, ' !"' + "#$%&'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\]^_`abcdefghijklmnopqrstuvwxyz{|}~", 0, 0); //used to be 1,1 before version 1.4.9999

global.fn_2c = font_add_sprite(s_fn2, ord(" "), 1, -1); //condensed font
global.fn_2o = font_add_sprite(s_fn2o, ord(" "), 0, 0); //outline only
global.fn_2f = font_add_sprite(s_fn2f, ord(" "), 0, 0); //fill only

// Elevator numbers //
global.fn_elevator = font_add_sprite(s_mg_elevator_numbers, ord('0'), true, 0);

//dwarfnet fonts
global.fn_dnet = font_add_sprite(s_dnet_font, ord('!'), true, 1);

//b-ball tactics fonts
global.fn_tactics = font_add_sprite(s_fn_tactics, ord(" "), 1, -1);
global.fn_tactics_bold = font_add_sprite(s_fn_tacticsb, ord(" "), 1, -1);

//Gun display font
global.fn_5 = font_add_sprite(s_fn5, ord("!"), 1, 0);
global.fn_5o = font_add_sprite(s_fn5o, ord("!"), 1, 0);
global.fn_5os = font_add_sprite(s_fn5os, ord(" "), 1, -1);
global.fn_5c = font_add_sprite(s_fn5c, ord("!"), 1, 1);
global.fn_7oc = font_add_sprite(s_fn7oc, ord(" "), 1, -1);
global.fn_12oc = font_add_sprite(s_fn12oc, ord(" "), 1, -1);
global.fn_hud = font_add_sprite(s_hud_num, ord("0"), 0, 3);

// GZ condensed version
global.fn_debug = font_add_sprite(s_fn_debug, ord("!"), 1, 1);
global.fn_7ocs = font_add_sprite(s_fn7ocs, ord(" "), 1, -1);
global.fn_12ocs = font_add_sprite(s_fn12ocs, ord(" "), 1, -1);
global.fn_12ocsd = font_add_sprite(s_fn12ocsd, ord(" "), 1, -1);
global.utilityFontSmelt = font_add_sprite(sMenuUtilitySmeltNumbers, ord(" "), 1, 0);
global.fn_chat = font_add_sprite(s_fn_chat, ord(" "), 1, 1);
quickmenu2("init"); //creates persistent qmenu object and sets some global vars
scr_gun("init"); //initializes some gun's stuff. gun's gun's gun'ii gun's

draw_set_font(global.fn_2)

// Collision object was here

// At the very end, create the screen scaling system object
instance_create(0, 0, o_screen)

// Combatactor surfaces
global.combatactor_surf_256 = surface_create(256, 256);
global.combatactor_surf_128 = surface_create(128, 128);
global.combatactor_surf_64  = surface_create(64, 64);
global.combatactor_surf_32  = surface_create(32, 32);

//Externally loaded resources
Portrait("init"); 
HUD("init"); 

//GZ Stuff
scr_enemyDB_init(); //Only call once per game, loads enemy stat DB
Marquee("init"); //ONLY CALL ONCE PER GAME, and at the very end as it checks quest vars and clock time
Breakout("init"); //For breakout boxes
Shake("init");
Minigame("init");
Flourish("init");
Note("game init");

// Create world collision - MUST be after settings for rtreeSize
instance_create(0, 0, sys_collision);

//The below two are for hoopz facing during cinemas
global.eventObject = NULL;
global.eventInteract = false;
global.eventFacing = 6; //Contains last facing of Hoopz
global.eventFrame = 0;
global.eventTeleport = 0;

// Phosphor CRT Shader editable vars
global.shaderNoise = 0.1; //shader_crt_pass1_tolinear
global.shaderHardScan = -12; //shader_crt_pass2_toscreen
global.shaderHardPix = -6; //shader_crt_pass2_toscreen
global.shaderHardBloomScan = -2; //shader_crt_pass2_toscreen
global.shaderHardBloomPix = -1.5; //shader_crt_pass2_toscreen
global.shaderBloomAmount = 0.09; //shader_crt_pass2_toscreen
global.shaderHardVScan = -1.50; //shader_crt_pass2_toscreen

// Cyber Shader editable vars
global.shaderCyberHBloomHard = -1.0;
global.shaderCyberVBloomHard = -1.0;
global.shaderCyberBloomAmount = 0.14;
global.shaderCyberHardScan = -12.0;
global.shaderCyberNoise = 0.1;

// Spawn editor vars
for (var i = 0; i < 6; i++) {
    global.spawn_palette[i] = spawn_point_create(0, 0, o_enemy_cGremlin_small);
}

// Spawn editor palette
ds_map_replace(global.spawn_palette[0], "hue", c_orange);
ds_map_replace(global.spawn_palette[1], "hue", c_red);
ds_map_replace(global.spawn_palette[2], "hue", c_yellow);
ds_map_replace(global.spawn_palette[3], "hue", c_green);
ds_map_replace(global.spawn_palette[4], "hue", c_purple);
ds_map_replace(global.spawn_palette[5], "hue", c_blue);

// List for light objects in o_room_darkarea
Light("init");

// Globals for zauber stance
global.stanceBeforeZauber = -1;
global.stanceBeforeRoll = -1;
global.stanceZauberHolster = 0;

// For spawning arrest
global.duergarPatrol = 1;

// Create the first room
scr_map_initialise_init();

// Reset game (code re-use)
scr_game_reset();
