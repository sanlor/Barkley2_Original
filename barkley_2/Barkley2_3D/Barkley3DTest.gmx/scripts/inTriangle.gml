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
        9 nx
       10 ny
       11 nz
       12 x test point
       13 y
       14 z

    Returns:
        whether the test point is in the triangle.
        if it's outside of the triangle then it sets 
        rx ry rz to the line the test point is outside of.
*/

var ax,ay,az,   bx,by,bz;

//point0 -> test point
ax=argument12-argument0;
ay=argument13-argument1;
az=argument14-argument2;

//point0 -> point1
bx=argument3-argument0;
by=argument4-argument1;
bz=argument5-argument2;

if (ay*bz-az*by)*argument9+(az*bx-ax*bz)*argument10+(ax*by-ay*bx)*argument11<=0
{
    //point1 -> test point
    ax=argument12-argument3;
    ay=argument13-argument4;
    az=argument14-argument5;
    
    //point1 -> point2
    bx=argument6-argument3;
    by=argument7-argument4;
    bz=argument8-argument5;
    
    if (ay*bz-az*by)*argument9+(az*bx-ax*bz)*argument10+(ax*by-ay*bx)*argument11<=0
    {
        //point2 -> test point
        ax=argument12-argument6;
        ay=argument13-argument7;
        az=argument14-argument8;
        
        //point2 -> point0
        bx=argument0-argument6;
        by=argument1-argument7;
        bz=argument2-argument8;
        
        if (ay*bz-az*by)*argument9+(az*bx-ax*bz)*argument10+(ax*by-ay*bx)*argument11<=0
        {
            return 1;
        }
        else
        {
            //point2 -> point1
            rx[0]=argument6;
            ry[0]=argument7;
            rz[0]=argument8;
            rx[1]=argument0;
            ry[1]=argument1;
            rz[1]=argument2;
        }
    }
    else
    {
        //point1 -> point2
        rx[0]=argument3;
        ry[0]=argument4;
        rz[0]=argument5;
        rx[1]=argument6;
        ry[1]=argument7;
        rz[1]=argument8;
    }
}
else
{
    //point0 -> point1
    rx[0]=argument0;
    ry[0]=argument1;
    rz[0]=argument2;
    rx[1]=argument3;
    ry[1]=argument4;
    rz[1]=argument5;
}

return 0;
