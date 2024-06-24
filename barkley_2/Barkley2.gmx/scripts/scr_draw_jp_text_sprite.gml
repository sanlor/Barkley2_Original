/// draw_jp_text_sprite(x, y, text, halign, valign, font_sprite, first, char_spacing, line_spacing, max_line_length_chars)
/// Draws text with the specified sprite font.
/// halign is either of fa_left, fa_center, fa_right
/// valign is either of fa_top, fa_middle, fa_bottom

var _x = argument0;
var _y = argument1;
var text = argument2;
var halign = argument3;
var valign = argument4;
var font_sprite = argument5;
var first = argument6;
var char_spacing = argument7;
var line_spacing = argument8;
var max_line_length = argument9;

var last = first + sprite_get_number(font_sprite) - 1;

// Begin render loop
var char_at = 0;
var xoff = 0;
var yoff = 0;
var imgw = sprite_get_width(font_sprite)
var imgh = sprite_get_height(font_sprite)
var line_length = 0;

while (char_at < string_length(text)) {
    // Get character to render
    var char = string_char_at(text, char_at+1)
    var char_o = ord(char)
    if (char == '#') {
        xoff = 0;
        yoff += imgh + line_spacing;
        line_length = 0;
        char_at++;
    }
    else {
        if (char_o >= first && char_o <= last) {
            draw_sprite(font_sprite, char_o - first, _x + xoff, _y + yoff)
        }
        xoff += imgw + char_spacing;
        line_length++;
        char_at++;
        if (line_length >= max_line_length) {
            xoff = 0;
            yoff += imgh + line_spacing;
            line_length = 0;
        }
    }
}
