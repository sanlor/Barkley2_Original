var namestring, number, r;

r = irandom(4);

switch(r)
{
    case(0): namestring = "stern_gupples"; break;
    case(1): namestring = "WhizKid"; break;
    case(2): namestring = "agentcodybanks"; break;
    case(3): namestring = "BallerPaladin"; break;
    case(4): namestring = "Mario"; break;
}

r = irandom_range(100,999);

namestring = namestring + string(r);

return namestring;
