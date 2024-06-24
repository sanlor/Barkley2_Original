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
    global.dslItemSub = ds_list_create();
    global.dslItemName = ds_list_create();
    global.dslItemDescription = ds_list_create();
    //Sewer Items
    Item("define", 0, "Fiscian Gut's", "Gut's from an aquatic creature.");
    Item("define", 1, "Garlics", "Exquisite veggies (to some...)");
    Item("define", 2, "Sewer Butter", "Butter from a barrel. *OFFENSIVE*");
    
    //TNN
    Item("define", 3, "Dragon Lord Gemstone", "The eye of the Fire Drake shines naught as bright.");
    Item("define", 4, "WristCONP2000", "Has all the latest gadgets and gizmos.");
    Item("define", 5, "Wilmer's Bones", "Soul cannot rest lest these bones are buried.");
    Item("define", 6, "Sterile Vial", "Once used by Vampyre Prince Drago");
    Item("define", 7, "Duergar Urine", "Drago wants you to keep it.");
    Item("define", 8, "Fruit Basket", "Mangos, Plantains, Rambutans, et. al.");
    Item("define", 9, "Granny's Medicine", "A granny needs this.");
    Item("define", 10, "Bomb", "Military Grade Explosives: C- (passing)");
    Item("define", 11, "Bolt Cutters", "Good at cutting bolts and nards.");
    Item("define", 12, "Lock Pick", "Pick your locks with this handy device.");
    
    // Runes from CC
    Item("define", 0, "Tuh, Ghost of Grandpa", "A mystical rune.");
    Item("define", 0, "Nip'pon, Apparition of Anime", "A mystical rune.");
    Item("define", 0, "M'kah, Spirit of Fire", "A mystical rune.");
    Item("define", 0, "Olop, Wraith of Riceballs", "A mystical rune.");
    Item("define", 0, "Dilly Dong Dong, Kelpie of Corn Cobs", "A mystical rune.");
    Item("define", 0, "Xatar, Phantom of Vidcons", "A mystical rune.");
    Item("define", 0, "As'hak, Haunt of Dwarfs", "A mystical rune.");
    Item("define", 0, "Esh'tek, Specter of Winter", "A mystical rune.");
    
    Item("define", 0, "Duck Organs", "description");
    Item("define", 0, "Cyberspear Piece", "Cyberspear Piece");
    Item("define", 0, "Mysterious Object", "Mysterious Object");
    Item("define", 0, "Zauber Pistol", "Zauber Pistol");
    Item("define", 0, "Guppy", "Guppy");
    Item("define", 0, "Pike", "Pike");
    Item("define", 0, "Carp", "Carp");
    Item("define", 0, "Gun", "Gun");
    Item("define", 0, "Item", "Item");
    Item("define", 0, "Item2", "Item2");
    Item("define", 0, "Useless Item", "description");
    Item("define", 0, "Camera", "description");
    Item("define", 0, "Turkey Feather", "description");
    Item("define", 0, "Tribune-Wrapped Item", "description");
    Item("define", 0, "Mystery Item", "description");
    Item("define", 0, "Derided Item", "description");
    Item("define", 0, "Esteemed Item", "description");
    Item("define", 0, "d:GLAZEr", "description");
    Item("define", 0, "wallscroll_01", "description");
    Item("define", 0, "wallscroll_02", "description");
    Item("define", 0, "wallscroll_03", "description");
    Item("define", 0, "wallscroll_04", "description");
    Item("define", 0, "Katzenjammer Blueprints", "description");
    Item("define", 0, "Letter to Donald", "description");
    Item("define", 0, "Healing Ointment", "description");
    Item("define", 0, "Swamp Flower", "description");
    Item("define", 0, "B1 Visitor Badge", "description");
    Item("define", 0, "2F Visitor Badge", "description");
    Item("define", 0, "3F Visitor Badge", "description");
    Item("define", 0, "Tower Keycard", "description");
    Item("define", 0, "Guilderberg Keycard", "description");
    Item("define", 0, "Bronze Coin", "description");
    Item("define", 0, "Silver Coin", "description");
    Item("define", 0, "Gold Coin", "description");
    Item("define", 0, "Durian Gaz", "description");
    Item("define", 0, "LONGINUSFAKEITEM", "description");
    Item("define", 0, "Guilderberg Deed", "description");
    Item("define", 0, "W Seed", "description");
    Item("define", 0, "Dreadfruit", "description");
    Item("define", 0, "W Fruit", "description");
    Item("define", 0, "Kirin Horn", "description");
    Item("define", 0, "Snake Corpse", "description");
    Item("define", 0, "Dwarf Skull", "description");
    Item("define", 0, "Mandorla", "description");
    Item("define", 0, "Alms Bowl", "description");
    Item("define", 0, "Purified Alms Bowl", "description");
    Item("define", 0, "Harmonious Alms Bowl", "description");
    Item("define", 0, "Mystic Alms Bowl", "description");
    Item("define", 0, "Ablution Bowl", "description");
    Item("define", 0, "Humble Ablution Bowl", "description");
    Item("define", 0, "Harmonious Ablution Bowl", "description");
    Item("define", 0, "Mystic Ablution Bowl", "description");
    Item("define", 0, "Singing Bowl", "description");
    Item("define", 0, "Purified Singing Bowl", "description");
    Item("define", 0, "Humble Singing Bowl", "description");
    Item("define", 0, "Mystic Singing Bowl", "description");
    Item("define", 0, "Royal Gem Box", "description");
    Item("define", 0, "Magnetic Tape", "description");
    Item("define", 0, "Hardtack Small Plates", "description");
    Item("define", 0, "Hardtack Entree", "description");
    Item("define", 0, "Hardtack Special", "description");
    Item("define", 0, "Hardtack 1st Course", "description");
    Item("define", 0, "Hardtack 2nd Course", "description");
    Item("define", 0, "Hardtack 3rd Course", "description");
    Item("define", 0, "Hardtack", "description");
    Item("define", 0, "Hemalatha's Bill", "description");
    Item("define", 0, "Hemalatha's Receipt", "description");
    Item("define", 0, "advent_calendar", "description");
    Item("define", 0, "rigged_advent_calendar", "description");
    Item("define", 0, "monster_bait", "description");
    Item("define", 0, "Lucky Frog Amulet", "description");
    //Wasteland Items
    Item("define", 0, "Chup", "description");
    
    return 1;
}

if (argument[0] == "draw name") // 1 = Name, 2 = x, 3 = y, 4 = xsc, 5 = ysc, 6 = rot, 7 = col, 8 = alp
{
    var sub = ds_list_find_index(global.dslItemName, argument[1]);
    draw_sprite_ext(sItem, sub, argument[2], argument[3], argument[4], argument[5], argument[6], argument[7], argument[8]);
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
    ds_list_add(global.dslItemSub, argument[1]);
    ds_list_add(global.dslItemName, argument[2]);
    ds_list_add(global.dslItemDescription, argument[3]);
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
