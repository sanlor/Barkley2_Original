// Draw legs
var zac = zauber_charge;
//var spr = script_execute(zau, "sprite", NULL, NULL, NULL, NULL); //s_cts_hoopzKneelDown;
var frm = 6; //sprite_get_number(spr);
var sub = floor((facing * 6) + min(5, (frm * zauber_charge)));
var col = Zauber("color", zauber_casting);

// WADING
var current = scr_statusEffect_getFromCombatActor(id, statusEffect_wading);
var swimmove = 0;
if(current > 0)
{
    swimmove = ds_map_find_value(current, "wadingDepthCurrent");
}

// ZAUBER EFFECT
zac = abs(1 - zauber_charge) * 2;
EffectZauber(s_HoopzLegs, facing, dx, dy, 1, 1, col, zac);
EffectZauber(sHoopzTorsoZauber, sub, dx, dy, 1, 1, col, zac);

shader_set(shader_zauber);
var shdCol = shader_get_uniform(shader_zauber, "argCol");
var shdTim = shader_get_uniform(shader_zauber, "argTim");
shader_set_uniform_f(shdCol, color_get_red(col) / 255, color_get_green(col) / 255, color_get_blue(col) / 255);
shader_set_uniform_f(shdTim, global.DELTA_TOTAL / 1000);

// LEGS
if (swimmove == 0) 
    scr_draw_spr(s_HoopzLegs, facing, dx, dy);
else if (swimmove <= 10) 
    draw_sprite_part_ext(s_HoopzLegs,facing, 0, 0, 44, 41 - swimmove, dx-22, dy-41 + swimmove, 1, 1, image_blend, image_alpha);

// TORSO
scr_draw_spr(sHoopzTorsoZauber, sub, dx, dy);

shader_reset();
