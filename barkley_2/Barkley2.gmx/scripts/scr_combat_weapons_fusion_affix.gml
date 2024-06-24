/// scr_combat_weapons_fusion_affix(gun1,gun2,gunFuseInto)
/// Result: fuseResult is assigned new pPrefix1, pPrefix2, pSuffix, and new gene values
var _gun0 = argument[0];
var _gun1 = argument[1];
var _gun2 = argument[2];

///DONE - Merge all genes
for (var _aI = 0; _aI < 3; _aI += 1)
{
    var _gN = scr_combat_weapons_fusion_affixhood(global.affixType[_aI], "gene amount"); //gene number in affix type
    for (var _gI = 0; _gI < _gN; _gI += 1)
    {
        var val1 = gunList2D_get(_gun0, "aGeneValue", _aI, _gI);
        var val2 = gunList2D_get(_gun1, "aGeneValue", _aI, _gI);
        gunList2D_put(_gun2, "aGene", _aI, _gI, (val1+val2));
    }
}

//Do compatibility
for (_aI = 0; _aI < 3; _aI += 1)
{
    bestAffix = "null";
    bestValue = 0;
    _aT = global.affixType[_aI];
    _aC = scr_combat_weapons_fusion_affixhood(_aT, "size");
    for (_j = 0; _j < _aC; _j += 1)
    {
        tempAffix = scr_combat_weapons_fusion_affixhood(_aT, "name", _j);
        tempValue = scr_combat_weapons_fusion_affixhood("compatibility", _aT, tempAffix, _gun2); //uses _i variable
        if (tempValue >= bestValue) // because i had 0.6 before
        {
            bestValue = tempValue;
            bestAffix = tempAffix;
        }
    }
    
    //See if it meets thresholds
    if (scr_combat_weapons_fusion_affixhood("threshold", _aT, bestAffix, _gun2) == 0)
    {
        _aff = 0;
        _gC = scr_combat_weapons_fusion_affixhood(_aT, "gene amount");
        //The below code is set later, so commented out
        //for (_i = 0; _i < _gC; _i += 1)
        //{
        //    _gun2[? ""]aGenePenchant[_aI, _i] = ds_list_find_value(global.genePenchant[_aI, _aff], _i);
        //}
        if (_aI == 0) bestAffix = scr_combat_weapons_fusion_affixhood("prefix1", "name", _aff);
        else if (_aI == 1) bestAffix = scr_combat_weapons_fusion_affixhood("prefix2", "name", _aff);
        else if (_aI == 2) bestAffix = scr_combat_weapons_fusion_affixhood("suffix", "name", _aff);
    }
    
    _msg[_aI] = bestAffix + " = " + string(bestValue); //_msg[] is used outside script in debug
    _affNam[_aI] = bestAffix; //_affNam[0, 1, 2] = new affix names
}

//Set new affix names
_gun2[? "pPrefix1"] = _affNam[0];
_gun2[? "pPrefix2"] = _affNam[1];
_gun2[? "pSuffix"] = _affNam[2];

//Do penchant + new values for gun 2
for (_aI = 0; _aI < 3; _aI += 1)
{
    _aT = global.affixType[_aI]; //prefix1, prefix2, suffix
    _aN = _affNam[_aI]; //make _
    _gC = scr_combat_weapons_fusion_affixhood(_aT, "gene amount");
    for (_gI = 0; _gI < _gC; _gI += 1)
    {
        _gN = scr_combat_weapons_fusion_affixhood(_aT, "gene name", _gI); //speed up
        //Gene value was set prior to this when merging guns, no need to set again
        gunList2D_put(_gun2, "aGenePenchant", _aI, _gI, scr_combat_weapons_fusion_affixhood(_aT, "gene", _aN, _gN));
        gunList2D_put(_gun2, "aGeneValue", _aI, _gI,
                gunList2D_get(_gun2, "aGene", _aI, _gI) * gunList2D_get(_gun2, "aGenePenchant", _aI, _gI));
    }
}
