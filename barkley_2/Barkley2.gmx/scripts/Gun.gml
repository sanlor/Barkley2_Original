/// Gun(add, name, damage, rate, special, weight, ammo, capacity, prefix1, prefix2, material, type, suffix)
//This is hoopz' gun slots - 6 would be total guns had, so 5 guns + 10 gunbag is 15
//These do not fully represent the actual guns, these would be linked to a guns ID

// ALL FUNCTIONS IN THIS SCRIPT USE THE "GUN INDEX"
// 0 - 4 are bando guns and 5 - 24 are bag guns

// scr_combat_weapons_destroygun - Only in fuselab
// scr_equipment_guns_bag_removeGun
var debug = 1;
if (argument[0] == "index to object") // 1 = Index | Return gun map
{
    if (argument[1] < 5) return scr_equipment_guns_bandolier_getGun(argument[1]);
    else return scr_equipment_guns_bag_getGun(argument[1] - 5);
}
if (argument[0] == "draw index") // 1 = index, 2 = x, 3 = y, 4 = xscale, 5 = yscale, 6 = rot, 7 = color, 8 = alpha
{
    var gnm = Gun("index to object", argument[1]);
    if (gnm == NULL) { show_debug_message("Gun('draw index') - ERROR: Index >" + string(argument[1]) + "< points to NULL gun."); return 0; }
    var spi = assetOrNull(gnm[? "hudIconSprite"], asset_sprite);
    var sbi = gnm[? "hudIconFrame"]; // Notice ROT is excluded - remove actual ARG from Utility sometime
    HUD("gun draw", spi, sbi, argument[2], argument[3], argument[4], argument[5], argument[7], argument[8]);
    return 1;
}
if (argument[0] == "draw map") // 1 = map, 2 = x, 3 = y, 4 = xscale, 5 = yscale, 6 = rot, 7 = color, 8 = alpha
{
    var gnm = argument[1];
    if (ds_exists(gnm, ds_type_map) == 0) { show_debug_message("Gun('draw map') - Gun doesn't exit to draw."); return 0; }
    if (is_undefined(gnm[? "hudIconSprite"])) { show_debug_message("Gun('draw map') - Undefined exit to draw."); return 0; }
    var spi = assetOrNull(gnm[? "hudIconSprite"], asset_sprite);
    var sbi = gnm[? "hudIconFrame"]; // Notice ROT is excluded - remove actual ARG from Utility sometime
    HUD("gun draw", spi, sbi, argument[2], argument[3], argument[4], argument[5], argument[7], argument[8]);
    return 1;
}
if (argument[0] == "current") // Returns GUN INDEX
{
    if (Gun("total amount") == 0) return NULL;
    var slt = scr_savedata_get("player.guns.equipSlot");
    if (scr_equipment_guns_bandolier_equippedFrom()) return slt;
    else return slt + 5;
}
if (argument[0] == "delete") // 1 = Index | Removes AND destroys gun from bando / bag
{
    var gnm = Gun("index to object", argument[1]);
    if (gnm[? "lineage_top"] != NULL) Lineage("delete", gnm[? "lineage_top"]); else show_debug_message("Gun('delete') - No top lineage to delete.");
    if (gnm[? "lineage_bot"] != NULL) Lineage("delete", gnm[? "lineage_bot"]); else show_debug_message("Gun('delete') - No bottom lineage to delete.");
    ds_map_destroy(gnm);
    Gun("remove", argument[1]);
    return 1;
}
if (argument[0] == "remove object") // 1 = Gun Map
{
    var gunObj = argument[1];
    var ind = scr_equipment_guns_bandolier_getSlot(gunObj)
    if (ind != NULL)
    {
        Gun("remove", ind);
        return 1;
    }
    ind = scr_equipment_guns_bag_getSlot(gunObj);
    if (ind != NULL)
    {
        Gun("remove", 5 + ind);
        return 1;
    }
    return 0;
}
if (argument[0] == "remove") // 1 = Index | Removes gun from bando / bag list
{
    if (argument[1] < 5) scr_equipment_guns_bandolier_removeGun(argument[1]);
    else scr_equipment_guns_bag_removeGun(argument[1] - 5);
    var current_gun = scr_equipment_guns_getCurrentGun(); // Gun Map, not Index
    if (scr_equipment_guns_bandolier_getSlot(current_gun) == NULL && 
        scr_equipment_guns_bag_getSlot(current_gun) == NULL)
    {
        if (Gun("amount") > 0)
        {
            show_debug_message("Gun('remove') - You removed the equipped gun. Equipping the 0 slot bando gun.");
            scr_equipment_guns_bandolier_equip(0);
        }
        else if (Gun("gunbag amount") > 0)
        {
            show_debug_message("Gun('remove') - You removed the equipped gun. No bando guns are available, equipping 0 slot bag gun.");
            scr_equipment_guns_bag_equip(0);
        }
        else
        {
            show_debug_message("Gun('remove') - You removed the equipped gun. No other guns to equip. Unarmed.");
            scr_savedata_put("player.guns.equipSlot", NULL);
            scr_savedata_put("player.guns.equipFrom", "bandolier");
        }
    }
    return 1;
}
if (argument[0] == "promote") // 1 = Index | Promotes index to bandolier
{
    if (Gun("amount") >= 5) { show_debug_message("Gun('promote') - ERROR: No room in bando to promote."); return 0; }
    var gnm = Gun("index to object", argument[1]);
    scr_equipment_guns_bandolier_addGun(gnm);
    Gun("remove", argument[1]);
    return 1;
}
if (argument[0] == "in bag") // 1 = Index
{
    var gnm = Gun("index to object", argument[1]);
    if (scr_equipment_guns_bag_getSlot(gnm) != NULL) return 1;
    return 0;
}
if (argument[0] == "exists") // 1 = Index
{
    if (argument[1] < 5) { return argument[1] < Gun("amount"); }
    if (argument[1] < 25) { return (argument[1] - 5) < Gun("gunbag amount"); }
}


