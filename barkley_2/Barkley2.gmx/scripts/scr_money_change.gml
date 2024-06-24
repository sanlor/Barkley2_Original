// Change Money
// usage: scr_money_change(amount)

var money = scr_money_count();
money += argument0;
money = max(0,money);
if (instance_exists(o_hud)) o_hud.moneyShow = 40;
scr_money_set(money);
