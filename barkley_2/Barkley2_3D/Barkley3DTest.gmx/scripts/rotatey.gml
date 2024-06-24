/*
    Arguments:
        0 dx vector
        1 dy
        
    Returns:
        sets rx ry rz to the positon after being rotated
*/

var tt;

tt=rx

rx=argument0*rx-argument1*rz;
rz=argument1*tt+argument0*rz;