///////////////////////////////////////////////////////
//                  GET / SET                    //////
///////////////////////////////////////////////////////
else if (argument[0] == "name") // 1 = Index, 2 = Value? | Get / Set
{
    var gnm = Gun("index to object", argument[1]);
    if (gnm == NULL) return NULL_STRING;
    else if (argument_count == 2) 
    {
        if (argument[1] >= 5) return "BAG " + string(argument[1] - 4);
        return gnm[? "pName"];
    }
    else gnm[? "pName"] = argument[2];
    return 1;
}
else if (argument[0] == "generation") // 1 = Index, 2 = Value? | Get / Set
{
    var gnm = Gun("index to object", argument[1]);
    if (argument_count == 2) return gnm[? "generation"];
    else gnm[? "generation"] = argument[2];
    return 1;
}
else if (argument[0] == "ammo") // 1 = Index, 2 = Value? | Get / Set
{
    var gnm = Gun("index to object", argument[1]);
    if (argument_count > 2) { gnm[? "pCurAmmo"] = argument[2]; return 1; }
    else return gnm[? "pCurAmmo"];
}
else if (argument[0] == "favorite") // 1 = Index, 2 = Value? | Get / Set
{
    var gnm = Gun("index to object", argument[1]);
    if (argument_count == 2) return gnm[? "favorite"];
    else gnm[? "favorite"] = argument[2];
    return 1;
}


