/// Railing("place", x, y, sub)
if (argument[0] == "place")
{
    var crx = argument[1] * 8;
    var cry = argument[2] * 8;
    var obj = instance_create(crx, cry, oRailingDummy);
    obj.depth = -(cry);
    if scr_area_get() = "fct" then obj.sprite_index = sRailing0;
    else obj.sprite_index = sRailing1;
    obj.image_single = argument[3];
    
    ds_grid_set(global.dsgRailDid, argument[1], argument[2], 1);
    global.didRail += 1;
    return 1;
}
else if (argument[0] == "queue")
{
    if (ds_grid_get(global.dsgRailDid, argument[1], argument[2]) == 0)
    {
        ds_grid_set(global.dsgRailDid, argument[1], argument[2], 1);
        ds_list_add(global.dslRailNextX, argument[1]);
        ds_list_add(global.dslRailNextY, argument[2]);
        ds_list_add(global.dslRailNextO, argument[3]);
    }
}
