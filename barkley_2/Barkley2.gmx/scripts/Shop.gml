/// Shop()

// DSL NOTES
// Invoke with:
// Shop | open | Egidius' Jerkinry
// The variable "shop" will then become what the player does
// bought - if the player buys an item
// exit - player did not buy anything
// empty
// Example:
// IF shop == exit   | DIALOG | P_NAME | Maybe some other time...
// IF shop == bought | DIALOG | Egidius | Thank you for your patronage.
// IF shop == empty  | DIALOG | Egidius | I'm out of stock.

// Shop("stocks", "Egidius' Jerkinry") - Returns how many purchasable items the shop has

// NOTE: Should check if shop can even open up (has stock)

if (argument[0] == "db")
{
    // Shop types are jerkin, recipe, gun, vidcon (items)
    
    // EGIDIUS
    shopName = "Egidius' Jerkinry";
    Shop("define", shopName, "jerkin", sEgidiusFace);
    Shop("option", shopName, "Buy", "Info"); //"Rent", "Info");
    //                       Item Name              Price
    Shop("stocks", shopName, "Bottlecap Jerkin",    1000);
    Shop("stocks", shopName, "Eggcrate Jerkin",     50);
    Shop("stocks", shopName, "Monofilament Jerkin", 750);
    Shop("stocks", shopName, "Vestal Jerkin",       500);
    Shop("stocks", shopName, "Lead Jerkin",         100);
    
    // MORTIMER
    shopName = "Mortimer's Candy Shop";
    Shop("define", shopName, "recipe", sMortimerFace);
    Shop("option", shopName, "Buy");
    //                       Item Name         Price
    Shop("stocks", shopName, "Chickenfry Dew", 50);
    Shop("stocks", shopName, "Sweet Sweat",    20);
    Shop("stocks", shopName, "Candy Corn",     30);
    Shop("stocks", shopName, "Choco-mallows",   900);
    
    // MILAGROS
    shopName = "Milagros' Palazzo";
    Shop("define", shopName, "vidcon", sMilagrosFace);
    Shop("option", shopName, "Buy");
    //                       Item Name         Price
    Shop("stocks", shopName, "VIDCON_7",       90);
    Shop("stocks", shopName, "VIDCON_8",       50);
    Shop("stocks", shopName, "VIDCON_9",       75);
    //Shop("stocks", shopName, "Garlics",        500);
    //Shop("stocks", shopName, "Dwarf Skull",    100);
    //Shop("stocks", shopName, "Magnetic Tape",  250);
    
    // GUN'SALESMAN
    shopName = "Redfield's Wares";
    Shop("define", shopName, "gun", sRedfieldFace);
    Shop("option", shopName, "Buy", "Info");
    //                       Item Name         Price
    Shop("stocks", shopName, "GUN_0",          5);
    Shop("stocks", shopName, "GUN_1",          5);
    Shop("stocks", shopName, "GUN_2",          5);
    Shop("stocks", shopName, "GUN_3",          5);
    Shop("stocks", shopName, "GUN_4",          5);
    
    // GARFUNKLE
    shopName = "Garfunkle's Deals";
    Shop("define", shopName, "gun", sGarfunkleFace);
    Shop("option", shopName, "Buy", "Info");
    //                       Item Name         Price
    Shop("stocks", shopName, "GUN_0",          100);
    Shop("stocks", shopName, "GUN_1",          200);
    Shop("stocks", shopName, "GUN_2",          300);
    Shop("stocks", shopName, "GUN_3",          400);
    Shop("stocks", shopName, "GUN_4",          500);
    
    // WARMASTAH CGREM
    shopName = "War Warez";
    Shop("define", shopName, "gun", sGarfunkleFace);
    Shop("option", shopName, "Buy", "Info");
    //                       Item Name         Price
    Shop("stocks", shopName, "GUN_0",          50);
    Shop("stocks", shopName, "GUN_1",          50);
    Shop("stocks", shopName, "GUN_2",          50);
    Shop("stocks", shopName, "GUN_3",          50);
    Shop("stocks", shopName, "GUN_4",          50);
    
    // JOE THE HOOSEGOWER //
    shopName = "Joe's Brastwarez";
    Shop("define", shopName, "gun", sGarfunkleFace);
    Shop("option", shopName, "Buy", "Info");
    //                       Item Name         Price
    Shop("stocks", shopName, "GUN_0",          5);
    Shop("stocks", shopName, "GUN_1",          5);
    Shop("stocks", shopName, "GUN_2",          5);
    Shop("stocks", shopName, "GUN_3",          5);
    Shop("stocks", shopName, "GUN_4",          5);
    
    // SAMWISE BUBKIS, WESTELANDS SHOP //
    shopName = "Gun's de la Samwise";
    Shop("define", shopName, "gun", sGarfunkleFace);
    Shop("option", shopName, "Buy", "Info");
    //                       Item Name         Price
    Shop("stocks", shopName, "GUN_0",          100);
    Shop("stocks", shopName, "GUN_1",          200);
    Shop("stocks", shopName, "GUN_2",          300);
    Shop("stocks", shopName, "GUN_3",          400);
    Shop("stocks", shopName, "GUN_4",          500);
    
    // MEINHARDT, REBEL CAVE SHOP //
    shopName = "Meinhardt's Warez";
    Shop("define", shopName, "gun", sGarfunkleFace);
    Shop("option", shopName, "Buy", "Info");
    //                       Item Name         Price
    Shop("stocks", shopName, "GUN_0",          100);
    Shop("stocks", shopName, "GUN_1",          200);
    Shop("stocks", shopName, "GUN_2",          300);
    Shop("stocks", shopName, "GUN_3",          400);
    Shop("stocks", shopName, "GUN_4",          500);
    
    return 1;
}

