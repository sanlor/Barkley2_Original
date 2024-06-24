//Returns if A0,A1 are inside of A2,A3 - A4,A5
if (argument[0] >= argument[2]) 
{ 
    if (argument[0] < argument[4]) 
    { 
        if (argument[1] >= argument[3]) 
        { 
            if (argument[1] < argument[5]) return 1; 
        } 
    } 
}
return 0;
