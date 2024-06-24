/*
    Arguments:
        0 x point0
        1 y
        2 z
        3 x point1
        4 y
        5 z
        6 x point2
        7 y
        8 z
        
    Returns:
        sets rx ry rz to the normal vector
*/

var ax,ay,az,bx,by,bz,m;

//point0 -> point1
ax = argument3-argument0;
ay = argument4-argument1;
az = argument5-argument2;

//point0 -> point2
bx = argument6-argument0;
by = argument7-argument1;
bz = argument8-argument2;

//cross product
rx = ay*bz-by*az;
ry = az*bx-bz*ax;
rz = ax*by-bx*ay;

//magnitude
m = sqrt(rx*rx+ry*ry+rz*rz);

//normalize
rx /= m;
ry /= m;
rz /= m;
