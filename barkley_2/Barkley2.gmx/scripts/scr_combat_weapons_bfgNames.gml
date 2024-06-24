/// scr_combat_weapons_bfgNames(string)
// Replaces text in a string to make BFG names
if (argument[0] == "init")
{
    global.dslBFGMaterial = ds_list_create();
    global.dslBFGReplace = ds_list_create();
    scr_combat_weapons_bfgNames("define", "Wood", "Becker's Log");
    scr_combat_weapons_bfgNames("define", "Plantain", "Cavendishtroyer");
    
    scr_combat_weapons_bfgNames("define", "Offal", "The Vivisector");
    scr_combat_weapons_bfgNames("define", "Stone", "Moai M.O.A.B.");
    scr_combat_weapons_bfgNames("define", "Obsidian", "Krakatoa");
    
    scr_combat_weapons_bfgNames("define", "Frankincense", "Melchior's Revenge");
    scr_combat_weapons_bfgNames("define", "Origami", "Paper-Mache");
    scr_combat_weapons_bfgNames("define", "Myrrh", "Balthazar's Judgement");
    scr_combat_weapons_bfgNames("define", "Gold", "Gaspar's Pride");
    scr_combat_weapons_bfgNames("define", "Mercury", "Quicksilverado");
    scr_combat_weapons_bfgNames("define", "Yggdrasil", "Slepnir");
}
else if (argument[0] == "define")
{
    ds_list_add(global.dslBFGMaterial, argument[1]);
    ds_list_add(global.dslBFGReplace, argument[2]);
}
else
{
    var str = argument[0];
    for (var iii = 0; iii < ds_list_size(global.dslBFGMaterial); iii += 1)
    {
        str = string_replace(str, global.dslBFGMaterial[| iii] + " " + GUN_TYPE_BFG, global.dslBFGReplace[| iii]);
    }
    return str;
}
