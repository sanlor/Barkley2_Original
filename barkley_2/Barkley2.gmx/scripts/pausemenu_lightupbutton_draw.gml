/// pausemenu_lightupbutton_draw(text, halign, menu, button, xoffset, yoffset)

var menu = argument0;
var button = argument1;
var xoff = argument2;
var yoff = argument3;

var text = button[? "text"];
var halign = button[? "halign"];
var font = button[? "font"];

var bx = button[? "x"] + xoff;
var by = button[? "y"] + yoff;
var bw = button[? "width"];
var bh = button[? "height"];

// Draw lightup bg
if (menu[? "selected"] == button) {
    var alpha = 0.3 + 0.4 * abs(sin(current_time / 500));
    draw_sprite_ext(s_pausemenu_buttonlight, 0, bx, by, view_wview, 1, 0, c_white, alpha); // 384 -> view_wview
}

// Draw text
draw_set_font(font);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_colour(c_white);
draw_set_alpha(1);

draw_text(bx + bw/2, by + (bh/2), text);

draw_set_halign(fa_left);
draw_set_valign(fa_top);
