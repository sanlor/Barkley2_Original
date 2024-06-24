/// DrawResistance(x, y, bio, cyber, mental, cosmic, zauber, letters [optional], alpha [optional])
// Use -999 to exclude a value to be drawn
var drx = floor(argument[0]);
var dry = floor(argument[1]);
_rs[0] = argument[2]; _rl[0] = "B"; _rc[0] = c_bio;
_rs[1] = argument[3]; _rl[1] = "C"; _rc[1] = c_cyber;
_rs[2] = argument[4]; _rl[2] = "M"; _rc[2] = c_mental;
_rs[3] = argument[5]; _rl[3] = "K"; _rc[3] = c_cosmic;
_rs[4] = argument[6]; _rl[4] = "Z"; _rc[4] = c_zauber;
if (argument_count <= 7) { var ltr = 1; } else { var ltr = argument[7]; }
if (argument_count <= 8) { var alp = 0.8; } else { var alp = argument[8]; }

if (_rs[0] != -999 || _rs[1] != -999 || _rs[2] != -999 || _rs[3] != -999 || _rs[4] != -999)
{
    // Scale of resistances 300 // From -100 to +200 //
    var scale = 300;
    var line_height = 24;
    var line_w = 3;
    var gap = 3;
    for (var i = 0; i < 5; i += 1) { _rn[i] = (_rs[i] + 100) / scale * line_height; }
    var xps = 0;
    
    // Draw defaults //
    draw_set_alpha(alp);
    draw_set_color(c_white);
    draw_set_font(global.fn_small);
    
    // Draw white line width according to how many are being shown
    for (var g = 0; g < 5; g += 1) { if (_rs[g] != -999) xps += (line_w + gap); }
    draw_sprite_ext(s1x1, 0, drx, dry + 8 - line_height / 2, xps - 1, 1, 0, c_white, alp);
    xps = 0;
    
    // Do all 5 resistance bars
    for (var i = 0; i < 5; i += 1)
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
