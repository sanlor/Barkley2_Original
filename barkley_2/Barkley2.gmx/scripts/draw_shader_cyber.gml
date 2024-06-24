/// draw_shader_cyber(surface, x, y, xscale, yscale)
// Requires the following instance variables:
//   surf_pass1
//   surf_pass2
//   surf_pass3

var surf_draw = argument0;
var dx = argument1;
var dy = argument2;
var xscale = argument3;
var yscale = argument4;

draw_set_colour(c_white);
draw_set_alpha(1);

surf_pass1 = verify_surface(surf_pass1, 512, 512);
surf_pass2 = verify_surface(surf_pass2, 512, 512);
surf_pass3 = verify_surface(surf_pass3, 512, 512);

s_time          = shader_get_uniform(shader_cyber_pass1_tolinear, "time");
s_noise         = shader_get_uniform(shader_cyber_pass1_tolinear, "noise");
s_hbloomHard    = shader_get_uniform(shader_cyber_pass2_hbloom, "hbloomHard");
s_vbloomHard    = shader_get_uniform(shader_cyber_pass3_vbloom, "vbloomHard");
s_hardScan      = shader_get_uniform(shader_cyber_pass4_toscreen, "hardScan");
s_bloomAmount   = shader_get_uniform(shader_cyber_pass4_toscreen, "bloomAmount");
s_yOffset       = shader_get_uniform(shader_cyber_pass4_toscreen, "yOffset");
s_bloom         = shader_get_sampler_index(shader_cyber_pass4_toscreen, "bloom");

// Drawpass 1 - To linear image
shader_set(shader_cyber_pass1_tolinear);
shader_set_uniform_f(s_time, current_time);
shader_set_uniform_f(s_noise, global.shaderCyberNoise);
surface_set_target(surf_pass1);
draw_surface(surf_draw, 0, 0);
surface_reset_target();
shader_reset();

// Drawpass 2 - H-Bloom
shader_set(shader_cyber_pass2_hbloom);
shader_set_uniform_f(s_hbloomHard, global.shaderCyberHBloomHard);

surface_set_target(surf_pass2);
draw_surface_ext(surf_pass1, dx, dy, 384/512, 240/512, 0, c_white, 1);
surface_reset_target();
shader_reset();

// Drawpass 3 - V-Bloom
shader_set(shader_cyber_pass3_vbloom);
shader_set_uniform_f(s_vbloomHard, global.shaderCyberVBloomHard);

surface_set_target(surf_pass3);
draw_surface_ext(surf_pass2, dx, dy, 384/512, 240/512, 0, c_white, 1.0);
surface_reset_target();
shader_reset();

// Drawpass 4 - render to screen

shader_set(shader_cyber_pass4_toscreen);
if (yscale < 2) {
    shader_set_uniform_f(s_hardScan, 0.0);
} else {
    shader_set_uniform_f(s_hardScan, global.shaderCyberHardScan);
}
if (yscale == 2) {
    shader_set_uniform_f(s_yOffset, 0.2/240.0);
} else {
    shader_set_uniform_f(s_yOffset, 0.0);
}
shader_set_uniform_f(s_bloomAmount, global.shaderCyberBloomAmount);

texture_set_stage(s_bloom, surface_get_texture(surf_pass3));
draw_surface_ext(surf_pass1, dx, dy, xscale*(384/512), yscale*(240/512), 0, c_white, 1);
shader_reset();
