/// Lineage()
if (argument[0] == "reset")
{
    scr_savedata_put_list("player.guns.lineage", ds_list_create());
    scr_savedata_put_list("player.guns.lineageID", ds_list_create());
    scr_savedata_put("player.guns.lineageCount", 0);
    return 1;
}



if (argument[0] == "count") // Argument1 = Increase?
{
    if (argument_count > 1) 
    {
        scr_savedata_put("player.guns.lineageCount", scr_savedata_get("player.guns.lineageCount") + 1);
        return scr_savedata_get("player.guns.lineageCount") - 1;
    }
    else return scr_savedata_get("player.guns.lineageCount");
}



if (argument[0] == "history") // 1 = guna, 2 = gunB, 3 = fused
{
    var gna = argument[1];
    var gnb = argument[2];
    var fus = argument[3];
    gna[? "son"] = fus[? "pModel"];
    gnb[? "son"] = fus[? "pModel"];
    // GET SLOTS!
    fus[? "lineage_top"] = Lineage("add", gna);
    fus[? "lineage_bot"] = Lineage("add", gnb);
    return 1;
}



if (argument[0] == "add") // 1 = gunMap | Stores in DB
{
    ds_list_add_map(scr_savedata_get("player.guns.lineage"), argument[1]);
    ds_list_add(scr_savedata_get("player.guns.lineageID"), Lineage("count"));
    Lineage("count", 1);
    return Lineage("count") - 1;
}



if (argument[0] == "delete") // 1 = Index | Find index and delete
{
    var ind = ds_list_find_index(scr_savedata_get("player.guns.lineageID"), argument[1]);
    ds_list_delete(scr_savedata_get("player.guns.lineage"), ind);
    ds_list_delete(scr_savedata_get("player.guns.lineageID"), ind);
    return 1;
}



if (argument[0] == "get") // 1 = lineage slot | Return MAP
{
    var ind = ds_list_find_index(scr_savedata_get("player.guns.lineageID"), argument[1]);
    return ds_list_find_value(scr_savedata_get("player.guns.lineage"), ind);
}
show_debug_message("Lineage() - Unknown function >" + argument[0] + "<");
