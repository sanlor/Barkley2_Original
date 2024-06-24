/// string_split(string, delimiter)

var str = argument0;
var delimiter = argument1;

var split;
var pos = 0;
while (string_pos(delimiter, str) != 0) {
    var next = string_pos(delimiter, str);
    split[pos] = string_copy(str, 0, next-1);
    str = string_copy(str, next+1, string_length(str) - next);
    pos++;
}
split[pos] = str;

return split;


exit;


/// string_split_fast(string)
var str = argument0;
var split;
var pos = 0;
var pls = string_pos("|", str);
while (pls != 0) 
{
    split[pos] = string_copy(str, 0, next-1);
    str = string_copy(str, next+1, string_length(str) - next);
    pos += 1;
    pls = string_pos("|", str);
}
split[pos] = str;
return split;

