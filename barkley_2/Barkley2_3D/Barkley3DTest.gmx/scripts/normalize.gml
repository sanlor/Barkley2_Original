/*
    Arguments:
        0 x vector
        1 y
        2 z
        
    Returns:
        sets rx ry rz to the normalized vector
        sets rm to the length of the vector
*/

rx=argument0;
ry=argument1;
rz=argument2;

rm=sqrt(rx*rx+ry*ry+rz*rz);

if (rm == 0)
{
    rx = 0;
    ry = 0;
    rz = 0;
}
else
{
    rx /= rm;
    ry /= rm;
    rz /= rm;
}

exit;
//added rm == 0 code, was error before
if (rm == 0) rx = 0; else rx /= rm;
if (rm == 0) ry = 0; else ry /= rm;
if (rm == 0) rz = 0; else rz /= rm;
