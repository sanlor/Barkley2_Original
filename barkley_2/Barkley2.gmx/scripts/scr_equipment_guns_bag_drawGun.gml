/// scr_equipment_guns_bag_drawGun()
/// Draw gun returns the first unused gun, or the last gun, or NULL if no guns

var list = scr_equipment_guns_bag_list();
var curGun = scr_equipment_guns_getCurrentGun();
//var curRes = 0;
//if (scr_equipment_guns_bandolier_equippedFrom())

if (ds_list_empty(list)) {
    return NULL;
}

if (scr_equipment_guns_bandolier_equippedFrom())
{
    show_debug_message("scr_equipment_guns_bag_drawGun - Going from bando to bag...");
    
    // Check if only one gun has ammo, if so, pick that always
    var gunAmm = 0;
    var gunEqp = -1;
    for (var i = 0; i < ds_list_size(list); i++)
    {
        var gun = list[| i];
        if (gun[? "pCurAmmo"] > 0) { gunAmm += 1; gunEqp = gun; }
    }
    if (gunAmm == 1) return gunEqp;
    
    // Otherwise draw last used gunsbag gun
    for (var i = 0; i < ds_list_size(list); i++)
    {
        var gun = list[| i];
        if (gun[? "used"]) { return gun; } //gun == curGun) { curInd = i ; break; }
    }
    
    // If there is no last used, pick first gunsbag gun
    var gun = list[| 0];
    gun[? "used"] = 1;
    return gun;
}

// Find index

var curInd = -1;
for (var i = 0; i < ds_list_size(list); i++)
{
    var gun = list[| i];
    if (gun[? "used"]) { curInd = i; break; } //gun == curGun) { curInd = i ; break; }
}

if (curInd == -1) // Either not in gunsbag (will never happen unless debug) OR it's from bando, so do 0
{
    curInd = 0;
    //show_debug_message("scr_equipment_guns_bag_drawGun - Gunsbag no longer has current gun.");
    //return curGun;
}

for (var h = 0; h < ds_list_size(list); h++)
{
    var gun = list[| h];
    if (h == curInd) gun[? "used"] = 1;
    else gun[? "used"] = 0;
}

i = curInd;
show_debug_message("scr_equipment_guns_bag_drawGun - Getting next bag gun... " + string(curInd));
for (var h = 0; h < ds_list_size(list); h++) 
{
    //if (h != 0) // Skip first
    //{
        var gun = list[| i];
        if (gun != NULL && gun[? "used"] == 0) 
        {
            //if (curGun[? "pCurAmmo"] == 0) return gun;
            //else 
            if (global.settingGunsbagDrawEmpty == 0 && gun[? "pCurAmmo"] > 0) { curGun[? "used"] = 0; gun[? "used"] = 1; return gun; }
            else if (global.settingGunsbagDrawEmpty == 1) { curGun[? "used"] = 0; gun[? "used"] = 1; return gun; }
        }
    //}
    i += 1;
    if (i >= ds_list_size(list)) i = 0;
}
show_debug_message("scr_equipment_guns_bag_drawGun - Couldn't get gunsbag gun regularly (no ammo on others?), so picking current.");
return curGun;
/*
show_debug_message("scr_equipment_guns_bag_drawGun - Couldn't get gunsbag gun regularly, so picking last.");
curGun = list[| ds_list_size(list)-1];
curGun[? "used"] = 1;
return curGun;
//return list[| ds_list_size(list)-1];
