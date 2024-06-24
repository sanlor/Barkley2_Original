/// Gun(add, name, damage, rate, special, weight, ammo, capacity, prefix1, prefix2, material, type, suffix)
//This is hoopz' gun slots - 6 would be total guns had, so 5 guns + 10 gunbag is 15
//These do not fully represent the actual guns, these would be linked to a guns ID

if (argument[0] == "draw") // 1 = material, 2 = type, 3 = x, 4 = y, 5 = xscale, 6 = yscale, 7 = rot, 8 = color, 9 = alpha
{
    draw_sprite_ext(sTempGun, 1, argument[3], argument[4], argument[5], argument[6], argument[7], argument[8], argument[9]);
    return 1;
}
else if (argument[0] == "current") // Need the INDEX, not the map / object
{
    if (Gun("gun amount") > 0) return 0; else return NULL;
}
else if (argument[0] == "favorite") 
{
    if (argument_count == 2) return global.gunFavorite[argument[1]];
    else global.gunFavorite[argument[1]] = argument[2];
    return 1;
}
else if (argument[0] == "delete")
{
    var ind = argument[1];
    var gto = Gun("amount");
    if (ind >= 5) gto = 5 + Gun("gunbag amount") - 1; //25 - 1; //24;
    for (var gni = ind; gni < gto; gni += 1)
    {
        Gun("clone", gni, gni + 1);
    }
    if (ind < 5) global.gunAmount -= 1; else global.gunBagAmount -= 1;
    return 1;
}
else if (argument[0] == "clone") // Replace Arg1 with Arg2
{
    var gni = argument[1];
    var gns = argument[2];
    global.gunName[gni] = global.gunName[gns];
    global.gunDamage[gni] = global.gunDamage[gns];
    global.gunRate[gni] = global.gunRate[gns];
    global.gunSpecial[gni] = global.gunSpecial[gns];
    global.gunWeight[gni] = global.gunWeight[gns];
    global.gunAmmo[gni] = global.gunAmmo[gns];
    global.gunCapacity[gni] = global.gunCapacity[gns];
    global.gunPrefix1[gni] = global.gunPrefix1[gns];
    global.gunPrefix2[gni] = global.gunPrefix2[gns];
    global.gunMaterial[gni] = global.gunMaterial[gns];
    global.gunType[gni] = global.gunType[gns];
    global.gunSuffix[gni] = global.gunSuffix[gns];
    global.gunFavorite[gni] = global.gunFavorite[gns];
    global.gunGeneration[gni] = global.gunGeneration[gns];
    return 1;
}
else if (argument[0] == "total amount")
{
    return Gun("amount") + Gun("gunbag amount");
}
else if (argument[0] == "name") 
{
    if (argument_count > 2) { global.gunName[argument[1]] = argument[2]; return 1; }
    else 
    {
        if (argument[1] >= 5) return "BAG " + string(argument[1] - 4);
        return global.gunName[argument[1]];
    }
}
else if (argument[0] == "value")
{
    // Sum of 4 base stat values rounded
    var gni = argument[1];
    return min(round(Gun("damage", gni) + Gun("rate", gni) + Gun("special", gni) + Gun("capacity", gni)), 999);
}
else if (argument[0] == "generation")
{
    return global.gunGeneration[argument[1]];
}
else if (argument[0] == "special letter")
{
    var spl = "ABCDEFGHIJKLMNOPQRTUVWXYZ"; // 25 letters
    var spv = floor(Gun("special", argument[1]) / 2);
    if (spv < 25) return string_copy(spl, 1 + spv, 1);
    else return "S";
}

// PLACEHOLDERS ABOVE

