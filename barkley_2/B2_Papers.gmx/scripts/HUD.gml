// Scale needs...
// x and y
// ??? holstered   = Holster sets scaleWeight to 0
// might       = Might                        - scr_stats_getEffectiveStat(o_hoopz, STAT_BASE_MIGHT)
// wgtBas      = Base weight (jerkin, status) - scr_stats_getEffectiveStat(o_hoopz, STAT_BASE_WEIGHT)
// hudOnce     = if 0 does it instantly       - Is 0 on HUD create
// scaleWeight = the weight of the gun        - gunEquipped[? "pWeight"]

// EXTERNAL
/*
if (0) //instance_exists(o_hoopz)) 
{
        might = scr_stats_getEffectiveStat(o_hoopz, STAT_BASE_MIGHT);
        wgtBas = scr_stats_getEffectiveStat(o_hoopz, STAT_BASE_WEIGHT);
}
// holstered   = Holster sets scaleWeight to 0
if (gunHolstered) scaleWeight = 0;
// hudOnce instant
if (hudOnce == 0)
    {
        scaleWeightPos = scaleWeight; //wgt;
        hudOnce = 1;
    }
// Base weight? just do my own math?
scr_stats_getEffectiveStat(o_hoopz, STAT_BASE_WEIGHT) + gunEquipped[? "pWeight"]

// NEW

var sclWgt = 0;
var mgt = 0;
var ins = 0;
if (instance_exists(o_hoopz)) 
{
    mgt = scr_stats_getEffectiveStat(o_hoopz, STAT_BASE_MIGHT);
    sclWgt += scr_stats_getEffectiveStat(o_hoopz, STAT_BASE_WEIGHT);
}
if (gunEquipped != NULL && ds_exists(gunEquipped, ds_type_map)) 
{
    if (gunHolstered == 0) sclWgt += gunEquipped[? "pWeight"];
}
if (hudOnce == 0) { ins = 1; hudOnce = 1; }
HUD("draw scale", x + scaleX, y + scaleY, mgt, sclWgt, ins);

*/
if (argument[0] == "setup scale")
{
    scaleWeightPos = 0;
    scaleWeightMomentum = 0;
}
else if (argument[0] == "draw scale") // 1 = x, 2 = y, 3 = might, 4 = carry_weight, 5 = instant, 6 = color
{
    var drx = argument[1];
    var dry = argument[2];
    var might = argument[3];
    scaleWeight = argument[4];
    var instant = argument[5]; // Instant
    var color = c_white;
    if (argument_count > 6) color = argument[6];
    var wgtBas = 0;//argument[4];
    scaleWeightSpeed = 3;
    scaleColorEncumbrance = make_color_rgb(255, 160, 160);
    scaleYPos = 1;
    scaleHeight = 220 - 2; // Minus 2

    // Weight marker
    if (instant) scaleWeightPos = scaleWeight;
    var wgt = (clamp(scaleWeightPos, -10, 105) * 2) - 3.5;
    wgt = floor(wgt);
    wgt -= wgtBas;
    // Weight marker
    
    // Scale animation
    if (paused() == false)
    {
        repeat (2)
        {
            scaleWeightDes = scaleHeight - (scaleWeight * 2);
            scaleWeightCur = scaleHeight - (scaleWeightPos * 2);
            dis = clamp((scaleWeightCur - scaleWeightDes), -10, 10);
            scaleWeightMomentum += (dis / scaleWeightSpeed) * dt_sec();
            scaleWeightMomentum = Goto(scaleWeightMomentum, 0, dt_sec() * (2 * abs(scaleWeightMomentum))); //friction
            if (scaleWeightPos >= scaleHeight) scaleWeightMomentum = Goto(scaleWeightMomentum, 0, dt_sec() * (2 * abs(scaleWeightMomentum)));
            scaleWeightPos += scaleWeightMomentum;
        }
    }
    scaleYPos = scaleHeight - (clamp(scaleWeightPos, -10, 105) * 2);
    
    // DRAW
    // Scale white BG      
    draw_sprite_ext(s1x1, 0, drx + 2, dry + 2, sprite_get_width(s_hud_scale) - 5, sprite_get_height(s_hud_scale) - 4, 0, c_white, image_alpha);
    // Red encumberance lines
    for (i = 0; i < 28 - 1; i += 1)
    {
        scl = scr_stats_encumberance(might, wgtBas + wgt);
        wgt -= 0.5;
        scl *= 10;
        scl = ceil(scl);
        if (i != 0) draw_sprite_ext(s1x1, 0, drx + 2 + 9 - scl, dry + 1 + i, scl, 1, 0, scaleColorEncumbrance, image_alpha);
    }
    draw_sprite_part_ext(s_hud_scale_numbers, 0, 0, clamp(scaleYPos - 14, 0, scaleHeight + 2) , 10, clamp(scaleHeight + 2 + 14 - scaleYPos, 0, 28), drx + 2, dry + 1, 1, 1, c_black, image_alpha);
    // Scale Shading
    dx = drx + 1;
    dy = dry + 1;
    draw_sprite_ext(s1x1, 0, dx, dy + 1, 11, 1, 0, c_black, 0.80 * image_alpha);
    draw_sprite_ext(s1x1, 0, dx, dy + 2, 11, 1, 0, c_black, 0.75 * image_alpha);
    draw_sprite_ext(s1x1, 0, dx, dy + 3, 11, 1, 0, c_black, 0.66 * image_alpha);
    draw_sprite_ext(s1x1, 0, dx, dy + 4, 11, 1, 0, c_black, 0.40 * image_alpha);
    draw_sprite_ext(s1x1, 0, dx, dy + 5, 11, 1, 0, c_black, 0.15 * image_alpha);
    dy = dry + 28;
    draw_sprite_ext(s1x1, 0, dx, dy - 1, 11, 1, 0, c_black, 0.80 * image_alpha);
    draw_sprite_ext(s1x1, 0, dx, dy - 2, 11, 1, 0, c_black, 0.75 * image_alpha);
    draw_sprite_ext(s1x1, 0, dx, dy - 3, 11, 1, 0, c_black, 0.66 * image_alpha);
    draw_sprite_ext(s1x1, 0, dx, dy - 4, 11, 1, 0, c_black, 0.40 * image_alpha);
    draw_sprite_ext(s1x1, 0, dx, dy - 5, 11, 1, 0, c_black, 0.15 * image_alpha);
    // Draw scale HUD overlay
    var hds = 0;
    var alpha = image_alpha;
    if (color != c_white) { hds = 1; alpha = 0.5; }
    draw_sprite_ext(s_hud_scale, hds, drx, dry, 1, 1, 0, color, alpha * image_alpha);
    if (hds) draw_sprite_ext(s_hud_scale, 2, drx, dry, 1, 1, 0, color, 1 * image_alpha);
}
