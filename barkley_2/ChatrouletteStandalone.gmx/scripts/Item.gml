/// Item(gain lose have count, item_name)

// Item("gain", item_name, quantity (optional: default 1))
//  Hoopz gaisn an item

// Item("lose", item_name, quantity (optional: default 1))
//  Hoopz loses an item

// Item("have", item_name)
//  Returns true if you have one or more of an item

// Item("count", item_name)
//  Returns the number you have of the item

// Item("build", ...)
//  Add build in front of any statement to have it work in a GML cinema

// Below are less common functions

// Item("init")
//  Call once per game

// Item("reset")
//  Call when player identity is reset

// Item("define", item_name, item_description)
//  Adds an item definition to the game (scroll down to init section to define items)

// Item("name", index)
//  Returns a name from an item index

// Item("description", item_name) 
//  Returns a description from a name

// Item("string")
//  Returns a giant string of all items and quantities you have

if (is_real(argument[0])) // ds_list containing actions
{
    var siz = ds_list_size(argument[0]) - 1;
    if (siz == 1) Item(ds_list_find_value(argument[0], 1));
    if (siz == 2) Item(ds_list_find_value(argument[0], 1), ds_list_find_value(argument[0], 2));
    if (siz == 3) Item(ds_list_find_value(argument[0], 1), ds_list_find_value(argument[0], 2), ds_list_find_value(argument[0], 3));
    if (siz == 4) Item(ds_list_find_value(argument[0], 1), ds_list_find_value(argument[0], 2), ds_list_find_value(argument[0], 3), ds_list_find_value(argument[0], 4));
    if (siz == 5) Item(ds_list_find_value(argument[0], 1), ds_list_find_value(argument[0], 2), ds_list_find_value(argument[0], 3), ds_list_find_value(argument[0], 4), ds_list_find_value(argument[0], 5));
    if (siz == 6) Item(ds_list_find_value(argument[0], 1), ds_list_find_value(argument[0], 2), ds_list_find_value(argument[0], 3), ds_list_find_value(argument[0], 4), ds_list_find_value(argument[0], 5), ds_list_find_value(argument[0], 6));
    scr_event_advance(id);
    return 1;
}

