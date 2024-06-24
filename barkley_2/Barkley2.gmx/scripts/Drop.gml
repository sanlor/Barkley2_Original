/// Drop("define", gunsdrop, generic, bio, cyber, mental, cosmic, zauber, automatic, mounted, pistols, projectile, rifles, shotguns, name?)
var i, h;

// Drop("db")
// Drop("define")
// Drop("stats")
// Drop("material")
// Drop("type")
// Drop("fixed")
// Drop("enabled")
// Drop("item")
// Drop("candy")
// Drop("generate")
// Drop("fuse fresh")
// Drop("init")

if (argument[0] == "db")
{
    //             GD  Ge Bi Cy Me Ko Za Au Mo Pi Pr Ri Sh
    Drop("define", 56, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, "generic automatic");
    Drop("define", 56, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, "generic mounted");
    Drop("define", 56, 1, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, "generic pistol");
    Drop("define", 56, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, "generic projectile");
    Drop("define", 56, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, "generic rifle");
    Drop("define", 56, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, "generic shotgun");
    
    // Quest guns
    Drop("define", 56, 3, 0, 0, 0, 0, 0, 0, 0, 3, 0, 0, 0, "wilmers gun");
    Drop("define", 56, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3, "esthers gun");
    Drop("define", 56, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, "bio shotgun");
    Drop("define", 56, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, "bio rifle");
    Drop("define", 56, 0, 0, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, "cyber pistol");
    Drop("define", 56, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, "cyber projectile");
    Drop("define", 56, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, "mental rifle");
    
    // Gun sales
    Drop("define", 56, 0, 0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, "kosmic pistol");
    Drop("define", 56, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1, 0, "kosmic rifle");
    Drop("define", 56, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, "kosmic shotgun");
    Drop("define", 56, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, "kosmic projectile");
    Drop("define", 56, 0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 0, 0, "kosmic mounted");
    
    Drop("define", 64, 0, 0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 0, "zauber pistol");
    Drop("define", 64, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, "zauber rifle");
    Drop("define", 64, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1, "zauber shotgun");
    Drop("define", 64, 0, 0, 0, 0, 0, 1, 0, 0, 0, 1, 0, 0, "zauber projectile");
    Drop("define", 64, 0, 0, 0, 0, 0, 1, 0, 1, 0, 0, 0, 0, "zauber mounted");
    
    // Turald      GD  Ge Bi Cy Me Ko Za Au Mo Pi Pr Ri Sh
    Drop("define", 56, 1, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, "turald free");
    Drop("define", 59, 1, 1, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, "turald weak");
    Drop("define", 64, 1, 1, 1, 0, 0, 0, 1, 1, 1, 1, 1, 1, "turald good");
    Drop("define", 69, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, "turald best");
    
    // TEST - for cgrem
    Drop("define", 56, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, "fixed test");
    
    // Destructs   GD  Ge Bi Cy Me Ko Za Au Mo Pi Pr Ri Sh "name"
    Drop("define", 70, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, "ds_gau_regular"); // Gauntlet - Random Catchall
    Drop("define", 59, 1, 1, 0, 0, 0, 0, 1, 1, 2, 1, 1, 1, "ds_sw1_regular"); // Sewers 1 - Bio + Pistol
    Drop("define", 68, 1, 1, 0, 0, 0, 0, 1, 1, 1, 1, 0, 1, "ds_sw2_regular"); // Sewers 2 - Bio - Rifle
    Drop("define", 83, 1, 0, 1, 0, 0, 0, 1, 0, 1, 1, 2, 1, "ds_est_regular"); // Easteland - Cyber + Rifle
    Drop("define", 83, 0, 0, 3, 0, 0, 0, 2, 0, 1, 0, 1, 0, "ds_est_cyber");   // Easteland - Cyber + Automatic
    Drop("define", 92, 1, 1, 0, 0, 3, 0, 1, 1, 1, 3, 2, 1, "ds_pea_regular"); // Mountain Pass - Kosmic + Projectile
    Drop("define", 92, 1, 1, 0, 3, 1, 3, 1, 1, 2, 1, 1, 3, "ds_min_regular"); // Mines - Mental + Shotgun
    Drop("define", 101, 1, 1, 0, 0, 0, 3, 1, 1, 1, 1, 1, 2, "ds_swp_regular"); // Swamp - Zauber + Shotgun
    Drop("define", 106, 1, 1, 1, 1, 2, 2, 1, 3, 1, 1, 1, 2, "ds_fct_regular"); // Factory - Zauber + Mounted
    Drop("define", 113, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, "ds_usw_regular"); // Undersewers - RANDOM
    Drop("define", 129, 1, 1, 3, 0, 2, 1, 1, 1, 2, 1, 1, 1, "ds_air_regular"); // AI Ruins - Cyber + Pistol
    Drop("define", 137, 0, 1, 0, 0, 0, 1, 0, 1, 1, 2, 1, 1, "ds_wst_regular"); // Westeland - Cyber + Rifle
    Drop("define", 137, 0, 0, 3, 0, 0, 0, 2, 0, 1, 0, 1, 0, "ds_est_cyber");   // Westeland - Cyber + Automatic
    Drop("define", 143, 1, 1, 0, 3, 0, 0, 1, 3, 1, 1, 1, 1, "ds_ice_regular"); // Iceland - Mental + Mounted
    Drop("define", 149, 1, 1, 0, 0, 1, 3, 1, 1, 1, 5, 1, 1, "ds_dth_regular"); // Death Tower - Zauber + Projectile
    Drop("define", 155, 1, 1, 1, 1, 3, 2, 3, 1, 2, 1, 1, 1, "ds_chu_regular"); // Cuchu's Lair - Kosmic + Automatic
    Drop("define", 180, 1, 1, 1, 1, 3, 2, 3, 1, 2, 1, 1, 1, "ds_swp_corpse"); // Corpse Blossom
    Drop("define", 200, 1, 1, 1, 1, 3, 2, 3, 1, 2, 1, 1, 1, "ds_gau_maxxx"); // Full Max Build
    
    // Gun in the Stone // Redfield's Memorial
    Drop("define", 69, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, "gun stone");
    
    // Fishing
    for (var _i = 0; _i <= 50; _i += 1)
    {
        Drop("define", 20 + _i, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, "fishing " + string(_i));
    }
    
    return 1;
}


