/// string_split_fast(string)
var str = argument0;
var split;
var pos = 0;
var pls = string_pos("|", str);
while (pls != 0) 
{
    split[pos] = string_copy(str, 0, pls - 1);
    str = string_copy(str, pls + 1, string_length(str) - pls);
    pos += 1;
    pls = string_pos("|", str);
}
split[pos] = str;
return split;
