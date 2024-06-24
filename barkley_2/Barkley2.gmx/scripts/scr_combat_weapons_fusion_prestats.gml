/// scr_combat_weapons_fusion_prestats(weapon_1, weapon_2)
gunStatDivisionBonus = 25; // was 15
gunPowerRatio = 1.2; // was 1.2
gunNoisePercent = .05;

//Grabbed values
var fga = argument[0];
var fgb = argument[1];
for (var iii = 0; iii < 2; iii += 1)
{
    var gun = argument[iii];
    gunPower[iii] = gun[? "sPower"];
    gunROF[iii] = gun[? "sSpeed"];
    gunAmmo[iii] = gun[? "sAmmo"];
    gunAffix[iii] = gun[? "sAffix"];
    gunWeight[iii] = gun[? "sWeight"];
    
    gunPowerMod[iii] = gun[? "pPowerMod"] + gun[? "pPowerMaxMod"]/2;
    gunROFMod[iii] = gun[? "pSpeedMod"];
    gunAmmoMod[iii] = gun[? "pAmmoMod"];
    gunAffixMod[iii] = gun[? "pAffixMod"];
    gunWeightMod[iii] = 1; //gun[? "pWeightMod"];
}

//Generate totals, priorities, bonus
for (var iii = 0; iii < 2; iii += 1)
{
    gunTotal[iii] = gunPower[iii] + gunROF[iii] + gunAmmo[iii] + gunAffix[iii]; //priority
    gunRatio[iii] = .5;
    gunRatioPower[iii] = .5;
    
    gunPowerTotal[iii] = gunPower[iii] * gunPowerMod[iii];
    gunROFTotal[iii] = gunROF[iii] * gunROFMod[iii];
    gunAmmoTotal[iii] = gunAmmo[iii] * gunAmmoMod[iii];
    gunAffixTotal[iii] = gunAffix[iii] * gunAffixMod[iii];
    gunWeightTotal[iii] = gunWeight[iii] * gunWeightMod[iii];
    
    gunPowerBonus[iii] = gunPowerTotal[iii] / gunStatDivisionBonus; //total divided by bonus division
    gunROFBonus[iii] = gunROFTotal[iii] / gunStatDivisionBonus;
    gunAmmoBonus[iii] = gunAmmoTotal[iii] / gunStatDivisionBonus;
    gunAffixBonus[iii] = gunAffixTotal[iii] / gunStatDivisionBonus;
    gunWeightBonus[iii] = gunWeightTotal[iii] / gunStatDivisionBonus;
}

//Do ratios
gunRatio[0] = gunTotal[0] / (gunTotal[0] + gunTotal[1]);
gunRatio[1] = gunTotal[1] / (gunTotal[0] + gunTotal[1]);

//Do power ratios
if (gunRatio[0] == gunRatio[1])
{
    gunRatioPower[0] = .5;
    gunRatioPower[1] = .5;
}
else
{
    if (gunRatio[0] > gunRatio[1]) gunRatioPower[0] = 1 - power(gunRatio[1], gunPowerRatio);
    else gunRatioPower[0] = power(gunRatio[0], gunPowerRatio);
    gunRatioPower[1] = abs(gunRatioPower[0] - 1);
}

ratio = gunRatioPower[0];

//gunPowerAverage = mean(gunPower[0], gunPower[1]);
//gunROFAverage = mean(gunROF[0], gunROF[1]);
//gunAmmoAverage = mean(gunAmmo[0], gunAmmo[1]);
//gunAffixAverage = mean(gunAffix[0], gunAffix[1]);
//gunWeightAverage = mean(gunWeight[0], gunWeight[1]);

gunPowerAverage = (gunPower[0] * gunRatioPower[0]) + (gunPower[1] * gunRatioPower[1]);
gunROFAverage = (gunROF[0] * gunRatioPower[0]) + (gunROF[1] * gunRatioPower[1]);
gunAmmoAverage = (gunAmmo[0] * gunRatioPower[0]) + (gunAmmo[1] * gunRatioPower[1]);
gunAffixAverage = (gunAffix[0] * gunRatioPower[0]) + (gunAffix[1] * gunRatioPower[1]);
gunWeightAverage = (gunWeight[0] * gunRatioPower[0]) + (gunWeight[1] * gunRatioPower[1]);

//bonus times the other power ratio
gunPowerGain = (gunPowerBonus[0] * gunRatioPower[1]) + (gunPowerBonus[1] * gunRatioPower[0]);
gunROFGain = (gunROFBonus[0] * gunRatioPower[1]) + (gunROFBonus[1] * gunRatioPower[0]);
gunAmmoGain = (gunAmmoBonus[0] * gunRatioPower[1]) + (gunAmmoBonus[1] * gunRatioPower[0]);
gunAffixGain = (gunAffixBonus[0] * gunRatioPower[1]) + (gunAffixBonus[1] * gunRatioPower[0]);
gunWeightGain = (gunWeightBonus[0] * gunRatioPower[1]) + (gunWeightBonus[1] * gunRatioPower[0]);

//New total
gunPowerNew = gunPowerAverage + gunPowerGain;
gunROFNew = gunROFAverage + gunROFGain;
gunAmmoNew = gunAmmoAverage + gunAmmoGain;
gunAffixNew = gunAffixAverage + gunAffixGain;
gunWeightNew = gunWeightAverage + gunWeightGain + global.settingFuseWeight;
gunTotalWorkingNew = gunPowerNew + gunROFNew + gunAmmoNew + gunAffixNew;// + gunWeightNew;

//NOISE
gunPowerNoise = max(gunPower[0], gunPower[1]) * gunNoisePercent;
gunROFNoise = max(gunROF[0], gunROF[1]) * gunNoisePercent;
gunAmmoNoise = max(gunAmmo[0], gunAmmo[1]) * gunNoisePercent;
gunAffixNoise = max(gunAffix[0], gunAffix[1]) * gunNoisePercent;
gunWeightNoise = max(gunWeight[0], gunWeight[1]) * gunNoisePercent;

//RANDOM
gunPowerNoiseEffect = random(gunPowerNoise) * choose(1, -1);
gunROFNoiseEffect = random(gunROFNoise) * choose(1, -1);
gunAmmoNoiseEffect = random(gunAmmoNoise) * choose(1, -1);
gunAffixNoiseEffect = random(gunAffixNoise) * choose(1, -1);
gunWeightNoiseEffect = random(gunWeightNoise);// * choose(1, -1);

//Noise total
gunPowerNoiseTotal = gunPowerNew + gunPowerNoiseEffect;
gunROFNoiseTotal = gunROFNew + gunROFNoiseEffect;
gunAmmoNoiseTotal = gunAmmoNew + gunAmmoNoiseEffect;
gunAffixNoiseTotal = gunAffixNew + gunAffixNoiseEffect;
gunWeightNoiseTotal = gunWeightNew + gunWeightNoiseEffect;

// GZ ADD
gunTotalNoiseless = gunPowerNew + gunROFNew + gunAmmoNew + gunAffixNew;
// GZ NEW WEIGHT
gunWeightNoiseTotal = max(gunWeight[0], gunWeight[1]);
if (gunTotal[0] > gunTotal[1]) gunWeightNoiseTotal += fga[? "generation"] * global.settingFuseWeight;
else gunWeightNoiseTotal += fgb[? "generation"] * global.settingFuseWeight;

gunTotalFinal = gunPowerNoiseTotal + gunROFNoiseTotal + gunAmmoNoiseTotal + gunAffixNoiseTotal + gunWeightNoiseTotal;
