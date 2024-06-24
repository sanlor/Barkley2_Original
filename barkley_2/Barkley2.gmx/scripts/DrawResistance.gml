/// DrawResistance(x, y, bio, cyber, mental, cosmic, zauber, physical, letters [optional], alpha [optional])
// Use -999 to exclude a value to be drawn
if (argument_count == 0)
{
    var pietyBonus = 0;//scr_stats_getEffectiveStat(self, STAT_BASE_PIETY) * global.pietyBonus;
    var pietyBase = scr_stats_getEffectiveStat(self, STAT_BASE_PIETY) * global.pietyBonus;
    var resBio = scr_stats_getEffectiveStat(self, STAT_BASE_RESISTANCE_BIO) - pietyBase;
    var resCyb = scr_stats_getEffectiveStat(self, STAT_BASE_RESISTANCE_CYBER) - pietyBase;
    var resMen = scr_stats_getEffectiveStat(self, STAT_BASE_RESISTANCE_MENTAL) - pietyBase;
    var resCos = scr_stats_getEffectiveStat(self, STAT_BASE_RESISTANCE_COSMIC) - pietyBase;
    var resZau = scr_stats_getEffectiveStat(self, STAT_BASE_RESISTANCE_ZAUBER) - pietyBase;
    var resNor = scr_stats_getEffectiveStat(self, STAT_BASE_RESISTANCE_NORMAL);
    resAlt[0] = resBio != (scr_stats_getBaseStat(self, STAT_BASE_RESISTANCE_BIO) + pietyBonus);
    resAlt[1] = resCyb != (scr_stats_getBaseStat(self, STAT_BASE_RESISTANCE_CYBER) + pietyBonus);
    resAlt[2] = resMen != (scr_stats_getBaseStat(self, STAT_BASE_RESISTANCE_MENTAL) + pietyBonus);
    resAlt[3] = resCos != (scr_stats_getBaseStat(self, STAT_BASE_RESISTANCE_COSMIC) + pietyBonus);
    resAlt[4] = resZau != (scr_stats_getBaseStat(self, STAT_BASE_RESISTANCE_ZAUBER) + pietyBonus);
    resAlt[5] = resNor != scr_stats_getBaseStat(self, STAT_BASE_RESISTANCE_NORMAL);
    // Set to actual value now that compare has been made
    resBio = scr_stats_getEffectiveStat(self, STAT_BASE_RESISTANCE_BIO);
    resCyb = scr_stats_getEffectiveStat(self, STAT_BASE_RESISTANCE_CYBER);
    resMen = scr_stats_getEffectiveStat(self, STAT_BASE_RESISTANCE_MENTAL);
    resCos = scr_stats_getEffectiveStat(self, STAT_BASE_RESISTANCE_COSMIC);
    resZau = scr_stats_getEffectiveStat(self, STAT_BASE_RESISTANCE_ZAUBER);
    resNor = scr_stats_getEffectiveStat(self, STAT_BASE_RESISTANCE_NORMAL);
    // Draw id there's a resistence difference
    if (resAlt[0] or resAlt[1] or resAlt[2] or resAlt[3] or resAlt[4] or resAlt[5] or quickmenu2())
    {
        var dvx = floor(dx + ailmentTotem_core_x_get(self.id));
        var dvy = floor(dy - ailmentTotem_core_y_get(self.id));
        DrawResistance(dvx, dvy, resBio, resCyb, resMen, resCos, resZau, resNor);
    }
    return 1;
}
var drx = floor(argument[0]);
var dry = floor(argument[1]);
_rs[0] = argument[2]; _rl[0] = "B"; _rc[0] = c_bio;
_rs[1] = argument[3]; _rl[1] = "C"; _rc[1] = c_cyber;
_rs[2] = argument[4]; _rl[2] = "M"; _rc[2] = c_mental;
_rs[3] = argument[5]; _rl[3] = "K"; _rc[3] = c_cosmic;
_rs[4] = argument[6]; _rl[4] = "Z"; _rc[4] = c_zauber;
_rs[5] = argument[7]; _rl[5] = "N"; _rc[5] = c_normal;
if (argument_count <= 8) { var ltr = 1; } else { var ltr = argument[8]; }
if (argument_count <= 9) { var alp = 0.8; } else { var alp = argument[9]; }

if (_rs[0] != -999 || _rs[1] != -999 || _rs[2] != -999 || _rs[3] != -999 || _rs[4] != -999 || _rs[5] != -999)
{
    // Scale of resistances 300 // From -100 to +200 //
    var scale = 100; // 200 was old - was 300
    var line_height = 24;
    var line_w = 3;
    var gap = 3;
    // 50 = 1 to 150 = max
    for (var i = 0; i < 6; i += 1) { _rn[i] = clamp((_rs[i] + 50) / scale * line_height, 1, line_height); } // was + 100
    var xps = 0;
    
    // Draw defaults //
    draw_set_alpha(alp);
    draw_set_color(c_white);
    draw_set_font(global.fn_small);
    
    // Draw white line width according to how many are being shown
    for (var g = 0; g < 6; g += 1) { if (_rs[g] != -999) xps += (line_w + gap); }
    //draw_sprite_ext(s1x1, 0, drx, dry + 8 - ceil(line_height * 0.5) + 1, xps - 1, 1, 0, c_white, alp);
    draw_sprite_ext(s1x1, 0, drx, dry + 8 - 11, xps - 1, 1, 0, c_white, alp);
    xps = 0;
    
    // Do all 6 resistance bars
    for (var i = 0; i < 6; i += 1)
    {
        if (_rs[i] != -999) 
        {
            draw_sprite_ext(s1x1, 0, drx + xps + 1, dry + 8 + 1, line_w, - _rn[i], 0, _rc[i], alp);
            if (ltr) draw_text(drx + xps + 1 - (i == 2), dry + 10, _rl[i]);
            xps += (line_w + gap);
        }
    }
    draw_set_alpha(1);
}