else if (argument[0] == "result") return global.shopResult;

else if (argument[0] == "buy") // 1 = Shop Name, 2 = Item | Assumes you have enough NS to buy
{
    var shp = ds_list_find_index(global.shopName, argument[1]);
    var shpTyp = global.shopType[| shp];
    var shpItm = ds_list_find_value(global.shopItem, shp);
    var shpCos = ds_list_find_value(global.shopCost, shp);
    var itmInd = ds_list_find_index(shpItm, argument[2]);
    if (shpTyp == "jerkin") Jerkin("gain", argument[2]);
    if (shpTyp == "recipe") Candy("recipe add", argument[2]);
    if (shpTyp == "vidcon")
    {
        if (string_count("VIDCON_", argument[2]) > 0)
        {
            Vidcon("give", real(string_delete(argument[2], 1, 7)));
        }
        else Item("gain", argument[2]);
    }
    if (shpTyp == "gun") scr_equipment_guns_bag_addGun(itmDat[itmTru[itmSel]]);
    scr_money_set(scr_money_count() - floor(shpCos[| itmInd] * global.shopDiscount));
    Shop("create", argument[1]);
    return 1;
}

// Shop("create", "Egidius' Jerkinry"); - Sets all the local variables in oShop to make the shop function
else if (argument[0] == "create") // 1 = Shop Name
{
    var shp = ds_list_find_index(global.shopName, argument[1]);
    if (shp == -1) { show_message("Shop('create') - Trying to create shop >" + argument[1] + "< but it doesn't exist!"); return 0; }
    var shpOpt = ds_list_find_value(global.shopPick, shp);
    var shpItm = ds_list_find_value(global.shopItem, shp);
    var shpCos = ds_list_find_value(global.shopCost, shp);
    
    shopName = global.shopName[| shp];
    shopType = global.shopType[| shp];
    shopFace = global.shopFace[| shp];
    
    itmAmt = 0;
    for (var i = 0; i < ds_list_size(shpItm); i += 1)
    {
        var canAdd = 1;
        if (shopType == "jerkin" && Jerkin("has", shpItm[| i])) canAdd = 0;
        if (shopType == "recipe" && Candy("recipe has", shpItm[| i])) canAdd = 0;
        if (shopType == "vidcon")
        {
            if (string_count("VIDCON_", shpItm[| i]) > 0 && Vidcon("have", real(string_delete(shpItm[| i], 1, 7)))) canAdd = 0;
            else if (Item("have", shpItm[| i])) canAdd = 0;
        }
        if (shopType == "gun" && itmBuy[i] == 1) canAdd = 0;
        if (canAdd)
        {
            itmNam[itmAmt] = shpItm[| i];
            itmPrc[itmAmt] = shpCos[| i];
            itmTru[itmAmt] = i; // Gun buying
            itmAmt += 1;
        }
    }
    if (shopType == "jerkin") { itmHeiExp = 9; attCou = 4; }
    if (shopType == "recipe") { itmHeiExp = 6; attCou = 0; }
    if (shopType == "vidcon") { itmHeiExp = 6; attCou = 0; }
    if (shopType == "gun") { itmHeiExp = 6; attCou = 5; }
    
    sldOptAmt = ds_list_size(shpOpt);
    for (i = 0; i < sldOptAmt; i += 1) sldOpt[i] = shpOpt[| i];
    return 1;
}

