/// HUD("gun draw", gun_sprite_index, gun_subimage, x, y, x_scale, y_scale, color, alpha)
if (argument[0] == "gun draw part") // 1 spr, 2 sub, 3 lef, 4 top, 5 wid, 6 hei, 7 x, 8 y, 9 xsc, 10 ysc, 11 col, 12 alp
{
    var gsi = argument[1];
    var gsb = argument[2];
    var drx = argument[7];
    var dry = argument[8];
    var xsc = 1;
    if (argument_count > 9) xsc = argument[9];
    var ysc = 1;
    if (argument_count > 10) ysc = argument[10];
    var col = c_white;
    if (argument_count > 11) col = argument[11];
    var alp = 1;
    if (argument_count > 12) alp = argument[12];
    
    //First get the gun sheet id of the gun, which is the material divided by gunPerSheet
    var gunSht = gsb div global.gunPerSheet;
    if (gunSht < 0) return 0;
    
    //Now check if the sheet is loaded, if not, load it up
    if (global.gunSheetSprite[gunSht] == -1)
    {
        var tim = get_timer();
        global.gunSheetSprite[gunSht] = sprite_add("_guns/FrankieGuns" + string(gunSht) + ".png", 1, 1, 0, 0, 0);
        show_debug_message("Sheet ID " + string(gunSht) + " loaded on demand in " + string((get_timer() - tim) / 1000000) + " seconds.");
    }
    
    //Draw the gun from the sheet
    //show_debug_message(sprite_get_name(gsi) + " " + string(gsb));
    var ext = gsb mod global.gunPerSheet;
    var typ = global.gunSwap[? gsi];
    if (sprite_exists(global.gunSheetSprite[gunSht]) == 0) return 0;
    
    // Last vars
    var lef = (ext * global.gunWidth);
    var top = (typ * global.gunHeight);
    var wid = global.gunWidth;
    var hei = global.gunHeight;
    if (argument[3] != -999) lef += argument[3];
    if (argument[4] != -999) top += argument[4];
    if (argument[5] != -999) wid = argument[5];
    if (argument[6] != -999) hei = argument[6];
    
    draw_sprite_part_ext(global.gunSheetSprite[gunSht], 0, lef, top, wid, hei, drx, dry, xsc, ysc, col, alp);
    return 1;
}
else if (argument[0] == "gun draw") // 1 spr, 2 sub, 3 x, 4 y, 5 x_scale, 6 y_scale, 7 color, 8 alpha
{
    HUD("gun draw part", argument[1], argument[2], -999, -999, -999, -999, argument[3], argument[4], argument[5], argument[6], argument[7], argument[8]);
    return 1;
}
else if (argument[0] == "setup scale")
{
    scaleWeightPos = 0;
    scaleWeightMomentum = 0;
    return 1;
}
else if (argument[0] == "draw scale") // 1 = x, 2 = y, 3 = might, 4 = carry_weight, 5 = instant, 6 = color, 7 = alpha
{
    var drx = argument[1];
    var dry = argument[2];
    var might = argument[3];
    scaleWeight = argument[4];
    var instant = argument[5]; // Instant
    var color = c_white;
    if (argument_count > 6) color = argument[6];
    var alpha = 1;
    if (argument_count > 7) alpha = argument[7];
    var wgtBas = 0;//argument[4];
    scaleWeightSpeed = 3;
    scaleColorEncumbrance = make_color_rgb(255, 160, 160);
    scaleColorLine = make_color_rgb(236, 241, 0); // Yellow weight line
    scaleYPos = 1;
    scaleHeight = 220 - 2; // Minus 2

    // Weight marker
    if (instant) scaleWeightPos = scaleWeight;
    var wgt = (clamp(scaleWeightPos, -10, 105) * 2) - 7;//3.5;
    var vgt = floor(clamp(scaleWeightPos, -10, 105)) + 7; // new
    //var wgt = (clamp(scaleWeightPos, -10, 105) * 2) - 7;
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
    draw_sprite_ext(s1x1, 0, drx + 2, dry + 2, sprite_get_width(s_hud_scale) - 5, sprite_get_height(s_hud_scale) - 4, 0, c_white, image_alpha * alpha);
    // Red encumbrance lines
    //wgt += (13.5 / 2);
    linDrw = 0;
    sclPrv = 0;
    for (i = 0; i < 28 - 1; i += 1)
    {
        if (false)
        {
            scl = abs(max(-10, scr_stats_encumbrance(might, wgtBas + wgt))) / 10;
            wgt -= 0.5;
            scl *= 10;
            scl = round(scl);
            if (i != 0) 
            {
                if (scl <= 0 && sclPrv >= 1 && linDrw == 0)
                {
                    linDrw = 1;
                    draw_sprite_ext(s1x1, 0, drx + 2 + 9 - 10, dry + 0 + i, 9, 1, 0, scaleColorLine, image_alpha * alpha);
                }
                draw_sprite_ext(s1x1, 0, drx + 2 + 9 - scl, dry + 1 + i, scl, 1, 0, scaleColorEncumbrance, image_alpha * alpha);
            }
            sclPrv = scl;
        }
        else
        {
            //show_debug_message("MIGHT = " + string(might) + " - WEIGHT = " + string(scaleWeight));
            //show_debug_message(string(wgt));
            scl = max(-10, vgt - might) / 1.5; //abs(max(-10, scr_stats_encumbrance(might, wgtBas + wgt))) / 10;
            vgt -= 0.5;
            //wgt -= 0.5;
            //scl *= 10;
            scl = round(scl);
            scl = min(scl, 9);
            if (i != 0)
            {
                //if (scl <= 0 && sclPrv >= 1 && linDrw == 0)
                if (scl <= 0 && sclPrv >= 1 && linDrw == 0)
                {
                    linDrw = 1;
                    draw_sprite_ext(s1x1, 0, drx + 2 + 9 - 10, dry + 0 + i, 9, 1, 0, scaleColorLine, image_alpha * alpha);
                }
                if (scl > 0) draw_sprite_ext(s1x1, 0, drx + 2 + 9 - scl, dry + 1 + i, scl, 1, 0, scaleColorEncumbrance, image_alpha * alpha);
            }
            sclPrv = scl;
        }
    }
    draw_sprite_part_ext(s_hud_scale_numbers, 0, 0, clamp(scaleYPos - 14, 0, scaleHeight + 2) , 10, clamp(scaleHeight + 2 + 14 - scaleYPos, 0, 28), drx + 2, dry + 1, 1, 1, c_black, image_alpha * alpha);
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
    var alpha2 = image_alpha;
    if (color != c_white) { hds = 1; alpha2 = 0.5; }
    draw_sprite_ext(s_hud_scale, hds, drx, dry, 1, 1, 0, color, alpha2 * image_alpha * alpha);
    if (hds) draw_sprite_ext(s_hud_scale, 2, drx, dry, 1, 1, 0, color, 1 * image_alpha * alpha);
    return 1;
}
else if (argument[0] == "init")
{
    //Contains gun sizes for grid line effect
    //NOTE: Don't set a value lower than 26 or higher than 97.
    global.gunSize = ds_map_create();
    global.gunSize[? s_hud_flaregun] = 26;
    global.gunSize[? s_hud_pistols] = 30;
    global.gunSize[? s_hud_flintlock] = 30;
    global.gunSize[? s_hud_machinepistol] = 30;
    global.gunSize[? s_hud_revolvers] = 35;
    global.gunSize[? s_hud_smg] = 36;
    global.gunSize[? s_hud_magnum] = 41;
    global.gunSize[? s_hud_crossbow] = 46;
    global.gunSize[? s_hud_shotgun] = 48;
    global.gunSize[? s_hud_doubleshotgun] = 50;
    global.gunSize[? s_hud_revshotgun] = 51;
    global.gunSize[? s_hud_mitrailleuse] = 52;
    global.gunSize[? s_hud_elephantgun] = 56;
    global.gunSize[? s_hud_assaultrifle] = 57;
    global.gunSize[? s_hud_rifle] = 66;
    global.gunSize[? s_hud_musket] = 68;
    global.gunSize[? s_hud_tranqrifle] = 69;
    global.gunSize[? s_hud_huntingrifle] = 73;
    global.gunSize[? s_hud_heavymachinegun] = 77;
    global.gunSize[? s_hud_minigun] = 80;
    global.gunSize[? s_hud_flamethrower] = 82;
    global.gunSize[? s_hud_sniper] = 89;
    global.gunSize[? s_hud_rocket] = 93;
    global.gunSize[? s_hud_gatlinggun] = 97;
    global.gunSize[? s_hud_bfg] = 97;
    
    // Data for external gun sheets
    global.gunSwap = ds_map_create();
    global.gunWidth = 49;
    global.gunHeight = 24;
    global.gunPerSheet = 9; //Number of guns to put per sheet. If loading a sheet takes too long, lower this number.
    global.gunMaterials = 81; //Maximum number of gun materials in game
    global.gunTypes = 26; //Maximum number of types of guns we'll have
    global.gunSheets = floor(global.gunMaterials / global.gunPerSheet); //Calculates how many gun sheets we have
    for (_i = 0; _i < global.gunSheets; _i += 1) { global.gunSheetSprite[_i] = -1; }
    global.gunSwap[? s_hud_pistols] = 0;
    global.gunSwap[? s_hud_flintlock] = 1;
    global.gunSwap[? s_hud_machinepistol] = 2;
    global.gunSwap[? s_hud_revolvers] = 3;
    global.gunSwap[? s_hud_magnum] = 4;
    global.gunSwap[? s_hud_flaregun] = 5;
    global.gunSwap[? s_hud_rifle] = 6;
    global.gunSwap[? s_hud_musket] = 7;
    global.gunSwap[? s_hud_huntingrifle] = 8;
    global.gunSwap[? s_hud_tranqrifle] = 9;
    global.gunSwap[? s_hud_sniper] = 10;
    global.gunSwap[? s_hud_assaultrifle] = 11;
    global.gunSwap[? s_hud_smg] = 12;
    global.gunSwap[? s_hud_heavymachinegun] = 13;
    global.gunSwap[? s_hud_gatlinggun] = 14;
    global.gunSwap[? s_hud_minigun] = 15;
    global.gunSwap[? s_hud_mitrailleuse] = 16;
    global.gunSwap[? s_hud_shotgun] = 17;
    global.gunSwap[? s_hud_doubleshotgun] = 18;
    global.gunSwap[? s_hud_revshotgun] = 19;
    global.gunSwap[? s_hud_elephantgun] = 20;
    global.gunSwap[? s_hud_crossbow] = 21;
    global.gunSwap[? s_hud_flamethrower] = 22;
    global.gunSwap[? s_hud_rocket] = 23;
    global.gunSwap[? s_hud_bfg] = 24;
    return 1;
}
show_debug_message("HUD(): Unknown function = " + string(argument[0]));