else if (argument[0] == "create")
{
    var gun = argument[1];
    var _x = argument[2];
    var _y = argument[3];
    var n = instance_create(_x, _y - 6, oPickUpGun); // Added -6 offset
    n.gun = gun;
    return n;
}


// Drop("define", 1 = gunsdrop, 
//                2 = matGen, 3 = matBio, 4 = matCyb, 5 = matMen, 6 = matCos, 7 = matZau,
//                8 = typAut, 9 = typMou, 10 = typPis, 11 = typPro, 12 = typRif, 13 = typSho);
// Returns a ds_map with the drop values
else if (argument[0] == "define")
{
    var dsm = ds_map_create();
    ds_map_add(dsm, "gunsdrop", argument[1]);
    ds_map_add(dsm, "generic", argument[2]);
    ds_map_add(dsm, "bio", argument[3]);
    ds_map_add(dsm, "cyber", argument[4]);
    ds_map_add(dsm, "mental", argument[5]);
    ds_map_add(dsm, "cosmic", argument[6]);
    ds_map_add(dsm, "zauber", argument[7]);
    ds_map_add(dsm, "automatic", argument[8]);
    ds_map_add(dsm, "mounted", argument[9]);
    ds_map_add(dsm, "pistols", argument[10]);
    ds_map_add(dsm, "projectile", argument[11]);
    ds_map_add(dsm, "rifles", argument[12]);
    ds_map_add(dsm, "shotguns", argument[13]);
    if (argument_count > 14) ds_map_add(global.dsmDrop, argument[14], dsm);
    return dsm;
}


