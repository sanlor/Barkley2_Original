/// Gun(add, name, damage, rate, special, weight, ammo, capacity, prefix1, prefix2, material, type, suffix)
//This is hoopz' gun slots - 6 would be total guns had, so 5 guns + 10 gunbag is 15
//These do not fully represent the actual guns, these would be linked to a guns ID
if (argument[0] == "name") return global.gunName[argument[1]];
else if (argument[0] == "damage") return global.gunDamage[argument[1]];
else if (argument[0] == "rate") return global.gunRate[argument[1]];
else if (argument[0] == "special") return global.gunSpecial[argument[1]];
else if (argument[0] == "weight") return global.gunWeight[argument[1]];
else if (argument[0] == "ammo") return global.gunAmmo[argument[1]];
else if (argument[0] == "capacity") return global.gunCapacity[argument[1]];
else if (argument[0] == "prefix1") return global.gunPrefix1[argument[1]];
else if (argument[0] == "prefix2") return global.gunPrefix2[argument[1]];
else if (argument[0] == "material") return global.gunMaterial[argument[1]];
else if (argument[0] == "type") return global.gunType[argument[1]];
else if (argument[0] == "suffix") return global.gunSuffix[argument[1]];
else if (argument[0] == "shot") { return global.gunShot[? global.gunType[argument[1]]]; }
else if (argument[0] == "type sub") { return ds_list_find_index(global.gunTypeSub, global.gunType[argument[1]]); }
else if (argument[0] == "add")
{
    if (global.gunAmount >= 5) return -1;
    if (global.gunEquipped == -1) global.gunEquipped = 0;
    global.gunName[global.gunAmount] = argument[1];
    global.gunDamage[global.gunAmount] = argument[2];
    global.gunRate[global.gunAmount] = argument[3];
    global.gunSpecial[global.gunAmount] = argument[4];
    global.gunWeight[global.gunAmount] = ceil(argument[5]);
    global.gunAmmo[global.gunAmount] = argument[6];
    global.gunCapacity[global.gunAmount] = argument[7];
    global.gunPrefix1[global.gunAmount] = argument[8];
    global.gunPrefix2[global.gunAmount] = argument[9];
    global.gunMaterial[global.gunAmount] = argument[10];
    global.gunType[global.gunAmount] = argument[11];
    global.gunSuffix[global.gunAmount] = argument[12];
    global.gunAmount += 1;
    return 1;
}
else if (argument[0] == "bag") //merge into add code to save lines
{
    if (global.gunEquipped == -1) global.gunEquipped = 5;
    global.gunName[5] = argument[1];
    global.gunWeight[5] = ceil(argument[2]);
    global.gunCapacity[5] = argument[3];
    global.gunAmmo[5] = argument[4];
    global.gunPrefix1[5] = argument[5];
    global.gunPrefix2[5] = argument[6];
    global.gunMaterial[5] = argument[7];
    global.gunType[5] = argument[8];
    global.gunSuffix[5] = argument[9];
    if (argument_count > 10) global.gunUnidentified[5] = argument[10]; 
    else global.gunUnidentified[5] = 0;
    //identified
    return 1;
}
else if (argument[0] == "amount")
{
    return global.gunAmount; //this doesn't count gun bag
}
else if (argument[0] = "gun amount") //Returns gun puch guns available
{
    //return scr_equipment_guns_bandolier_getSlotsUsed();
}
else if (argument[0] == "gunbag") //Returns if the player has a gunbag (can carry a reserve)
{
    if (argument_count == 1) return global.gunBag; else { global.gunBag = argument[1]; return 1; }
}
else if (argument[0] = "gunbag amount") //Returns reserve + empty gunsbag number
{
    //return scr_equipment_guns_bag_getSlotsUsed();
}
else if (argument[0] = "gunbag reserve amount") //Returns reserve number
{
    //return scr_equipment_guns_bag_countUsedGuns();
}
else if (argument[0] = "gunbag empty amount") //Returns reserve + empty gunsbag number
{
    //return scr_equipment_guns_bag_countUnusedGuns();
}
else if (argument[0] == "clear")
{
    for (_i = 0; _i < 5; _i += 1)
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
    }
    global.gunEquipped = -1;
    global.gunAmount = 0;
    global.gunBag = 1; //If 0 you don't have a gun bag to carry reserve guns
    return 1;
}
else if (argument[0] == "init")
{
    //Extra slot is gun's bag first gun
    //scr_gun("clear");
    
    // Type link
    global.gunShot = ds_map_create();
    ds_map_add(global.gunShot, "Crossbow", 0);
    ds_map_add(global.gunShot, "Machinegun", 1);
    ds_map_add(global.gunShot, "SMG", 1);
    ds_map_add(global.gunShot, "Hunting Rifle", 2);
    ds_map_add(global.gunShot, "Elephant Gun", 2);
    ds_map_add(global.gunShot, "Tranq Rifle", 2);
    ds_map_add(global.gunShot, "Rifle", 2);
    ds_map_add(global.gunShot, "Sniper Rifle", 2);
    ds_map_add(global.gunShot, "Uzi", 3);
    ds_map_add(global.gunShot, "Assault", 3);
    ds_map_add(global.gunShot, "Flame", 4);
    ds_map_add(global.gunShot, "Flintlock", 5);
    ds_map_add(global.gunShot, "Musket", 5);
    ds_map_add(global.gunShot, "Revolver", 6);
    ds_map_add(global.gunShot, "Magnum", 6);
    ds_map_add(global.gunShot, "Pistol", 6);
    ds_map_add(global.gunShot, "Flare Gun", 7);
    ds_map_add(global.gunShot, "Bazooka", 7);
    ds_map_add(global.gunShot, "BFG", 8);
    ds_map_add(global.gunShot, "Autoshotgun", 9);
    ds_map_add(global.gunShot, "Dbl. Shotgun", 9);
    ds_map_add(global.gunShot, "Shotgun", 9);
    ds_map_add(global.gunShot, "Gatling Gun", 10);
    ds_map_add(global.gunShot, "Mitrailleuse", 10);
    ds_map_add(global.gunShot, "Minigun", 10);
    
    // Type sub
    global.gunTypeSub = ds_list_create();
    ds_list_add(global.gunTypeSub, "Pistol");
    ds_list_add(global.gunTypeSub, "Flintlock");
    ds_list_add(global.gunTypeSub, "Uzi");
    ds_list_add(global.gunTypeSub, "Revolver");
    ds_list_add(global.gunTypeSub, "Magnum");
    ds_list_add(global.gunTypeSub, "Flare Gun");
    ds_list_add(global.gunTypeSub, "Rifle");
    ds_list_add(global.gunTypeSub, "Musket");
    ds_list_add(global.gunTypeSub, "Hunting Rifle");
    ds_list_add(global.gunTypeSub, "Tranq Rifle");
    ds_list_add(global.gunTypeSub, "Sniper");
    ds_list_add(global.gunTypeSub, "Assault");
    ds_list_add(global.gunTypeSub, "SMG");
    ds_list_add(global.gunTypeSub, "Machinegun");
    ds_list_add(global.gunTypeSub, "Gatling Gun");
    ds_list_add(global.gunTypeSub, "Minigun");
    ds_list_add(global.gunTypeSub, "Mitrailleuse");
    ds_list_add(global.gunTypeSub, "Shotgun");
    ds_list_add(global.gunTypeSub, "Dbl. Shotgun");
    ds_list_add(global.gunTypeSub, "Autoshotgun");
    ds_list_add(global.gunTypeSub, "Elephant Gun");
    ds_list_add(global.gunTypeSub, "Crossbow");
    ds_list_add(global.gunTypeSub, "Flame");
    ds_list_add(global.gunTypeSub, "Bazooka");
    ds_list_add(global.gunTypeSub, "BFG");
    
    //For now guns just have name, ammo capacity, ammo, and weight
    return 1;
}

//If you typo or provide an incorrect command...
show_debug_message("Gun() - Unknown command: " + argument[0]);
