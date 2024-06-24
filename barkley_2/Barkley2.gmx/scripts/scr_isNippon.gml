/// scr_isNippon(string)
var text = argument0

var charat = 0;
var char;
var char_o;
while (charat < string_length(text)) {
    char = string_char_at(text, charat+1);
    char_o = ord(char);
    if (char_o >= 12288 && char_o <= 12600) {
        return true;
    }
    charat++;
}
return false;
