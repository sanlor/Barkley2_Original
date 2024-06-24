// Periodic deals 150% MENTAL instead of normal damage.
if (string(argument[0]) == "applyStats") return 0;
if (string(argument[0]) == "apply") return 0;
if (string(argument[0]) == "applyBullet")
{
    var _bullet = argument[1];
    var gun = argument[2];
    if (gun[? "pChargeRatio"] == 1)
    {
        statusHelper_damageSingle(_bullet, STAT_ATTACK_DMG_MENTAL, 1 + (gun[? "pAffix"] / 50));
    }
    return 1;
}