// Drop("stats", 50, ClockTime("time"), scr_stats_getEffectiveStat(o_hoopz, STAT_BASE_LUCK) + Quest("playerCCBonus"));
else if (argument[0] == "stats") // Arg1 = Gunsdrop, Arg2 = Time, Arg3 = Bonus
{
    // RETURNS sttPow, sttCap, sttAff, sttSpd
    var pow = argument[1] / 4; // Gunsdrop
    var tim = argument[2]; // "24:00"
    var bon = argument[3] / 10; // Bonus Value usually is Player Luck + CCBonus
    // Base Stats
    sttPow = pow;
    sttCap = pow;
    sttAff = pow;
    sttSpd = pow;
    // Bonus Apply = Is even and not 0
    num = string_copy(tim, 1, 1);
    if (real(num) / 2 == floor(real(num) / 2) && num != "0") sttPow += Quest("playerCCPowerBonus");
    num = string_copy(tim, 2, 1);
    if (real(num) / 2 == floor(real(num) / 2) && num != "0") sttCap += Quest("playerCCCapacityBonus");
    num = string_copy(tim, 4, 1);
    if (real(num) / 2 == floor(real(num) / 2) && num != "0") sttAff += Quest("playerCCAffixBonus");
    num = string_copy(tim, 5, 1);
    if (real(num) / 2 == floor(real(num) / 2) && num != "0") sttSpd += Quest("playerCCSpeedBonus");
}

else if (argument[0] == "material") // 1 = Luck, 2 = Generic, 3 = Bio, 4 = Cyber, 5 = Mental, 6 = Kosmic, 7 = Zauber
{
    smtLck = 1; // In Settings()
    totLck = argument[1] / 2; // Usually enemy + player luck
    matVal[0] = argument[2];
    matVal[1] = 0; // Synthetic
    matVal[2] = argument[3];
    matVal[3] = argument[4]; 
    matVal[4] = argument[5];
    matVal[5] = argument[6];
    matVal[6] = argument[7];
    totLck = (totLck * smtLck);
    tfp = 0;
    for (i = 0; i < ds_list_size(global.dslMaterialGroups); i += 1) tfp += matVal[i];
    for (i = 0; i < ds_list_size(global.dslMaterialGroups); i += 1)
    {
        matValSmo[i] = matVal[i];
        if (matVal[i] != 0)
        {
            matValSmo[i] *= (abs(totLck - 100) / 100);
            matValSmo[i] += (tfp / 6) * (totLck / 100);
        }
    }
    
    // Should only be doing this list once, but has low performance impact
    var cou = 0;
    gloLst = 0; // Last number
    for (i = 0; i < ds_list_size(global.dslMaterialGroups); i += 1)
    {
        var cat = global.dslMaterialGroups[| i]; // Generic, Synthetic, etc
        totPct[i] = 0;
        for (h = 0; h < ds_list_size(global.dslMaterialName); h += 1)
        {
            var mat = global.dslMaterialName[| h];
            if (Material("group", mat) == cat)
            {
                var odd = Material("odds", mat); // Local Material Odds
                if (odd != 0)
                {
                    odd *= (abs(totLck - 100) / 100);
                    odd += totLck / global.dslMaterialTimes[| i];
                }
                gloMat[cou] = mat;
                gloLst += (odd * matValSmo[i]) / tfp; // Global Material Odds
                gloNum[cou] = gloLst;
                cou += 1;
            }
        }
        //string(totPct[i]); // Group Odds
    }
    var num = random(gloLst);
    for (i = 0; i < cou; i += 1)
    {
        if (num <= gloNum[i]) { gloInd = i; return gloMat[i]; }
    }
    return gloMat[0]; // The code should never reach here, a fail safe
}


