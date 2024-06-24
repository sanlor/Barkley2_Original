/// scr_vrw_username()
nam = choose("Garth", "Wendy", "Dundit", "Perry", "Tony", "Samson", "Babs", "Zorb", "Mandy", "Paula", "Sandra");
ggg = irandom(2);
switch (ggg)
{
    case 0: nam = string_upper(nam);
    case 1: nam = string_lower(nam);
}

ali = choose("Holy", "DoGood", "Vengeful", "Wicked");
ggg = irandom(2);
switch (ggg)
{
    case 0: ali = string_upper(ali);
    case 1: ali = string_lower(ali);
}

cla = choose("Croupier", "Jobber", "Cobbler", "Roofer");
ggg = irandom(2);
switch (ggg)
{
    case 0: cla = string_upper(cla);
    case 1: cla = string_lower(cla);
}

adj = choose("Sexual", "Wise", "Big", "Lanky", "Astute", "Groovy", "Solid", "Liquid", "Wet");
ggg = irandom(2);
switch (ggg)
{
    case 0: adj = string_upper(adj);
    case 1: adj = string_lower(adj);
}

num = "";
ggg = irandom(5);
switch (ggg)
{
    case 0: num = string(irandom(999));
    case 1: num = string(irandom(99));
    case 2: num = string(irandom(9));
}

// Florish
flo = choose("$", "%", "_", "-", "!", ".", ":", "*");
if (random(100) < 75) flo = "";

// Choose combining method
fir = choose(adj, ali);
sec = choose(cla, nam);
ggg = irandom(9);
if (ggg <= 7)
    return flo + fir + sec + num + flo;
else if (ggg == 8)
    return flo + "_" + fir + "_" + sec + "_" + num + "_" + flo;
else
    return flo + "-" + fir + "-" + sec + "-" + num + "-" + flo;
