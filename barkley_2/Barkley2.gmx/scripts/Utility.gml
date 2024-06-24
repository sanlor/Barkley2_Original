/// Utility("tab" / "grid", x, y, etc);

// DO NOT EDIT BELOW
global.utilitySpriteAlpha = global.settingUtilitySpriteAlpha * global.utilityAlpha; // I believe this shouldn't be necessary according to the help, but it is!
var vxv = view_xview[0];
var vyv = view_yview[0];
// 
if (argument[0] == "sprite")
{
    draw_sprite_ext(argument[1], argument[2], vxv + argument[3], vyv + argument[4], argument[5], argument[6], argument[7], argument[8], argument[9]);
    return 1;
}
else if (argument[0] == "step")
{
    if (utilityFadeIn > 0)
    {
        utilityFadeIn -= dt_sec() * 2;
        utilityFadeIn = max(0, utilityFadeIn);
        if (utilityFadeIn == 0) Utility("input", 1);
    }
    if (utilityFadeOut > 0)
    {
        utilityFadeOut -= dt_sec() * 2;
        utilityFadeOut = max(0, utilityFadeOut);
        if (utilityFadeOut == 0) { instance_destroy(); with (o_utilitystation) Cinema("run", script2); exit; }
    }
    actionWait = clamp(actionWait - 1, 0, 999);
    doAction = "";
    var _um = 191 * global.utilityMono;
    var _hm = 64 * global.utilityMono;
    global.utilityColor[0] = make_color_hsv(global.utilityHue, 64 + (_hm * 3), 191 + _hm);
    global.utilityColor[1] = make_color_hsv(global.utilityHue, 32 + (96 * global.utilityMono) + _hm, 128 + _hm);
    global.utilityColor[2] = make_color_hsv(global.utilityHue, (96 * global.utilityMono) + (_hm / 2), 64 + (_hm / 2));
    for (var _ii = 0; _ii < 3; _ii += 1) global.utilityColor[_ii] = merge_color(global.utilityColor[_ii], c_white, 0.1);
    global.utilityColor[0] = merge_color(global.utilityColor[0], c_white, 0.2);
    global.utilityColor[3] = make_color_hsv(global.utilityHue, 128, 255); // Grid Color
    global.utilityColor[4] = make_color_hsv(global.utilityHue, 192, 255);
    global.utilityColor[5] = make_color_rgb(224, 64, 64); // Smelta
    global.utilityColor[6] = c_white;
    global.utilityColor[7] = c_ltgray;
    global.utilityColor[8] = c_lime;
    global.utilityColorHilightDirection += dt_sec() * 270;
    global.utilityColorHilight = make_colour_hsv(global.utilityHue, 255, 191 + lengthdir_x(32, global.utilityColorHilightDirection));
    global.utilityColorHilight2 = make_colour_hsv(global.utilityHue, 128, 191 + lengthdir_x(32, global.utilityColorHilightDirection));
}
else if (argument[0] == "background")
{
    var _cg = global.utilityColor[3];
    var _ab = 0.075;
    for (var xxx = argument[1]; xxx < argument[1] + argument[3]; xxx += 1)
    {
        Utility("sprite", s1x1, 0, (xxx * 8) - 1, argument[2] * 8, 1, argument[4] * 8, 0, _cg, (_ab + random(0.01)) * global.utilitySpriteAlpha);
    }
    for (var yyy = argument[2]; yyy < argument[2] + argument[4]; yyy += 1)
    {
        Utility("sprite", s1x1, 0, argument[1] * 8, (yyy * 8), argument[3] * 8, 1, 0, _cg, (_ab + random(0.01)) * global.utilitySpriteAlpha);
    }
}
else if (argument[0] == "tab") // 0 = tab, 1 = x, 2 = y, 3 = width, 4 = text, 5 = hilight
{
    var drx = 15 + (argument[1] * 8);
    var dry = 16 + (argument[2] * 8);
    var _cl = 3;
    var _c2 = global.utilityColor[2];
    if (argument_count > 5) { _cl = argument[5]; _c2 = global.utilityColor[abs(_cl - 4)]; }
    Utility("grid", argument[1], argument[2], argument[3], 1, _cl);
    scr_font(global.fn_smallc, _c2, 1, 0);
    draw_set_alpha(global.utilityTextAlpha * global.utilityAlpha);
    Utility("text", drx + ceil((argument[3] / 2) * 8) + 1, dry + 2, argument[4]);
    draw_set_alpha(1 * global.utilityAlpha);
}
else if (argument[0] == "grid") // grid, x, y, w, h, col
{
    var drx = 15 + (argument[1] * 8);
    var dry = 16 + (argument[2] * 8);
    var _cl = global.utilityColor[3];
    var _cg = global.utilityColor[3];
    var _ba = global.utilityAlphaBack * draw_get_alpha();
    var _ga = global.utilityAlphaGlow * draw_get_alpha();
    var _ea = global.utilityAlphaBorder * draw_get_alpha();
    if (argument_count > 5) { if (argument[5] != 3) { _cl = global.utilityColorHilight; _ba *= 8; _ga *= 4; _ea *= 4; } }
    // BACK
    Utility("sprite", s1x1, 0, drx + 1, dry + 1, (argument[3] * 8) - 1, (argument[4] * 8) - 1, 0, _cl, _ba);
    // GLOW
    Utility("sprite", s1x1, 0, drx - 1, dry - 1, (argument[3] * 8) + 3, 3, 0, _cg, _ga);
    Utility("sprite", s1x1, 0, drx - 1, dry + (argument[4] * 8) - 1, (argument[3] * 8) + 3, 3, 0, _cg, _ga);
    Utility("sprite", s1x1, 0, drx - 1, dry + 2, 3, (argument[4] * 8) - 3, 0, _cg, _ga);
    Utility("sprite", s1x1, 0, drx + (argument[3] * 8) - 1, dry + 2, 3, (argument[4] * 8) - 3, 0, _cg, _ga);
    // BORDER
    Utility("sprite", s1x1, 0, drx, dry, (argument[3] * 8) + 1, 1, 0, _cg, _ea);
    Utility("sprite", s1x1, 0, drx, dry + (argument[4] * 8), (argument[3] * 8) + 1, 1, 0, _cg, _ea);
    Utility("sprite", s1x1, 0, drx, dry + 1, 1, (argument[4] * 8) - 1, 0, _cg, _ea);
    Utility("sprite", s1x1, 0, drx + (argument[3] * 8), dry + 1, 1, (argument[4] * 8) - 1, 0, _cg, _ea);
}
else if (argument[0] == "linev")
{
    var drx = 15 + (argument[1] * 8);
    var dry = 16 + (argument[2] * 8);
    var _cg = global.utilityColor[3];
    Utility("sprite", s1x1, 0, drx - 1, dry + 2, 3, (argument[3] * 8) - 3, 0, _cg, global.utilityAlphaGlow * global.utilitySpriteAlpha);
    Utility("sprite", s1x1, 0, drx, dry + 1, 1, (argument[3] * 8) - 1, 0, _cg, global.utilityAlphaBorder * global.utilitySpriteAlpha);
}
else if (argument[0] == "lineh")
{
    var drx = 15 + (argument[1] * 8);
    var dry = 16 + (argument[2] * 8);
    var _cg = global.utilityColor[3];
    Utility("sprite", s1x1, 0, drx - 1 + 1, dry - 1, (argument[3] * 8) + 3 - 2, 3, 0, _cg, global.utilityAlphaGlow * global.utilitySpriteAlpha);
    Utility("sprite", s1x1, 0, drx + 1, dry, (argument[3] * 8) + 1 - 2, 1, 0, _cg, global.utilityAlphaBorder * global.utilitySpriteAlpha);
}
else if (argument[0] == "text 2c") // "text 2b", x, y, text, color, halign, valign
{
    var _wid = 9999;
    draw_set_font(global.fn_2c);
    if (argument_count > 4) draw_set_color(global.utilityColor[argument[4]]); else draw_set_color(c_white);
    if (argument_count > 5) draw_set_halign(argument[5]); else draw_set_halign(0);
    if (argument_count > 6) draw_set_valign(argument[6]); else draw_set_valign(0);
    if (argument_count > 7) _wid = argument[7];
    draw_set_alpha(global.utilityTextAlpha * global.utilityAlpha);
    Utility("text", argument[1], argument[2], argument[3], -1, _wid);
    draw_set_alpha(1.0 * global.utilityAlpha);
}
else if (argument[0] == "text 1b") // "text 2b", x, y, text, color, halign, valign
{
    var _wid = 9999;
    draw_set_font(global.fn_1b);
    if (argument_count > 4) draw_set_color(global.utilityColor[argument[4]]); else draw_set_color(c_white);
    if (argument_count > 5) draw_set_halign(argument[5]); else draw_set_halign(0);
    if (argument_count > 6) draw_set_valign(argument[6]); else draw_set_valign(0);
    if (argument_count > 7) _wid = argument[7];
    draw_set_alpha(global.utilityTextAlpha * global.utilityAlpha);
    Utility("text", argument[1], argument[2], argument[3], -1, _wid);
    draw_set_alpha(1.00 * global.utilityAlpha);
}
else if (argument[0] == "text 1b x2") // "text 1b x2", x, y, text, color, halign, valign AT x2 SCALE
{
    var _wid = 9999;
    draw_set_font(global.fn_1b);
    if (argument_count > 4) draw_set_color(global.utilityColor[argument[4]]); else draw_set_color(c_white);
    if (argument_count > 5) draw_set_halign(argument[5]); else draw_set_halign(0);
    if (argument_count > 6) draw_set_valign(argument[6]); else draw_set_valign(0);
    if (argument_count > 7) _wid = argument[7];
    draw_set_alpha(global.utilityTextAlpha * global.utilityAlpha);
    Utility("text scale", argument[1], argument[2], argument[3], -1, _wid, 2, 2);
    draw_set_alpha(1.00 * global.utilityAlpha);
}
else if (argument[0] == "text smallc") // "text smallc", x, y, text, color, halign, valign
{
    var _wid = 9999;
    draw_set_font(global.fn_smallc);
    if (argument_count > 4) draw_set_color(global.utilityColor[argument[4]]); else draw_set_color(c_white);
    if (argument_count > 5) draw_set_halign(argument[5]); else draw_set_halign(0);
    if (argument_count > 6) draw_set_valign(argument[6]); else draw_set_valign(0);
    if (argument_count > 7) _wid = argument[7];
    draw_set_alpha(global.utilityTextAlpha * global.utilityAlpha);
    Utility("text", argument[1], argument[2], argument[3], -1, _wid);
    draw_set_alpha(1.00 * global.utilityAlpha);
}
else if (argument[0] == "text 7ocs") // "text 2b", x, y, text, color, halign, valign, width
{
    var _wid = 9999;
    draw_set_font(global.fn_7ocs);
    if (argument_count > 4) draw_set_color(global.utilityColor[argument[4]]); else draw_set_color(c_white);
    if (argument_count > 5) draw_set_halign(argument[5]); else draw_set_halign(0);
    if (argument_count > 6) draw_set_valign(argument[6]); else draw_set_valign(0);
    if (argument_count > 7) _wid = argument[7];
    draw_set_alpha(global.utilityTextAlpha * global.utilityAlpha);
    Utility("text", argument[1], argument[2], argument[3], -1, _wid);
    draw_set_alpha(1.00 * global.utilityAlpha);
}
else if (argument[0] == "text 12ocsd") // "text 2b", x, y, text, color, halign, valign, width
{
    var _wid = 9999;
    draw_set_font(global.fn_12ocsd);
    if (argument_count > 4) draw_set_color(global.utilityColor[argument[4]]); else draw_set_color(c_white);
    if (argument_count > 5) draw_set_halign(argument[5]); else draw_set_halign(0);
    if (argument_count > 6) draw_set_valign(argument[6]); else draw_set_valign(0);
    if (argument_count > 7) _wid = argument[7];
    draw_set_alpha(global.utilityTextAlpha * global.utilityAlpha);
    Utility("text", argument[1], argument[2], argument[3], -1, _wid);
    draw_set_alpha(1.00 * global.utilityAlpha);
}
else if (argument[0] == "text smelt") // "text 2b", x, y, text, color, halign, valign, width
{
    var _wid = 9999;
    draw_set_font(global.utilityFontSmelt);
    if (argument_count > 4) draw_set_color(global.utilityColor[argument[4]]); else draw_set_color(c_white);
    if (argument_count > 5) draw_set_halign(argument[5]); else draw_set_halign(0);
    if (argument_count > 6) draw_set_valign(argument[6]); else draw_set_valign(0);
    if (argument_count > 7) _wid = argument[7];
    draw_set_alpha(global.utilityTextAlpha * global.utilityAlpha);
    Utility("text", argument[1], argument[2], argument[3], -1, _wid);
    draw_set_alpha(1.00 * global.utilityAlpha);
}
else if (argument[0] == "text") // x, y, text, sep?, wid?, xscale?, yscale?
{
    var _se = -1;
    var _wd = 9999;
    if (argument_count > 4) _se = argument[4];
    if (argument_count > 5) _wd = argument[5];
    draw_text_ext(vxv + argument[1], vyv + argument[2], argument[3], _se, _wd);
    draw_set_blend_mode(bm_add);
    _al = draw_get_alpha();
    draw_set_alpha((0.04 + random(0.02)) * global.utilityAlpha);
    draw_text_ext(vxv + argument[1] + 1, vyv + argument[2], argument[3], _se, _wd);
    draw_text_ext(vxv + argument[1] - 1, vyv + argument[2], argument[3], _se, _wd);
    draw_text_ext(vxv + argument[1], vyv + argument[2] + 1, argument[3], _se, _wd);
    draw_text_ext(vxv + argument[1], vyv + argument[2] - 1, argument[3], _se, _wd);
    draw_set_alpha(_al * global.utilityAlpha);
    draw_set_blend_mode(bm_normal);
}
else if (argument[0] == "text scale") // x, y, text, sep?, wid?, xscale?, yscale?
{
    var _se = -1;
    var _wd = 9999;
    var _xs = 1;
    var _ys = 1;
    if (argument_count > 4) _se = argument[4];
    if (argument_count > 5) _wd = argument[5];
    if (argument_count > 6) _xs = argument[6];
    if (argument_count > 7) _ys = argument[7];
    draw_text_ext_transformed(vxv + argument[1], vyv + argument[2], argument[3], _se, _wd, _xs, _ys, 0);
    draw_set_blend_mode(bm_add);
    _al = draw_get_alpha();
    draw_set_alpha((0.04 + random(0.02)) * global.utilityAlpha);
    draw_text_ext_transformed(vxv + argument[1] + 1, vyv + argument[2], argument[3], _se, _wd, _xs, _ys, 0);
    draw_text_ext_transformed(vxv + argument[1] - 1, vyv + argument[2], argument[3], _se, _wd, _xs, _ys, 0);
    draw_text_ext_transformed(vxv + argument[1], vyv + argument[2] + 1, argument[3], _se, _wd, _xs, _ys, 0);
    draw_text_ext_transformed(vxv + argument[1], vyv + argument[2] - 1, argument[3], _se, _wd, _xs, _ys, 0);
    draw_set_alpha(_al * global.utilityAlpha);
    draw_set_blend_mode(bm_normal);
}
else if (argument[0] == "draw status")
{
    // Hoopz
    Utility("tab", 00, 00, 5, "X114JAM9");
    drx = 15; dry = 16 + 8; //34 50
    
    Utility("sprite", sMenuUtilityFaces, 0, drx + 1 + 4, dry + 0, 1, 1, 0, c_white, global.utilitySpriteAlpha);
    Utility("grid", 0, 1, 9, 6);
    
    // Vitals
    gdx = 09;
    Utility("tab", gdx, 00, 5, "VITALS");
    drx = 15 + (gdx * 8); dry = 16 + 8;
    Utility("grid", gdx, 1, 5, 5);
    dry -= 4;
    drw = 8; drh = 6;
    Utility("lineh", gdx, 1 + (1 * 2), 5);
    Utility("text smallc", drx + 2, dry + 6, "HP", 2, 0, 0);
    Utility("text 2c", drx + 24 - 2, dry + 9, valStt[0], 1, 1, 0);
    dry += 16;
    Utility("text smallc", drx + 2, dry + 6, "LEVEL", 2, 0, 0);
    Utility("text 1b", drx + 24 - 2, dry + 9 + 2, sttVal[7], 1, 1, 0);
    
    // GLAMP
    gdh = 5;
    drx = 15; dry = 16;
    Utility("tab", 30, 05, 5, "STATS");
    drw = 4; drh = 6; //6;
    drx += ((6 + 9) * 8);
    plu = 4;
    dry += 2;
    dry -= 12;
    Utility("grid", 15, 0, 4 * 5, gdh);
    for (i = 0; i < 5; i += 1)
    {
        if (i > 0) Utility("linev", 15 + (i * 4), 0, gdh);
        Utility("text 1b", drx + ((drw / 2) * 8) + 4, dry + 28 + 2 + plu + 2 - 2 - 8, sttVal[i + 1], 1, 1, 0);
        Utility("text 1b", drx + ((drw / 2) * 8) - 8, dry + 9 + plu - 3, string_copy(sttNam[i + 1], 1, 1), 2, 1, 0);
        Utility("text smallc", drx + ((drw / 2) * 8) + 1, dry + 8 + 29 + 9 + plu - 6, string_upper(sttNam[i + 1]), 2, 1, 0);
        drx += ((drw + 0) * 8);
    }
    
    // DNA
    drx = 15; dry = 16 + (7 * 8);
    Utility("grid", 19, 7, 16, 3);
    Utility("tab", 19, 6, 9, "TRANSHUMANISM");
    dx = 15 + 1 + (19 * 8) + 3;
    dy = 16 + (7 * 8);
    Utility("draw dna", dx, dy, dnaBio, dnaCyber, dnaCosmic, dnaZauber);
    
    // Class
    Utility("tab", 13, 7, 5, "PERSONAE");
    Utility("grid", 0, 8, 18, 2);
    drx = 15 + (9 * 8); dry = 16 + (8 * 8) + 4;
    Utility("text 2c", drx, dry, "Forlorn Youngster", 1, 1, 0);
    
    // Resistance
    gdy = 19;
    Utility("tab", 0, gdy, 7, "RESISTANCES");
    Utility("grid", 0, gdy + 1, 14, 6);
    Utility("grid", 14, gdy + 1, 4, 5);
    Utility("linev", 7, gdy + 1, 6);
    // Defense
    drx = 15 + (0.5 * 8); dry = 16 + ((gdy + 1) * 8);
    drw = 6 * 8; drh = 6 * 8;
    Utility("sprite", sMenuUtilityDefense, 0, drx + 4, dry + 8 - 2, 1, 1, 0, c_white, global.utilitySpriteAlpha);
    stv = eqpRes[1, (eqpJer * 6)] + eqpRes[0, (eqpHel * 6)];
    Utility("text 1b", drx + (drw / 2), dry + (drh / 2) + 6 + 2, string(stv), 1, 1, 1);
    // Pentagon
    for (i = 0; i < 5; i += 1) 
    {
        resVal[i] = clamp(eqpRes[1, (eqpJer * 6) + (i + 1)] + eqpRes[0, (eqpHel * 6) + (i + 1)], -100, 200);
    }
    drx = 15 + (7 * 8); dry = 16 + ((gdy + 1) * 8);
    Utility("draw resistance", drx + (3.5 * 8), dry + (3 * 8), resVal[0], resVal[1], resVal[2], resVal[3], resVal[4]);
    // 5 element blips
    dw = 5 * 8; dh = 8;
    drx = 15 + (14 * 8); dry = 16 + ((gdy + 1) * 8);
    for (i = 0; i < 5; i += 1)
    {
        Utility("sprite", sMenuUtilityResistanceBlip, 0, drx + 3, dry + 3, 1, 1, 0, rssCol[i + 1], global.utilitySpriteAlpha);
        stv = eqpRes[1, (eqpJer * 6) + (i + 1)] + eqpRes[0, (eqpHel * 6) + (i + 1)];
        Utility("text smallc", drx + (dw / 2), dry + (dh / 2) + 1, string(stv), 1, 1, 1);
        dry += 8;
    }
    
    // EQUIPMENT
    gdx = 19; gdy = 16;
    Utility("tab", gdx, gdy, 6, "EQUIPMENT");
    
    Utility("grid", gdx, gdy + 1, 16 - 3, 9);
    Utility("lineh", gdx, gdy + 1 + 3, 13);
    Utility("lineh", gdx, gdy + 1 + 5, 13);
    Utility("lineh", gdx, gdy + 1 + 7, 13);
    drx = 15 + (gdx * 8); dry = 16 + ((gdy + 1 + 3) * 8); drw = 13 * 8;
    Utility("text 2c", drx + (drw / 2), dry + 4, eqpNam[1, eqpJer], 1, 1, 0);
    dry += 2 * 8;
    Utility("text 2c", drx + (drw / 2), dry + 4, eqpNam[0, eqpHel], 1, 1, 0);
    
    // GUN
    drx = 15 + (gdx * 8) - (2 * 8); dry = 16 + ((gdy + 1) * 8); drw = 13 * 8;
    eqpGun = Gun("current");
    if (eqpGun != NULL && Gun("exists", eqpGun))
    {
        Gun("draw index", eqpGun, vxv + drx + 16 + 1, vyv + dry, 1, 1, 0, c_white, global.utilitySpriteAlpha);
        Utility("text 2c", drx + 16 + 48 + 16 - 2, dry + 20, string(round(Gun("weight", eqpGun))) + "~", 1, 2, 1); // Weight
        drx += 8 + 8 + 8;
        drx += 32 + 24;
        Utility("text 1b", drx + 16 + 4, dry + 13, Gun("name", eqpGun), 1, 1, 1); // Gun name
    }
    else
    {
        drx += 6 * 8;
        Utility("text 1b", drx + 16 + 4, dry + 13, "Unarmed", 1, 1, 1);
    }
    
    // Draw scale
    Utility("tab", gdx + 11 + 2, gdy + 9, 3, "WGT");
    Utility("grid", gdx + 11 + 2, gdy + 9 - 5, 3, 5);
    image_alpha = global.utilitySpriteAlpha;
    HUD("draw scale", vxv + 277, vyv + 181, sclMgt, sclWgt, 1, global.utilityColor[0]);
    image_alpha = 1;
    
    // MAIN INFO BLOCK
    gdx = 0; gdy = 10;
    Utility("tab", gdx + 13, gdy + 8, 5, "DATUM");
    Utility("grid", gdx, gdy + 1, 18, 7);
    Utility("lineh", gdx, gdy + 1 + 2, 18);
    Utility("linev", gdx + 6, gdy + 1, 2);
    Utility("linev", gdx + 11, gdy + 1, 2);
    Utility("linev", gdx + 11, gdy + 1 + 2, 5);
    Utility("lineh", gdx + 11, gdy + 1 + 5, 7);
    drx = 15 + (gdx * 8); dry = 16 + ((gdy + 1) * 8);
    Utility("text smallc", drx + 2, dry + 2, "GUMPTION", 2, 0, 0);
    Utility("text smallc", drx + 0 + (4 * 8), dry + 2 + 8, "73%", 1, 0, 0);
    drx += 6 * 8;
    Utility("text smallc", drx + 2, dry + 2, "GUMSHOE", 2, 0, 0);
    Utility("text smallc", drx + 2, dry + 2 + 8, "LVL", 2, 0, 0);
    Utility("text smallc", drx + 2 + (4 * 8), dry + 2 + 8, "1", 1, 0, 0);
    drx += 5 * 8;
    Utility("text smallc", drx + 2, dry + 2, "FREE", 2, 0, 0);
    Utility("text smallc", drx + 2, dry + 2 + 8, "WILL", 2, 0, 0);
    drx += 4 * 8;
    Utility("text 2c", drx + (1.5 * 8) - 4, dry + 9, "ON", 1, 1, 1);
    drx = 15 + (gdx * 8) + (11 * 8); dry = 16 + ((gdy + 1) * 8) + (2 * 8);
    Utility("text smallc", drx + 2, dry + 2, "POISE", 2, 0, 0);
    Utility("text smallc", drx + 2 + 1, dry + 2 + 8 + 4, "|--|--|--|--|--|", 1, 0, 0);
    Utility("text smallc", drx + 2 + 3 + 7, dry - 10 + (2 * 8) + 4, "*", 1, 0, 0);
    Utility("text smallc", drx + 2 + 3 + 7, dry + 0 + (2 * 8) + 4, "*", 1, 0, 0);
    dry += 3 * 8;
    Utility("text smallc", drx + 2, dry + 2, "BEARDSTATE", 2, 0, 0);
    Utility("text smallc", drx + 2 + (2 * 8), dry + 2 + 8, "FOLLICLED", 1, 0, 0);
    drx = 15 + (gdx * 8); dry = 16 + ((gdy + 1 + 2) * 8); drw = 11 * 8; drh = 5 * 8;
    Utility("text smallc", drx + (drw / 2), dry + 2, "CURRENT MOOD", 2, 1, 0);
    Utility("text 2c", drx + (drw / 2), dry + 7 + 14, "CRESTFALLEN", 1, 1, 1);
    
    // SIDE INFO BLOCK
    gdx = 18; gdy = 11;
    Utility("grid", gdx, gdy, 10 + 7, 4);
    Utility("linev", gdx + 10, gdy, 4);
    drx = 15 + (gdx * 8); dry = 16 + (gdy * 8); drw = 10 * 8;
    Utility("text 1b", drx + (drw / 2), dry + 7 + 10, "??? ???", 2, 1, 1);
    drx = 15 + (gdx * 8) + (10 * 8); dry = 16 + (gdy * 8);
    Utility("text smallc", drx + 2, dry + 2, "VOLTAGE", 2, 0, 0);
    Utility("text smallc", drx + 2 + (5 * 8), dry + 2 + 8, "15.1", 1, 0, 0);
    dry += 2 * 8;
    Utility("text smallc", drx + 2, dry + 2, "AMPERAGE", 2, 0, 0);
    Utility("text smallc", drx + 2 + (5 * 8), dry + 2 + 8, "11", 1, 0, 0);
}
else if (argument[0] == "draw brain")
{
    // Hide
    menuID = 8;
    menuText[menuID, 1] = "";
    if (Utility("experience to next") <= 0) menuText[menuID, 1] = "Level Up";
    
    /// 5 - Brain Overview
    drx = 15 + (1 * 8); dry = 16 + (1 * 8);
    drw = 16 * 8; drh = 23 * 8;
    Utility("tab", 12, 24, 5, "BRAIN");
    Utility("grid", 1, 1, 16, 23);
    brnWid = 120; brnHei = 136;
    Utility("sprite", sMenuBrain, 0, drx + (drw / 2) - (brnWid / 2), dry + (drh / 2) - (brnHei / 2), 1, 1, 0, c_white, global.utilitySpriteAlpha);
    pxh = (brnHei / 1440) * floor(scr_savedata_get("player.xp.questxp"));
    pxha = abs(brnHei - pxh);
    draw_sprite_part_ext(sMenuBrain, 1, 0, brnHei - pxh, brnWid, pxh, drx + vxv + (drw / 2) - (brnWid / 2), dry + vyv + (drh / 2) - (brnHei / 2) + pxha, 1, 1, c_red, global.utilitySpriteAlpha);
    pxh = brnHei * (Vidcon("unboxed total") / Vidcon("game total"));
    pxha = abs(brnHei - pxh);
    draw_sprite_part_ext(sMenuBrain, 2, 0, brnHei - pxh, brnWid, pxh, drx + vxv + (drw / 2) - (brnWid / 2), dry + vyv + (drh / 2) - (brnHei / 2) + pxha, 1, 1, c_blue, global.utilitySpriteAlpha);
    Utility("text smallc", drx + (2 * 8) + 12 + 8, dry + (21 * 8) - 3, "WORK", 1, 1, 1);
    Utility("text smallc", drx + (12 * 8) + 2 - 7, dry + (2 * 8) + 5, "PLAY", 1, 1, 1);
    
    ////////////////////////////////////// EXPERIENCE
    drx = 15 + (18 * 8); dry = 16 + (1 * 8);
    Utility("tab", 18, 5, 6, "EXPERIENCE");
    Utility("grid", 18, 1, 6, 4);
    Utility("text 1b", drx + (4 * 8) + 1 - 8, dry + (2 * 8) + 2, Utility("total experience"), 0, 1, 1);
    
    
    ////////////////////////////////////// TO NEXT
    //Utility("linev", 18 + 6, 1, 4); 
    Utility("grid", 18 + 6 + 1, 1, 3, 4);
    Utility("tab", 18 + 6 + 1, 5, 3, "NEXT");
    Utility("text 1b", drx + (9 * 8) + 1 - 5, dry + (2 * 8) + 2, Utility("experience to next"), 0, 1, 1);
    
    ////////////////////////////////////// LEVEL
    drx = 15 + (27 * 8); dry = 16 + (1 * 8);
    Utility("tab", 29, 5, 5, "LEVEL");
    //Utility("linev", 29, 1, 4); 
    Utility("grid", 29, 1, 5, 4);
    if (Utility("experience to next") <= 0)  wcl = 0; else wcl = 6;
    Utility("text 1b", drx + (3 * 8) + 1 + 4 + wcl, dry + (2 * 8) + 2, sttVal[7], 0, 1, 1);
    // Level Arrow
    drx = 15 + (32 * 8); dry = 16 + (2 * 8);
    lvlDir += dt() * 20;// * 20;
    if (Utility("experience to next") <= 0) Utility("sprite", sMenuUtilityLevelUp, 0, drx, dry, 1, 1, 0, merge_color(c_white, c_lime, 1), (0.4 + lengthdir_x(0.4, lvlDir)) * global.utilitySpriteAlpha);
    
    //////////////////////////////////// WORK
    Utility("tab", 29, 15, 5, "WORK");
    // HELPER QUOTIENT
    drx = 15 + (18 * 8); dry = 16 + (7 * 8);
    Utility("grid", 18, 7, 16, 8);
    Utility("text smallc", drx + (5 * 8) + 1, dry + 2 + (2 * 8), "HELPER QUOTIENT", 1, 1, 1);
    Utility("text 1b", drx + (12.5 * 8) + 1, dry + (2 * 8) + 2, string_format(scr_savedata_get("quest.time") - ClockTime("get"), 0, 2), 0, 1, 1);
    // EXPERIENCE GAINED
    drx = 15 + (18 * 8); dry = 16 + (11 * 8);
    Utility("lineh", 18, 11, 16);
    Utility("text 1b", drx + (3 * 8) + 1 - 4, dry + (2 * 8) + 2, floor(scr_savedata_get("player.xp.questxp")), 0, 1, 1);
    Utility("text smallc", drx + (10 * 8) + 1 + 4, dry + 2 + (2 * 8), "EXPERIENCE GAINED", 1, 1, 1);
    
    //////////////////////////////////// VIDCONS
    Utility("tab", 18, 16, 5, "PLAY");
    // VIDCONS
    drx = 15 + (18 * 8); dry = 16 + (17 * 8);
    Utility("grid", 18, 17, 16, 8);
    Utility("text smallc", drx + (3 * 8) + 1 + 1, dry + 2 + (2 * 8) - 1, "VIDCONS", 1, 1, 1);
    Utility("text smallc", drx + (8 * 8) + 1 + 1, dry + 2 + (3 * 8) - 1, "OWNED", 1, 1, 1);
    Utility("text 1b", drx + (8 * 8) + 1, dry + (1.5 * 8) + 2, string(Vidcon("have total")), 0, 1, 1);
    Utility("text smallc", drx + ((13) * 8) + 1, dry + 2 + (3 * 8) - 1, "UNBOXED", 1, 1, 1);
    Utility("text 1b", drx + (13 * 8) + 1, dry + (1.5 * 8) + 2, string(Vidcon("unboxed total")), 0, 1, 1);
    // EXPERIENCE GAINED
    drx = 15 + (18 * 8); dry = 16 + (21 * 8);
    Utility("lineh", 18, 21, 16);
    Utility("text smallc", drx + (10 * 8) + 1 + 4, dry + 2 + (2 * 8), "EXPERIENCE GAINED", 1, 1, 1);
    Utility("text 1b", drx + (3 * 8) + 1 - 4, dry + (2 * 8) + 2, string(Vidcon("experience")), 0, 1, 1);
}
else if (argument[0] == "draw brain level")
{
    ply = 2; // Plus on Y, the 2c letter got shifted somehow
    // Create
    if (subscriptCreate == 0)
    {
        for (var iii = 0; iii < 5; iii += 1) lvlVal[iii] = 0;
        subscriptCreate = 1;
        sttLvl = 3;
    }
    
    // Input
    if (doAction != "")
    {
        var sttInd = -1;
        if (doAction == "Guts") sttInd = 0;
        if (doAction == "Luck") sttInd = 1;
        if (doAction == "Acrobatic") sttInd = 2;
        if (doAction == "Might") sttInd = 3;
        if (doAction == "Piety") sttInd = 4;
        if (sttInd != -1)
        {
            if (lvlVal[sttInd] == 3 && sttLvl == 2) { lvlVal[sttInd] = 5; sttLvl = 0; }
            else if (lvlVal[sttInd] == 0) 
            { 
                lvlVal[sttInd] = sttLvl;
                if (sttLvl == 3) sttLvl = 2;
                else if (sttLvl == 2) sttLvl = 1;
                else sttLvl = 0;
            }
            
        }
        else // Confirm / Level Up
        {
            for (i = 1; i < 6; i += 1)
            {
                sttVal[i] += lvlVal[i - 1];
            }
            sttVal[7] += 1;
            Utility("hoopz stats set");
            Utility("go back");
            exit;
        }
    }
    menuID = 80;
    if (sttLvl == 0)
    {
        menuText[menuID, 5] = "Confirm"; menuLink[menuID, 5] = 800; menuClick[menuID, 5] = 1;
    }
    else
    {
        menuText[menuID, 5] = "";
    }
    
    // CYBIOTIC AUGMENTATION REGULATOR
    drx = 15 + (0 * 8); dry = 16 + (0 * 8);
    Utility("grid", 0, 0, 35, 2);
    Utility("text 2c", drx + (17.5 * 8), dry + (1 * 8) + ply, "CYBIOTIC AUGMENTATION REGULATOR", 2, 1, 1);
    
    // HOOPZ
    drx = 15 + (0 * 8); dry = 16 + (6 * 8);
    dw = 10 * 8; dh = 18 * 8;
    Utility("grid", 0, 6, 10, 19);
    Utility("sprite", sMenuUtilityHoopzFull, 0, drx + (dw / 2), dry + (dh / 2) + 4, 1, 1, 0, c_white, global.utilitySpriteAlpha);
    
    // GLAMP STATS
    drx += 10 * 8;
    dw = 4 * 8; dh = 3 * 8;
    Utility("grid", 10, 6, 4, (6 * 3));
    for (i = 0; i < 6; i += 1)
    {
        Utility("lineh", 10, 6 + ((i + 1) * 3), 4);
        Utility("text smallc", drx + (dw / 2) + 1, dry + 2, sttNam[i], 1, 1, 0);
        stc = comCol[1];
        stv = sttVal[i];
        if (i == 0) stv = Utility("hoopz weight");
        if (i > 0) { stv += lvlVal[i - 1]; if (lvlVal[i - 1] != 0) stc = comCol[2]; }
        Utility("text 2c", drx + (dw / 2), dry + (dh / 2) + 5, stv, stc, 1, 1);
        dry += 3 * 8;
    }
    
    // LEVEL
    gdx = 0; gdy = 3; gdw = 14; gdh = 2;
    drx = 15 + (gdx * 8); dry = 16 + (gdy * 8); drh = gdh * 8; drw = gdw * 8;
    Utility("grid", gdx, gdy, gdw, gdh);
    if (sttLvl != 0) { wcl = 2; wcp = 0; }
    else { wcp = 1; wcl = 1; Utility("grid", gdx, gdy, gdw, gdh, 0); }
    Utility("text 2c", drx + (drw / 2), dry + (drh / 2) + ply, "LEVEL " + string(sttVal[7] + wcp), wcl, 1, 1);
    
    // Bandwidth
    gdx = 15; gdy = 3; gdw = 10; gdh = 2;
    drx = 15 + (gdx * 8); dry = 16 + (gdy * 8); drh = gdh * 8; drw = gdw * 8;
    Utility("grid", gdx, gdy, gdw + 9, gdh);
    if (sttLvl == 0) wcl = 2; 
    else 
    { 
        wcl = 1; 
        Utility("grid", gdx, gdy, 10, gdh, 0); 
        if (sttLvl == 3) Utility("grid", gdx + 10, gdy, 3, gdh, 0);
        if (sttLvl == 2) Utility("grid", gdx + 13, gdy, 3, gdh, 0);
        if (sttLvl == 1) Utility("grid", gdx + 16, gdy, 3, gdh, 0);
    }
    Utility("text 2c", drx + (drw / 2), dry + (drh / 2) + ply, "BANDWIDTH", wcl, 1, 1);
    gdx += 10; gdw = 3;
    for (i = 0; i < 3; i += 1)
    {
        drx = 15 + (gdx * 8); dry = 16 + (gdy * 8); drh = gdh * 8; drw = gdw * 8;
        Utility("linev", gdx, gdy, gdh); //gdw, gdh);
        if (sttLvl == 3 - i) wcl = 1; else wcl = 2;
        Utility("text 2c", drx + (drw / 2), dry + (drh / 2) + ply, string(3 - i), wcl, 1, 1);
        gdx += gdw;
    }
    
    // Do Glamper
    gdx = 15; gdy = 6;
    for (i = 0; i < 5; i += 1)
    {
        Utility("grid", gdx, gdy, 5 + 14, 3);
        if (lvlVal[i] == 0) wcl = 1; else wcl = 0;
        Utility("text 2c", 15 + (gdx * 8) + (2.5 * 8), 16 + (gdy * 8) + (1.5 * 8) + 1, sttNam[1 + i], wcl, 1, 1); // Guts
        Utility("text 1b", 15 + ((gdx + 5) * 8) + (1.5 * 8), 16 + (gdy * 8) + (1.5 * 8) + 1, string(lvlVal[i]), wcl, 1, 1); // 0, 1, 2, 3, 4, 5
        if (lvlVal[i] != 5) wcl = 1; else wcl = 0;
        Utility("text 1b", 15 + ((gdx + 16) * 8) + (1.5 * 8), 16 + (gdy * 8) + (1.5 * 8) + 1, "OC", wcl, 1, 1);
        // linev
        draw_set_color(c_lime);
        drx = 15 + (gdx * 8); dry = 16 + (gdy * 8); drh = 3 * 8; drw = 8 * 8;
        saws = max(3, 3 + (lvlVal[i] * 3));
        draw_set_alpha(0.01 * global.utilityAlpha);
        // SAW TOOTH
        wavTim[i] += (dt_sec() * 90) + (dt_sec() * ((lvlVal[i] * (lvlVal[i] / 2)) * 32)); 
        drx += 8 * 8;
        drx += 1;
        if (lvlVal[i] == 0) dvv = 1; else dvv = lvlVal[i];
        for (xxx = 0; xxx < (8 * 8) - 2; xxx += 1 / dvv)
        {
            wav = lengthdir_x(0.9, wavTim[i] + (xxx * 16 * (lvlVal[i] * 0.5))); // 6 is wave
            wdx = (drx + xxx) - 0.5 + random(1);
            wdy = (dry + (drh / 2) + (wav * (2 * lvlVal[i]))) - 0.5 + random(1);
            if (lvlVal[i] == 0) wcl = global.utilityColor[1]; else wcl = global.utilityColor[0]; //merge_color(global.utilityColor[1], global.utilityColor[0], lvlVal[i] / 5);
            Utility("sprite", s1x1, 0, wdx, wdy, 1, 1, 0, wcl, (0.7 + random(0.1)) * global.utilitySpriteAlpha); //0.8 wave strength
        }
        draw_set_alpha(1 * global.utilityAlpha);
        Utility("linev", gdx + 16, gdy, 3); //3, 3);
        
        Utility("linev", gdx + 5, gdy, 3); //3, 3);
        Utility("linev", gdx + 8, gdy, 3); //8, 3);
        gdy += 4;
    }
}
else if (argument[0] == "draw brain vidcon") ////////////////////////////////////////////////////////////////////
{
    //Scroll
    if (global.keyinput_type == KEYINPUT_KEYBOARD_MOUSE)
    {
        if (alpOvr == 0)
        {
            if (mouse_wheel_up()) vidconScroll = max(0, vidconScroll - 1);
            if (mouse_wheel_down()) vidconScroll = min(vidconScrollMax, vidconScroll + 1);
        }
        else
        {
            if (alpRes != -1)
            {
                if (alpRes == 1) Vidcon("unbox", vidconIndex);
                alpOvr = 0;
                alpRes = -1;
            }
        }
    }
    else if (actionWait == 0) // Gamepad
    {
        if (global.utilityFocus == "main")
        {
            if (Utility("key", "up"))
            {
                if (vidconSelect == 0 && vidconScroll > 0) vidconScroll -= 1; else vidconSelect -= 1;
                if (vidconSelect < 0 && vidconScroll == 0) { vidconSelect = 4; vidconScroll = vidconScrollMax; }
            }
            if (Utility("key", "down"))
            {
                if (vidconSelect == 4 && vidconScroll < vidconScrollMax) vidconScroll += 1; else vidconSelect += 1;
                if (vidconSelect > 4 && vidconScroll == vidconScrollMax) { vidconSelect = 0; vidconScroll = 0; }
            }
            if (Utility("key", "action")) 
            {
                if (Vidcon("have", vidconIndex) && Vidcon("is boxed", vidconIndex)) Utility("focus side");
            }
        }
        else if (global.utilityFocus == "side")
        {
            if (alpOvr == 0)
            {
                if (Utility("key", "cancel")) Utility("focus main");
            }
            else
            {
                if (Utility("key", "cancel")) { alpOvr = 0; alpRes = -1; actionWait = 2; }
                if (alpRes != -1)
                {
                    if (alpRes == 1) { Vidcon("unbox", vidconIndex); global.utilityFocus = "main"; }
                    alpOvr = 0;
                    alpRes = -1;
                }
            }
        }
    }
    if (doAction == "Unbox" && vidconIndex != -1 && Vidcon("is boxed", vidconIndex)) Utility("choose", "Are you sure you want to unbox " + Vidcon("name", vidconIndex) + "?");
    vidconSelect = clamp(vidconSelect, 0, 4);
    
    // Hide Unbox
    menuID = 81;
    menuText[menuID, 0] = "";
    if (Vidcon("have", vidconIndex)) { if (Vidcon("is boxed", vidconIndex)) menuText[menuID, 0] = "Unbox"; }
    
    /////////////////// GAMERSCORE
    gdx = 0; gdy = 0; gdw = 16; gdh = 3;
    drx = 15 + (gdx * 8); dry = 16 + (gdy * 8);
    Utility("grid", gdx, gdy, gdw, gdh);
    Utility("text smallc", drx + (10 * 8) - 1 + 5, dry + 2 + (1.5 * 8) - 1, "EXPERIENCE GAINED", 0, 1, 1);
    Utility("text 1b", drx + (3 * 8) -5 + 2, dry + (1.5 * 8) + 1, string(Vidcon("experience")), 0, 1, 1);
    Utility("tab", gdx, gdy + 3, 7, "GAMERSCORE");
    
    /// VIDCONS
    gdx = 16; gdy = 0; gdw = 16; gdh = 3;
    gdx = 0; gdy = 5; gdw = 16; gdh = 3;
    drx = 15 + (gdx * 8); dry = 16 + (gdy * 8);
    Utility("grid", gdx, gdy, gdw, gdh);
    Utility("linev", gdx + 8, gdy, gdh);
    Utility("text smallc", drx + (3 * 8) - 5, dry + 2 + (1.5 * 8) - 1, "OPENED", 0, 1, 1);
    Utility("text 1b", drx + (7 * 8) -5, dry + (1.5 * 8) + 1, string(Vidcon("unboxed total")), 0, 1, 1);
    // SEALED
    Utility("text smallc", drx + (11 * 8) - 5, dry + 2 + (1.5 * 8) - 1, "SEALED", 0, 1, 1);
    Utility("text 1b", drx + (15 * 8) -5, dry + (1.5 * 8) + 1, string(Vidcon("boxed total")), 0, 1, 1);
    Utility("tab", gdx + 9, gdy - 1, 7, "COLLECTION");
    
    ////////////////////////////// Show items
    drx = 15; dry = 16 + (1 * 8);
    dry += 9 * 8;
    drw = (35 * 8); drh = (3 * 8);
    hover = -1;
    hil = 0;
    for (i = 0; i < 5; i += 1)
    {
        ind = vidconScroll + i;
        if (Utility("mouse", drx + vxv, dry + vyv, drx + vxv + drw, dry + vyv + drh - 1) && alpOvr == 0) hover = ind;
        if (global.keyinput_type != KEYINPUT_KEYBOARD_MOUSE && vidconSelect == i) 
        {
            hover = ind;
            vidconIndex = ind;
        }
        if (hover == ind) hil = 1; else hil = 0;
        if (global.keyinput_type == KEYINPUT_KEYBOARD_MOUSE)
        {
            if (Utility("key", "action") && alpOvr == 0 && hover == ind) vidconIndex = ind;
            if (vidconIndex == ind) hil = 1;
            if (hil && vidconIndex != ind) draw_set_alpha(0.5 * global.utilityAlpha);
        }
        Utility("grid", 0, 10 + (i * 3), 35, 3, 3 + hil);
        draw_set_alpha(1 * global.utilityAlpha);
        Utility("text 2c", drx + (1.5 * 8), dry + (1.5 * 8), string(ind + 1), !hil, 1, 1);
        Utility("linev", 3, 10 + (i * 3), 3);
        if (Vidcon("have", ind)) nam = Vidcon("name", ind); else nam = "???";
        Utility("text 1b", drx + (3 * 8) + 3, dry + (drh / 2) + 1, nam, !hil, 0, 1);
        // Box
        Utility("linev", 32, 10 + (i * 3), 3);
        if (Vidcon("have", ind)) Utility("sprite", sMenuUtilityVidcon, Vidcon("is boxed", ind), drx + (32.5 * 8) + 1, dry, 1, 1, 0, c_white, global.utilitySpriteAlpha);
        dry += drh;
    }
    
    //////////////////// CONSOLE
    gdx = 17; gdy = 1; gdw = 18; gdh = 7;
    drx = 15 + (gdx * 8); dry = 16 + (gdy * 8);
    Utility("grid", gdx, gdy, gdw, gdh);
    if (vidconIndex != -1) 
    { 
        if (Vidcon("have", vidconIndex)) 
            Utility("text smallc", drx + 6, dry + 5, Vidcon("description", vidconIndex), 0, 0, 0, (gdw * 8) - 8);
    }
    Utility("tab", gdx, gdy - 1, 7, "DESCRIPTION");
    
    /////////////////////////// PAGE UP / DOWN ARROWS
    itmCom[0] = 0; itmPag[0] = "PAGE UP";
    itmCom[1] = vidconScrollMax; itmPag[1] = "PAGE DOWN";
    gdx = 28; gdy = 9;
    drx = 15 + (gdx * 8); dry = 16 + (gdy * 8); drw = (7 * 8); drh = 8;
    for (i = 0; i < 2; i += 1)
    {
        if (vidconScroll != itmCom[i])
        {
            hil = 0;
            if (Utility("mouse", drx + vxv, dry + vyv, drx + vxv + drw, dry + vyv + drh - 1)) hil = 1;
            Utility("tab", gdx, gdy, 7, itmPag[i], 3 + hil);
            if (hil != 0 && Utility("key", "action"))
            {
                if (i == 0) vidconScroll = max(0, vidconScroll - 5); // UP
                else vidconScroll = min(vidconScrollMax, vidconScroll + 5); // DOWN
            }
        }
        gdy += 16;
        dry += 16 * 8;
    }
}
else if (argument[0] == "draw equip jerkin") { if (eqpClr == 0) eqpScr = 0; Utility("draw equip", "jerkin"); }
else if (argument[0] == "draw equip helmet") { if (eqpClr == 0) eqpScr = 0; Utility("draw equip", "helmet"); }
else if (argument[0] == "draw equip")
{
    var stn, stv; // stat name, value
    sbs = "main";
    var com = 0;
    if (argument_count > 1) { sbs = argument[1]; com = 1; }
    else { eqpHelNew = eqpHel; eqpJerNew = eqpJer; eqpClr = 0; eqpSel = 0; }
    
    
    // HOOPZ
    drx = 15 + (0 * 8); dry = 16 + (7 * 8);
    dw = 10 * 8; dh = 18 * 8;
    Utility("grid", 0, 7, 10, 19);
    Utility("sprite", sMenuUtilityHoopzFull, 0, drx + (dw / 2), dry + (dh / 2) + 4, 1, 1, 0, c_white, global.utilitySpriteAlpha);
    
    // ATTRIBUTES
    drx += 10 * 8;
    dw = 4 * 8; dh = 3 * 8;
    Utility("grid", 10, 7, 4, (6 * 3));
    //Utility("text 2c", 93, 133, string(eqpJerNew), 1, 1, 0); Utility("text 2c", 93, 153, string(eqpHelNew), 1, 1, 0);
    for (i = 0; i < 6; i += 1)
    {
        stc = comCol[1];
        if (i == 0) // WEIGHT
        {
            stv = eqpWei[1, eqpJer] + eqpWei[0, eqpHel];
            stn = eqpWei[1, eqpJerNew] + eqpWei[0, eqpHelNew];
            if (com) { if (stv < stn) stc = comCol[0]; else if (stv > stn) stc = comCol[2]; stv = stn; }
            stv = string(stv) + "~";
        }
        else 
        {
            stv = sttVal[i];
            stn = sttVal[i];
            if (com) { if (stv > stn) stc = comCol[0]; else if (stv < stn) stc = comCol[2]; stv = stn; }
        }
        Utility("lineh", 10, 7 + ((i + 1) * 3), 4);
        Utility("text smallc", drx + (dw / 2) + 1, dry + 2, sttNam[i], 1, 1, 0);
        Utility("text 2c", drx + (dw / 2), dry + (dh / 2) + 5, stv, stc, 1, 1);
        dry += 3 * 8;
    }
    
    // POCKET
    drx = 7 * 8; dry = 19 * 8;
    Utility("sprite", s1x1, 0, drx, dry, 4 * 8, 3 * 8, 0, c_black, 0.66 * global.utilitySpriteAlpha);
    repeat (2)
    {
        Utility("background", 5 + 2, 17 + 2, 4, 3);
        Utility("grid", 5, 17, 4, 3);
        Utility("text smallc", drx + (dw / 2) + 0, dry + 2, sttNam[i], 1, 1, 0);
    }
    stv = eqpPoc[1, eqpJer] + eqpPoc[0, eqpHel]; 
    stn = eqpPoc[1, eqpJerNew] + eqpPoc[0, eqpHelNew];
    stc = comCol[1];
    if (com) { if (stv > stn) stc = comCol[0]; else if (stv < stn) stc = comCol[2]; stv = stn; }
    Utility("text 2c", drx + (dw / 2), dry + (dh / 2) + 5, stv, stc, 1, 1);
    
    // DEFENSE
    drx = 15 + (0 * 8); dry = 16 + (0 * 8);
    Utility("tab", 0, 0, 5, "DEFENSE");
    dry += 1 * 8;
    drw = 6 * 8; drh = 6 * 8;
    Utility("grid", 0, 1, 6, 6);
    Utility("sprite", sMenuUtilityDefense, 0, drx + 4, dry + 8 - 2, 1, 1, 0, c_white, global.utilitySpriteAlpha);
    stv = eqpRes[1, (eqpJer * 6)] + eqpRes[0, (eqpHel * 6)];
    stn = eqpRes[1, (eqpJerNew * 6)] + eqpRes[0, (eqpHelNew * 6)];
    stc = comCol[1];
    if (com) { if (stv > stn) stc = comCol[0]; else if (stv < stn) stc = comCol[2]; stv = stn; }
    Utility("text 1b", drx + (drw / 2), dry + (drh / 2) + 6 + 2, string(stv), stc, 1, 1);
    
    // Load res values
    for (i = 0; i < 5; i += 1) 
    {
        resVal[i] = clamp(eqpRes[1, (eqpJer * 6) + (i + 1)] + eqpRes[0, (eqpHel * 6) + (i + 1)], -100, 200);
        if (com) resVal[i] = clamp(eqpRes[1, (eqpJerNew * 6) + (i + 1)] + eqpRes[0, (eqpHelNew * 6) + (i + 1)], -100, 200);
    }
    
    // RESISTENCES
    drx += 8 * 8;
    drh = 4 * 8; drw = 4 * 8;
    Utility("grid", 14, 0, (5 * 4) + 0, 3);
    drx += 24 + (4 * 8); dry -= 6;
    drx -= 8;
    for (i = 0; i < 5; i += 1)
    {
        if (i > 0) Utility("linev", 15 + (i * 4) - 1, 0, 3);
        Utility("text smallc", drx + (dw / 2) + 4 - 3, dry + 0, resNam[i], 1, 1, 0);
        stv = eqpRes[1, (eqpJer * 6) + (i + 1)] + eqpRes[0, (eqpHel * 6) + (i + 1)];
        stn = eqpRes[1, (eqpJerNew * 6) + (i + 1)] + eqpRes[0, (eqpHelNew * 6) + (i + 1)];
        stc = comCol[1];
        if (com) { if (stv > stn) stc = comCol[0]; else if (stv < stn) stc = comCol[2]; stv = stn; }
        Utility("text 2c", drx + (dw / 2), dry + (dh / 2) + 3, string(stv), stc, 1, 1);
        drx += 4 * 8;
    }
    //Utility("linev", 15 + (i * 4), 0, 3);
    drx = 15 + (28 * 8); dry = 16 + (3 * 8);
    Utility("tab", 28 - 1, 3, 7, "RESISTANCES");
    
    // Resistence Pentagon
    drx = 15 + (7 * 8); dry = 16 + (0 * 8);
    drw = 7 * 8; drh = 6 * 8;
    Utility("grid", 7, 0, 7, 6);
    dir = 90;
    for (i = 0; i < 5; i += 1)
    {
        dx0 = drx + (56 / 2);
        dy0 = dry + (48 / 2);
        dir += (360 / 5);
    }
    Utility("draw resistance", drx + 28, dry + 24, resVal[0], resVal[1], resVal[2], resVal[3], resVal[4]);
    
    /// EQUIPMENT
    gdy = 4;
    eqn[0] = "HELMET"; 
    eqn[1] = "JERKIN"; 
    if (sbs == "main")
    {
        for (h = 0; h < 2; h += 1)
        {
            if (h == 1) eqq = eqpJer; else eqq = eqpHel;
            drx = 15 + (15 * 8); dry = 16 + (gdy * 8);
            Utility("tab", 15, gdy, 5, eqn[h]);
            dry += 1 * 8;
            drw = 4 * 8; drh = 5 * 8;
            Utility("grid", 15, gdy + 1, 4 + 16, 5);
            Utility("linev", 19, gdy + 1, 5);
            if (h == 0) Helmet("draw", "current", drx + vxv + (drw / 2), dry + vyv + 20 - 2, 1, 1, 0, c_white, global.utilitySpriteAlpha);
            else Jerkin("draw", "current", drx + vxv + (drw / 2), dry + vyv + 20 - 2, 1, 1, 0, c_white, global.utilitySpriteAlpha);
            Utility("text 2c", drx + (drw / 2), dry + 35, string(eqpWei[h, eqq]) + "~", 1, 1, 1);
            drx += 4 * 8;
            drw = 16 * 8; drh = 2 * 8;
            Utility("text 1b", drx + 2, dry + 0, eqpNam[h, eqq], 0, 0, 0); // eqpItm[h]
            dry += 2 * 8;
            drx += 4; dry += 4;
            for (i = 0; i < 6 i += 1)
            {
                Utility("sprite", sMenuUtilityResistanceBlip, 0, drx, dry, 1, 1, 0, rssCol[i], global.utilitySpriteAlpha);
                Utility("text 2c", drx + 7, dry - 2, eqpRes[h, (eqq * 6) + i], 1, 0, 0);
                drx += 40;
                if (i == 2) { drx -= 40 * 3; dry += 12; }
            }
            gdy += 7;
        }
    }
    else
    {
        ////////// STANDARD //////////
        var ein = 0;
        scrDid = 0;
        if (sbs == "helmet") ein = 0; else ein = 1;
        if (sbs == "helmet") eqq = eqpHel; else eqq = eqpJer;
        eqpMax = clamp(eqpAmt[ein] - 0 - 4, 0, 999);
        
        ////////// INPUT //////////
        if (global.keyinput_type == KEYINPUT_KEYBOARD_MOUSE)
        {
            if (mouse_wheel_up()) scrDid = -1; else if (mouse_wheel_down()) scrDid = 1;
        }
        else if (actionWait == 0) // gamepad
        {
            if (global.utilityFocus == "side")
            {
                if (Utility("key", "cancel")) Utility("focus main");
            }
            else
            {
                if (Utility("key", "up")) 
                {
                    eqpSel -= 1;
                    if (eqpSel < 0) { scrDid = -1; eqpSel = 0; }
                }
                else if (Utility("key", "down")) 
                {
                    eqpSel += 1;
                    if (eqpSel > 3) { scrDid = 1; eqpSel = 3; }
                }
                Utility("equip scroll process");
                if (Utility("key", "action")) if (eqpAmt[ein] != 1) Utility("focus side");
            }
        }
        
        drx = 15 + (15 * 8); dry = 16 + (gdy * 8);
        dry += 1 * 8;
        drw = 19 * 8; drh = 5 * 8;
        hov = -1;
        eqpDid = 0;
        for (q = 0; eqpDid < clamp(eqpAmt[ein]-1, 1, 4); q += 1)
        {
            if (eqpAmt[ein] == 1) break;
            eai = eqpScr + q; // equip actual index
            if (eai == eqq) continue; // Skip current
            eqpDid += 1;
            if (Utility("mouse", drx + vxv, dry + vyv, drx + vxv + drw, dry + vyv + drh - 1))
            {
                hov = eai; //eqpDid;
                if (Utility("key", "action"))
                {
                    if (sbs == "helmet") eqpHelNew = eai; else eqpJerNew = eai;
                }
            }
            dry += 5 * 8;
        }
        if (doAction == "Equip")
        {
            if (sbs == "helmet") Utility("equip", sbs, eqpHelNew); else Utility("equip", sbs, eqpJerNew);
            Utility("go back");
        }
        ////////// INPUT //////////
        
        ////////// DRAW ////////// 
         eqpDid = 0;
        for (q = 0; eqpDid < clamp(eqpAmt[ein], 1, 4); q += 1) // Get gamepad selection
        {
            eai = eqpScr + q; // equip actual index
            if (eai >= eqpAmt[ein]) break;
            if (eqpAmt[ein] == 1) break;
            if (eai == eqq) continue; // Skip current
            if (global.keyinput_type != KEYINPUT_KEYBOARD_MOUSE)
            {
                if (eqpDid == eqpSel) { if (sbs == "helmet") eqpHelNew = eai; else eqpJerNew = eai; }
            }
            eqpDid += 1;
        }
        if (sbs == "helmet") eqz = eqpHelNew; else if (sbs == "jerkin") eqz = eqpJerNew;
        // All but active
        eqpDid = 0;
        for (q = 0; eqpDid < clamp(eqpAmt[ein], 1, 4); q += 1) //q < clamp(eqpAmt[ein], 1, 4);
        {
            eai = eqpScr + q; // equip actual index
            if (eai >= eqpAmt[ein]) break;
            if (eqpAmt[ein] == 1) break;
            if (eai == eqq) continue; // Skip current
            eqpDid += 1;
            // Get first equip
            if (eqpClr == 0) 
            {
                if (sbs == "helmet") eqpHelNew = eai; else eqpJerNew = eai;
                eqpClr = 1;
            }
            if (eai == eqz) hil = 1; else hil = 0;
            drx = 15 + (15 * 8); dry = 16 + (gdy * 8);
            dry += 1 * 8;
            drw = 4 * 8; drh = 5 * 8;
            Utility("grid", 15, gdy + 1, 4 + 16, 5, 3 + hil);
            if (hil == 0 && hov == eai) { draw_set_alpha(0.33 * global.utilityAlpha); Utility("grid", 15, gdy + 1, 4 + 15, 5, 4); }
            draw_set_alpha(1 * global.utilityAlpha);
            Utility("linev", 19, gdy + 1, 5);
            Jerkin("draw", eqpNam[ein, eai], drx + vxv + (drw / 2), dry + vyv + 20 - 2, 1, 1, 0, c_white, global.utilitySpriteAlpha);
            Utility("text 2c", drx + (drw / 2), dry + 35, string(eqpWei[ein, eai]) + "~", 1, 1, 1); // weight
            drx += 4 * 8;
            drw = 16 * 8; drh = 2 * 8;
            Utility("text 1b", drx + 2, dry + 0, eqpNam[ein, eai], 0, 0, 0);
            dry += 2 * 8;
            drx += 4; dry += 4;
            for (i = 0; i < 6 i += 1)
            {
                Utility("sprite", sMenuUtilityResistanceBlip, 0, drx, dry, 1, 1, 0, rssCol[i], global.utilitySpriteAlpha);
                Utility("text 2c", drx + 7, dry - 2, eqpRes[ein, (eai * 6) + i], 1, 0, 0);
                drx += 40;
                if (i == 2) { drx -= 40 * 3; dry += 12; }
            }
            gdy += 5;
        }
        if (eqpDid == 0) // Empty
        {
            drx = 15 + (15 * 8); dry = 16 + (gdy * 8);
            dry += 1 * 8;
            drw = 4 * 8; drh = 5 * 8;
            Utility("grid", 15, gdy + 1, 4 + 16, 5, 3);
            drx += 4 * 8;
            drw = 16 * 8; drh = 2 * 8;
            Utility("text 1b", drx + 2, dry + 0, "None available", 0, 0, 0);
        }
        
        /////////////////////////// PAGE UP / DOWN ARROWS
        itmCom[0] = 0; itmPag[0] = "PAGE UP";
        itmCom[1] = eqpMax; itmPag[1] = "PAGE DOWN";
        gdx = 15; gdy = 9 - 5;
        drx = 15 + (gdx * 8); dry = 16 + (gdy * 8); drw = (7 * 8); drh = 8;
        for (i = 0; i < 2; i += 1)
        {
            if (eqpScr != itmCom[i])
            {
                hil = 0;
                if (Utility("mouse", drx + vxv, dry + vyv, drx + vxv + drw, dry + vyv + drh - 1)) hil = 1;
                Utility("tab", gdx, gdy, 7, itmPag[i], 3 + hil); // + string(eqpMax)
                if (hil != 0 && Utility("key", "action"))
                {
                    if (i == 0) { scrDid = -4; } // UP
                    else { scrDid = 4; } // DOWN
                }
            }
            gdy += 16 + 5;
            dry += (16 + 5) * 8;
            if (eqpScr >= eqpMax - 1 && eqq >= eqpMax) break;
        }
        Utility("equip scroll process");
    }
}
else if (argument[0] == "equip scroll process")
{
    // FIXER FOR SKIPPED ITEM
    if (scrDid != 0)
    {
        repeat (abs(scrDid))
        {
            if (eqpScr == eqq) eqpScr += sign(scrDid);
            eqpScr += sign(scrDid);
            eqpScr = clamp(eqpScr, 0, eqpMax);
        }
        if (eqpScr == 1 && eqq == 0 && scrDid < 0) eqpScr = 0;
        if (eqpScr >= eqpMax - 1 && eqq >= eqpMax && scrDid > 0) eqpScr = eqpMax - 1;
    }
    scrDid = 0;
}
else if (argument[0] == "draw items")
{
    itmAmt = Item("unique");
    itmScrMax = max(0, itmAmt - itmDis);
    if (global.keyinput_type == KEYINPUT_KEYBOARD_MOUSE)
    {
        if (mouse_wheel_up()) itmScr = max(0, itmScr - 1);
        if (mouse_wheel_down()) itmScr = min(itmScrMax, itmScr + 1);
    }
    else
    {
        if (Utility("key", "up"))
        {
            if (itmSel == 0 && itmScr > 0) itmScr -= 1; else itmSel -= 1;
            if (itmSel < 0 && itmScr == 0) { itmSel = itmDis - 1; itmScr = itmAmt - itmDis; }
        }
        if (Utility("key", "down"))
        {
            if (itmSel == itmDis - 1 && itmScr < itmAmt - itmDis) itmScr += 1; else itmSel += 1;
            if (itmSel > itmDis - 1 && itmScr == itmAmt - itmDis) { itmSel = 0; itmScr = 0; }
        }
        itmSel = clamp(itmSel, 0, itmDis - 1);
    }
    
    
    ////////////////////////////// Show items
    gdy = 5; gdh = 2;
    drx = 15; dry = 16 + (gdy * 8);
    drw = (35 * 8); drh = (gdh * 8);//40;
    hover = -1;
    hil = 0;
    Utility("tab", 0, gdy - 1, 5, "ITEM");
    if (Item("unique") == 0)
    {
        Utility("grid", 0, gdy, 35, gdh, 3);
        Utility("text 2c", drx + 4, dry + (drh / 2) + 1, textItemless, 1, 0, 1);
    }
    else
    {
        for (i = 0; i < min(itmAmt, itmDis); i += 1)
        {
            ind = itmScr + i;
            if (Utility("mouse", drx + vxv, dry + vyv, drx + vxv + drw, dry + vyv + drh - 1)) hover = ind;
            if (global.keyinput_type != KEYINPUT_KEYBOARD_MOUSE && itmSel == i) hover = ind;
            if (hover == ind) hil = 1; else hil = 0;
            if (global.keyinput_type == KEYINPUT_KEYBOARD_MOUSE)
            {
                if (Utility("key", "action") && hover == ind) itmSel = ind;
                if (itmSel == ind) hil = 1;
                if (hil && itmSel != ind) draw_set_alpha(0.5 * global.utilityAlpha);
            }
            Utility("grid", 0, gdy + (i * gdh), 35, gdh, 3 + hil);
            draw_set_alpha(1 * global.utilityAlpha);
            var itmNam = Item("name", ind);
            Item("draw name", itmNam, vxv + drx + 4, vyv + dry + 1, 1, 1, 0, c_white, global.utilitySpriteAlpha);
            Utility("text 2c", drx + 18 + 4, dry + (drh / 2) + 1, itmNam, !hil, 0, 1);
            Utility("text 2c", drx + 4 + 252, dry + (drh / 2) + 1, "x" + string(Item("count", itmNam)), !hil, 0, 1);
            dry += drh;
        }
    }
    
    // DESCRIPTION
    Utility("tab", 0, 0, 7, "DESCRIPTION");
    Utility("grid", 0, 1, 35, 2);
    if (Item("unique") > 0) Utility("text 2c", 15 + 4, 16 + 8 + 4, Item("description", Item("name", itmSel)), 1, 0, 0);
    
    /////////////////////////// PAGE UP / DOWN ARROWS
    itmCom[0] = 0; itmPag[0] = "PAGE UP";
    itmCom[1] = itmScrMax; itmPag[1] = "PAGE DOWN";
    gdx = 28; gdy -= 1;
    drx = 15 + (gdx * 8); dry = 16 + (gdy * 8);
    drw = (7 * 8); drh = 8; //(26 * 8);//40;
    for (i = 0; i < 2; i += 1)
    {
        if (itmScr != itmCom[i])
        {
            hil = 0;
            if (Utility("mouse", drx + vxv, dry + vyv, drx + vxv + drw, dry + vyv + drh - 1)) hil = 1;
            Utility("tab", gdx, gdy, 7, itmPag[i], 3 + hil);
            if (hil != 0 && Utility("key", "action"))
            {
                if (i == 0) itmScr = max(0, itmScr - itmDis); // UP
                else itmScr = min(itmScrMax, itmScr + itmDis); // DOWN
            }
        }
        gdy += (itmDis * gdh) + 1;
        dry += ((itmDis * gdh) + 1) * 8;
    }
}
else if (argument[0] == "draw candy")
{
    /// Select
    candyMax = Candy("recipe count"); //28 max
    candyHover = -1;
    if (actionWait == 0 && global.keyinput_type == KEYINPUT_GAMEPAD)
    {
        if (global.utilityFocus == "main")
        {
            if (Utility("key", "up")) { candySelect -= 7; if (candySelect < 0) { candySelect += 28; while (candySelect >= candyMax) candySelect -= 7; } }
            if (Utility("key", "down")) { candySelect += 7; if (candySelect >= candyMax) { candySelect -= 28; while (candySelect < 0) candySelect += 7; } }
            if (Utility("key", "left")) { candySelect -= 1; if (candySelect < 0) { candySelect += 27; while (candySelect >= candyMax) candySelect -= 1; } }
            if (Utility("key", "right")) { candySelect += 1; if (candySelect >= candyMax) { candySelect -= 27; while (candySelect < 0) candySelect += 1; } }
            if (Utility("key", "action")) Utility("focus side");
        }
        else
        {
            if (Utility("key", "cancel")) Utility("focus main");
            if (Utility("key", "action")) doAction = "Make";
        }
    }
    else if (actionWait == 0)
    {
        gdx = 14; gdy = 0;
        drx = 15 + (gdx * 8); dry = 16 + (gdy * 8);
        h = 0;
        for (yyy = 0; yyy < 4; yyy += 1)
        {
            for (xxx = 0; xxx < 7; xxx += 1)
            {
                if (h < candyMax) 
                {
                    if (Utility("mouse", drx + vxv, dry + vyv, drx + vxv + (3 * 8), dry + vyv + (3 * 8))) 
                    {
                        candyHover = h;
                        if (Utility("key", "action")) candySelect = h;
                    }
                }
                drx += 3 * 8;
                h += 1;
            }
            drx -= (3 * 8) * 7; dry += 3 * 8;
        }
    }
    if (doAction == "Make")
    {
        if (Jerkin("pockets free") > 0)
        {
            var schem = Candy("recipe get", candySelect);
            schem = Candy("name to map", schem);
            var smeltpts = Candy("smelt", schem);
            var smelt = scr_savedata_get("ustation.smelt");
            if (smelt >= smeltpts)
            {
                var name = schem[? "name"];
                var item = scr_items_db_getCopyOfItem(name);
                var add = scr_items_add(item);
                if (add) 
                {
                    scr_savedata_put("ustation.smelt", smelt - smeltpts);
                }
                else ds_map_destroy(item);
            }
        }
    }
    // Get fresh list
    if (ds_exists(cdyLis, ds_type_list)) ds_list_destroy(cdyLis);
    cdyLis = scr_items_getAllOfType(ITEMTYPE_CANDY);
    
    ////////// POCKETS //////////
    smelta = 0;
    pocketCapacity = Jerkin("pockets");
    //for (i = 0; i < 15; i += 1) { if (i < 7) pocket[i] = "Black#Licorice"; else pocket[i] = ""; }
    gdx = 1; gdy = 0;
    drx = 15 + (gdx * 8); dry = 16 + (gdy * 8); drw = 4 * 8; drh = 4 * 8;
    h = 0;
    for (yyy = 0; yyy < 6; yyy += 1)
    {
        for (xxx = 0; xxx < 4; xxx += 1)
        {
            if (h < pocketCapacity)
            {
                if (ds_list_size(cdyLis) > h) cdy = cdyLis[| h]; else cdy = NULL;
                if (cdy != NULL) Candy("draw name", Candy("name", cdy), drx + vxv + 12, dry + vyv + 12, 1, 1, 0, c_white, global.utilitySpriteAlpha); //  && pocket[h] != ""
                else Utility("text smallc", drx + (1.5 * 8) + 1, dry + (1.5 * 8) + 1, "NONE", 2, 1, 1);
            }
            else Utility("sprite", s1x1, 0, drx, dry, (3 * 8), (3 * 8), 0, c_black, 0.9 * global.utilitySpriteAlpha);
            h += 1;
            drx += 3 * 8;
        }
        drx -= (3 * 8) * 4;
        dry += 3 * 8;
    }
    Utility("grid", gdx, gdy, (4 * 3), (6 * 3));
    Utility("linev", gdx + 3, gdy, (6 * 3));
    Utility("linev", gdx + 6, gdy, (6 * 3));
    Utility("linev", gdx + 9, gdy, (6 * 3));
    Utility("lineh", gdx, gdy + 3, (4 * 3));
    Utility("lineh", gdx, gdy + 6, (4 * 3));
    Utility("lineh", gdx, gdy + 9, (4 * 3));
    Utility("lineh", gdx, gdy + 12, (4 * 3));
    Utility("lineh", gdx, gdy + 15, (4 * 3));
    Utility("tab", gdx, 18, 5, "POCKETS");
    
    ////////// JERKIN ////////////
    drx = 15 + (gdx * 8); dry = 16 + (20 * 8);
    Utility("grid", gdx, 20, 9, 6);
    Utility("text smallc", drx + (4.5 * 8) + 1, dry + 9, string_upper(Jerkin("current")), 1, 1, 1, 64);
    Utility("text smallc", drx + (4.5 * 8) + 1, dry + (6 * 8) - 3, "POCKETS: " + string(Jerkin("pockets")), 1, 1, 1);
    Jerkin("draw", "current", drx + vxv + (4.5 * 8), dry + vyv + (3 * 8) + 4, 1, 1, 0, c_white, global.utilitySpriteAlpha);
    
    ////////// SCHEMES //////////
    gdx = 14; gdy = 0;
    drx = 15 + (gdx * 8); dry = 16 + (gdy * 8);
    h = 0;
    cdySel = NULL;
    sdx = 0; sdy = 0; // Select draw x
    for (yyy = 0; yyy < 4; yyy += 1)
    {
        for (xxx = 0; xxx < 7; xxx += 1)
        {
            if (h < candyMax) 
            {
                cdyNam = Candy("recipe get", h);
                //show_debug_message("Utility() - " + cdyNam);
                cdy = Candy("name to map", cdyNam);
                //show_debug_message("Utility() - " + string(cdy));
                if (h == candyHover)
                {
                    hdx = gdx + (xxx * 3);
                    hdy = gdy + (yyy * 3);
                    cdyHov = cdyNam;
                }
                if (h == candySelect) 
                {
                    sdx = gdx + (xxx * 3);
                    sdy = gdy + (yyy * 3);
                    smelta = -Candy("smelt", cdy);
                    cdySel = cdyNam;
                }
                if (h != candySelect && h != candyHover) 
                    Candy("draw name", cdyNam, drx + vxv + 4 + 8, dry + vyv + 4 + 8, 1, 1, 0, c_white, 0.8 * global.utilitySpriteAlpha);
            }
            else Utility("sprite", s1x1, 0, drx, dry, (3 * 8), (3 * 8), 0, c_black, 0.9 * global.utilitySpriteAlpha);
            drx += 3 * 8;
            h += 1;
        }
        drx -= (3 * 8) * 7; dry += 3 * 8;
    }
    gdx = 14; gdy = 0;
    drx = 15 + (gdx * 8); dry = 16 + (gdy * 8);
    Utility("grid", gdx, gdy, 7 * 3, 4 * 3);
    for (iii = 1; iii < 7; iii += 1) Utility("linev", gdx + (iii * 3), gdy, (4 * 3));
    for (iii = 1; iii < 4; iii += 1) Utility("lineh", gdx, gdy + (iii * 3), (7 * 3));
    Utility("tab", gdx + 16, 12, 5, "SCHEMES");
    
    // Draw selected candy
    if (sdx != 0 || sdy != 0) 
    {
        Utility("grid", sdx, sdy, 3, 3, 4);
        Candy("draw name", cdySel, vxv + (15 + (sdx * 8)) + 4 + 8, vyv + (16 + (sdy * 8)) + 4 + 8, 1, 1, 0, c_white, global.utilitySpriteAlpha);
    }
    if (candyHover != candySelect && candyHover != -1)
    {
        draw_set_alpha(0.5 * global.utilityAlpha);
        Utility("grid", hdx, hdy, 3, 3, 4);
        draw_set_alpha(1 * global.utilityAlpha);
        Candy("draw name", cdyHov, vxv + (15 + (hdx * 8)) + 4 + 8, vyv + (16 + (hdy * 8)) + 4 + 8, 1, 1, 0, c_white, global.utilitySpriteAlpha);
    }
    
    ////////// GRID LINES //////////
    drx = 15 + (14 * 8); dry = 16 + (13 * 8);
    Utility("tab", 14, 13, 5, "INFO");
    Utility("grid", 14, 14, 5 + 16, 5); // sprite
    Utility("linev", 14 + 5, 14, 5);
    dry += 8;
    if (candyMax > 0 && candySelect != -1)
    {
        Candy("draw name", cdySel, vxv + drx + 4 + 16, vyv + dry + 4 + 16, 2, 2, 0, c_white, global.utilitySpriteAlpha);
        Utility("text 1b", drx + (5 * 8) + 2, dry, cdySel, 1, 0, 0);
        Utility("text 2c", drx + (5 * 8) + 2, dry + 16 + 3, Candy("utility", Candy("name to map", cdySel)), 1, 0, 0, (16 * 8) - 5);
    }
    
    Utility("draw smelt");
    smelta = 0;
}
else if (argument[0] == "draw guns")
{
    Utility("draw guns overview");
    Utility("draw gunsbag");
    Utility("draw smelt");
}
else if (argument[0] == "draw guns gunsbag")
{
    if (subscriptCreate == 0 && newScript == argument[0])
    {
        subscriptCreate = 1;
        gunMen = argument[0];
        if (Gun("gunbag amount") > 0) gunSel = 5; else gunSel = -1;
        if (gunSel == -1) menuText[21, 0] = ""; else menuText[21, 0] = "Fave";
        if (Gun("amount") > 4) menuText[21, 1] = ""; else menuText[21, 1] = "Promote";
    }
    
    gunHil = -1;
    Utility("input select gunsbag");
    Utility("draw guns info");
    Utility("draw select gunsbag");
    if (gunSel != -1) Utility("draw lineage");
    
    // Gamepad
    if (global.keyinput_type != KEYINPUT_KEYBOARD_MOUSE && actionWait == 0)
    {
        if (global.utilityFocus == "main")
        {
            if (Utility("key", "action")) Utility("focus side");
        }
        else
        {
            if (Utility("key", "cancel")) Utility("focus main");
        }
    }
    
    if (doAction == "Fave")
    {
        if (gunSel != -1) { Gun("favorite", gunSel, !Gun("favorite", gunSel)); }
    }
    // Promote
}
else if (argument[0] == "draw guns bandolier")
{
    if (subscriptCreate == 0 && newScript == argument[0])
    {
        subscriptCreate = 1;
        gunMen = argument[0];
        if (Gun("amount") > 0) gunSel = 0; else gunSel = -1;
        if (gunSel == -1) menuText[20, 0] = ""; else menuText[20, 0] = "Rename";
    }
    
    gunHil = -1;
    Utility("input select bandolier");
    Utility("draw guns info");
    Utility("draw select bandolier");
    if (gunSel != -1) Utility("draw lineage");
    // Rename
    if (global.keyinput_type != KEYINPUT_KEYBOARD_MOUSE && actionWait == 0)
    {
        if (global.utilityFocus == "main")
        {
            if (Utility("key", "action")) Utility("focus side");
        }
        else
        {
            if (Utility("key", "cancel")) Utility("focus main");
        }
    }
}
else if (argument[0] == "draw guns smelt" || argument[0] == "draw breed select top" || argument[0] == "draw breed select bottom")
{
    if (subscriptCreate == 0 && newScript == argument[0])
    {
        subscriptCreate = 1;
        gunMen = argument[0];
        if (Gun("amount") > 0) gunSel = 0;
        else if (Gun("gunbag amount") > 0) gunSel = 5; 
        else gunSel = -1;
        if (gunSel == -1) menuText[22, 0] = ""; else menuText[22, 0] = "Current";
    }
    if (pushBack == 1)
    {
        repeat (50)
        {
            if (gunSel >= 5)
            {
                if (gunSel - 5 >= Gun("gunbag amount"))
                {
                    gunSel -= 1;
                }
                if (Gun("gunbag amount") <= 0)
                {
                    if (Gun("amount") > 0) gunSel = 0;
                    else gunSel = -1;
                }
            }
            else
            {
                if (gunSel >= Gun("amount")) gunSel -= 1;
                if (Gun("amount") <= 0)
                {
                    if (Gun("gunbag amount") > 0) gunSel = 5;
                    else gunSel = -1;
                }
            }
        }
    }
    gunHil = -1;
    if (global.keyinput_type != KEYINPUT_KEYBOARD_MOUSE && actionWait == 0)
    {
        if (gunSel < 5) Utility("input select bandolier");
    }
    else Utility("input select bandolier");
    
    // Gamepad switch
    exeAction = "";
    if (global.keyinput_type != KEYINPUT_KEYBOARD_MOUSE && actionWait == 0)
    {
        if (alpOvr == 0)
        {
            if (global.utilityFocus == "main")
            {
                if (Utility("key", "action") && Gun("total amount") > 0) Utility("focus side");
            }
            else
            {
                if (Utility("key", "cancel")) Utility("focus main");
            }
            if (global.utilityFocus == "main" && gunSel != -1)
            {
                if (Gun("gunbag amount") > 0 && Utility("key", "down")) 
                { 
                    if (gunSel < 5) gunSel = 5 + (gunSel * 4); 
                    while (gunSel >= 5 + Gun("gunbag amount")) gunSel -=1;
                }
                if (Gun("amount") > 0 && Utility("key", "up")) 
                { 
                    if (gunSel >= 5) gunSel = floor((gunSel - 5) / 4) 
                    while (gunSel >= 5 + Gun("amount")) gunSel -=1; 
                }
            }
        }
        else
        {
            if (Utility("key", "cancel")) { alpOvr = 0; alpRes = -1; actionWait = 2; }
            if (alpRes != -1)
            {
                if (alpRes == 1) exeAction = delAction;
                alpOvr = 0;
                alpRes = -1;
            }
        }
    }
    
    if (global.keyinput_type != KEYINPUT_KEYBOARD_MOUSE && actionWait == 0)
    {
        if (gunSel >= 5) Utility("input select gunsbag");
    }
    else Utility("input select gunsbag");
    Utility("draw select bandolier");
    Utility("draw select gunsbag");
    Utility("draw guns info");
    
    // Pre-smelt values
    smelta = 0;
    if (hover != -1)
    {
        if (menuText[menu, hover] == "Current" && Gun("total amount") > 0) 
        {
            if (Gun("material", gunSel) != "3D Printed") smelta = smeltGain;
        }
        if (menuText[menu, hover] == "In Bag") 
        {
            //for (i = 0; i < Gun("amount"); i += 1) { if (Gun("material", i) != "3D Printed") smelta += smeltGain; }
            for (i = 5; i < 5 + Gun("gunbag amount"); i += 1) { if (Gun("material", i) != "3D Printed") smelta += smeltGain; }
        }
        if (menuText[menu, hover] == "Empty") 
        {
            for (i = 5; i < 5 + Gun("gunbag amount"); i += 1) 
            { 
                if (Gun("ammo", i) == 0 && Gun("material", i) != "3D Printed") smelta += smeltGain;
            }
        }
        if (menuText[menu, hover] == "Unfaves") 
        {
            for (i = 5; i < 5 + Gun("gunbag amount"); i += 1) 
            { 
                if (Gun("favorite", i) == 0 && Gun("material", i) != "3D Printed") smelta += smeltGain;
            }
        }
    }
    if (argument[0] == "draw guns smelt") Utility("draw smelt");
    else Utility("draw lineage");
    
    // Warning
    
    if (alpRes != -1)
    {
        if (alpRes == 1) { exeAction = delAction; global.utilityFocus = "main"; }
        alpOvr = 0;
        alpRes = -1;
    }
    // Clicking on buttons
    if (argument[0] == "draw guns smelt")
    {
        if (doAction != "") delAction = doAction;
        if (gunSel != -1)
        {
            if (doAction == "Current" && Gun("total amount") > 1)
            {
                if (Gun("material", gunSel) != "3D Printed") Utility("smelt", smeltGain);
                Gun("delete", gunSel);
                exeAction = "Current"; // to make it go back on gamepad on 0 guns
                pushBack = 1;
            }
            if (doAction == "Empty") Utility("choose", smeltEmpty);
            if (doAction == "Unfaves") Utility("choose", smeltUnfaves);
            if (doAction == "In Bag") Utility("choose", smeltAll);
            if (exeAction == "Empty")
            {
                exeAction = "";
                for (i = 5; i < 5 + Gun("gunbag amount"); i += 1)
                {
                    if(Gun("total amount") == 1) break;
                    if (Gun("ammo", i) == 0)
                    {
                        if (Gun("material", i) != "3D Printed") Utility("smelt", smeltGain);
                        Gun("delete", i);
                        i -= 1;
                    }
                }
                pushBack = 1;
            }
            if (exeAction == "Unfaves")
            {
                for (i = 5; i < 5 + Gun("gunbag amount"); i += 1)
                {
                    if(Gun("total amount") == 1) break;
                    if (Gun("favorite", i) == 0)
                    {
                        if (Gun("material", i) != "3D Printed") Utility("smelt", smeltGain);
                        Gun("delete", i);
                        i -= 1;
                    }
                }
                pushBack = 1;
            }
            if (exeAction == "In Bag")
            {
                //for (i = 0; i < Gun("amount"); i += 1)
                //{
                //    if (Gun("material", i) != "3D Printed") Utility("smelt", smeltGain);
                //    Gun("delete", i);
                //    i -= 1;
                //}
                for (i = 5; i < 5 + Gun("gunbag amount"); i += 1)
                {
                    if(Gun("total amount") == 1) break;
                    if (Gun("material", i) != "3D Printed") Utility("smelt", smeltGain);
                    Gun("delete", i);
                    i -= 1;
                }
                pushBack = 1;
            }
            if (exeAction != "") { if (Gun("total amount") == 0) Utility("focus main"); }
        }
    }
    else // breed select
    {
        if (doAction == "Select")
        {
            if (argument[0] == "draw breed select top") ind = 0; else ind = 1;
            if (brdCho[!ind] == gunSel) brdCho[!ind] = -1;
            brdCho[ind] = gunSel;
            menuText[24, ind] = Gun("name", gunSel);
            Utility("go back");
        }
    }
}
else if (argument[0] == "draw guns reload")
{
    // Only show side buttons for available guns
    menuID = 23;
    for (i = 0; i < 6; i += 1) menuText[menuID, i] = "";
    if (Gun("amount") > 0)
    {
        menuText[menuID, 0] = "All";
        for (i = 0; i < Gun("amount"); i += 1)
        {
            menuText[menuID, i + 1] = Gun("name", i);
        }
    }
    
    // Overview hilight
    for (i = 0; i < 5; i += 1) relGun[i] = 0;
    if (hover > 0 && hover <= 5) relGun[hover - 1] = 1;
    else if (hover != -1)
    { 
        for (i = 0; i < 5; i += 1) relGun[i] = 1; 
    }
    Utility("draw guns overview");
    for (i = 0; i < 5; i += 1) relGun[i] = 0;
    
    // Smelt bar
    smelta = -1;
    Utility("draw smelt");
    smelta = 0;
    
    // Inputs
    if (doAction != "")
    {
        relCou += dt() * 6;
        while (relCou >= 1)
        {
            if (doAction == "All")
            {
                Utility("reload", "all");
            }
            for (i = 0; i < Gun("amount"); i += 1)
            {
                if (doAction == Gun("name", i)) Utility("reload", string(i));
            }
            relCou -= 1;
        }
    }
    else relCou = 1;
}
else if (argument[0] == "draw guns breed")
{
    if (subscriptCreate == 0 && newScript == argument[0])
    {
        for (ind = 0; ind < 2; ind += 1)
        {
            if (brdCho[ind] < 5)
            {
                if (brdCho[ind] >= Gun("amount")) brdCho[ind] = -1;
            }
            else
            {
                if (brdCho[ind] >= Gun("gunbag amount") + 5) brdCho[ind] = -1;
            }
        }
        if (brdCho[0] == -1) menuText[24, 0] = textButtonEmpty; else menuText[24, 0] = Gun("name", brdCho[0]);
        if (brdCho[1] == -1) menuText[24, 1] = textButtonEmpty; else menuText[24, 1] = Gun("name", brdCho[1]);
        subscriptCreate = 1;
    }
    if (brdCho[0] == -1 || brdCho[1] == -1) menuText[24, 2] = "";
    else menuText[24, 2] = textButtonBreed;
    cho[0] = brdCho[0];
    cho[1] = brdCho[1];
    
    // TOP
    gdy = 0;
    Utility("tab", 0, gdy, 5, "TOP");
    for (ind = 0; ind < 2; ind += 1)
    {
        Utility("grid", 0, gdy + 1, 26, 9);
        if (cho[ind] == -1)
        {
            drx = 15 + (0 * 8); dry = 16 + ((gdy + 1) * 8); drw = 13 * 8; drh = 9 * 8;
            Utility("text 1b", drx + 8, dry + 4 + 2, textBreedEmpty, 1, 0, 0);
        }
        else
        {
            // GUN
            drx = 15 + (0 * 8); dry = 16 + ((gdy + 1) * 8); drw = 13 * 8; drh = 9 * 8;
            dry += 4;
            draw_set_color(global.utilityColor[0]);
            draw_set_alpha(global.utilityTextAlpha * global.utilityAlpha);
            DrawGunName(vxv + drx + (13 * 8), vyv + dry, Gun("prefix1", cho[ind]), Gun("prefix2", cho[ind]), Gun("material", cho[ind]), Gun("type", cho[ind]), Gun("suffix", cho[ind]), 1);
            draw_set_alpha(1 * global.utilityAlpha);
            Gun("draw index", cho[ind], drx + vxv + 4, dry + vyv + 20, 2, 2, 0, c_white, global.utilitySpriteAlpha);
            // WEIGHT
            drx = 15 + (9 * 8); dry = 16 + ((gdy + 10) * 8) - 23;
            Utility("text 1b", drx + 8, dry + 4 + 2, string(round(Gun("weight", cho[ind]))) + "|", 0, 0, 0);
            // GUN VALUE
            drx -= (8 * 8);
            Utility("text 1b", drx + 8 - 16 + 2, dry + 4 + 2, Gun("value", cho[ind]), 0, 0, 0);
            // STATS
            drx = 15 + (13 * 8); dry = 16 + ((gdy + 4) * 8);
            drx += 2; dry += 1; //2;
            for (h = 0; h < 5; h += 1)
            {
                Utility("text smallc", drx, dry, gunAtb[h], 2, 0, 0);
                gnv = Gun(gunAtf[h], cho[ind]);
                Utility("text 1b", drx - 1 + 6, dry + 4 + 2, gnv, 0, 0, 0);
                if (h == 1) Utility("text 1b", drx - 1 + 6 + string_width(string(gnv)) + 2, dry + 4 + 2, "@", 0, 0, 0);
                if (h == 0) drx += 6 * 8;
                if (h == 1) { dry += (3 * 8); drx = 15 + (13 * 8); drx += 2; }
                if (h == 2) drx += (6 * 8);
                if (h == 3) drx += 4 * 8;
                if (h == 4) drx += 6 * 8;
            }
        }
        gdy += 11;
    }
    Utility("tab", 0, gdy - 1, 5, "BOTTOM");
    var lgtGrn = 0;
    var lgtRed = 0;
    var bad = 0;
    var gnp = 0.5; // GUNSPOWER - 0 is topmost, 1 is bottomost
    if (cho[0] != -1 && cho[1] != -1)
    {
        if (Gun("exists", cho[0]) && Gun("exists", cho[1]))
        {
            scr_combat_weapons_fusion_prestats(Gun("index to object", cho[0]), Gun("index to object", cho[1]));
            gnp = abs(1 - ratio);
            var orgMax = max(Gun("value", cho[0]), Gun("value", cho[1]));
            if (orgMax >= gunTotalNoiseless * global.settingFuseCompatibility) lgtRed = 1;
            if (gunTotalNoiseless >= orgMax * global.settingFuseCompatibility) lgtGrn = 1;
        }
    }
    
    // GUN'SPOWER
    gdx = 30; gdy = 0;
    drx = 15 + (gdx * 8); dry = 16 + (gdy * 8); drw = 7 * 8; drh = 1 * 8;
    Utility("tab", gdx - 4, gdy, 4, "GENE'S");
    Utility("tab", gdx - 4, gdy + 21, 4, "GENE'S");
    drx = 15 + (gdx * 8); dry = 16 + ((gdy + 1) * 8); drw = 5 * 8; drh = 20 * 8;
    Utility("grid", gdx, gdy + 1, 5, 20);
    Utility("text smallc", drx + (2.5 * 8), dry + 2 + (1 * 8) - 4, "TOP", 2, 1, 0);
    Utility("text smallc", drx + (2.5 * 8) + 2, dry + 2 + (18 * 8) + 4, "BOTTOM", 2, 1, 0);
    drx += (1 * 8) + 1; dry += (2 * 8) + 1; drw = (3 * 8) - 1; drh = (9 * 8) - 1;
    Utility("grid", gdx + 1, gdy + 1 + 2, 3, 16);
    if (cho[0] != -1 && cho[1] != -1) Utility("sprite", s1x1, 0, drx, dry + (((16 * 8) - 9) * gnp), drw, 8, 0, merge_color(c_yellow, c_black, 0.33), 0.8 * global.utilitySpriteAlpha);
    
    // GENES
    gdx = 26; gdy = 1;
    for (i = 0; i < 2; i += 1)
    {
        Utility("grid", gdx, gdy, 4, 8);
        if (cho[i] != -1)
        {
            var gng = Gun("index to object", cho[i]);
            // Grab genez
            //for (i = 0; i < 2; i += 1)
            //{
            for (q = 0; q < genGrp; q += 1)
            {
                genGrpPri[i, q] = ds_priority_create();
                for (v = 0; v < genSub[q]; v += 1)
                {
                    var gnk = gunList2D_get(gng, "aGeneValue", genAfi[q], genGni[q] + v);
                    ds_priority_add(genGrpPri[i, q], genLtr[q, v], gnk);
                }
            }
            //}
            // 
            drx = 15 + (gdx * 8); dry = 16 + (gdy * 8); 
            h = 0;
            for (q = 0; q < genGrp; q += 1)
            {
                var dspGen = ds_priority_create();
                ds_priority_copy(dspGen, genGrpPri[i, q]);
                for (v = 0; v < genSub[q]; v += 1)
                {
                    var ltr = ds_priority_find_max(dspGen);
                    ds_priority_delete_max(dspGen);
                    if (v == 0) wcl = comCol[0]; else wcl = 2;
                    gnx = drx + ((h mod 4) * 8); gny = dry + ((h div 4) * 8);
                    Utility("text smallc", gnx + 5, gny + 5, ltr, wcl, 1, 1);
                    h += 1;
                }
                ds_priority_destroy(dspGen);
            }
            // Clear priority
            //for (i = 0; i < 2; i += 1)
            //{
            for (q = 0; q < genGrp; q += 1) ds_priority_destroy(genGrpPri[i, q]);
            //}
        }
        gdy += 12;
    }
    
    // Compatibility
    //lgtGrn = abs(1 - bad);
    //lgtRed = bad;
    if (cho[0] == -1 || cho[1] == -1) { lgtGrn = 0; lgtRed = 0; }
    gdx = 6; gdy = 25;
    Utility("tab", gdx, gdy, 8, "COMPATIBILITY");
    gdy -= 3;
    Utility("grid", gdx, gdy, 19, 3);
    drx = 15 + (gdx * 8); dry = 16 + (gdy * 8); drw = 9; drh = 9;
    drx += 8; dry += 8;
    Utility("sprite", s1x1, 0, drx, dry, drw, drh, 0, merge_color(c_black, c_lime, 0.2 + (lgtGrn * 0.8)), 0.8 * global.utilitySpriteAlpha);
    drx += 3 * 8;
    Utility("sprite", s1x1, 0, drx, dry, drw, drh, 0, merge_color(c_black, c_red, 0.2 + (lgtRed * 0.8)), 0.8 * global.utilitySpriteAlpha);
    
    if (doAction == textButtonBreed)
    {
        Utility("input", 0);
        // NEED TO FUZE HERE
        // Get name and generation from GUNS VALUE WINNER
        if (Gun("value", cho[0]) > Gun("value", cho[1])) global.fuseWinner = cho[0];
        else global.fuseWinner = cho[1];
        // Determine if it can fit in BANDO
        if (Gun("in bag", cho[0]) == 1 && Gun("in bag", cho[1]) == 1)
        {
            ustation.didBando = 0;
            global.fuseName = "FUSE";
        }
        else //if (Gun("in bag", cho[0]) == 1 || Gun("in bag", cho[1]) == 1) // Replace bando gun slot in merge
        {
            ustation.didBando = 1;
            if (Gun("in bag", cho[0]) == 0 && Gun("in bag", cho[1]) == 1) ustation.fuseReplaceSlot = cho[0];
            else if (Gun("in bag", cho[0]) == 1 && Gun("in bag", cho[1]) == 0) ustation.fuseReplaceSlot = cho[1];
            else
            {
                if (Gun("value", cho[0]) > Gun("value", cho[1])) ustation.fuseReplaceSlot = cho[0];
                else ustation.fuseReplaceSlot = cho[1];
            }
            global.fuseName = Gun("name", ustation.fuseReplaceSlot);
        }
        //global.fuseIndexKeep = Gun("index to object", ustation.fuseReplaceSlot);
        //if (cho[0] == global.fuseIndexKeep) global.fuseIndexLose = Gun("index to object", cho[1]); 
        //else global.fuseIndexLose = Gun("index to object", cho[0]);
        global.fuseIndexKeep = Gun("index to object", cho[0]);
        global.fuseIndexLose = Gun("index to object", cho[1]);
        //global.fuseName = Gun("name", global.fuseWinner);
        global.fuseGeneration = Gun("generation", global.fuseWinner);
        global.fuseResult = Drop("fuse fresh", Gun("index to object", cho[0]), Gun("index to object", cho[1]));
        CinemaFusion("play", Gun("index to object", cho[0]), Gun("index to object", cho[1]), global.fuseResult);
    }
}
else if (argument[0] == "draw guns overview")
{
    gunAtn[0] = "damage"; //"DMG";
    gunAtn[1] = "rate";//"RATE";
    gunAtn[2] = "special letter"; //"SPC";
    gunAtt[0] = "DMG";
    gunAtt[1] = "RTE";
    gunAtt[2] = "SPC";
    gunAtt[3] = "CAPACITY";
    /// 5 GUN BANDO
    drx = 15 - 2 + 2; dry = 16 - 2 + 2; //was 24
    ysp = 32 + 8;
    
    // No bandolier gun's available
    if (Gun("amount") == 0)
    {
        gdx = 0; gdy = 0;
        Utility("grid", gdx, gdy, 35, 3);
        drx += 8 + 8 + 8;
        drx += 32 + 24;
        Utility("text 1b", drx + 16 + 4, dry + 13, "No bandolier gun's available", 1, 1, 1);
    }
    
    // Draw guns
    for (i = 0; i < Gun("amount"); i += 1)
    {
        gdx = 0; gdy = i * 4;
        Utility("grid", gdx, gdy, 35, 3); 
        if (relGun[i] == 1) Utility("grid", gdx, gdy, 35, 3, 1);
        gdx += 2; // 1 2 3 4 5
        Utility("linev", gdx, gdy, 3); gdx += 8; // GUN IMAGE
        Utility("linev", gdx, gdy, 3); gdx += 5; // WILM
        Utility("linev", gdx, gdy, 3); gdx += 3; // DMG
        Utility("linev", gdx, gdy, 3); gdx += 5; // RTE
        Utility("linev", gdx, gdy, 3); gdx += 3; // AFX
        Utility("linev", gdx, gdy, 3); gdx += 9; // CAP
        
        Gun("draw index", i, vxv + drx + 16 + 1, vyv + dry, 1, 1, 0, c_white, global.utilitySpriteAlpha);
        
        Utility("text 2c", drx + 4 + 4, dry + 13, string(i + 1), 1, 1, 1); // Slot #
        Utility("text 2c", drx + 16 + 48 + 16 - 2, dry + 20, string(round(Gun("weight", i))) + "~", 1, 2, 1); // Weight
        
        drx += 8 + 8 + 8;
        drx += 32 + 24;
        Utility("text 1b", drx + 16 + 4, dry + 13, Gun("name", i), 1, 1, 1); // Gun name = gunNam[i]
        
        drx += 32 + 8;// + 24;
        if (relGun[i] == 1) wcl = 1; else wcl = 2;
        for (h = 0; h < 5; h += 1)
        {
            if (h == 3) continue;
            if (h == 4) 
            {
                drx += 8;
                Utility("text smallc", drx + 5 + (8 * 3), dry + 6 - 1, "CAPACITY", wcl, 1, 1);
                Utility("text 2c", drx + 4 + (8 * 3), dry + 5 + 12, string(floor(Gun("ammo", i))) + " (" + string(Gun("capacity", i)) + ")", 1, 1, 1);
                break;
            }
            Utility("text smallc", drx + 5 + (8 * 1), dry + 6 - 1, gunAtt[h], wcl, 1, 1);
            var gunVal = Gun(gunAtn[h], i);
            if (h == 0) gunVal = round(gunVal);
            if (h == 1) gunVal = string_format(gunVal, 2, 1);
            Utility("text 2c", drx + 4 + (8 * 1), dry + 5 + 12 , string(gunVal), 1, 1, 1);
            drx += 8 * 3; //4;
            if (h <= 1) drx += 8;
        }
        dry += 16 + 16; //24;
        drx = 15 - 2 + 2;
        draw_set_alpha(1 * global.utilityAlpha);
    }
}
else if (argument[0] == "draw guns info") // Arg0 = grid_x_offset, Arg1 = grid_y_offset, Arg2 = Gunsmap?
{
    gunVal[0] = "damage";
    gunVal[1] = "rate";
    gunVal[2] = "special letter";
    gunVal[3] = "ammo"; //both
    gunAtt[0] = "DMG";
    gunAtt[1] = "RTE";
    gunAtt[2] = "SPC";
    gunAtt[3] = "CAPACITY";
    
    var gxo = 0;
    var gyo = 0;
    var gnm = 1;
    var gdx = 1;
    if (argument_count > 1) { gxo = argument[1]; gyo = argument[2]; }
    if (argument_count > 3) gnm = argument[3];
    if (argument_count > 4) gdx = argument[4];
    if (gunSel == -1)
    {
        Utility("grid",  00 + gxo, 5 + gyo, 26, 3);
        drx = 15 + (gxo * 8); dry = 16 + ((5 + gyo) * 8);
        if (gunMen == "draw guns bandolier") Utility("text 1b", drx - 1 + 6, dry + 2, "No bandolier guns", 1, 0, 0);
        if (gunMen == "draw guns gunsbag") Utility("text 1b", drx - 1 + 6, dry + 2, "No gunsbag guns", 1, 0, 0);
        if (gunMen == "draw guns smelt") Utility("text 1b", drx - 1 + 6, dry + 2, "No guns", 1, 0, 0);
    }
    else
    {
        // Get affix data
        gunInf[0] = scr_combat_weapons_fusion_affixhood("description", Gun("prefix1", gunSel));
        gunInf[1] = scr_combat_weapons_fusion_affixhood("description", Gun("prefix2", gunSel));
        gunInf[2] = scr_combat_weapons_fusion_affixhood("description", Gun("suffix", gunSel));
        /// DRAW = Main gun part
        gdy = 18 + gyo;
        drx = 15 + (31 + gxo) * 8; dry = 16 + (gdy * 8);
        if (gdx) Utility("tab", 13 + gxo, gdy, 5, "AFFIX"); // was 30
        gdy = 9 + gyo;
        drx = vxv + 15 + (gxo * 8);
        dry = vyv + 16 + (gdy * 8);
        if (gdx) Utility("grid", 0 + gxo, gdy, 13 + 22, 9);
        if (gdx) Utility("linev", 13 + gxo, gdy, 9);
        if (gdx) Utility("lineh", 13 + gxo, gdy + 3, 22);
        if (gdx) Utility("lineh", 13 + gxo, gdy + 6, 22);
        drx += 4;
        dry += 3;
        draw_set_color(global.utilityColor[0]);
        draw_set_alpha(global.utilityTextAlpha * global.utilityAlpha);
        DrawGunName(drx, dry, "type", Gun("material", gunSel), Gun("type", gunSel));
        if (gdx) Gun("draw index", gunSel, drx, dry + 20, 2, 2, 0, c_white, global.utilitySpriteAlpha);
        drx += 102;
        draw_set_color(global.utilityColor[0]);
        draw_set_alpha(global.utilityTextAlpha * global.utilityAlpha);
        DrawGunName(drx, dry, "prefix", Gun("prefix1", gunSel));
        if (Gun("prefix1", gunSel) != "") Utility("text 7ocs", drx - vxv + 65, dry - vyv, gunInf[0], 1, 0, 0, 112);
        dry += 24;
        draw_set_color(global.utilityColor[0]);
        draw_set_alpha(global.utilityTextAlpha * global.utilityAlpha);
        DrawGunName(drx, dry, "prefix", Gun("prefix2", gunSel));
        if (Gun("prefix2", gunSel) != "") Utility("text 7ocs", drx - vxv + 65, dry - vyv, gunInf[1], 1, 0, 0, 112);
        dry += 24;
        draw_set_color(global.utilityColor[0]);
        draw_set_alpha(global.utilityTextAlpha * global.utilityAlpha);
        DrawGunName(drx, dry, "suffix", Gun("suffix", gunSel));
        if (Gun("suffix", gunSel) != "") Utility("text 7ocs", drx - vxv + 65, dry - vyv, gunInf[2], 1, 0, 0, 112);
        draw_set_alpha(1 * global.utilityAlpha);
        
        // Gun Map
        if (gnm)
        {
            Utility("draw gun map", 27 + gxo, 0 + gyo, Gunsmap("type to index", Gun("type", gunSel)), Gun("position", gunSel));
            Utility("grid", 27 + gxo, 0 + gyo, 8, 8);
        }
        
        // WEIGHT
        gdy = 18 + gyo;
        drx = 15 + ((9 + gxo) * 8); dry = 16 + (gdy * 8);
        if (gdx) Utility("tab", 8 + gxo, gdy, 5, "WEIGHT");
        Utility("text 1b", drx + 8, dry - 23 + 4 + 2, string(round(Gun("weight", gunSel))) + "|", 1, 0, 0);
        
        // GUN VALUE
        drx -= (8 * 8);
        if (gdx) Utility("tab", 0, gdy, 3, "PTS");
        Utility("text 1b", drx + 8 - 16 + 2, dry - 23 + 4 + 2, Gun("value", gunSel), 1, 0, 0);
        
        attCol = c_gray;
        drx = 15 + (gxo * 8) + 2;
        dry = 16 + (gyo * 8) + (5 * 8) + 2;
        if (gdx) Utility("sprite", s1x1, 0, drx, dry, 2 * 8, 3 * 8, 0, c_black, 0.5 * global.utilitySpriteAlpha);
        if (gdx) Utility("grid",  00 + gxo, 5 + gyo, 26, 3);
        if (gdx) Utility("linev", 02 + gxo, 5 + gyo, 3);
        if (gdx) Utility("linev", 07 + gxo, 5 + gyo, 3);
        if (gdx) Utility("linev", 13 + gxo, 5 + gyo, 3);
        if (gdx) Utility("linev", 16 + gxo, 5 + gyo, 3);
        Utility("sprite", sMenuGunIcon, Gun("icon from type", Gun("type", gunSel)), drx - 2, dry - 2, 1, 1, 0, c_ltgray, global.utilitySpriteAlpha);
        drx = 15 + (gxo * 8) + 2 + 16;
        dry = 16 + (gyo * 8) + (5 * 8) + 2;
        for (h = 0; h < 4; h += 1)
        {
            Utility("text smallc", drx, dry, gunAtt[h], 2, 0, 0);
            if (h == 3) drx -= 3;
            txtVal = Gun(gunVal[h], gunSel);
            if (h == 3) txtVal = floor(txtVal); // Floor ammo
            if (h <= 1) txtVal = string_format(txtVal, 2, 1);
            
            if (h != 3) Utility("text 1b", drx - 1 + 6, dry + 4 + 2, string(txtVal), 1, 0, 0);
            else Utility("text 1b", drx - 1 + 6, dry + 4 + 2, string(txtVal) + " (" + string(Gun("capacity", gunSel)) + ")", 1, 0, 0);
            
            if (h == 3) drx += 3;
            if (h == 1) Utility("text 1b", drx - 1 + 6 + string_width(string(txtVal)) + 2, dry + 4 + 2, "@", 1, 0, 0); // Rate of Fire
            if (h == 0) drx += 5 * 8;
            if (h == 1) drx += 6 * 8;
            if (h == 2) drx += 3 * 8; // capacity
            if (h == 3) drx += 10 * 8;
        }
    }
}
else if (argument[0] == "input select gunsbag")
{
    if (global.keyinput_type == KEYINPUT_KEYBOARD_MOUSE)
    {
        drx = vxv + 15 + (6 * 8); dry = vyv + 16 + (2 * 8);
        for (i = 0; i < Gun("gunbag amount"); i += 1)
        {
            if (Utility("mouse", drx, dry, drx + (1 * 8), dry + (2 * 8) - 1)) gunHil = i + 5;
            drx += (1 * 8);
        }
        if (gunHil != -1 && Utility("key", "action")) gunSel = gunHil;
    }
    else // Gamepad
    {
        if (global.utilityFocus == "main")
        {
            if (Utility("key", "left")) { gunSel -= 1; if (gunSel < 5) gunSel = 5 + Gun("gunbag amount") - 1; }
            if (Utility("key", "right")) { gunSel += 1; if (gunSel > 5 + Gun("gunbag amount") - 1) gunSel = 5; }
        }
    }
}
else if (argument[0] == "draw select gunsbag")
{
    drx = 15; dry = 16 + 16;
    Utility("grid", 0, 2, 26, 2);
    Utility("text 1b", drx + 3, dry + 0, "BAG", 2, 0, 0);
    drx = 15 + (6 * 8) - 1;
    dry = 16 + (2 * 8) + 4;
    for (i = 0; i < 20; i += 1)
    {
        if (i >= Gun("gunbag amount")) break;
        col = c_white;
        if (Gun("favorite", i + 5) == 1) col = c_red;
        if (gunSel - 5 == i) Utility("grid", 6 + i, 2, 1, 2, 4);
        else if (gunHil - 5 == i) { draw_set_alpha(0.5 * global.utilityAlpha); Utility("grid", 6 + i, 2, 1, 2, 2); draw_set_alpha(1 * global.utilityAlpha); }
        else col = merge_color(col, c_gray, 0.5);
        Utility("sprite", sMenuUtilityBlip, Gun("type sub", i + 5) + 1, drx + 1, dry - 3, 1, 1, 0, col, global.utilitySpriteAlpha);
        drx += 8;
    }
}
else if (argument[0] == "input select bandolier")
{
    if (global.keyinput_type == KEYINPUT_KEYBOARD_MOUSE)
    {
        drx = vxv + 15 + (6 * 8); dry = vyv + 16 + (0);
        for (i = 0; i < Gun("amount"); i += 1)
        {
            if (Utility("mouse", drx, dry, drx + (4 * 8), dry + (2 * 8) - 1)) gunHil = i;
            drx += (4 * 8);
        }
        if (gunHil != -1 && Utility("key", "action")) gunSel = gunHil;
    }
    else
    {
        if (global.utilityFocus == "main")
        {
            if (Utility("key", "left")) { gunSel -= 1; if (gunSel < 0) gunSel = Gun("amount") - 1; }
            if (Utility("key", "right")) { gunSel += 1; if (gunSel > Gun("amount") - 1) gunSel = 0; }
        }
    }
}
else if (argument[0] == "draw select bandolier")
{
    drx = 15; dry = 16;
    Utility("grid", 0, 0, 26, 2);
    Utility("text 1b", drx + 3, dry + 0, "BANDO", 2, 0, 0);
    for (i = 0; i < Gun("amount"); i += 1)
    {
        col = gunCol[i];
        if (gunSel == i) Utility("grid", 6 + (i * 4), 0, 4, 2, 4);
        else if (gunHil == i) { draw_set_alpha(0.5 * global.utilityAlpha); Utility("grid", 6 + (i * 4), 0, 4, 2, 4); draw_set_alpha(1 * global.utilityAlpha); }
        else col = merge_color(col, c_gray, 0.5);
        drx = 15 + (6 * 8) + ((i * 4) * 8);
        Utility("sprite", sMenuUtilityBlip, Gun("type sub", i) + 1, drx + 1 - 1, dry, 1, 1, 0, col, global.utilitySpriteAlpha);
        Utility("text 12ocsd", drx + (2 * 8) + 4 - 1, dry + 0, Gun("name", i), 1, 1, 0); // chr(ord("A") + i)
    }
}
else if (argument[0] == "draw rename" || argument[0] == "draw promote")
{
    if (subscriptCreate == 0 && newScript == argument[0])
    {
        renNam = "";
        renSel = 0;
        subscriptCreate = 1;
    }
    if (global.keyinput_type != KEYINPUT_KEYBOARD_MOUSE && actionWait == 0) // Gamepad
    {
        if (renSel < 0) renSel = 0;
        if (string_length(renNam) >= 4)
        {
            if (renSel != 38 || renSel == 39) renSel = 39;
            if (Utility("key", "left") || Utility("key", "right")) { if (renSel != 38) renSel = 38; else renSel = 39; }
        }
        else
        {
            if (Utility("key", "up")) { renSel -= 10; if (renSel < 0) renSel += 40; }
            if (Utility("key", "down")) { renSel += 10; if (renSel > 39) renSel -= 40; }
            if (Utility("key", "left")) { renSel -= 1; if (renSel < 0) renSel += 40; }
            if (Utility("key", "right")) { renSel += 1; if (renSel > 39) renSel -= 40; }
        }
    }
    else // Mouse
    {
        renSel = -1;
        gdx = 7; gdy = 10 + 7;
        drx = 15 + (gdx * 8); dry = 16 + (gdy * 8);
        for (i = 0; i < 40; i += 1)
        {
            zrx = drx + ((i mod renPer) * 16); zry = dry + ((i div renPer) * 16);
            if (Utility("mouse", zrx + vxv, zry + vyv, zrx + vxv + (2 * 8) - 1, zry + vyv + (2 * 8) - 1)) renSel = i;
        }
    }
    Utility("draw guns info", 0, -9, 0);
    
    // Big Letters
    gdx = 11 + 2; gdy = 11;
    drx = 15 + (gdx * 8); dry = 16 + (gdy * 8);
    for (i = 0; i < string_length(renNam); i += 1)
    {
        var renLtr = string_copy(renNam, i + 1, 1);
        Utility("text 1b x2", drx, dry + 4, renLtr, 1, 1, 0);
        drx += 3 * 8;
    }
    
    gdx = 7; gdy = 10 + 7;
    drx = 15 + (gdx * 8); dry = 16 + (gdy * 8);
    didLtr = "";
    if (string_length(renNam) < 4) wcl = 0; else wcl = 38;
    for (i = 0; i < 40; i += 1)
    {
        var renLtr = string_copy(renChr, i + 1, 1);
        zrx = drx + ((i mod renPer) * 16); zry = dry + ((i div renPer) * 16);
        if (i >= wcl && renSel == i)
        {
            Utility("grid", gdx + ((i mod renPer) * 2), gdy + ((i div renPer) * 2), 2, 2, 0);
            if (Utility("key", "action")) didLtr = renLtr;
        }
        if (i >= wcl) wcc = 0; else wcc = 2;
        Utility("text 1b", zrx + 8, zry + 0, renLtr, wcc, 1, 0);
    }
    if (didLtr != "")
    {
        // Backspace
        if (didLtr == "}") { if (renNam != "") renNam = string_delete(renNam, string_length(renNam), 1); }
        // End / Fin
        else if (didLtr == "~")
        {
            if (string_length(renNam) == 4)
            {
                did = 1;
                wcl = gunSel;
                for (i = 0; i < 5; i += 1)
                {
                    if (i != gunSel)
                    {
                        if (Gun("name", i) == renNam) did = 0;
                    }
                }
                if (did == 0) Utility("warning", renameError);
                else 
                { 
                    Gun("name", gunSel, renNam); 
                    if (argument[0] == "draw promote")
                    {
                        Gun("promote", gunSel);
                        if (gunSel != 5) gunSel -= 1;
                        if (Gun("gunbag amount") <= 0) gunSel = -1;
                    }
                    Utility("go back"); 
                }
            }
            else Utility("warning", renameShort);
        }
        // Add new letter if able
        else if (string_length(renNam) < 4) renNam += didLtr;
    }
}
else if (argument[0] == "draw gunsbag")
{
    drx = 15; dry = 8 * 22;
    Utility("sprite", sMenuUtilityGunsbag, 0, drx + (6 * 8) + 2, dry + (3 * 8) + 1, 1, 1, 0, c_white, global.utilitySpriteAlpha); // 30, 23
    Utility("grid", 0, 20, 10, 6);
    Utility("text 1b", drx + (5 * 8), dry + (2 * 8) - 2, "Gun'sbag", 1, 1, 1);
    Utility("text 1b", drx + 29 - 2, dry + (4.5 * 8) - 2 + 3, string(Gun("gunbag amount")) + " (20)", 1, 1, 1);
}
else if (argument[0] == "draw smelt")
{
    /// SMELT
    drx = 15; dry = 8 * 22;
    smlSub = ceil(45 * (scr_savedata_get("ustation.smelt") / 1000));
    drx += 48 + 8 + 32;
    Utility("tab", 11 + 19, 20, 5, "SMELT");
    Utility("grid", 11, 21, 24, 5);
    Utility("sprite", sMenuUtilitySmelt, 0, drx + 8, dry + 11, 1, 1, 0, c_white, 0.8 * global.utilitySpriteAlpha);
    Utility("sprite", sMenuUtilitySmelt, smlSub, drx + 8, dry + 11, 1, 1, 0, c_white, 0.4 * global.utilitySpriteAlpha);
    draw_set_blend_mode(bm_add);
    for (z = 0; z < smlSub; z += 1)
    {
        smtDir[z] += dt() + smtSpd[z] * 3;
        Utility("sprite", sMenuUtilitySmelt, z, drx + 8, dry + 11, 1, 1, 0, merge_color(c_black, c_white, (0.5 + lengthdir_x(0.5, smtDir[z])) / 30), 1 * global.utilitySpriteAlpha);
    }
    draw_set_font(global.utilityFontSmelt);
    draw_set_blend_mode(bm_normal);
    tx0 = string(floor(scr_savedata_get("ustation.smelt"))) + " SMELT";
    tx1 = tx0;
    if (smelta != 0)
    {
        if (smelta < 0) tx1 = " - " + string(abs(smelta)) + "";
        else tx1 = " + " + string(smelta) + "";
        Utility("text smelt", drx + (6 * 8) + 4 + string_width(tx0), dry + 8 + 19 - 1, tx1, 6, 0, 0);
        Utility("text smelt", drx + (6 * 8) + 4, dry + 8 + 19 - 1, tx0, 7, 0, 0);
    }
    else
    {
        Utility("text smelt", drx + (6 * 8) + 4, dry + 8 + 19 - 1, tx0, 7, 0, 0);
    }
}
else if (argument[0] == "draw lineage") // Arg1 = lineage_top?, Arg2 = lineage_bot?
{
    if (argument_count > 1) cho[0] = argument[1]; 
    else cho[0] = Lineage("get", Gun("lineage top", gunSel)); // IS A GUN OBJECT
    if (argument_count > 2) cho[1] = argument[2]; 
    else cho[1] = Lineage("get", Gun("lineage bot", gunSel));
    gdy = 19;
    drx = 15; dry = 16 + (gdy * 8);
    Utility("tab", 30, gdy, 5, "LINEAGE");
    dry += 8;
    drw = 35; drh = 3;
    Utility("grid", 0, gdy + 1, drw, 6);
    Utility("linev", 8, gdy + 1, 6);
    Utility("lineh", 0, gdy + 1 + 3, drw);
    for (var lin = 0; lin < 2; lin += 1)
    {
        //show_debug_message("Utility- gunSel = " + string(gunSel) + " , lineage_top=" + string(Gun("lineage top", gunSel)) + " , lineage_bot=" + string(Gun("lineage bot", gunSel)));
        var lgt = cho[lin];
        if (ds_exists(lgt, ds_type_map))
        {
            if (is_undefined(lgt[? "hudIconSprite"]) == 0)
            {
                Gun("draw map", lgt, vxv + drx + 1, vyv + dry, 1, 1, 0, c_white, global.utilitySpriteAlpha);
                Utility("text 2c", drx + 48 + 16 - 2, dry + 15, string(round(lgt[? "pWeight"])) + "~", 1, 2, 0);
                var _p1 = lgt[? "pPrefix1"]; // Gun("prefix1", lgt)
                var _p2 = lgt[? "pPrefix2"]; // Gun("prefix2", lgt)
                var _ma = lgt[? "pMaterial"]; // Gun("material", lgt)
                var _ty = lgt[? "pType"]; // Gun("type", lgt)
                var _su = lgt[? "pSuffix"]; // Gun("suffix", lgt)
                DrawGunName(drx + vxv + 56 + 1 + 8 + 3, dry + vyv + 4, _p1, _p2, _ma, _ty, _su, 0);
            }
            else { show_debug_message("Utility('draw lineage') - Exit because icon is undefined."); }
        }
        else { show_debug_message("Utility('draw lineage') - Exit because map doesn't exist."); }
        dry += 24;
    }
}
else if (argument[0] == "draw gun map") // X, Y, GUNSMAP_INDEX, GUNSMAP_POSITION
{
    gdx = argument[1]; gdy = argument[2];
    drx = 15 + (gdx * 8); dry = 16 + (gdy * 8); drw = 8 * 8; drh = 1 * 8;
    image_alpha = global.utilitySpriteAlpha;
    Gunsmap("draw64", drx + vxv + 1, dry + vyv + 1, argument[3], argument[4]);
    image_alpha = 1;
}
else if (argument[0] == "draw resistance") // 1 = x, 2 = y
{
    drx = vxv + argument[1];
    dry = vyv + argument[2];
    _sl = 5;
    _rd = 20; // radius
    _dd = 360 / _sl;
    _dr = _dd / 4;
    _tg = 1;
    for (_i = 0; _i < _sl; _i += 1)
    {
        //resCol[_i]
        _vl = _rd * ((argument[3 + _i] + 100) / 300);
        draw_set_color(c_ltgray);
        draw_set_alpha(0.66 * global.utilityAlpha);
        draw_triangle(drx, dry, 
            drx + lengthdir_x(_rd, _dr), dry + lengthdir_y(_rd, _dr),
            drx + lengthdir_x(_rd, _dr + _dd), dry + lengthdir_y(_rd, _dr + _dd), 0);
        draw_set_alpha(0.66 * global.utilityAlpha);
        draw_set_color(c_dkgray);
        draw_triangle(drx, dry, 
            drx + lengthdir_x(_rd, _dr), dry + lengthdir_y(_rd, _dr),
            drx + lengthdir_x(_rd, _dr + _dd), dry + lengthdir_y(_rd, _dr + _dd), 1);
        // Draw actual amount
        draw_set_alpha(0.75 * global.utilityAlpha);
        draw_set_color(resCol[_i]);
        draw_triangle(drx, dry, 
            drx + lengthdir_x(_vl, _dr), dry + lengthdir_y(_vl, _dr),
            drx + lengthdir_x(_vl, _dr + _dd), dry + lengthdir_y(_vl, _dr + _dd), 0);
        draw_set_color(merge_color(resCol[_i], c_black, 0.5));
        // Blip
        if (_i < 2) _bs = 3; else if (_i == 2 || _i == 4) _bs = 2; else _bs = 1;
        Utility("sprite", sMenuUtilityResistanceBlip, 0, 
            drx - vxv - 2 + lengthdir_x(_rd + _bs, _dr + (_dd / 2)), dry - vyv - 2 + lengthdir_y(_rd + _bs, _dr + (_dd / 2)), 
            1, 1, 0, resCol[_i], global.utilitySpriteAlpha);
        // Continue
        _dr += _dd;;
    }
    _dr = _dd / 4;
    drx -= 1; dry -= 1;
    for (_i = 0; _i < 5; _i += 1)
    {
        
        _vl = _rd * ((argument[3 + _i] + 100) / 300);
        draw_set_color(merge_color(resCol[_i], c_black, 0.5));
        
        draw_line(drx, dry, drx + lengthdir_x(_vl, _dr), dry + lengthdir_y(_vl, _dr));
        _dr += _dd;
    }
}
else if (argument[0] == "draw dna") // 1 = x, 2 = y, 3 = bio, 4 = cyber, 5 = cosmic, 6 = zauber
{
    var dx = argument[1];
    var dy = argument[2];
    var w = (16 * 8) - 4;
    var h = (3 * 8);
    var rots = 3; // How much the strand "twists"
    var amountA = argument[3];
    var amountB = argument[4];
    var amountC = argument[5];
    var amountD = argument[6];
    var colorA = c_bio;
    var colorB = c_cyber;
    var colorC = c_cosmic;
    var colorD = c_zauber;
    
    // Specify some constants used for rendering
    var STEP_X = 6;
    var CENTER_X = dx + w/2;
    var CENTER_Y = dy + h/2;
    var SIN_H = (h/2)-6;
    var SIN_DEPTH = 0.05;
    var DEPTH_CENTER = 1 + SIN_DEPTH;
    var ANGLE_PER_STEP = (pi*2) / ((w/STEP_X)/rots);
    
    // Preliminary color calculation
    amountTot = amountA + amountB + amountC + amountD;
    amountPerStep = amountTot / (w / STEP_X);
    
    // Define spiral orbs to draw
    var todraw = ds_priority_create();
    
    var current_x = -w/2;
    var angle = -current_time / 300.0;
    var n = 0;
    var amount = 0;
    while (current_x < w/2) {
        var z = DEPTH_CENTER + SIN_DEPTH * sin(angle);
        var scale = 1/z;
        
        var color;
        if (amount < amountA) color = colorA;
        else if (amount < amountA + amountB) color = colorB;
        else if (amount < amountA + amountB + amountC) color = colorC;
        else color = colorD;
        
        var orbToDraw = ds_list_create();
        orbToDraw[| 0] = CENTER_X + current_x*scale;
        orbToDraw[| 1] = CENTER_Y + SIN_H*scale*cos(angle);
        orbToDraw[| 2] = merge_colour(color, c_black, (1 - scale) * 4);
        orbToDraw[| 3] = scale*0.8;
        ds_priority_add(todraw, orbToDraw, z);
        
        var z = DEPTH_CENTER - SIN_DEPTH * sin(angle);
        var scale = 1/z;
        orbToDraw = ds_list_create();
        orbToDraw[| 0] = CENTER_X + current_x*scale;
        orbToDraw[| 1] = CENTER_Y - SIN_H*scale*cos(angle);
        orbToDraw[| 2] = merge_colour(color, c_black, (1 - scale) * 4);;
        orbToDraw[| 3] = scale*0.7;
        ds_priority_add(todraw, orbToDraw, z);
        
        if ((n mod 2) == 1) {
            // Add interconnecting line
            for (len = -0.6; len <= 0.6; len += 0.4) {var z = DEPTH_CENTER - SIN_DEPTH * sin(angle);
                z = DEPTH_CENTER - SIN_DEPTH * sin(angle) * len;
                scale = 1/z;
                orbToDraw = ds_list_create();
                orbToDraw[| 0] = CENTER_X + current_x*scale;
                orbToDraw[| 1] = CENTER_Y - SIN_H*scale*cos(angle)*len;
                orbToDraw[| 2] = merge_colour(color, c_black, (1 - scale) * 4);;
                orbToDraw[| 3] = scale*0.4;
                ds_priority_add(todraw, orbToDraw, z);
            }
        }
        
        current_x += STEP_X;
        angle += ANGLE_PER_STEP;
        amount += amountPerStep;
        n++;
    }
    
    // Draw all the orbs in depth order
    while (!ds_priority_empty(todraw)) {
        var orbToDraw = ds_priority_find_max(todraw);
        ds_priority_delete_max(todraw);
        Utility("sprite", sMenuUtilityOrb, 0,
                        orbToDraw[| 0], orbToDraw[| 1],
                        orbToDraw[| 3], orbToDraw[| 3],
                        0, orbToDraw[| 2], 1 * global.utilityAlpha);
        ds_list_destroy(orbToDraw);
    }
    
    // Clean up the universe
    ds_priority_destroy(todraw);
}
else if (argument[0] == "dwarfnet")
{
    if(doAction == "CONNECT")
    {
        Dnet("init");
        Dnet("launch");
        DnetUsers("init");
        Utility("input", 0);
    }
}
else if (argument[0] == "create")
{
    global.utilityTextAlpha = global.settingUtilityTextAlpha; // Alpha of all text
    global.utilityAlphaBack = global.settingUtilityAlphaBack; // Alpha of grid BG
    global.utilityAlphaGlow = global.settingUtilityAlphaGlow; // Alpha of glowing (text, grid)
    global.utilityAlphaBorder = global.settingUtilityAlphaBorder; // Alpha of foreground grids, lines, etc
    global.utilityHue = Quest("playerGumballColor")
    global.utilityMono = global.settingUtilityMono; // How colorful the menu is, 0 being B&W 1 being full color

    spawn_resetStates();
    scr_statusEffect_clearStatusEffects(o_hoopz.id);
    scr_player_setGunHolstered(true);
    scr_stats_setCurrentStat(o_hoopz.id, STAT_CURRENT_HP, scr_stats_getEffectiveStat(o_hoopz.id, STAT_EFFECTIVE_MAX_HP)); 
    // repeat (5) scr_items_add(scr_items_db_getCopyOfItem("Butterscotch"));
    
    global.utilityFocus = "side";
    global.utilityColorHilightDirection = 0; // Counter for flashing color
    
    utilityInput = 1; // For freezing during transition
    utilityFadeIn = 1;
    utilityFadeOut = 0;
    Utility("input", 0);
    
    doAction = "";
    actionWait = 0;
    
    HUD("setup scale");
    Utility("step"); // 0, 1, 2, 3, 4, hilight
    Utility("hoopz stats get");
    
    // Smelt bar
    pushBack = 0; // For when you smelt a gun to keep in bounds
    smelta = 0;
    for (z = 0; z < 99; z += 1) { smtDir[z] = random(360); smtSpd[z] = 1 + random(1); }
    
    // Status //dnaAnim = 0; //dnaSpeed = 5;
    
    // Rename
    renSel = -1; // gunSel from bando
    renChr = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ+-}~";
    renPer = 10;
    renSel = 0;
    renNam = ""; // Name of gun to be
    
    // Bandolier / Bag
    gunSel = 0;
    gunAtt[0] = "DMG";
    gunAtt[1] = "RTE";
    gunAtt[2] = "SPC";
    gunAtt[3] = "WGT";
    
    // Breed
    brdCho[0] = -1;
    brdCho[1] = -1;
    gunAtb[0] = "DMG";
    gunAtb[1] = "RATE";
    gunAtb[2] = "CAPACITY";
    gunAtb[3] = "SPC";
    gunAtb[4] = "GEN";
    gunAtf[0] = "damage";
    gunAtf[1] = "rate";
    gunAtf[2] = "capacity";
    gunAtf[3] = "special letter";
    gunAtf[4] = "generation";
    
    /// Candy
    candySelect = 0;
    cdyLis = -1;
    
    // Colors
    comCol[0] = 5; // global.utilityColor
    comCol[1] = 7;
    comCol[2] = 8;
    
    // BRAIN
    lvlDir = 0; // For level up arrow blinking
    for (i = 0; i < 5; i += 1) wavTim[i] = 0; // Level up waves
    /// VIDCONS
    vidconSelect = 0;
    vidconIndex = 0;
    vidconScroll = 0;
    vidconScrollMax = Vidcon("game total") - 5;
    
    // Reload counter
    relCou = 0;
    relIni = -1; // Reload initiate
    for (i = 0; i < 5; i += 1) relGun[i] = 0;
    
    // ITEM
    itmDis = 10;
    itmSel = 0;
    itmScr = 0;
    
    /// STATS / EQUIP - around line 620
    resCol[0] = c_bio;
    resCol[1] = c_cyber;
    resCol[2] = c_mental;
    resCol[3] = c_cosmic;
    resCol[4] = c_zauber;
    resNam[0] = "BIO";
    resNam[1] = "CYBER";
    resNam[2] = "MENTAL";
    resNam[3] = "KOSMIC";
    resNam[4] = "ZAUBER";
    rssCol[0] = c_white;
    rssCol[1] = c_bio;
    rssCol[2] = c_cyber;
    rssCol[3] = c_mental;
    rssCol[4] = c_cosmic;
    rssCol[5] = c_zauber;
    
    // Genes 8 rows of 4 = 32
    genGrp = 8;
    genSub[0] = 3; // Prefix 1
    genAfi[0] = 0; 
    genGni[0] = 0;
    genRef[0, 0] = "plus"; genRef[0, 1] = "minus"; genRef[0, 2] = "pound";
    genLtr[0, 0] = "P";    genLtr[0, 1] = "M";     genLtr[0, 2] = "\#";
    
    genSub[1] = 6; // Prefix 1
    genAfi[1] = 0; 
    genGni[1] = 3;
    genRef[1, 0] = "random"; genRef[1, 1] = "homing"; genRef[1, 2] = "bounce"; genRef[1, 3] = "curved"; genRef[1, 4] = "firing"; genRef[1, 5] = "linear";
    genLtr[1, 0] = "R";      genLtr[1, 1] = "H";      genLtr[1, 2] = "B";      genLtr[1, 3] = "C";      genLtr[1, 4] = "F";      genLtr[1, 5] = "L";
    
    genSub[2] = 3; // Prefix 2
    genAfi[2] = 1; 
    genGni[2] = 0;
    genRef[2, 0] = "top"; genRef[2, 1] = "bottom"; genRef[2, 2] = "charm";
    genLtr[2, 0] = "T";   genLtr[2, 1] = "B";      genLtr[2, 2] = "C";
    
    genSub[3] = 5; // Prefix 2
    genAfi[3] = 1; 
    genGni[3] = 3;
    genRef[3, 0] = "bio"; genRef[3, 1] = "cyber"; genRef[3, 2] = "mental"; genRef[3, 3] = "cosmic"; genRef[3, 4] = "zauber";
    genLtr[3, 0] = "B";   genLtr[3, 1] = "C";     genLtr[3, 2] = "M";      genLtr[3, 3] = "K";      genLtr[3, 4] = "Z";
    
    genSub[4] = 4; // Prefix 2
    genAfi[4] = 1; 
    genGni[4] = 8;
    genRef[4, 0] = "hp"; genRef[4, 1] = "capability"; genRef[4, 2] = "properties"; genRef[4, 3] = "weight";
    genLtr[4, 0] = "H";  genLtr[4, 1] = "C";          genLtr[4, 2] = "P";          genLtr[4, 3] = "W";
    
    genSub[5] = 3; // Suffix
    genAfi[5] = 2; 
    genGni[5] = 0;
    genRef[5, 0] = "up"; genRef[5, 1] = "down"; genRef[5, 2] = "strange";
    genLtr[5, 0] = "U";  genLtr[5, 1] = "D";    genLtr[5, 2] = "S";
    
    genSub[6] = 3; // Suffix
    genAfi[6] = 2; 
    genGni[6] = 3;
    genRef[6, 0] = "reactive"; genRef[6, 1] = "aggressive"; genRef[6, 2] = "passive";
    genLtr[6, 0] = "R";        genLtr[6, 1] = "A";          genLtr[6, 2] = "P";
    
    genSub[7] = 5; // Suffix
    genAfi[7] = 2; 
    genGni[7] = 6;
    genRef[7, 0] = "bio"; genRef[7, 1] = "cyber"; genRef[7, 2] = "mental"; genRef[7, 3] = "cosmic"; genRef[7, 4] = "zauber";
    genLtr[7, 0] = "b";   genLtr[7, 1] = "c";     genLtr[7, 2] = "m";      genLtr[7, 3] = "k";      genLtr[7, 4] = "z";
    // Assign random values so they get shifted
    for (i = 0; i < 2; i += 1)
    {
        for (q = 0; q < genGrp; q += 1)
        {
            genGrpPri[i, q] = ds_priority_create();
            for (v = 0; v < genSub[q]; v += 1)
            {
                ds_priority_add(genGrpPri[i, q], genLtr[q, v], irandom(100));
            }
        }
    }
    
    // EQUIPMENT - Lists
    // 0 = Jerkin, 1 = Helmet, 2 = Vidcon
    eqpJer = 0; eqpHel = 0; eqpVid = 0; eqpGun = Gun("current"); // PLUG IN
    eqpJerNew = eqpJer; eqpHelNew = eqpHel;
    // Helmet list
    eqpNam[0, 0] = Helmet("name");
    eqpWei[0, 0] = Helmet("weight");
    eqpPoc[0, 0] = 0;
    eqpRes[0, 0] = Helmet("res_normal");
    eqpRes[0, 1] = Helmet("res_bio");
    eqpRes[0, 2] = Helmet("res_cyber");
    eqpRes[0, 3] = Helmet("res_cosmic");
    eqpRes[0, 4] = Helmet("res_mental");
    eqpRes[0, 5] = Helmet("res_zauber");
    eqpAmt[0] = 1;
    // Jerkin list
    jrkLis = Jerkin("list");
    for (i = 0; i < Jerkin("count"); i += 1)
    {
        jrkNam = jrkLis[| i];
        if (Jerkin("current") == jrkNam) eqpJer = i;
        eqpNam[1, i] = jrkNam;;
        eqpWei[1, i] = Jerkin("weight", jrkNam);
        eqpPoc[1, i] = Jerkin("pockets", jrkNam);
        eqpRes[1, (i * 6) + 0] = Jerkin("res_normal", jrkNam); // normal
        eqpRes[1, (i * 6) + 1] = Jerkin("res_bio", jrkNam); // bio
        eqpRes[1, (i * 6) + 2] = Jerkin("res_cyber", jrkNam); // cyber
        eqpRes[1, (i * 6) + 3] = Jerkin("res_cosmic", jrkNam); // kosmic
        eqpRes[1, (i * 6) + 4] = Jerkin("res_mental", jrkNam); // mental
        eqpRes[1, (i * 6) + 5] = Jerkin("res_zauber", jrkNam); // zauber
    }
    eqpAmt[1] = i;
}
else if (argument[0] == "hoopz stats get") // Load in these externally later
{
    with (o_hoopz)
    {
        combat_gunwield_reset();
        scr_player_calculateWeight();
        scr_stats_genEffectiveStats();
        scr_stats_resetCurrentStats();
    }
    
    dnaBio = scr_savedata_get("player.humanism.bio"); 
    dnaCyber = scr_savedata_get("player.humanism.cyber"); 
    dnaCosmic = scr_savedata_get("player.humanism.cosmic"); 
    dnaZauber = scr_savedata_get("player.humanism.zauber"); 
    // Mental does not exist
    
    sttNam[0] = "WEIGHT";
    sttNam[1] = "GUTS";
    sttNam[2] = "LUCK";
    sttNam[3] = "ACRO";
    sttNam[4] = "MIGHT";
    sttNam[5] = "PIETY";
    sttNam[6] = "POCKET";
    sttNam[7] = "LEVEL"; // extras
    
    sttVal[0] = "99~"; // NOT USED
    sttVal[1] = scr_savedata_get("player.stats.base." + STAT_BASE_GUTS);
    sttVal[2] = scr_savedata_get("player.stats.base." + STAT_BASE_LUCK);
    sttVal[3] = scr_savedata_get("player.stats.base." + STAT_BASE_AGILE);
    sttVal[4] = scr_savedata_get("player.stats.base." + STAT_BASE_MIGHT);
    sttVal[5] = scr_savedata_get("player.stats.base." + STAT_BASE_PIETY);
    sttVal[6] = 95; // pocket - NOT USED
    sttVal[7] = scr_savedata_get("player.xp.level");
    
    // STATUS MENU
    valNam[0] = "HP"; 
    valStt[0] = scr_stats_getEffectiveStat(o_hoopz, STAT_EFFECTIVE_MAX_HP);
    valNam[1] = "LVL"; 
    valStt[1] = floor(scr_savedata_get("player.xp.questxp"));
    // I also need the amount of bandolier guns and gunsbag
    sclMgt = scr_stats_getEffectiveStat(o_hoopz, STAT_BASE_MIGHT);
    sclWgt = scr_stats_getEffectiveStat(o_hoopz, STAT_BASE_WEIGHT);
}
else if (argument[0] == "hoopz stats set") // Call after level up
{
    scr_savedata_put("player.stats.base." + STAT_BASE_GUTS, sttVal[1]);
    scr_savedata_put("player.stats.base." + STAT_BASE_LUCK, sttVal[2]);
    scr_savedata_put("player.stats.base." + STAT_BASE_AGILE, sttVal[3]);
    scr_savedata_put("player.stats.base." + STAT_BASE_MIGHT, sttVal[4]);
    scr_savedata_put("player.stats.base." + STAT_BASE_PIETY, sttVal[5]);
    scr_savedata_put("player.xp.level", sttVal[7]);
    with (o_hoopz)
    {
        scr_stats_genEffectiveStats();
        scr_stats_resetCurrentStats();
        scr_player_calculateWeight();
    }
    sclMgt = scr_stats_getEffectiveStat(o_hoopz, STAT_BASE_MIGHT);
    sclWgt = scr_stats_getEffectiveStat(o_hoopz, STAT_BASE_WEIGHT);
}
else if (argument[0] == "hoopz weight") { return eqpWei[1, eqpJer] + eqpWei[0, eqpHel]; }
else if (argument[0] == "total experience") { return Vidcon("experience") + floor(scr_savedata_get("player.xp.questxp")); }
else if (argument[0] == "experience to next") { return max(0, ((scr_savedata_get("player.xp.level") - 11) * 60) - Utility("total experience")); }
else if (argument[0] == "smelt")
{
    scr_savedata_put("ustation.smelt", clamp(scr_savedata_get("ustation.smelt") + argument[1], 0, 1000));
    return 1;
}
else if (argument[0] == "equip")
{
    if (argument[1] == "helmet")
    {
        eqpHel = argument[2];
    }
    else // Jerkin
    {
        eqpJer = argument[2];
        var jrp = Jerkin("pockets used");
        Jerkin("equip", eqpNam[1, eqpJer]);
        if (jrp > Jerkin("pockets")) // Lose candies here
        {
            for (var jri = jrp - 1; jri >= Jerkin("pockets"); jri -= 1) //
            {
                var cdyRes = scr_items_delete(ITEMTYPE_CANDY, jri);
            }
        }
    }
    Utility("hoopz stats get");
}
else if (argument[0] == "reload")
{
    var smelt = scr_savedata_get("ustation.smelt");
    if (smelt >= 1)
    {
        if (argument[1] == "all")
        {
            var rsp = 0;
            for (var rei = 0; rei < Gun("amount"); rei += 1)
            {
                if (Gun("ammo", rei) < Gun("capacity", rei)) rsp += 1;
            }
            if (rsp > 0)
            {
                scr_savedata_put("ustation.smelt", smelt - 1);
                rsp = 100 * rsp;
                for (var rei = 0; rei < Gun("amount"); rei += 1)
                {
                    if (Gun("ammo", rei) < Gun("capacity", rei)) 
                    {
                        Gun("ammo", rei, Gun("ammo", rei) + (Gun("capacity", rei) / rsp));
                        if (Gun("ammo", rei) >= Gun("capacity", rei)) Gun("ammo", rei, Gun("capacity", rei));
                    }
                }
            }
        }
        else
        {
            gunTry = real(argument[1]);
            if (Gun("ammo", gunTry) < Gun("capacity", gunTry))
            {
                scr_savedata_put("ustation.smelt", smelt - 1);
                Gun("ammo", gunTry, Gun("ammo", gunTry) + (Gun("capacity", gunTry) / 100));
                if (Gun("ammo", gunTry) >= Gun("capacity", gunTry)) Gun("ammo", gunTry, Gun("capacity", gunTry));
            }
        }
    }
}
else if (argument[0] == "go back")
{
    if (argument_count == 1) hover = menuTops - 1;
    else hover = argument[1];
    if (menuTopLink[hover] == 0) exit;
    menu = menuTopLink[hover];
    menuSelect = menuTopSelect[hover];
    menuTops = hover;
    event_user(10);
}
else if (argument[0] == "focus main") { actionWait = 2; global.utilityFocus = "main"; }
else if (argument[0] == "focus side") { actionWait = 2; global.utilityFocus = "side"; menuSelect = 0; }
else if (argument[0] == "choose") { alpOvr = 1; alpTxt = argument[1]; alpSel = 0; alpRes = -1; actionWait = 2; }
else if (argument[0] == "warning") { alpWar = 1; alpOvr = 1; alpTxt = argument[1]; alpSel = 0; alpRes = -1; actionWait = 2; }
else if (argument[0] == "alpha") { if (argument_count == 1) return global.utilityAlpha; else global.utilityAlpha = argument[1]; }
else if (argument[0] == "input") { if (argument_count == 1) return utilityInput; else utilityInput = argument[1]; }
else if (argument[0] == "key")
{
    if (utilityInput == 0) return 0;
    if (argument_count == 2) return MiniKeyPress(argument[1]);
    if (argument_count == 3) return MiniKeyPress(argument[1], argument[2]);
}
else if (argument[0] == "mouse")
{
    if (utilityInput == 0) return 0;
    return scr_mouse_rect(argument[1], argument[2], argument[3], argument[4]);
}
else if (argument[0] == "quote") { return global.quoTxt[floor(random(global.quoAmt))]; }
else if (argument[0] == "unplug" || argument[0] == "exit") { if (utilityFadeOut == 0) { utilityFadeOut = 1; Utility("input", 0); } }