///////////////////////////////////////////////////////
//                  GET                          //////
///////////////////////////////////////////////////////
else if (argument[0] == "lineage top") // 1 = Index | Get only
{
    var gnm = Gun("index to object", argument[1]);
    return gnm[? "lineage_top"];
}
else if (argument[0] == "lineage bot") // 1 = Index | Get only
{
    var gnm = Gun("index to object", argument[1]);
    return gnm[? "lineage_bot"];
}
else if (argument[0] == "special letter") // 1 = Index | Get only
{
    return GunMap(Gun("index to object", argument[1]), "special letter");
}
else if (argument[0] == "rate") // 1 = Index | Get only
{
    return GunMap(Gun("index to object", argument[1]), "rate");
}
else if (argument[0] == "value") // 1 = Index | Get only
{
    var gni = Gun("index to object", argument[1]);
    return min(round(gni[? "sPower"] + gni[? "sSpeed"] + gni[? "sAffix"] + gni[? "sAmmo"]), 999);
}
else if (argument[0] == "damage") // 1 = Index | Get only
{
    return GunMap(Gun("index to object", argument[1]), "damage");
}
else if (argument[0] == "rate direct") // 1 = Index | Get only
{
    var gnm = Gun("index to object", argument[1]);
    return gnm[? "pFireSpeed"];
}
else if (argument[0] == "special")  // 1 = Index | Get only
{
    var gnm = Gun("index to object", argument[1]);
    return gnm[? "pAffix"];
}
else if (argument[0] == "weight") // 1 = Index | Get only
{
    return GunMap(Gun("index to object", argument[1]), "weight");
}
else if (argument[0] == "capacity") // 1 = Index | Get only
{
    return GunMap(Gun("index to object", argument[1]), "capacity");
}
else if (argument[0] == "prefix1") // 1 = Index | Get only
{
    var gnm = Gun("index to object", argument[1]);
    return gnm[? "pPrefix1"];
}
else if (argument[0] == "prefix2") // 1 = Index | Get only
{
    var gnm = Gun("index to object", argument[1]);
    return gnm[? "pPrefix2"];
}
else if (argument[0] == "suffix") // 1 = Index | Get only
{
    var gnm = Gun("index to object", argument[1]);
    return gnm[? "pSuffix"];
}
else if (argument[0] == "material") // 1 = Index | Get only
{
    var gnm = Gun("index to object", argument[1]);
    return gnm[? "pMaterial"];
}
else if (argument[0] == "type") // 1 = Index | Get only
{
    var gnm = Gun("index to object", argument[1]);
    return gnm[? "pType"];
}
else if (argument[0] == "position") // 1 = Index | Get only
{
    var gnm = Gun("index to object", argument[1]);
    return gnm[? "gunmap_pos"];
}
else if (argument[0] == "model") // 1 = Index | Get only
{
    var gnm = Gun("index to object", argument[1]);
    return gnm[? "pModel"];
}
else if (argument[0] == "type sub") 
{ 
    return ds_list_find_index(global.gunTypeSub, Gun("type", argument[1])); 
}
else if (argument[0] == "amount") return scr_equipment_guns_bandolier_getSlotsUsed();
else if (argument[0] == "gunbag amount") return scr_equipment_guns_bag_getSlotsUsed();
else if (argument[0] == "total amount") return Gun("amount") + Gun("gunbag amount");
else if (argument[0] == "shot") { return global.gunShot[? global.gunType[argument[1]]]; }
else if (argument[0] == "group") return global.gunGroup[| ds_list_find_index(global.gunTypeList, argument[1])];
else if (argument[0] == "icon from type") return global.gunTypeIcon[| ds_list_find_index(global.gunTypeList, argument[1])];

else if (argument[0] == "sub from name") { return ds_list_find_index(global.gunTypeSub, argument[1]); }
else if (argument[0] == "gunbag") //Returns if the player has a gunbag (can carry a reserve)
{
    return 1;//if (argument_count == 1) return global.gunBag; else { global.gunBag = argument[1]; return 1; }
}
else if (argument[0] = "gunbag reserve amount") //Returns reserve number
{
    return scr_equipment_guns_bag_countUsedGuns();
}
else if (argument[0] = "gunbag empty amount") //Returns reserve + empty gunsbag number
{
    return scr_equipment_guns_bag_countUnusedGuns();
}