else if (argument[0] == "type") // 1 = Luck, 2 = Automatic, 3 = Mounted, 4 = Pistols, 5 = Projectile, 6 = Rifles, 7 = Shotguns
{
    smtLck = 1; // In Settings()
    totLck = argument[1] / 2; // Usually enemy + player luck
    gunVal[0] = argument[2];
    gunVal[1] = argument[3];
    gunVal[2] = argument[4]; 
    gunVal[3] = argument[5];
    gunVal[4] = argument[6];
    gunVal[5] = argument[7];
    
    for (i = 0; i < ds_list_size(global.gunGroups); i += 1) gunPol[i] = 0;
    for (h = 0; h < ds_list_size(global.gunTypeList); h += 1)
    {
        var gun = global.gunTypeList[| h];
        for (i = 0; i < ds_list_size(global.gunGroups); i += 1)
        {
            if (Gun("group", gun) == global.gunGroups[| i]) gunGrp[h] = i;
        }
    }
    tfp = 0;
    for (i = 0; i < ds_list_size(global.gunGroups); i += 1) tfp += gunVal[i];
    for (h = 0; h < ds_list_size(global.gunTypeList); h += 1)
    {
        var gun = global.gunTypeList[| h];
        var ind = gunGrp[h];
        gunPol[ind] += Gunsmap("rarity by name", gun);
    }
    for (i = 0; i < ds_list_size(global.gunGroups); i += 1)
    {
        gunValSmo[i] = gunVal[i];
        gunValSmo[i] *= (abs(totLck - 100) / 100);
        gunValSmo[i] += (tfp / 6) * (totLck / 100);
    }
    
    // Should only be doing this list once, but has low performance impact
    var cou = 0;
    gloLst = 0; // Last number
    for (i = 0; i < ds_list_size(global.gunGroups); i += 1)
    {
        var cat = global.gunGroups[| i]; // Generic, Synthetic, etc
        totPct[i] = 0;
        for (h = 0; h < ds_list_size(global.gunTypeList); h += 1)
        {
            var gun = global.gunTypeList[| h];
            if (Gun("group", gun) == cat)
            {
                var odd = Gunsmap("rarity by name", gun);//Material("odds", mat);
                var odo = odd;
                odd = (odo / gunPol[i]) * 100;
                odd *= (abs(totLck - 100) / 100);
                odd += totLck / global.gunTimes[| i];
                gloMat[cou] = gun;
                gloLst += (odd * gunValSmo[i]) / tfp; // Global Material Odds
                gloNum[cou] = gloLst;
                cou += 1;
            }
        }
        //string(totPct[i]); // Group Odds
    }
    var num = random(gloLst);
    for (i = 0; i < cou; i += 1)
    {
        if (num <= gloNum[i]) { gloInd = i; return gloMat[i]; }
    }
    return gloMat[0]; // The code should never reach here, a fail safe
}

else if (argument[0] == "fixed")
{
    if (argument_count == 1) return fixedDrop_gun;
    fixedDrop_gun = argument[1];
    return 1;
}
else if (argument[0] == "enabled")
{
    if (argument_count == 1) return itemdrop_enabled;
    itemdrop_enabled = argument[1];
    return 1;
}


