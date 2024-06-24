/*
Required input vars from step script:
facing
*/

var subimg, hscale;
hscale = 1;
if (facing == 0 or facing == 1) {
    subimg = 6;
}
else if (facing == 2 or facing == 3) {
    subimg = 4;
    hscale = -1;
}
else if (facing == 4 or facing == 5) {
    subimg = 2;
    hscale = -1;
}
else {
    subimg = 0;
}

var shock = instance_exists(o_enemy_babbySystem);
if (shock == 1)
{
    subimg = (global.DELTA_TOTAL / 100) mod 2;
    draw_sprite_ext(sHoopzElectrocution, subimg, dx, dy, hscale, 1, 0, c_white, 1);
}
else if (BodySwap() == "diaper") scr_draw_spr(s_HoopzDiaperStagger, subimg, dx, dy);
else scr_draw_spr(s_HoopzStagger, subimg, dx, dy);