if (argument[0] == "init") // DEFINE ALL ITEMS HERE
{
    global.dslItemName = ds_list_create();
    global.dslItemDescription = ds_list_create();
    Item("define", "Fiscian Gut's", "Gut's from an aquatic creature.");
    Item("define", "Garlics", "Duergars can't resist.");
    Item("define", "Duck Organs", "description");
    Item("define", "Sewer Butter", "Butter-like substance, affront to ya buds.");
    Item("define", "Cyberspear Piece", "Cyberspear Piece");
    Item("define", "Mysterious Object", "Mysterious Object");
    Item("define", "Bomb", "Bomb");
    Item("define", "Sterile Vial", "Sterile Vial");
    Item("define", "Duergar Urine", "Duergar Urine");
    Item("define", "Fruit Basket", "Fruit Basket");
    Item("define", "Zauber Pistol", "Zauber Pistol");
    Item("define", "Granny's Medicine", "Granny's Medicine");
    Item("define", "Guppy", "Guppy");
    Item("define", "Pike", "Pike");
    Item("define", "Carp", "Carp");
    Item("define", "Gun", "Gun");
    Item("define", "Item", "Item");
    Item("define", "Item2", "Item2");
    Item("define", "Useless Item", "description");
    Item("define", "Camera", "description");
    Item("define", "Turkey Feather", "description");
    Item("define", "Tribune-Wrapped Item", "description");
    Item("define", "Mystery Item", "description");
    Item("define", "Derided Item", "description");
    Item("define", "Esteemed Item", "description");
    Item("define", "d:GLAZEr", "description");
    Item("define", "wallscroll_01", "description");
    Item("define", "wallscroll_02", "description");
    Item("define", "wallscroll_03", "description");
    Item("define", "wallscroll_04", "description");
    Item("define", "Katzenjammer Blueprints", "description");
    Item("define", "Letter to Donald", "description");
    Item("define", "Healing Ointment", "description");
    Item("define", "Swamp Flower", "description");
    Item("define", "B1 Visitor Badge", "description");
    Item("define", "2F Visitor Badge", "description");
    Item("define", "3F Visitor Badge", "description");
    Item("define", "Tower Keycard", "description");
    Item("define", "Guilderberg Keycard", "description");
    Item("define", "Bronze Coin", "description");
    Item("define", "Silver Coin", "description");
    Item("define", "Gold Coin", "description");
    Item("define", "Durian Gaz", "description");
    Item("define", "LONGINUSFAKEITEM", "description");
    Item("define", "Guilderberg Deed", "description");
    Item("define", "W Seed", "description");
    Item("define", "Dreadfruit", "description");
    Item("define", "W Fruit", "description");
    Item("define", "Kirin Horn", "description");
    Item("define", "Snake Corpse", "description");
    Item("define", "Dwarf Skull", "description");
    Item("define", "Mandorla", "description");
    Item("define", "Alms Bowl", "description");
    Item("define", "Purified Alms Bowl", "description");
    Item("define", "Harmonious Alms Bowl", "description");
    Item("define", "Mystic Alms Bowl", "description");
    Item("define", "Ablution Bowl", "description");
    Item("define", "Humble Ablution Bowl", "description");
    Item("define", "Harmonious Ablution Bowl", "description");
    Item("define", "Mystic Ablution Bowl", "description");
    Item("define", "Singing Bowl", "description");
    Item("define", "Purified Singing Bowl", "description");
    Item("define", "Humble Singing Bowl", "description");
    Item("define", "Mystic Singing Bowl", "description");
    Item("define", "Royal Gem Box", "description");
    Item("define", "Magnetic Tape", "description");
    Item("define", "Hardtack Small Plates", "description");
    Item("define", "Hardtack Entree", "description");
    Item("define", "Hardtack Special", "description");
    Item("define", "Hardtack 1st Course", "description");
    Item("define", "Hardtack 2nd Course", "description");
    Item("define", "Hardtack 3rd Course", "description");
    Item("define", "Hardtack", "description");
    Item("define", "Hemalatha's Bill", "description");
    Item("define", "Hemalatha's Receipt", "description");
    Item("define", "advent_calendar", "description");
    Item("define", "rigged_advent_calendar", "description");
    Item("define", "monster_bait", "description");
    Item("define", "Lucky Frog Amulet", "description");
    Item("define", "Chup", "description");
    
    return 1;
}

if (argument[0] == "reset") // New Player Identity
{
    scr_savedata_put_list("quest.itemsName", ds_list_create());
    scr_savedata_put_list("quest.itemsQuantity", ds_list_create());
    //show_debug_message("ITEM > LIST > " + string(scr_savedata_get("quest.itemsName")) + " | " + string(scr_savedata_get("quest.itemsQuantity")));
    return 1;
}

if (argument[0] == "define")
{
    var des = argument[1];
    if (argument_count > 2) des = argument[2];
    ds_list_add(global.dslItemName, argument[1]);
    ds_list_add(global.dslItemDescription, des);
    return 1;
}

if (argument[0] == "name") // Name from inventory
{
    var dslItm = scr_savedata_get("quest.itemsName");
    return dslItm[| argument[1]];
}

if (argument[0] == "description")
{
    var ind = ds_list_find_index(global.dslItemName, argument[1]);
    if (ind == -1) return "";
    return global.dslItemDescription[| ind];
}

