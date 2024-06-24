/// scr_string_limit(string,width)
/// Clips a string to the specified width.

var nstr, ostr, astr;

nstr = argument0;
ostr = '';

for(i=0;i<=string_length(nstr);i+=1){
    astr = string_char_at(nstr,i);
    if string_width(ostr + astr) > argument1
        break;
    if ord(astr) < 123 and astr != '#'
        ostr += string_upper(astr);
}

return ostr;