if (argument[0] == "damage") return global.gunDamage[argument[1]];
else if (argument[0] == "rate") return global.gunRate[argument[1]];
else if (argument[0] == "special") return global.gunSpecial[argument[1]];
else if (argument[0] == "weight") return global.gunWeight[argument[1]];
else if (argument[0] == "ammo") 
{
    if (argument_count > 2) { global.gunAmmo[argument[1]] = argument[2]; return 1; }
    else return global.gunAmmo[argument[1]];
}
else if (argument[0] == "capacity") return global.gunCapacity[argument[1]];
else if (argument[0] == "prefix1") return global.gunPrefix1[argument[1]];
else if (argument[0] == "prefix2") return global.gunPrefix2[argument[1]];
else if (argument[0] == "material") return global.gunMaterial[argument[1]];
else if (argument[0] == "type") return global.gunType[argument[1]];
else if (argument[0] == "suffix") return global.gunSuffix[argument[1]];
else if (argument[0] == "shot") { return global.gunShot[? global.gunType[argument[1]]]; }
else if (argument[0] == "group") return global.gunGroup[| ds_list_find_index(global.gunName, argument[1])];
else if (argument[0] == "type sub") { return ds_list_find_index(global.gunTypeSub, global.gunType[argument[1]]); }
else if (argument[0] == "sub from name") { return ds_list_find_index(global.gunTypeSub, argument[1]); }
else if (argument[0] == "add" || argument[0] == "add bag")
{
    if (argument[0] == "add") 
    { 
        if (global.gunAmount >= 5) return -1; 
        if (global.gunEquipped == -1) global.gunEquipped = 0;
        var gni = global.gunAmount;
    }
    else 
    {
        if (global.gunEquipped == -1) global.gunEquipped = 5;
        var gni = 5 + global.gunBagAmount;
    }
    
    global.gunName[gni] = argument[1];
    global.gunDamage[gni] = argument[2];
    global.gunRate[gni] = argument[3];
    global.gunSpecial[gni] = argument[4];
    global.gunWeight[gni] = ceil(argument[5]);
    global.gunAmmo[gni] = argument[6];
    global.gunCapacity[gni] = argument[7];
    global.gunPrefix1[gni] = argument[8];
    global.gunPrefix2[gni] = argument[9];
    global.gunMaterial[gni] = argument[10];
    global.gunType[gni] = argument[11];
    global.gunSuffix[gni] = argument[12];
    if (argument_count > 13) global.gunFavorite[gni] = argument[13]; else global.gunFavorite[gni] = 0;
    if (argument_count > 14) global.gunGeneration[gni] = argument[14]; else global.gunGeneration[gni] = 0;
    if (argument[0] == "add") global.gunAmount += 1;
    else global.gunBagAmount += 1;
    
    return 1;
}
else if (argument[0] == "amount")
{
    if (argument_count == 1) return global.gunAmount; //this doesn't count gun bag
    else global.gunAmount = argument[1];
    return 1;
}
else if (argument[0] = "gun amount") //Returns gun puch guns available
{
    return scr_equipment_guns_bandolier_getSlotsUsed();
}
else if (argument[0] == "gunbag") //Returns if the player has a gunbag (can carry a reserve)
{
    if (argument_count == 1) return global.gunBag; else { global.gunBag = argument[1]; return 1; }
}
else if (argument[0] = "gunbag amount") //Returns reserve + empty gunsbag number
{
    return global.gunBagAmount;
}
else if (argument[0] = "gunbag reserve amount") //Returns reserve number
{
    return scr_equipment_guns_bag_countUsedGuns();
}
else if (argument[0] = "gunbag empty amount") //Returns reserve + empty gunsbag number
{
    return scr_equipment_guns_bag_countUnusedGuns();
}
else if (argument[0] == "clear")
{
    for (_i = 0; _i < 25; _i += 1)
    {
        global.gunName[_i] = "";
        global.gunDamage[_i] = 0;
        global.gunRate[_i] = 0;
        global.gunSpecial[_i] = 0;
        global.gunWeight[_i] = 0;
        global.gunAmmo[_i] = 50;
        global.gunCapacity[_i] = 100;
        global.gunPrefix1[_i] = "";
        global.gunPrefix2[_i] = "";
        global.gunMaterial[_i] = "NullMaterial";
        global.gunType[_i] = "NullType";
        global.gunSuffix[_i] = "";
        global.gunFavorite[_i] = 0;
        global.gunGeneration[_i] = 0;
    }
    global.gunEquipped = -1;
    global.gunAmount = 0;
    global.gunBagAmount = 0;
    global.gunBag = 1; //If 0 you don't have a gun bag to carry reserve guns
    return 1;
}
else if (argument[0] == "define") // 1 = group, 2 = name, 3 = type
{
    //global.gunShot = ds_map_create();
    //global.gunTypeSub = ds_list_create();
    ds_list_add(global.gunGroup, argument[1]);
    ds_map_add(global.gunShot, argument[2], 0);
    ds_list_add(global.gunName, argument[2]);
    ds_list_add(global.gunTypeSub, argument[2]); // was 3
    //ds_list_add(
    return 1;
}
else if (argument[0] == "init")
{
    //Extra slot is gun's bag first gun
    Gun("clear");
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
    global.gunName = ds_list_create();
    
    // The order below is VERY IMPORTANT for sub-images! DO NOT CHANGE!
    Gun("define", "Pistols",    "Pistol", 6);
    Gun("define", "Pistols",    "Flintlock", 5);
    Gun("define", "Automatic",  "Uzi", 3);
    Gun("define", "Pistols",    "Revolver", 6);
    Gun("define", "Pistols",    "Magnum", 6);
    Gun("define", "Projectile", "Flare Gun", 7);
    Gun("define", "Rifles",     "Rifle", 2);
    Gun("define", "Rifles",     "Musket", 5);
    Gun("define", "Rifles",     "Hunting Rifle", 2);
    Gun("define", "Rifles",     "Tranq Rifle", 2);
    Gun("define", "Rifles",     "Sniper", 2); // Is this sniper rifle?
    Gun("define", "Automatic",  "Assault", 3);
    Gun("define", "Automatic",  "SMG", 1);
    Gun("define", "Automatic",  "Machinegun", 10);
    Gun("define", "Mounted",    "Gatling Gun", 10);
    Gun("define", "Mounted",    "Minigun", 10);
    Gun("define", "Mounted",    "Mitrailleuse", 10);
    Gun("define", "Shotguns",   "Shotgun", 9);
    Gun("define", "Shotguns",   "Dbl. Shotgun", 9);
    Gun("define", "Shotguns",   "Autoshotgun", 9);
    Gun("define", "Shotguns",   "Elephant Gun", 2);
    Gun("define", "Projectile", "Crossbow", 0);
    Gun("define", "Projectile", "Flame", 4);
    Gun("define", "Projectile", "Bazooka", 7);
    Gun("define", "Mounted",    "BFG", 8);
    
    // Type sub-image
    
    //For now guns just have name, ammo capacity, ammo, and weight
    return 1;
}

//If you typo or provide an incorrect command...
show_debug_message("Gun() - Unknown command: " + argument[0]);
