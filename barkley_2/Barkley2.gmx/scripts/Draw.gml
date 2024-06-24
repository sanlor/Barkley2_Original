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
    Draw("map", sBorderCorners, 16);
    Draw("map", sBorderLeftRight, 28);
    Draw("map", sBorderTopBottom, 14, 2);
    Draw("map", s_pedestrian_tnn01, 24, 15);
    Draw("map", s_door_slab01, 21, 2);
    Draw("map", s_door_garage01, 11, 1);
    Draw("map", s_door_tech01, 17, 1);
    Draw("map", s_door_tech02, 17, 1);
    Draw("map", s_door_biotek01, 11, 1);
    Draw("map", s_door_undersewer01, 16, 1);
    Draw("map", s_koboldLarge_head, 9, 18);
    Draw("map", s_koboldLarge_body, 10, 4);
    Draw("map", s_alienMenace_med, 5, 15);
    Draw("map", s_oozeMan, 10, 6);
    Draw("map", s_bugflower_mimic, 7, 6);
    Draw("map", s_tengu_crossbow, 8, 6);
    Draw("map", s_werecroc, 13, 2);
    Draw("map", s_cgremlin_torso, 28, 3);
    Draw("map", s_cgremlin_head, 4, 12);
    Draw("map", s_pelekryte_escort01, 12, 1);
    Draw("map", s_gutterhound_walk, 12, 1);
    Draw("map", s_running_mantis, 12, 1);
    //Draw("map", sBorderCorners, 16);
    //Draw("map", sBorderLeftRight, 28);
    //Draw("map", sBorderTopBottom, 14, 2);
}
