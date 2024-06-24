// Enemy GLAMP //
var glamp_G = scr_stats_getEffectiveStat(self, STAT_BASE_GUTS);
var glamp_L = scr_stats_getEffectiveStat(self, STAT_BASE_LUCK);
var glamp_A = scr_stats_getEffectiveStat(self, STAT_BASE_AGILE);
var glamp_M = scr_stats_getEffectiveStat(self, STAT_BASE_MIGHT);
var glamp_P = scr_stats_getEffectiveStat(self, STAT_BASE_PIETY);
var glamp_W = scr_stats_getEffectiveStat(self, STAT_BASE_WEIGHT);

var glamp_G_base = scr_stats_getBaseStat(self, STAT_BASE_GUTS);
var glamp_L_base = scr_stats_getBaseStat(self, STAT_BASE_LUCK);
var glamp_A_base = scr_stats_getBaseStat(self, STAT_BASE_AGILE);
var glamp_M_base = scr_stats_getBaseStat(self, STAT_BASE_MIGHT);
var glamp_P_base = scr_stats_getBaseStat(self, STAT_BASE_PIETY);
var glamp_W_base = scr_stats_getBaseStat(self, STAT_BASE_WEIGHT);

// BOOSTED, DECREASED OR NEUTRAL? //
if glamp_G < glamp_G_base then glamp_altered[0] = -1;
else if glamp_G > glamp_G_base then glamp_altered[0] = +1; 
else glamp_altered[0] = 0; 

if glamp_L < glamp_L_base then glamp_altered[1] = -1;
else if glamp_L > glamp_L_base then glamp_altered[1] = +1;
else glamp_altered[1] = 0; 

if glamp_A < glamp_A_base then glamp_altered[2] = -1;
else if glamp_A > glamp_A_base then glamp_altered[2] = +1; 
else glamp_altered[2] = 0; 

if glamp_M < glamp_M_base then glamp_altered[3] = -1;
else if glamp_M > glamp_M_base then glamp_altered[3] = +1; 
else glamp_altered[3] = 0;

if glamp_P < glamp_P_base then glamp_altered[4] = -1;
else if glamp_P > glamp_P_base then glamp_altered[4] = +1; 
else glamp_altered[4] = 0;

if glamp_W < glamp_W_base then glamp_altered[5] = -1;
else if glamp_W > glamp_W_base then glamp_altered[5] = +1; 
else glamp_altered[5] = 0;
    
// Draw this glamp shit //
if glamp_altered[0] != 0 or glamp_altered[1] != 0 or glamp_altered[2] != 0 or glamp_altered[3] != 0 or glamp_altered[4] != 0 or glamp_altered[5] != 0 then
    {    
    // Offset //
    var xoff = ailmentTotem_core_x_get(self.id);
    var yoff = ailmentTotem_core_y_get(self.id);
    var drx = floor(dx + xoff);
    var dry = floor(dy - yoff + 16);
    draw_set_font(global.fn_small);  
    draw_set_alpha(1);  
    
    // PLUS //
    var plus_spot = 0;
    draw_set_color(make_color_rgb(90, 255, 30));
    if glamp_altered[0] = 1 or glamp_altered[1] = 1 or glamp_altered[2] = 1 or glamp_altered[3] = 1 or glamp_altered[4] = 1 or glamp_altered[5] = 1 then 
        {
        draw_text(drx, dry, "+");
        plus_spot += 4;
        }
    
    // PLUS ROW //    
    if glamp_altered[0] = +1 then 
        {
        draw_text(drx + plus_spot, dry, "G");
        plus_spot += 5;
        }
    if glamp_altered[1] = +1 then 
        {
        draw_text(drx + plus_spot, dry, "L");
        plus_spot += 4;
        }
    if glamp_altered[2] = +1 then 
        {
        draw_text(drx + plus_spot, dry, "A");
        plus_spot += 5;
        }
    if glamp_altered[3] = +1 then 
        {
        draw_text(drx + plus_spot, dry, "M");
        plus_spot += 6;
        }
    if glamp_altered[4] = +1 then 
        {
        draw_text(drx + plus_spot, dry, "P");
        plus_spot += 5;
        }
    if glamp_altered[5] = +1 then 
        {
        draw_text(drx + plus_spot, dry, "W");
        plus_spot += 6;
        }
        
    // MINUS //
    var minus_spot = 0;
    draw_set_color(c_red);
    if glamp_altered[0] = -1 or glamp_altered[1] = -1 or glamp_altered[2] = -1 or glamp_altered[3] = -1 or glamp_altered[4] = -1 or glamp_altered[5] = -1 then 
        {
        draw_text(drx + plus_spot, dry, "-");
        minus_spot += 4;
        }
        
    // MINUS ROW //   
    if glamp_altered[0] = -1 then 
        {
        draw_text(drx + minus_spot + plus_spot, dry, "G");
        minus_spot += 5;
        }
    if glamp_altered[1] = -1 then 
        {
        draw_text(drx + minus_spot + plus_spot, dry, "L");
        minus_spot += 4;
        }
    if glamp_altered[2] = -1 then 
        {
        draw_text(drx + minus_spot + plus_spot, dry, "A");
        minus_spot += 5;
        }
    if glamp_altered[3] = -1 then 
        {
        draw_text(drx + minus_spot + plus_spot, dry, "M");
        minus_spot += 6;
        }
    if glamp_altered[4] = -1 then 
        {
        draw_text(drx + minus_spot + plus_spot, dry, "P");
        minus_spot += 5;
        }
    if glamp_altered[5] = -1 then 
        {
        draw_text(drx + minus_spot + plus_spot, dry, "W");
        minus_spot += 6;
        }
    }
