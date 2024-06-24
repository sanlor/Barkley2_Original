/// GlampEffect(G, L, A, M, P);
glamp_g = instance_create(0, 0, o_effect_glampChange);
glamp_g.index = "G";
glamp_g.adjustment = argument0;
glamp_g.soundlord = true;

glamp_l = instance_create(0, 0, o_effect_glampChange);
glamp_l.index = "L";
glamp_l.adjustment = argument1;

glamp_a = instance_create(0, 0, o_effect_glampChange);
glamp_a.index = "A";
glamp_a.adjustment = argument2;

glamp_m = instance_create(0, 0, o_effect_glampChange);
glamp_m.index = "M";
glamp_m.adjustment = argument3;

glamp_p = instance_create(0, 0, o_effect_glampChange);
glamp_p.index = "P";
glamp_p.adjustment = argument4;

// Screen dimmer //
dimmer = instance_create(x, y, o_effect_glampChange_dim);
dimmer.lifespan = 150;
dimmer.lifespan_half = 80;
dimmer.alpha_goal = 0.3;

// Set the message for the visual //
var guplur = argument0 + argument1 + argument2 + argument3 + argument4;
if guplur < 0 then 
    {
    dimmer.text = "GLAMP has been decimated!"
    dimmer.color_text = c_red;
    }
if guplur > 0 then 
    {
    dimmer.text = "GLAMP has been elevated!"
    dimmer.color_text = c_aqua;
    }
