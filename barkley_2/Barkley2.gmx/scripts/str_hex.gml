/// str_hex(val)
/* argument0 = decimal number; returns hexadecimal (string)
Script Variables:
- n: The [N]umber(decimal) being converted into a hex
- r: The hexadecimal number ([R]eturn value)
*/
var n,r;
n = argument0; // get number
r = ""; // init return string
while(n){ // while we have a rest to parse, continue
 r=string_char_at("0123456789ABCDEF", n mod 16+1 ) + r; // parse first part into hex char, get the char from the hex char list
 n=n div 16; // get the rest to parse
}
return r;