/////////////// INTERNALS /////////////////
else if (argument[0] == "define") // 1 = group, 2 = name, 3 = type
{
    ds_list_add(global.gunGroup, argument[1]);
    ds_map_add(global.gunShot, argument[2], 0);
    ds_list_add(global.gunTypeList, argument[2]);
    ds_list_add(global.gunTypeSub, argument[2]); // was 3
    ds_list_add(global.gunTypeIcon, argument[3]);
    return 1;
}
else if (argument[0] == "init")
{
    // gunTimes = How many guns per group, manually calculated
    global.gunTimes = ds_list_create();
    ds_list_add(global.gunTimes, 4, 4, 4, 4, 5, 4);
    global.gunGroups = ds_list_create();
    ds_list_add(global.gunGroups, "Automatic");
    ds_list_add(global.gunGroups, "Mounted");
    ds_list_add(global.gunGroups, "Pistols");
    ds_list_add(global.gunGroups, "Projectile");
    ds_list_add(global.gunGroups, "Rifles");
    ds_list_add(global.gunGroups, "Shotguns");
    global.gunGroup = ds_list_create();
    global.gunShot = ds_map_create();
    global.gunTypeSub = ds_list_create();
    global.gunTypeList = ds_list_create();
    global.gunTypeIcon = ds_list_create();
    
    // The order below is VERY IMPORTANT for sub-images! DO NOT CHANGE!
    Gun("define", "Pistols",    GUN_TYPE_PISTOL, 6);
    Gun("define", "Pistols",    GUN_TYPE_FLINTLOCK, 5);
    Gun("define", "Automatic",  GUN_TYPE_SUBMACHINEGUN, 3);
    Gun("define", "Pistols",    GUN_TYPE_REVOLVER, 6);
    Gun("define", "Pistols",    GUN_TYPE_MAGNUM, 6);
    Gun("define", "Projectile", GUN_TYPE_FLAREGUN, 7);
    Gun("define", "Rifles",     GUN_TYPE_RIFLE, 2);
    Gun("define", "Rifles",     GUN_TYPE_MUSKET, 5);
    Gun("define", "Rifles",     GUN_TYPE_HUNTINGRIFLE, 2);
    Gun("define", "Rifles",     GUN_TYPE_TRANQRIFLE, 2);
    Gun("define", "Rifles",     GUN_TYPE_SNIPERRIFLE, 2); // Is this sniper rifle?
    Gun("define", "Automatic",  GUN_TYPE_ASSAULTRIFLE, 3);
    Gun("define", "Automatic",  GUN_TYPE_MACHINEPISTOL, 1);
    Gun("define", "Automatic",  GUN_TYPE_HEAVYMACHINEGUN, 10);
    Gun("define", "Mounted",    GUN_TYPE_GATLINGGUN, 10);
    Gun("define", "Mounted",    GUN_TYPE_MINIGUN, 10);
    Gun("define", "Mounted",    GUN_TYPE_MITRAILLEUSE, 10);
    Gun("define", "Shotguns",   GUN_TYPE_SHOTGUN, 9);
    Gun("define", "Shotguns",   GUN_TYPE_DOUBLESHOTGUN, 9);
    Gun("define", "Shotguns",   GUN_TYPE_REVOLVERSHOTGUN, 9);
    Gun("define", "Shotguns",   GUN_TYPE_ELEPHANTGUN, 2);
    Gun("define", "Projectile", GUN_TYPE_CROSSBOW, 0);
    Gun("define", "Projectile", GUN_TYPE_FLAMETHROWER, 4);
    Gun("define", "Projectile", GUN_TYPE_ROCKET, 7);
    Gun("define", "Mounted",    GUN_TYPE_BFG, 8);
    
    // Type sub-image
    
    //For now guns just have name, ammo capacity, ammo, and weight
    return 1;
}

else if (argument[0] == "draw debug")
{
    draw_set_color(c_fuchsia);
    draw_set_font(global.fn_1b);
    var drx = view_xview[0] + 5;
    var dry = view_yview[0] + 5;
    for (var iii = 0; iii < 25; iii += 1)
    {
        var gnm = Gun("index to object", iii);
        if (gnm != NULL)
        {
            draw_text(drx, dry, string(iii) + " = " + Gun("model", iii));
        }
        dry += 20;
    }
    return 1;
}

//If you typo or provide an incorrect command...
show_debug_message("Gun() - Unknown command: " + argument[0]);
