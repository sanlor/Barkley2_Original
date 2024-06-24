// SETUP STUFF // 

if (string(argument[0]) == "applyStats") return 0;
if (string(argument[0]) == "apply") return 0;
if (string(argument[0]) == "applyBullet")
{
    var _bullet = argument[1];
    var gun = argument[2];
    if (gun[? "pChargeRatio"] == 1)
    {
        var conf;
        conf = scr_statusEffect_addToCombatAttack(statusEffect_busting, _bullet);
        conf[? "timer"] = 50;
    }
    return 1;
}

var conf = argument0;
var actor = argument1;
var command = argument2;
var changestat = argument3;

// GENERATE SOME DEFAULT VALUES //
if (command == "generate") then
    {
    // Copy attack stats into Conf so it can be used as an attack object
    var atk = scr_stats_newAttackStats();
    ds_map_copy(conf, atk);
    ds_map_destroy(atk);
    
    // Append basic information
    scr_statusEffect_generateBasicInfo(conf, statusEffect_busting, 50);

    // Default values so there won't be undefined variable crashes //    
    conf[? "timerTotal"] = conf[? "timer"];
    conf[? "effectImage"] = 0;
    conf[? "effectImageMin"] = 0;
    conf[? "effectImageMax"] = 5;
    conf[? "effectY"] = 0;

    conf[? "effectFlickerTimer"] = 0;
    conf[? "effectFlickerTimerReset"] = 5;
    conf[? "effectFlickerToggle"] = 1;
    
    return conf;
    }
    
// IF ACTOR DOES NOT EXIST RETURN 0 //
else if (!instance_exists(actor)) then
    {
    return 0;
    }
    
// APPLY THIS STATUS EFFECT //
else if (command == "apply") then 
    {
    // Check if actor already has the status effect //
    var currentBusting = scr_statusEffect_getFromCombatActor(actor, statusEffect_busting);
    
    // Status effect being applied when the actor does not have it currently //
    if (currentBusting == -1) then
        {
        // Apply new status effect
        scr_statusEffect_applyNewToCombatActor(actor, conf);
        
        // STAGGER //
        var atk = scr_stats_newAttackStats();
        atk[? STAT_ATTACK_STAGGER] = 100;
        atk[? STAT_ATTACK_STAGGER_HARDNESS] = STAGGER_HARDNESS_MEDIUM;
        scr_stats_performAttack(atk, actor, false, NULL, false, true);
        
        // Effect //
        audio_play_sound_on_actor(actor,scr_soundbank_pickSound("affix_busting"),false,70);
        }
    else 
        {
        // Re-apply the status effect AKA reset the timer //
        var timer = conf[? "timer"];
        timer = max(timer, currentBusting[? "timer"]);
        currentBusting[? "timer"] = timer;        
        }
        
    // Return zero //     
    return 0;
    } 
    
// STATUS EFFECT STEP //
else if (command == "step") then
    {
    // This is for the status effect visual flickering //
    // scr_fx_statusFlicker(conf, 4, 1.5); // gz remove temp
    
    var atk = scr_stats_newAttackStats();
    atk[? STAT_ATTACK_STAGGER] = 100;
    atk[? STAT_ATTACK_STAGGER_HARDNESS] = STAGGER_HARDNESS_MEDIUM;
    scr_stats_performAttack(atk, actor, false, NULL, false, true);
    ds_map_destroy(atk);
    
    // Return zero //
    return false;
    }

// DRAW POST //
else if (command == "draw_post") then
    {
    var spx, spy, drx, dry, pww, dx, dy, slw, slh, col, app, lines, sprCur, i, dr, dir;
    spx = actor.x;
    spy = actor.y;
    sprCur = actor.sprite_index;
    alp = conf[? "timer"] / 50;
    lines = 4;
    
    vrw = sprite_get_width(sprCur) / 2;
    vrh = sprite_get_height(sprCur) / 2;
    drx = spx - sprite_get_xoffset(sprCur) + vrw;
    dry = spy - sprite_get_yoffset(sprCur) + vrh;
    vrw *= 0.8;
    vrh *= 0.9;
    
    draw_set_blend_mode(bm_add);
    for (i = 0; i < (vrw * vrh) / 60; i += 1)
    {
        dr = random(360);
        pww = random(1);
        dx = drx + lengthdir_x(vrw * pww, dr);
        dy = dry + lengthdir_y(vrh * pww, dr);
        slw = 0.1 + random(0.2);
        slh = 0.1 + random(0.2);
        col = merge_color(c_aqua, c_white, random(1));
        col = make_color_rgb(col, c_black, 0.9);
        app = (0.3 + random(0.1)) * alp;
        draw_sprite_ext(s_light_256, 0, dx, dy, slw / 4, slh / 4, random(360), col, app);
    }
    for (i = 0; i < lines; i += 1)
    {
        dir = random(360); pww = random(1);
        lx0 = drx + lengthdir_x(vrw, dir);
        ly0 = dry + lengthdir_y(vrh, dir);
        dir = random(360); pww = random(1);
        lx1 = drx + lengthdir_x(vrw * pww, dir);
        ly1 = dry + lengthdir_y(vrh * pww, dir);
        col = merge_color(c_aqua, c_white, 0.5 - random(0.5));
        col = make_color_rgb(col, c_black, 0.9);
        dis = point_distance(lx0, ly0, lx1, ly1);
        dir = point_direction(lx0, ly0, lx1, ly1);
        app = (0.5 + random(0.1)) * alp;
        draw_sprite_ext(s1x1, 0, lx0, ly0, dis, 1, dir, col, app);
    }
    draw_set_blend_mode(bm_normal);
    
    
    
    return 0;
    }
