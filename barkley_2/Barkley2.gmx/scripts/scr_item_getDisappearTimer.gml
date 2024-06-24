/// scr_item_getDisappearTimer()
/// default item disappear timer
/// returns the time before an item disappears. Is affected by hoopz' LUCK stat.

// This can happen before hoopz has been created. Use a non-hoopz dependent method to get LUCK
var luckmultip = scr_savedata_get("player.stats.effective." + STAT_BASE_LUCK) / 100;
return (global.settingDropTimeMin * 10) + (global.settingDropTimeLuck * 10) * luckmultip;