if (argument[0] == "gain") // gain, itemName, quantity (optional)
{
    var dsl = scr_savedata_get("quest.itemsName");
    var dslQty = scr_savedata_get("quest.itemsQuantity");
    //show_debug_message("ITEM > gain > DSL values = " + string(dsl) + " | " + string(dslQty));
    var itmNam = argument[1];
    if (Item("index", itmNam) == -1) { show_debug_message("Item('gain', '" + itmNam + "') - Cannot gain item, doesn't exist."); return 0; }
    var itm = ds_list_find_index(dsl, itmNam);
    var qty = 1;
    if (argument_count > 2) qty = argument[2];
    if (itm == -1) // Item is not in inventory, add it
    { 
        itm = ds_list_size(dsl); 
        ds_list_add(dsl, itmNam); 
        ds_list_add(dslQty, qty); 
    }
    else // Item is in inventory, add to it
    {
        ds_list_replace(dslQty, itm, clamp(Item("count", itmNam) + qty, 0, 9999));
    }
    if (dslQty[| itm] <= 0) { ds_list_delete(dsl, itm); ds_list_delete(dslQty, itm); }
    return 1;
}

if (argument[0] == "lose") // lose, itemName, quantity (optional)
{
    var qty = 1;
    if (argument_count > 2) qty = argument[2];
    if (Item("count", argument[1]) < qty) { show_debug_message("Item('" + argument[1] + "') - Losing too many."); qty = -Item("count", argument[1]); }
    Item("gain", argument[1], -qty);
    return 1;
}

if (argument[0] == "have")
{
    return Item("count", argument[1]) > 0;
}

if (argument[0] == "count" || argument[0] == "quantity")
{
    var ind = ds_list_find_index(scr_savedata_get("quest.itemsName"), argument[1]);
    if (ind == -1) return 0;
    return ds_list_find_value(scr_savedata_get("quest.itemsQuantity"), ind);
}

if (argument[0] == "string")
{
    var str = "";
    var dslItm = scr_savedata_get("quest.itemsName");
    var dslItmQty = scr_savedata_get("quest.itemsQuantity");
    for (var iii = 0; iii < ds_list_size(scr_savedata_get("quest.itemsName")); iii += 1)
    {
        str += dslItm[| iii] + " x " + string(dslItmQty[| iii]) + "#";
    }
    return str;
}

if (argument[0] == "build") // Shift functions to action
{
    var act = ds_list_create();
    ds_list_add(act, Item);
    if (argument_count > 1) ds_list_add(act, argument[1]);
    if (argument_count > 2) ds_list_add(act, argument[2]);
    if (argument_count > 3) ds_list_add(act, argument[3]);
    if (argument_count > 4) ds_list_add(act, argument[4]);
    if (argument_count > 5) ds_list_add(act, argument[5]);
    if (argument_count > 6) ds_list_add(act, argument[6]);
    if (argument_count > 7) ds_list_add(act, argument[7]);
    ds_list_add(_event_list, act);
    return ds_list_size(_event_list) - 1;
}

if (argument[0] == "index") // Returns DSL index - scr_item, scr_item_exists
{
    return ds_list_find_index(global.dslItemName, argument[1]);
}

if (argument[0] == "unique")
{
    return ds_list_size(scr_savedata_get("quest.itemsName"));
}

////////// DEBUG BELOW //////////
if (argument[0] == "gain random") // Random item, quantity
{
    var qty = 1;
    if (argument_count > 2) qty = argument[2];
    Item("gain", global.dslItemName[| floor(random(ds_list_size(global.dslItemName)))], qty);
    return 1;
}

if (argument[0] == "lose random") // Random item, quantity
{
    var dslItm = scr_savedata_get("quest.itemsName");
    if (ds_list_size(dslItm) == 0) { show_debug_message("Item('lose random') - No items to lose."); return 0; }
    var itmInd = floor(random(ds_list_size(dslItm)));
    var qty = 1;
    if (argument_count > 2) qty = argument[2];
    Item("lose", dslItm[| itmInd], qty);
    return 1;
}

show_debug_message("Item('" + argument[0] + "') - No such command.");