else if (argument[0] == "open") // 1 = Shop Name
{
    global.shopOpenName = argument[1];
    instance_create(0, 0, oShop);
    return 1;
}

else if (argument[0] == "option") // 1 = Shop Name, 2 = Option 1, 3 = Option 2, etc
{
    var shp = ds_list_find_index(global.shopName, argument[1]);
    var shpOpt = ds_list_find_value(global.shopPick, shp);
    ds_list_add(shpOpt, argument[2]);
    if (argument_count > 3) ds_list_add(shpOpt, argument[3]);
    if (argument_count > 4) ds_list_add(shpOpt, argument[4]);
    if (argument_count > 5) ds_list_add(shpOpt, argument[5]);
    return 1;
}

else if (argument[0] == "stocks") // 1 = Shop Name, 2 = Item, 3 = Cost
{
    var shp = ds_list_find_index(global.shopName, argument[1]);
    var shpItm = ds_list_find_value(global.shopItem, shp);
    var shpTyp = global.shopType[| shp];
    if (argument_count == 2)
    {
        var shpAmt = 0;
        for (var i = 0; i < ds_list_size(shpItm); i += 1)
        {
            var canAdd = 1;
            if (shpTyp == "jerkin" && Jerkin("has", shpItm[| i])) canAdd = 0;
            if (shpTyp == "recipe" && Candy("recipe has", shpItm[| i])) canAdd = 0;
            if (shpTyp == "vidcon")
            {
                if (string_count("VIDCON_", shpItm[| i]) > 0 && Vidcon("have", real(string_delete(shpItm[| i], 1, 7)))) canAdd = 0;
                else if (Item("have", shpItm[| i])) canAdd = 0;
            }
            if (canAdd) shpAmt += 1;
        }
        return shpAmt;
    }
    
    var shpCos = ds_list_find_value(global.shopCost, shp);
    ds_list_add(shpItm, argument[2]);
    ds_list_add(shpCos, argument[3]);
    return 1;
}

else if (argument[0] == "define") // 1 = Shop Name, 2 = Shop Type, 3 = Portrait
{
    ds_list_add(global.shopName, argument[1]);
    ds_list_add(global.shopType, argument[2]);
    ds_list_add(global.shopFace, argument[3]);
    
    ds_list_add(global.shopPick, ds_list_create());
    
    ds_list_add(global.shopItem, ds_list_create());
    ds_list_add(global.shopCost, ds_list_create());
    
    return 1;
}

else if (argument[0] == "init")
{
    global.shopResult = "";
    global.shopName = ds_list_create();
    global.shopType = ds_list_create();
    global.shopFace = ds_list_create();
    
    global.shopPick = ds_list_create();
    
    global.shopItem = ds_list_create();
    global.shopCost = ds_list_create();
    
    Shop("db");
    return 1;
}

show_debug_message("Shop() - Unknown function >" + string(argument[0]) + "<.");
