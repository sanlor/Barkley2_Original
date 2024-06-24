/// Draw()
// Assign sprites to a NO CROP texture page for this to work
if (argument[0] == "map")
{
    if (argument_count == 3) 
    {
        ds_map_add(global.dsmStripWidth, argument[1], argument[2]);
        ds_map_add(global.dsmStripHeight, argument[1], 1);
    }
    else
    {
        ds_map_add(global.dsmStripWidth, argument[1], argument[2]);
        ds_map_add(global.dsmStripHeight, argument[1], argument[3]);
    }
}
else if (argument[0] == "init")
{
    global.dsmStripWidth = ds_map_create();
    global.dsmStripHeight = ds_map_create();
    Draw("map", sArchambeau, 10);
    Draw("map", sBorderCorners, 16);
    Draw("map", sBorderLeftRight, 28);
    Draw("map", sBorderTopBottom, 14, 2);
}
