///between(value, range_low, range_high, inclusive)
var value, range_low, range_high, inclusive = false;

value = argument[0];
range_low = argument[1];
range_high = argument[2];
if(argument_count >= 4) inclusive = argument[3];

if(inclusive)
return (argument[0] >= argument[1] && argument[0] <= argument[2]);
else
return (argument[0] > argument[1] && argument[0] < argument[2]);
