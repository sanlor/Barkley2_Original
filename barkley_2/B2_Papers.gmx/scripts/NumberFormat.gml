//Does a leading 0, only works for 2 digits, make robust version later
if (argument0 < 10) _str = "0" + string(argument0);
else _str = string(argument0);
return _str;
