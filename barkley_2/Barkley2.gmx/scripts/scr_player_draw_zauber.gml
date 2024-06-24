// Draw legs
var zac = zauber_charge mod 1;
var zam = min(1, zauber_charge);
if (zam == 1) zam = 2;
//var spr = script_execute(zau, "sprite", NULL, NULL, NULL, NULL); //s_cts_hoopzKneelDown;
var frm = 6; //sprite_get_number(spr);
var sub = floor((floor(facing / 2) * 6) + min(5, (frm * zac)));
var col = Zauber("color", zauber_casting);

// Get sub and body type
spr = sHoopzTorsoDribble;
if (move_dist == 0 && zauber_charge >= 1) // and shuffle <= 0)
{
    spr = sHoopzTorsoDribbleHold;
    sub = floor(facing / 2);
}

// ZAUBER EFFECT
//if (move_dist == 0 and shuffle <= 0)
if (move_dist == 0) EffectZauber(s_HoopzLegs, facing, dx, dy, 1, 1, col, zam); // and shuffle <= 0)
else EffectZauber(aLegsS[legdir], scr_entity_animation_getImage("default"), dx, dy, 1, 1, col, zam);
EffectZauber(spr, sub, dx, dy, 1, 1, col, zam);

shader_set(shader_zauber);
var shdCol = shader_get_uniform(shader_zauber, "argCol");
var shdTim = shader_get_uniform(shader_zauber, "argTim");
shader_set_uniform_f(shdCol, color_get_red(col) / 255, color_get_green(col) / 255, color_get_blue(col) / 255);
shader_set_uniform_f(shdTim, global.DELTA_TOTAL / 1000);

// LEGS
if (move_dist == 0) scr_draw_spr(s_HoopzLegs, facing, dx, dy);
else scr_draw_spr(aLegsS[legdir], scr_entity_animation_getImage("default"), dx, dy);

// TORSO
scr_draw_spr(spr, sub, dx, dy);

shader_reset();