// Drop ITEM can only be called from combat actors as it uses Hoopz and Enemy LUCK
else if (argument[0] == "item") // Arg1 = dropdata? (or string from DB)
{
    if (Drop("enabled") == false) return 0;
    var dsmDrp;
    if (argument_count == 2) 
    {
        //show_debug_message("Drop('item'): Arg1 = " + string(argument[1]));
        if (is_string(argument[1])) dsmDrp = ds_map_find_value(global.dsmDrop, argument[1]);
        else dsmDrp = argument[1];
        //show_debug_message("Drop('item'): " + string(dsmDrp[? "pistols"]) + " - " + string(dsmDrp[? "shotguns"]));
    }
    
    // Check for fixed
    if (fixedDrop_gun != NULL) 
    {
        fixedDrop_gun[? "pCurAmmo"] = ceil(fixedDrop_gun[? "pMaxAmmo"] * global.settingDropAmmo); // made this 50% ammo for gun's drops for GoG - bhroom
        var objDrp = Drop("create", fixedDrop_gun, x, y);
        objDrp.timer = 9999999999;
        return 0;
    }
    
    // Check empty dropdata
    if (ds_map_empty(dsmDrp)) { show_debug_message("Drop() - Empty dropdata supplied. No drop being executed."); return 0; }
    
    // Check for all 0's in types
    if (dsmDrp[? "automatic"] + dsmDrp[? "mounted"] + dsmDrp[? "pistols"] + 
            dsmDrp[? "projectile"] + dsmDrp[? "rifles"] + dsmDrp[? "shotguns"] == 0)
    {
        show_debug_message("Drop() - Empty types (0 for all types). No drop being executed."); 
        return 0;
    }
    
    // Check for all 0's in materials
    if (dsmDrp[? "generic"] + dsmDrp[? "bio"] + dsmDrp[? "cyber"] +
            dsmDrp[? "mental"] + dsmDrp[? "cosmic"] + dsmDrp[? "zauber"] == 0)
    {
        show_debug_message("Drop() - Empty materials (0 for all types). No drop being executed."); 
        return 0;
    }
    
    // Try dropping...
    var rnd = random(100);
    if (Quest("dropEnabled") == 0) rnd = 100000;
    var drt = Quest("dropTable");
    // Candy, or...
    if (rnd < global.settingDropCandy[drt])
    {
        Drop("candy", x, y);
    }
    // Gun, or...
    else if (rnd < global.settingDropGun[drt] + global.settingDropCandy[drt])
    {
        return Drop("gun", dsmDrp);
    }
    // Ammo, or...
    else if (rnd < global.settingDropGun[drt] + global.settingDropCandy[drt] + global.settingDropWildAmmo[drt])
    {
        instance_create(x, y, oPickUpAmmo);
    }
    // Otherwise, drop "NADA" / Nothing
}
else if (argument[0] == "gun")
{
    var dsmDrp;
    // Get droplist
    if (is_string(argument[1])) dsmDrp = ds_map_find_value(global.dsmDrop, argument[1]);
    else dsmDrp = argument[1];
    // Use luck to drop gun
    var lck = scr_savedata_get("player.stats.effective." + STAT_BASE_LUCK) + scr_stats_getBaseStat(id, STAT_BASE_LUCK);
    var gunNew = Drop("generate", lck, dsmDrp);
    gunNew[? "pCurAmmo"] = ceil(gunNew[? "pMaxAmmo"] * global.settingDropAmmo);
    return Drop("create", gunNew, x, y);
}
else if (argument[0] == "candy") // 1 = X, 2 = Y, 3 = Luck? | Drops an object of candy
{
    var _obj = instance_create(argument[1], argument[2], oPickUpCandy);
    //_obj.move_x = random(2)-1;
    //_obj.move_y = random(2)-1;
    //_obj.move_z = random(2)+2;
    //_obj.rot = random(360);
    //_obj.rotspd = random(20)-10;
    if (argument_count > 3) _obj.candy = Candy("drop", argument[3]);
    else 
    {
        var lck = scr_savedata_get("player.stats.effective." + STAT_BASE_LUCK) + 
        scr_stats_getBaseStat(id, STAT_BASE_LUCK) + (scr_quest_get_state("playerCCBonus") * ClockTime("get"));
        _obj.candy = Candy("drop", lck);
    }
}
else if (argument[0] == "generate") // Arg1 = Luck, Arg2 = dropdata, Arg3 = Name?
{
    var gunGen;
    var lck = argument[1];
    var dsmGen = argument[2];
    var name = "";
    if (argument_count > 3) name = argument[3];
    
    // Check for string list
    if (is_string(dsmGen)) dsmGen = ds_map_find_value(global.dsmDrop, argument[2]);
    
    for (q = 0; q < 2; q += 1)
    {
        gunGen = scr_combat_weapons_new();
        
        // Set TYPE
        gunGen[? "pType"] = Drop("type", lck, 
            dsmGen[? "automatic"], dsmGen[? "mounted"], dsmGen[? "pistols"], 
            dsmGen[? "projectile"], dsmGen[? "rifles"], dsmGen[? "shotguns"]);
            
        // Set MATERIAL
        gunGen[? "pMaterial"] = Drop("material", lck,
            dsmGen[? "generic"], dsmGen[? "bio"], dsmGen[? "cyber"],
            dsmGen[? "mental"], dsmGen[? "cosmic"], dsmGen[? "zauber"]);
        
        // Set AFFIX
        if (random(100) <= global.geneAffixChance)
            gunGen[? "pPrefix1"] = scr_combat_weapons_fusion_affixhood("prefix1", "name", 1 + floor(random(scr_combat_weapons_fusion_affixhood("prefix1", "size") - 1)));
        else 
            gunGen[? "pPrefix1"] = scr_combat_weapons_fusion_affixhood("prefix1", "name", 0); // Empty
        scr_combat_weapons_fusion_affixhood("generate", "prefix1", gunGen[? "pPrefix1"], gunGen);
          
        if (random(100) <= global.geneAffixChance)
            gunGen[? "pPrefix2"] = scr_combat_weapons_fusion_affixhood("prefix2", "name", 1 + floor(random(scr_combat_weapons_fusion_affixhood("prefix2", "size") - 1)));
        else
            gunGen[? "pPrefix2"] = scr_combat_weapons_fusion_affixhood("prefix2", "name", 0);
        scr_combat_weapons_fusion_affixhood("generate", "prefix2", gunGen[? "pPrefix2"], gunGen);
        
        if (random(100) <= global.geneAffixChance)
            gunGen[? "pSuffix"] = scr_combat_weapons_fusion_affixhood("suffix", "name", 1 + floor(random(scr_combat_weapons_fusion_affixhood("suffix", "size") - 1)));
        else
            gunGen[? "pSuffix"] = scr_combat_weapons_fusion_affixhood("suffix", "name", 0);
        scr_combat_weapons_fusion_affixhood("generate", "suffix", gunGen[? "pSuffix"], gunGen);
    
        ///apply material and type to get mod ratios
        scr_combat_weapons_applyMaterial(gunGen, gunGen[? "pMaterial"]);
        scr_combat_weapons_applyType(gunGen, gunGen[? "pType"]);
        scr_combat_weapons_applyGraphic(gunGen);
        
        // Set STATS
        Drop("stats", dsmGen[? "gunsdrop"], ClockTime("time"), Quest("playerCCBonus"));
        gunGen[? "sPower"] = sttPow;
        gunGen[? "sSpeed"] = sttSpd;
        gunGen[? "sAmmo"] = sttCap;
        gunGen[? "sAffix"] = sttAff;
        gunGen[? "sWeight"] = ((sttPow + sttSpd + sttCap + sttAff) * global.settingDropWeightPercent) + global.settingDropWeightAdd;
        
        // THE REST...
        scr_combat_weapons_prepareStats(gunGen);
    
        ///AFFIXES MODIFY THE BASIC STATS HERE
        scr_combat_weapons_Prefix1(gunGen[? "pPrefix1"], "applyStats", gunGen);
        scr_combat_weapons_Prefix2(gunGen[? "pPrefix2"], "applyStats", noone, gunGen);
        scr_combat_weapons_Suffix(gunGen[? "pSuffix"], "applyStats", noone, gunGen);
        
        ///THEN APPLY SPECIAL AFFIX EFFECTS
        ///(done separately and after because some of them might take basic stats into account)
        scr_combat_weapons_Prefix1(gunGen[? "pPrefix1"], "apply", gunGen);
        scr_combat_weapons_Prefix2(gunGen[? "pPrefix2"], "apply", noone, gunGen);
        scr_combat_weapons_Suffix(gunGen[? "pSuffix"], "apply", noone, gunGen);
        
        scr_combat_weapons_prepPattern(gunGen);
        scr_combat_weapons_buildName(gunGen);
        
        gunFus[q] = gunGen;
    }
    
    var gnf = Drop("fuse fresh", gunFus[0], gunFus[1]);
    if (name != "") gnf[? "pName"] = name;
    return gnf;
}
else if (argument[0] == "fuse fresh") // Arg1 = GunTop, Arg2 = GunBot
{
    var gunNoA = argument[1];
    var gunNoB = argument[2];
    var fusedGun = scr_combat_weapons_fusion(gunNoA, gunNoB);
    show_debug_message("Drop('fuse fresh') - " + gunNoA[? "pModel"] + " + " + gunNoB[? "pModel"] + " = " + fusedGun[? "pModel"]);
    return fusedGun;
}
else if (argument[0] == "init")
{
    global.dsmDrop = ds_map_create();
    Drop("db");
}
