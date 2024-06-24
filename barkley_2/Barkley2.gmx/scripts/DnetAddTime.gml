var threadHours = real(string_copy(argument[0], 0, 2));
var threadMinutes = real(string_copy(argument[0], 4, 2));
var postHours = real(string_copy(argument[1], 0, 2));
var postMinutes = real(string_copy(argument[1], 4, 2));

var postMinutes = threadMinutes - postMinutes;
if (postMinutes <= 0) { threadHours -= 1; postMinutes += 60; }
var postHours = threadHours - postHours;
return NumberFormat(postHours) + ":" + NumberFormat(postMinutes); 
