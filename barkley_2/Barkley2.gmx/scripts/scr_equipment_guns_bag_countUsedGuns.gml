/// scr_equipment_guns_bag_countUsedGuns()

var list = scr_equipment_guns_bag_list();

var tot = 0;
for (var i = 0; i < ds_list_size(list); i++) {
    var gun = list[| i];
    if (gun[? "used"]) {
        tot++;
    }
}

return tot;
