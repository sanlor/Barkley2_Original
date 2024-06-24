//This is hoopz' gun slots - 6 would be total guns had, so 5 guns + 10 gunbag is 15
//These do not fully represent the actual guns, these would be linked to a guns ID
if (argument[0] == "ammo") return global.gunAmmo[argument[1]];
else if (argument[0] == "capacity") return global.gunCapacity[argument[1]];
else if (argument[0] == "name") return global.gunName[argument[1]];
else if (argument[0] == "weight") return global.gunWeight[argument[1]];
else if (argument[0] == "prefix1") return global.gunPrefix1[argument[1]];
else if (argument[0] == "prefix2") return global.gunPrefix2[argument[1]];
else if (argument[0] == "material") return global.gunMaterial[argument[1]];
else if (argument[0] == "type") return global.gunType[argument[1]];
else if (argument[0] == "suffix") return global.gunSuffix[argument[1]];
else if (argument[0] == "unidentified") return global.gunUnidentified[argument[1]];
else if (argument[0] == "slot") //provide a slot ID and return the order
{
    return global.gunOrder[argument[1]];
}
else if (argument[0] == "hotkey key")
{
    return global.gunHotkeyKey[argument[1]];
}
else if (argument[0] == "hotkey") 
{
    if (argument_count == 2) //Tells you which hotkey is assigned to which slot
    {
        return global.gunHotkey[argument[1]];
    }
    else if (argument_count == 3) //Provide 2 numbers to swap
    {
        if (global.gunHotkey[argument[1]] == argument[2]) return 0; //Same hotkey
        _ind0 = argument[1];
        _ind = -1;
        _key = global.gunHotkey[_ind0];
        _key2 = global.gunHotkeyKey[_ind0];
        for (_i = 0; _i < 6; _i += 1)
        {
            if (global.gunHotkey[_i] == argument[2]) { _ind = _i; break; }
        }
        if (_ind == -1) return - 1;
        //Ms g("MIX = " + string(argument[2]) + " / " + string(global.gunHotkey[_ind]));
        global.gunHotkey[_ind0] = argument[2];
        global.gunHotkeyKey[_ind0] = global.gunHotkeyKey[_ind];
        global.gunHotkey[_ind] = _key;
        global.gunHotkeyKey[_ind] = _key2;
        return 1;
    }
}
else if (argument[0] == "add")
{
    if (global.gunAmount >= 5) return -1;
    if (global.gunEquipped == -1) global.gunEquipped = 0;
    global.gunName[global.gunAmount] = argument[1];
    global.gunWeight[global.gunAmount] = ceil(argument[2]);
    global.gunCapacity[global.gunAmount] = argument[3];
    global.gunAmmo[global.gunAmount] = argument[4];
    global.gunPrefix1[global.gunAmount] = argument[5];
    global.gunPrefix2[global.gunAmount] = argument[6];
    global.gunMaterial[global.gunAmount] = argument[7];
    global.gunType[global.gunAmount] = argument[8];
    global.gunSuffix[global.gunAmount] = argument[9];
    if (argument_count > 10) global.gunUnidentified[global.gunAmount] = argument[10]; 
    else global.gunUnidentified[global.gunAmount] = 0;
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
else if (argument[0] == "inscribed")
{
    //
}
else if (argument[0] = "gun amount") //Returns gun pouch guns available
{
    return scr_equipment_guns_bandolier_getSlotsUsed();
}
else if (argument[0] == "gunbag") //Returns if the player has a gunbag (can carry a reserve)
{
    if (argument_count == 1) return global.gunBag;
    else { global.gunBag = argument[1]; return 1; }
}
else if (argument[0] = "gunbag amount") //Returns reserve + empty gunsbag number
{
    return scr_equipment_guns_bag_getSlotsUsed();
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
    for (_i = 0; _i < 6; _i += 1)
    {
        //global.gunHotkey[_i] = _i + 1;
        global.gunOrder[_i] = _i; //Tells me which position the guns should be for the bandolier
        global.gunName[_i] = "";
        global.gunWeight[_i] = 0;
        global.gunCapacity[_i] = 100;
        global.gunAmmo[_i] = 50;
        global.gunPrefix1[_i] = "";
        global.gunPrefix2[_i] = "";
        global.gunMaterial[_i] = "NullMaterial";
        global.gunType[_i] = "NullType";
        global.gunSuffix[_i] = "";
        global.gunUnidentified[_i] = 0;
    }
    global.gunEquipped = -1; //based on slot
    global.gunAmount = 0;
    global.gunBag = 1; //If 0 you don't have a gun bag to carry reserve guns
    return 1;
}
else if (argument[0] == "order") //ask for the 0 gun and it returns the slot ID
{
    for (_i = 0; _i < 5; _i += 1) //was 6
    {
        if (global.gunOrder[_i] == argument[1]) return _i;
    }
    scr_msg("scr_gun() - ORDER ERROR: -1");
    return -1;
}
else if (argument[0] == "init")
{
    //Hotkey
    global.hotkeyEnabled = 1;
    for (_i = 0; _i < 5; _i += 1) global.gunHotkey[_i] = _i + 1;
    global.gunHotkeyKey[0] = ord('1');
    global.gunHotkeyKey[1] = ord('2');
    global.gunHotkeyKey[2] = ord('3');
    global.gunHotkeyKey[3] = ord('4');
    global.gunHotkeyKey[4] = ord('5');
    //Extra slot is gun's bag first gun
    scr_gun("clear");
    
    //For now guns just have name, ammo capacity, ammo, and weight
    return 1;
}

//If you typo or provide an incorrect command...
scr_msg("scr_gun() - Unknown command: " + argument[0]);
