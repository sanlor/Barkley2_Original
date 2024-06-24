/// scr_short_name(name,width)
/// TODO: Get rid of this (not used).


str_out = "";
nchar = "";

if string_width(argument0) < argument1 + 3
    return argument0;

for(ii=0;ii<string_length(argument0);ii+=1) {
    nchar = string_char_at(argument0,ii);
    if string_width(str_out + nchar) > argument1 - 6 {
        return str_out+"...";
        break;
    }
    else
        str_out += nchar;
}

return str_out;
