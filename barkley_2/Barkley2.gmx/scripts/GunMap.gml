/// GunMap(gunMap, rate / damage / etc)
// The 1st argument MUST be the GUN "DS_MAP"
var gnm = argument[0];
if (argument[1] == "special letter") // 1 = Index | Get only
{
    var spl = "ZYXWVUTRQPONMLKJIHGFEDCBA"; // 25 letters
    var spv = floor(gnm[? "pAffix"] / 2);
    if (spv < 25) return string_copy(spl, 1 + spv, 1);
    else return "S"; // RETURN - <50 = A-Z | >=50 = S
}
else if (argument[1] == "damage") return gnm[? "pDamageMin"];
else if (argument[1] == "damageRound") return round(gnm[? "pDamageMin"]);
else if (argument[1] == "rate")
{
    var sSpeed = gnm[? "sSpeed"];
    var sSpeedMod = gnm[? "pSpeedMod"];
    var POWER = 1.75;
    var DIVISOR = 4.0;
    var TARGET = 300;  //pre-GoG value was 350 - bhroom
    var pFireSpeed = sSpeed * sSpeedMod;
    var stepInterval = 15 + (power(1 + pFireSpeed, POWER) / DIVISOR);
    var timeInterval = (TARGET / stepInterval) / 10;
    var perSecond = 1 / timeInterval;
    return 1 / perSecond;
}
else if (argument[1] == "rateTotal")
{
    return string(GunMap(gnm, "rate")) + "/s";
}
else if (argument[1] == "capacity")
{
    return gnm[? "pMaxAmmo"];
}
else if (argument[1] == "weight") return gnm[? "pWeight"];
else if (argument[1] == "weightRound") return string(round(gnm[? "pWeight"])) + "|";
else if (argument[1] == "model") // This is only ever called to DRAW
{
    return scr_combat_weapons_bfgNames(gnm[? "pModel"]);
}
else if (argument[1] == "material type") // This is only ever called to DRAW
{
    return scr_combat_weapons_bfgNames(gnm[? "pMaterial"] + " " + gnm[? "pType"]);
}
// GunMap(gunMap, "decimate") - Destroys top, bottom and gun maps
else if (argument[1] == "decimate")
{
    if (ds_exists(gnm, ds_type_map))
    {
        if (gnm[? "lineage_top"] != NULL) Lineage("delete", gnm[? "lineage_top"]); 
        else show_debug_message("GunMap(" + string(gnm) + ", 'decimate') - No top lineage to delete.");
        if (gnm[? "lineage_bot"] != NULL) Lineage("delete", gnm[? "lineage_bot"]); 
        else show_debug_message("GunMap(" + string(gnm) + ", 'decimate') - No bottom lineage to delete.");
        ds_map_destroy(gnm);
    }
    else
    {
        show_debug_message("GunMap(" + string(gnm) + ", 'decimate') - No such gunMap.");
    }
}
