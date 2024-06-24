/// Power(area, function)
if (argument[0] == "lamp")
{
    if (scr_area_get() == "min") 
    {
        if (Quest("powerMines")) Light("add xy", x, y, 64, 0.05, make_color_rgb(128, 128, 0));
    }
    else if (scr_area_get() == "pea") 
    {
    Light("add xy", x, y, 64, 0.05, make_color_rgb(100, 100, 128));
    }
}
if (argument[0] == "crystal big")
{
    //if (scr_area_get() == "min") 
    //{
        Light("add xy", x, y - 22, 64, 0.05, make_color_rgb(64, 64, 244));
    //}
}
if (argument[0] == "crystal small")
{
    //if (scr_area_get() == "min") 
    //{
        Light("add xy", x + 8, y - 14, 32, 0.05, make_color_rgb(64, 64, 244));
    //}
}
if (argument[0] == "mines")
{
    if (argument[1] == "light")
    {
        if room = r_min_lobby01 then
            {
            if (Quest("powerMines")) Light("set", 0.8);
            else Light("set", 0.5);
            }
        else
            {
            if (Quest("powerMines")) Light("set", 0.5);
            else Light("set", 0.33);
            }
    }
}
if (argument[0] == "guilderbergs")
{
    if (argument[1] == "light")
    {
        Light("set", 0.66);
    }
}
if (argument[0] == "rebel")
{
    if (argument[1] == "light")
    {
    if room = r_pea_caveRebel01 then 
        {
        if Quest("rebelCaveFirstVisit") == 0 then Light("set", 0.05);
        else Light("set", 0.8);
        }
    else Light("set", 0.25);
    }
}
if (argument[0] == "pdt")
{
    if (argument[1] == "light")
    {
        //if room = r_pdt_italiano01 or room = r_pdt_backalley01 or room = r_pdt_respawn01 or room = r_pdt_katzenKave01 or room = r_pdt_katzenKave02 or room = r_pdt_eelThrone01 then Light("set", 0.6);
        //else Light("set", 0.4);
    }
}
if (argument[0] == "gatoraid")
{
    if (argument[1] == "light")
    {
        Light("set", 0.85);
    }
}
