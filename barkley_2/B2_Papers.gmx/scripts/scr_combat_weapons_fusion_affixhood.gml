////////
//The below example could set the default gene dominance any where from
//20 to 40 up to 50 to 100
//In conjunction with threshold, this will decide what is empty
global.geneMin = 30 + random(20); //20 + random(30);
global.geneMax = 20 + random(30);
if (argument[0] == "load")
{
    //Affix threshold - The average value of all signifiers must be above this number for an affix to not be empty
    global.affixThreshold = 30;//50;
    //Default penchants
    global.genePrimaryValue = .65; //When a SIGNIFIER is all CAPS it gets this value (note: currently all sigs are lower case)
    global.geneSecondaryValue = .6; //When a signifier is lower case it gets this value (note: currently all sigs are lower case)
    global.geneDistributedValue = .62; //when something is "distributed" / skip, give all in that pool this value
    global.geneOtherValue = .45; //All non-signifier genes get this value
    //NOTE: Distributed value will not work if you change the gene structure in the future, as the distribution is done
    //manually in the create prefix / suffix segment of code. Change the code there as well to make it work if changes are made.
    scr_combat_weapons_fusion_affixdb("prefix1"); //Load prefix1 data
    scr_combat_weapons_fusion_affixdb("prefix2"); //Load prefix2 data
    scr_combat_weapons_fusion_affixdb("suffix"); //Load suffix data
    
    //Data
    global.affixType[0] = "prefix1";
    global.affixType[1] = "prefix2";
    global.affixType[2] = "suffix";
}
else if (argument[0] == "compatibility") //scr_affix("compatibility", affix_type, affix_name, obj_id); - works with suffix only, returns compatibility
{
    if (argument[1] == "prefix1") { _ind = 0; } //mat = matches
    else if (argument[1] == "prefix2") { _ind = 1; }
    else { _ind = 2; }
    _aff = ds_list_find_index(global.affixName[_ind], argument[2]);
    _pnt = 0;
    var gun = argument[3];
    for (_i = 0; _i < global.affixGenes[_ind]; _i += 1)
    {
        _pnt += gunList2D_get(gun, "aGene", _ind, _i) * ds_list_find_value(global.genePenchant[_ind, _aff], _i); //was 8
    }
    return _pnt;
}
else if (argument[0] == "match all") //affix index, affix name, sigs (3 - 5)
{
    if (argument[1] == "prefix1") { _ind = 0; } //mat = matches
    else if (argument[1] == "prefix2") { _ind = 1; }
    else { _ind = 2; }
    _mat = global.affixPools[_ind];
    _aff = ds_list_find_index(global.affixName[_ind], argument[2]);
    //use the high gene NUMBERS, so (x = 0, y = 1, z = 2) would be 1 for y
    for (_i = 0; _i < _mat; _i += 1)
    {
        if (ds_list_find_value(global.geneSignifier[_ind, _aff], argument[3 + _i]) == 0) return 0;
    }
    return 1; //to speed up could have script that checks all auto in here, but less modular
}
else if (argument[0] == "prefix1" || argument[0] = "prefix2" || argument[0] == "suffix") //arg1 = pool, arg2 = 0 > 4
{
    if (argument[0] == "prefix1") { _ind = 0; }
    else if (argument[0] == "prefix2") { _ind = 1; }
    else { _ind = 2; }
    _tim = global.affixPools[_ind];
    if (argument[1] == "gene") //scr_affix("prefix0", "gene", "of the marriage", "genename")
    {
        _pos = ds_list_find_index(global.affixName[_ind], argument[2]); //find affix
        _ind2 = ds_list_find_index(global.geneName[_ind], argument[3]);
        return ds_list_find_value(global.genePenchant[_ind, _pos], _ind2);
    }
    else if (argument[1] == "gene name") //scr_affix("prefix0", "gene name", 2) - returns 2nd gene name
    {
        return ds_list_find_value(global.geneName[_ind], argument[2]);
    }
    else if (argument[1] == "find gene family") //supply gene name
    {
        _pos = ds_list_find_index(global.geneName[_ind], argument[2]);
        if (_ind < 0) return -1;
        return ds_list_find_value(global.geneFamily[_ind], _pos); 
    }
    else if (argument[1] == "name") //scr_affix("prefix0", "name", 1) - returns number 1 affix anme
    {
        //if (argument_count == 2)
        if (argument[2] >= ds_list_size(global.affixName[_ind])) return -1;
        return ds_list_find_value(global.affixName[_ind], argument[2]);
    }
    else if (argument[1] == "index") //scr_affix("prefix0", "index", "of the dickslayer") - returns number 1 affix anme
    {
        return ds_list_find_index(global.affixName[_ind], argument[2]);
    }
    else if (argument[1] == "description") //scr_affix("prefix0", "name", 1) - returns number 1 affix anme
    {
        if (argument[2] >= ds_list_size(global.affixName[_ind])) return -1; //error check
        return ds_list_find_value(global.affixDescription[_ind], argument[2]);
    }
    else if (argument[1] == "size") //scr_affix("prefix0", "name") - returns number of affixes in this category
    {
        return ds_list_size(global.affixName[_ind]);
    }
    else if (argument[1] == "gene amount")
    {
        return global.affixGenes[_ind];
    }
    else if (argument[1] == "duplicate") //prefix0, name of affix 0, name of affix 1
    {
        //Msg("hi");
        _mat = 0;
        for (_i = 0; _i < _tim; _i += 1)
        {
            if (ds_list_find_value(global.geneMarkers[_ind, argument[2]], _i) == ds_list_find_value(global.geneMarkers[_ind, argument[3]], _i)) _mat += 1; //return 0;
        }
        //Msg("Matches " + string(_mat));
        if (_mat == _tim) return 1; else return 0;
        return 1;
    }
}
else if (argument[0] == "create prefix1" || argument[0] = "create prefix2" || argument[0] == "create suffix") //Make prefix table
{
    if (argument[0] == "create prefix1") { _ind = 0; }
    else if (argument[0] == "create prefix2") { _ind = 1; }
    else { _ind = 2; }
    _tim = global.affixPools[_ind];
    ds_list_add(global.affixName[_ind], argument[1]);
    ds_list_add(global.affixDescription[_ind], argument[_tim + 2]);
    
    //set gene values
    if (_ind == 2) 
    { 
        _pri = global.genePrimaryValue; 
        _sec = global.geneSecondaryValue; 
        _oth = global.geneOtherValue; 
    }
    else { _pri = global.genePrimaryValue; _sec = global.geneSecondaryValue; _oth = global.geneOtherValue; }
    
    //reset all genes
    _pos = global.affixCount[_ind]; //ds_list_size(global.geneValue[_ind, 0]); //for replacing later
    global.genePenchant[_ind, _pos] = ds_list_create();
    global.geneSignifier[_ind, _pos] = ds_list_create();
    global.geneMarkers[_ind, _pos] = ds_list_create();
    global.geneMarkersIndex[_ind, _pos] = ds_list_create();
    for (_h = 0; _h < global.affixGenes[_ind]; _h += 1)
    {
        ds_list_add(global.genePenchant[_ind, _pos], _oth); // was h
        ds_list_add(global.geneSignifier[_ind, _pos], 0);
    }
    
    //assign passed genes checking each for primary - argument 2 to 6
    if (global.affixCount[_ind] > 0)// || _ind == 2 || _ind == 0) //always make weak weak, skips first affix of every group, except suffix
    {
        for (_i = 0; _i < _tim; _i += 1)
        {
            _str = argument[2 + _i];
            if (string_upper(_str) == _str) { _val = _pri; _str = string_lower(_str); _sig = 2; }
            else { _val = _sec; _sig = 1; }
            _ind2 = ds_list_find_index(global.geneName[_ind], _str);
            if (_ind2 >= 0)
            {
                ds_list_replace(global.genePenchant[_ind, _pos], _ind2, _val);
                ds_list_replace(global.geneSignifier[_ind, _pos], _ind2, _sig);
            }
            ds_list_add(global.geneMarkers[_ind, _pos], _str);
            ds_list_add(global.geneMarkersIndex[_ind, _pos], _ind2);
        }
    }
    
    //Suffix exception
    if (_ind == 2)
    {
        if (argument[5] == "distributed")
        {
            //14 < 30
            for (_f = 14; _f < 30; _f += 1)
            {
                ds_list_replace(global.genePenchant[_ind, _pos], _f, global.geneDistributedValue);
            }
        }
    }
    
    global.affixCount[_ind] += 1;
}
else if (argument[0] == "signifiers")
{
    if (argument[1] == "prefix1") return global.affixPools[0];
    else if (argument[1] == "prefix2") return global.affixPools[1];
    else return global.affixPools[2];
}
else if (argument[0] == "threshold") //scr_affix("threshold", affix_type, affix_name, obj_id) - TRUE / FALSE
{
    //Returns TRUE / FALSE depending if affix meets thresholds (ie. use this after generating a gun from an affix)
    if (argument[1] == "prefix1") _ind = 0; else if (argument[1] == "prefix2") _ind = 1; else _ind = 2;
    _pol = global.affixPools[_ind]; //Number of gene families in this affix
    _aff = ds_list_find_index(global.affixName[_ind], argument[2]); //Index of affix
    _pts = 0; //tallies 
    _dis = 0; //if 1, do distribute add after
    var gun = argument[3];
    for (_i = 0; _i < _pol; _i += 1)
    {
        _mI = ds_list_find_value(global.geneMarkersIndex[_ind, _aff], _i); //get gene signifier
        if (_mI >= 0)
        {
            _pts += gunList2D_get(gun, "aGene", _ind, _mI) * ds_list_find_value(global.genePenchant[_ind, _aff], _mI);
        }
        else _dis = 1;
    }
    if (_dis == 1) //if a suffix has distribute as a gene, average it and use that as threshold number
    {
        _pss = 0; //new points for distribute
        var list = global.genePenchant[_ind, _aff];
        for (var _f = 14; _f < 30 and _f < ds_list_size(list); _f += 1)
        {
            _pss += gunList2D_get(gun, "aGene", _ind, _f) * ds_list_find_value(list, _f);
        }
        _pts += (_pss / 16);
    }
    if (_pts / _pol >= global.affixThreshold) return 1; else return 0;
}
else if (argument[0] == "generate") //scr_affix("generate", affix_type, affix_name, object_id); - Must be executed three times
{
    if (argument[1] == "prefix1") _ind = 0; else if (argument[1] == "prefix2") _ind = 1; else _ind = 2;
    _aff = ds_list_find_index(global.affixName[_ind], argument[2]);
    gun = argument[3];
    //Feel free to edit value min and max
    ds_list_clear(global.geneListTemp);
    for (_i = 0; _i < global.affixGenes[_ind]; _i += 1) ds_list_add(global.geneListTemp, global.geneMin + random(global.geneMax));
    ds_list_sort(global.geneListTemp, 0); //was shuffle, now sort
    
    //Get penchant values
    _gC = scr_combat_weapons_fusion_affixhood(argument[1], "gene amount");
    for (_i = 0; _i < _gC; _i += 1)
    {
        gunList2D_put(gun, "aHilight", _ind, _i, 0); //For debugging, keep this in!
        gunList2D_put(gun, "aGenePenchant", _ind, _i, ds_list_find_value(global.genePenchant[_ind, _aff], _i));
        gunList2D_put(gun, "aGeneName", _ind, _i, scr_combat_weapons_fusion_affixhood(argument[1], "gene name", _i));
    }
    
    //Loop through signifiers first and add accordingly - distributes matter or not?
    //gunList2D_put(gun, "aGenePenchant", _ind, 0, global.genePrimaryValue);
    _cou = 0;
    for (_i = 0; _i < _gC; _i += 1)
    {
        if (gunList2D_get(gun, "aGenePenchant", _ind, _i) == global.genePrimaryValue)
        {
            gunList2D_put(gun, "aGene", _ind, _i, ds_list_find_value(global.geneListTemp, _cou));
            ds_list_delete(global.geneListTemp, 0); 
            //_cou += 1;
        }
    }
    for (_i = 0; _i < _gC; _i += 1)
    {
        if (gunList2D_get(gun, "aGenePenchant", _ind, _i) == global.geneSecondaryValue)
        {
            gunList2D_put(gun, "aGene", _ind, _i, ds_list_find_value(global.geneListTemp, _cou));
            ds_list_delete(global.geneListTemp, 0); 
            //_cou += 1;
        }
    }
    for (_i = 0; _i < _gC; _i += 1)
    {
        if (gunList2D_get(gun, "aGenePenchant", _ind, _i) == global.geneDistributedValue)
        {
            gunList2D_put(gun, "aGene", _ind, _i, ds_list_find_value(global.geneListTemp, _cou));
            ds_list_delete(global.geneListTemp, 0); 
            //_cou += 1;
        }
    }
    ds_list_shuffle(global.geneListTemp);
    for (_i = 0; _i < _gC; _i += 1)
    {
        if (gunList2D_get(gun, "aGenePenchant", _ind, _i) == global.geneOtherValue)
        {
            gunList2D_put(gun, "aGene", _ind, _i, ds_list_find_value(global.geneListTemp, _cou));
            ds_list_delete(global.geneListTemp, 0); 
            //_cou += 1;
        }
    }
    
    //See if this affix meets the threshold
    _thr = scr_combat_weapons_fusion_affixhood("threshold", argument[1], argument[2], argument[3]);
    if (_thr == 0)
    {
        _aff = 0;
        for (_i = 0; _i < _gC; _i += 1)
        {
            gunList2D_put(gun, "aGene", _ind, _i, ds_list_find_value(global.genePenchant[_ind, _aff], _i));
        }
        if (_ind == 0) gun[? "pPrefix1"] = scr_combat_weapons_fusion_affixhood("prefix1", "name", _aff);
        else if (_ind == 1) gun[? "pPrefix2"] = scr_combat_weapons_fusion_affixhood("prefix2", "name", _aff);
        else if (_ind == 2) gun[? "pSuffix"] = scr_combat_weapons_fusion_affixhood("suffix", "name", _aff);
    }
    
    //Get total values
    for (_i = 0; _i < _gC; _i += 1)
    {
        gunList2D_put(gun, "aGeneValue", _ind, _i, gunList2D_get(gun, "aGene", _ind, _i) * gunList2D_get(gun, "aGenePenchant", _ind, _i));
    }
    return _thr;
}
else if (argument[0] == "init")
{
    global.geneListTemp = ds_list_create();
    global.geneDominance = 50; //does nothing currently
    
    //
    global.affixGenes[0] = 9; 
    global.affixPools[0] = 2;
    global.affixGenes[1] = 12; // was 13
    global.affixPools[1] = 3;
    global.affixGenes[2] = 11; // was 12
    global.affixPools[2] = 3;
    for (_i = 0; _i < 3; _i += 1) 
    { 
        global.affixName[_i] = ds_list_create();
        global.affixDescription[_i] = ds_list_create();
        global.affixCount[_i] = 0;
    }
    
    //PREFIX 1
    _ind = 0;
    global.geneName[_ind] = ds_list_create();
    global.geneFamily[_ind] = ds_list_create();
    // PMP - 3 genes
    ds_list_add(global.geneName[_ind], "plus"); ds_list_add(global.geneFamily[_ind], 0);   //1
    ds_list_add(global.geneName[_ind], "minus"); ds_list_add(global.geneFamily[_ind], 0);  //2
    ds_list_add(global.geneName[_ind], "pound"); ds_list_add(global.geneFamily[_ind], 0);  //3
    // Movement - 6 genes
    ds_list_add(global.geneName[_ind], "random"); ds_list_add(global.geneFamily[_ind], 1); //4
    ds_list_add(global.geneName[_ind], "homing"); ds_list_add(global.geneFamily[_ind], 1); //5
    ds_list_add(global.geneName[_ind], "bounce"); ds_list_add(global.geneFamily[_ind], 1); //6
    ds_list_add(global.geneName[_ind], "curved"); ds_list_add(global.geneFamily[_ind], 1); //7
    ds_list_add(global.geneName[_ind], "firing"); ds_list_add(global.geneFamily[_ind], 1); //8
    ds_list_add(global.geneName[_ind], "linear"); ds_list_add(global.geneFamily[_ind], 1); //9
    
    //PREFIX2
    _ind = 1;
    global.geneName[_ind] = ds_list_create();
    global.geneFamily[_ind] = ds_list_create();
    // TBC - 3 genes
    ds_list_add(global.geneName[_ind], "top"); ds_list_add(global.geneFamily[_ind], 0);         //1
    ds_list_add(global.geneName[_ind], "bottom"); ds_list_add(global.geneFamily[_ind], 0);        //2
    ds_list_add(global.geneName[_ind], "charm"); ds_list_add(global.geneFamily[_ind], 0);       //3
    // Element - 6 genes
    ds_list_add(global.geneName[_ind], "bio"); ds_list_add(global.geneFamily[_ind], 1);         //4
    ds_list_add(global.geneName[_ind], "cyber"); ds_list_add(global.geneFamily[_ind], 1);       //5
    ds_list_add(global.geneName[_ind], "mental"); ds_list_add(global.geneFamily[_ind], 1);      //6
    ds_list_add(global.geneName[_ind], "cosmic"); ds_list_add(global.geneFamily[_ind], 1);      //7
    ds_list_add(global.geneName[_ind], "zauber"); ds_list_add(global.geneFamily[_ind], 1);      //8
    // normal is unused
    //ds_list_add(global.geneName[_ind], "normal"); ds_list_add(global.geneFamily[_ind], 1);      //9
    // Attribute - 4 genes
    ds_list_add(global.geneName[_ind], "hp"); ds_list_add(global.geneFamily[_ind], 2);          //10
    ds_list_add(global.geneName[_ind], "capability"); ds_list_add(global.geneFamily[_ind], 2);  //11
    ds_list_add(global.geneName[_ind], "properties"); ds_list_add(global.geneFamily[_ind], 2);  //12
    ds_list_add(global.geneName[_ind], "weight"); ds_list_add(global.geneFamily[_ind], 2);      //13
    
    //SUFFIX
    _ind = 2;
    global.geneName[_ind] = ds_list_create();
    global.geneFamily[_ind] = ds_list_create();
    // QUARK - 3 genes
    ds_list_add(global.geneName[_ind], "up"); ds_list_add(global.geneFamily[_ind], 0);          //1
    ds_list_add(global.geneName[_ind], "down"); ds_list_add(global.geneFamily[_ind], 0);        //2
    ds_list_add(global.geneName[_ind], "strange"); ds_list_add(global.geneFamily[_ind], 0);     //3
    // Element - 6 genes
    ds_list_add(global.geneName[_ind], "bio"); ds_list_add(global.geneFamily[_ind], 1);         //4
    ds_list_add(global.geneName[_ind], "cyber"); ds_list_add(global.geneFamily[_ind], 1);       //5
    ds_list_add(global.geneName[_ind], "mental"); ds_list_add(global.geneFamily[_ind], 1);      //6
    ds_list_add(global.geneName[_ind], "cosmic"); ds_list_add(global.geneFamily[_ind], 1);      //7
    ds_list_add(global.geneName[_ind], "zauber"); ds_list_add(global.geneFamily[_ind], 1);      //8
    // normal is unused
    //ds_list_add(global.geneName[_ind], "normal"); ds_list_add(global.geneFamily[_ind], 1);      //9
    // STANCE - 2 genes
    ds_list_add(global.geneName[_ind], "reactive"); ds_list_add(global.geneFamily[_ind], 2);    //10
    ds_list_add(global.geneName[_ind], "aggressive"); ds_list_add(global.geneFamily[_ind], 2);   //11
    ds_list_add(global.geneName[_ind], "passive"); ds_list_add(global.geneFamily[_ind], 2);     //12
    
    scr_combat_weapons_fusion_affixhood("load");
}
else if (argument[0] == "description") // Arg1 = Name of affix
{
    // Search Prefix 1
    var afi = ds_list_find_index(global.affixName[0], argument[1]);
    // Search Prefix 2 on fail, or return Prefix 1 data
    if (afi == -1) ds_list_find_index(global.affixName[1], argument[1]); 
    else return ds_list_find_value(global.affixDescription[0], afi);
    // Search Suffix on fail, or return Prefix 2 data
    if (afi == -1) ds_list_find_index(global.affixName[2], argument[1]);
    else return ds_list_find_value(global.affixDescription[1], afi);
    // Return Suffix data on success, or return empty string
    if (afi != -1) return ds_list_find_value(global.affixDescription[2], afi);
    return "";
}
