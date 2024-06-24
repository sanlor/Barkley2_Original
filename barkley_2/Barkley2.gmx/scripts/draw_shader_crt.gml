/// draw_shader_crt(surface, x, y, xscale, yscale, u_yOffset)
// Requires the following instance variables:
//   surf_pass1
//   surf_pass2
//   s_scanTime
//   s_yOffset

var surf_draw = argument0;
var dx = argument1;
var dy = argument2;
var xscale = argument3;
var yscale = argument4;
var u_yOffset = argument5;

draw_set_colour(c_white);
draw_set_alpha(1);

surf_pass1 = verify_surface(surf_pass1, 512, 512);
surface_set_target(surf_pass1);
draw_clear_alpha(c_black, 1.0);
draw_surface(surf_draw, 0, 0);
surface_reset_target();

// Drawpass 1
shader_set(shader_crt_pass1_tolinear);
shader_set_uniform_f(s_scanTime, current_time);
shader_set_uniform_f(shader_get_uniform(shader_crt_pass1_tolinear, "noise"), global.shaderNoise);

surf_pass2 = verify_surface(surf_pass2, 512, 512);
surface_set_target(surf_pass2);
draw_surface(surf_pass1, 0, 0);
surface_reset_target();
shader_reset();

// Drawpass 2
shader_set(shader_crt_pass2_toscreen);
if (yscale <= 1.99) {
    // Disable scanlines if yscale < 2 since they do not look good at that size
    shader_set_uniform_f(shader_get_uniform(shader_crt_pass2_toscreen, "hardScan"), 0.0);
    shader_set_uniform_f(shader_get_uniform(shader_crt_pass2_toscreen, "hardVScan"), 0.0);
} else {
    shader_set_uniform_f(shader_get_uniform(shader_crt_pass2_toscreen, "hardScan"), global.shaderHardScan);
    shader_set_uniform_f(shader_get_uniform(shader_crt_pass2_toscreen, "hardVScan"), global.shaderHardVScan);
}
shader_set_uniform_f(s_yOffset, u_yOffset);
shader_set_uniform_f(shader_get_uniform(shader_crt_pass2_toscreen, "hardPix"), global.shaderHardPix);
shader_set_uniform_f(shader_get_uniform(shader_crt_pass2_toscreen, "hardBloomScan"), global.shaderHardBloomScan);
shader_set_uniform_f(shader_get_uniform(shader_crt_pass2_toscreen, "hardBloomPix"), global.shaderHardBloomPix);
shader_set_uniform_f(shader_get_uniform(shader_crt_pass2_toscreen, "bloomAmount"), global.shaderBloomAmount);

draw_surface_ext(surf_pass2, dx, dy, xscale*(384/512), yscale*(240/512), 0, c_white, 1);
shader_reset();
