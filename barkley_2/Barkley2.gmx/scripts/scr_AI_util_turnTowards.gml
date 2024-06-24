/// scr_AI_util_turnTowards(x, y, turnspd)
/* Turns towards the given point with the given turn speed.
   The variable turned is faceDir */
var _x = argument0;
var _y = argument1;
var turnspd = argument2;

var dir = point_direction(x, y, _x, _y);
var diff = scr_math_rdif(faceDir,dir);
turnspd *= dt();
        
if( diff > turnspd)
    faceDir -= turnspd;
else if(diff < -turnspd)
    faceDir += turnspd;
else
    faceDir = dir;
