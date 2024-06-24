/// EffectZauber(sprite_index, image_index, x, y, xscale, yscale, color, alpha?)
var spr = argument[0];
var sub = argument[1];
var drx = argument[2];
var dry = argument[3];
var xsl = 1;
var ysl = 1;
var colorSin = ((global.DELTA_TOTAL mod 1000) / 1000) * 360;
for (var i = 0; i < 8; i += 1)
{
    var num = 250 + (66 * i);
    pix[i] = lengthdir_x(2, ((global.DELTA_TOTAL mod num) / num) * 360);
    piz[i] = lengthdir_x(1, ((global.DELTA_TOTAL mod num) / num) * 360);
}
var colorAlpha = 0.2 + (abs(lengthdir_x(0.5, colorSin)) * .4); // was 0.8
var color = merge_colour(c_white, argument[6], 1 - abs(lengthdir_x(0.25, colorSin)));
if (argument_count > 4) xsl = argument[4];
if (argument_count > 5) ysl = argument[5];
// COLOR
if (argument_count > 7) colorAlpha *= argument[7];

draw_set_blend_mode(bm_add);
d3d_set_fog(true, color, 0, 0);

draw_sprite_ext(spr, sub, drx - 1 + piz[0], dry + piz[1], xsl, ysl, 0, color, colorAlpha);
draw_sprite_ext(spr, sub, drx + 1 - piz[3], dry + piz[4], xsl, ysl, 0, color, colorAlpha);
draw_sprite_ext(spr, sub, drx - piz[2], dry - 1 - piz[5], xsl, ysl, 0, color, colorAlpha);
draw_sprite_ext(spr, sub, drx + piz[7], dry + 1 - piz[6], xsl, ysl, 0, color, colorAlpha);

draw_sprite_ext(spr, sub, drx - 2 - piz[0], dry + pix[4], xsl, ysl, 0, color, colorAlpha);
draw_sprite_ext(spr, sub, drx + 2 + piz[3], dry - pix[5], xsl, ysl, 0, color, colorAlpha);
draw_sprite_ext(spr, sub, drx + pix[6], dry - 2 - piz[4], xsl, ysl, 0, color, colorAlpha);
draw_sprite_ext(spr, sub, drx - pix[7], dry + 2 - piz[6], xsl, ysl, 0, color, colorAlpha);

draw_sprite_ext(spr, sub, drx - 1 + pix[3], dry - 1 + piz[2], xsl, ysl, 0, color, colorAlpha);
draw_sprite_ext(spr, sub, drx - 1 - pix[4], dry + 1 + piz[5], xsl, ysl, 0, color, colorAlpha);
draw_sprite_ext(spr, sub, drx + 1 - piz[7], dry - 1 + pix[3], xsl, ysl, 0, color, colorAlpha);
draw_sprite_ext(spr, sub, drx + 1 + piz[6], dry + 1 + pix[7], xsl, ysl, 0, color, colorAlpha);

draw_sprite_ext(spr, sub, drx - 3 + piz[7], dry + pix[0], xsl, ysl, 0, color, colorAlpha);
draw_sprite_ext(spr, sub, drx + 3 - piz[4], dry - pix[1], xsl, ysl, 0, color, colorAlpha);
draw_sprite_ext(spr, sub, drx + pix[2], dry - 3 + piz[3], xsl, ysl, 0, color, colorAlpha);
draw_sprite_ext(spr, sub, drx - pix[3], dry + 3 + piz[6], xsl, ysl, 0, color, colorAlpha);

d3d_set_fog(false, c_white, 0, 0);
draw_set_blend_mode(bm_normal);
