/// scr_AI_util_lookTowards(x, y, turnSpd)

/* Used to create a value which can be used for head (or heads) turning to look towards the target
   The variable turned is faceDir */
var _x = argument0;
var _y = argument1;
var turnspd = argument2;

var dir = point_direction(x, y, _x, _y);
var diff = scr_math_rdif(headDir,dir); // Head Direction looking towards the focal point, etc.
turnspd *= dt();
        
if( diff > turnspd)
    headDir -= turnspd;
else if(diff < -turnspd)
    headDir += turnspd;
else
    headDir = dir;
