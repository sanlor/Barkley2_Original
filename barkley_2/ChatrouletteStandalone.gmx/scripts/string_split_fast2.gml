/// string_split_fast2(string)
var str = argument0;
var split;
var pos = 0;
var nwl = chr(13) + chr(10);
var pls = string_pos(nwl, str);
while (pls != 0) 
{
    split[pos] = string_copy(str, 0, pls - 1);
    str = string_delete(str, 1, pls + 1);
    pos += 1;
    pls = string_pos(nwl, str);
}
split[pos] = str;
return split;

