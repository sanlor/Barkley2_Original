/// DropDestructable()
if (argument_count > 0)
{
    if (argument[0] == "init") return 0;
}

var area = scr_area_get();

//if (object_index == o_woodBarrel) NOTE: bhroom removed this to make a uniform 
//                                  drop list to start for ALL types of destructibles

// Sewer Floor 1 Drops
if (area == "sw1")
{
    Drop("item", "ds_sw1_regular");
}

// Sewer Floor 2 Drops
if (area == "sw2")
{
    Drop("item", "ds_sw2_regular");
}

// Wasteland Drops
if (area == "wst")
{
    Drop("item", "ds_wst_regular");
}

// Swamp Drops
if (area == "swp")
{
    Drop("item", "ds_swp_regular");
}

// Factory Drops
if (area == "fct")
{
    Drop("item", "ds_fct_regular");
}

// Mountain Pass Drops
if (area == "mtn")
{
    Drop("item", "ds_mtn_regular");
}

// Iceland Drops
if (area == "ice")
{
    Drop("item", "ds_ice_regular");
}

// Mines Drops
if (area == "min")
{
    Drop("item", "ds_min_regular");
}

// AI Ruins Drops
if (area == "air")
{
    Drop("item", "ds_air_regular");
}

// Undersewer Drops
if (area == "usw")
{
    Drop("item", "ds_usw_regular");
}

// Cuchu's Lair Drops
if (area == "chu")
{
    Drop("item", "ds_chu_regular");
}

// Gauntlet Drops (and catchall)
else if (area == "gau")
{
    if room == r_gau_01_entrance01
    {
        Drop("item", "ds_sw1_regular");
    }
    else if room == r_gau_16_sewerTwoStart01
    {
        Drop("item", "ds_sw2_regular");
    }
    else if room == r_gau_21_eastelandsStart01
    {
        Drop("item", "ds_est_regular");
    }
    else if room == r_gau_24_peakStart01
    {
        Drop("item", "ds_pea_regular");
    }
    else if room == r_gau_27_swampStart01
    {
        Drop("item", "ds_swp_regular");
    }
    else if room == r_gau_29_powerplantStart01
    {
        Drop("item", "ds_fct_regular");
    }
    else if room == r_gau_31_undersewersStart01
    {
        Drop("item", "ds_usw_regular");
    }
    else if room == r_gau_36_airuinsStart01
    {
        Drop("item", "ds_air_regular");
    }
    else if room == r_gau_39_westelandsStart01
    {
        Drop("item", "ds_wst_regular");
    }
    else if room == r_gau_41_icefieldsStart01
    {
        Drop("item", "ds_ice_regular");
    }
    else if room == r_gau_45_cuchuStart01
    {
        Drop("item", "ds_chu_regular");
    }
    else if room == r_gau_48_endStart01
    {
        Drop("item", "ds_chu_regular");
    }
    else if room == r_gau_55_beefsterStart01
    {
        Drop("item", "ds_swp_corpse");
    }
    else if room == r_gau_61_maxStart01
    {
        Drop("item", "ds_gau_maxxx");
    }
    else
    {
        Drop("item", "ds_gau_regular"); //this should catch all non-represented destructible drops
    }
}
