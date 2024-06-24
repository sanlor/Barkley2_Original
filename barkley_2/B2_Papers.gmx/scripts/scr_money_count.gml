// Check Money
// usage: scr_money_count()

if (room == rDSL) return scr_savedata_get("quest.vars.player.shekels");
return scr_savedata_get("player.shekels");
