/// Drop("create" "stats" "material")
var i, h;

// Drop("create", 1 = gunsdrop, 
//                2 = matGen, 3 = matBio, 4 = matCyb, 5 = matMen, 6 = matCos, 7 = matZau,
//                8 = typAut, 9 = typMou, 10 = typPis, 11 = typPro, 12 = typRif, 13 = typSho);
// Returns a ds_map with the drop values
if (argument[0] == "create")
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
    if (real(num) / 2 == floor(real(num) / 2) && num != "0") sttPow += bon;
    num = string_copy(tim, 2, 1);
    if (real(num) / 2 == floor(real(num) / 2) && num != "0") sttCap += bon;
    num = string_copy(tim, 4, 1);
    if (real(num) / 2 == floor(real(num) / 2) && num != "0") sttAff += bon;
    num = string_copy(tim, 5, 1);
    if (real(num) / 2 == floor(real(num) / 2) && num != "0") sttSpd += bon;
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


else if (argument[0] == "type") // 1 = Luck, 2 = Pistols, 3 = Rifles, 4 = Shotguns, 5 = Automatic, 6 = Mounted, 7 = Projectile
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
    for (h = 0; h < ds_list_size(global.gunName); h += 1)
    {
        var gun = global.gunName[| h];
        for (i = 0; i < ds_list_size(global.gunGroups); i += 1)
        {
            if (Gun("group", gun) == global.gunGroups[| i]) gunGrp[h] = i;
        }
    }
    tfp = 0;
    for (i = 0; i < ds_list_size(global.gunGroups); i += 1) tfp += gunVal[i];
    for (h = 0; h < ds_list_size(global.gunName); h += 1)
    {
        var gun = global.gunName[| h];
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
        for (h = 0; h < ds_list_size(global.gunName); h += 1)
        {
            var gun = global.gunName[| h];
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
