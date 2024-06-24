/// Candy()

// Use from pocket
if (argument[0] == "db")
{
    // Define candies in order of weakest to strongest Drop value
    //              Name             Sub Drop Smelt Marquee    Utility Station Description                Flavor Description
    Candy("define", "Butterscotch",   00, 000, 010, "CHOMP!",  "+25 HP",                                  "Bland as hell like Grandpappy liked.");
    Candy("define", "Chickenfry Dew", 02, 040, 015, "BITE!",   "+40 HP, +2 Might for 60",                 "From the first one. Decent snack. Wet.");
    Candy("define", "Sweet Sweat",    03, 050, 010, "SLURP!",  "Remove all Ailments",                     "The sweat of a sweet. Cures what ails you.");
    Candy("define", "Black Licorice", 04, 060, 005, "GOMP!",   "Ailment Immunity for 60 seconds",         "Tastes like anise. So bad, nothing else matters.");
    Candy("define", "Candy Corn",     05, 070, 025, "MASH!",   "+100 Element Resistance for 30 seconds",  "Traditionally consumed by techno-sherpas and their kin. Fortifies you from the elements.");
    Candy("define", "Ecto Poppers",   06, 080, 020, "POP!",    "-50 HP, +10 GLAMP for 60 seconds",        "Exxxtreme Gamerfuel. Berzerked metabolism begins to break down all stomach contents and liver.");
    Candy("define", "Choco-mallows",  07, 999, 050, "MUNCH!",  "+100% HP, +5 GLAMP for 20 seconds",       "Clispaeth's Gift to Dwarfs. The best candy on Necron 7, 4613 years running.");
    Candy("define", "Wilmer's Neue",  01, 999, 015, "CRUNCH!", "+100 HP, +5 GUTS for 10 seconds",         "Makes the weak strong and the feeble emboldened. A unique and arcane recipe.");
    
    // Effects of candy, can add multiple
    //Butterscotch
    Candy("effect", "Butterscotch", "heal", 25);
    //Wilmer's Neue
    Candy("effect", "Wilmer's Neue", "heal", 100);
    Candy("effect", "Wilmer's Neue", "gutsBoost", 5, 10);
    //Chickenfry Dew
    Candy("effect", "Chickenfry Dew", "mightBoost", 2, 60);
    Candy("effect", "Chickenfry Dew", "heal", 40);
    // Black Licorice
    //TODO: ailment immunity
    Candy("effect", "Black Licorice", "heal", 100);
    // Candy Corn
    //TODO: element resistance
    Candy("effect", "Candy Corn", "heal", 100);
    //Sweet Sweat
    Candy("effect", "Sweet Sweat", "heal", 100);
    Candy("effect", "Sweet Sweat", "antidote", 0);
    //Ectopoppers
    Candy("effect", "Ecto Poppers", "heal", -50);
    Candy("effect", "Ecto Poppers", "glampBoost", 10, 60);
    //Choco-mallows
    Candy("effect", "Choco-mallows", "heal", 999);
    Candy("effect", "Choco-mallows", "glampBoost", 5, 20);
    
    // MUST be after all declarations
    for (var iii = 0; iii < ds_list_size(global.candyList); iii += 1)
    {
        ds_map_add(global.items_db, global.candyList[| iii], global.candyData[| iii]);
    }
    return 1;
}



// From map
else if (argument[0] == "name to map") // Arg1 = Name | Returns map
{
    return global.candyData[| ds_list_find_index(global.candyList, argument[1])];
}
else if (argument[0] == "name") return ds_map_find_value(argument[1], "name");
else if (argument[0] == "sub") return ds_map_find_value(argument[1], "sub");
else if (argument[0] == "smelt") return ds_map_find_value(argument[1], "smelt");
else if (argument[0] == "utility") return ds_map_find_value(argument[1], "utility");
else if (argument[0] == "dropValue") return ds_map_find_value(argument[1], "dropValue");

else if (argument[0] == "draw name") // Argument1 = CandyName | Same as draw_sprite_ext
{
    if (argument[1] == "") return 0;
    var sub = ds_map_find_value(Candy("name to map", argument[1]), "sub");
    draw_sprite_ext(sCandy, sub, argument[2], argument[3], argument[4], argument[5], argument[6], argument[7], argument[8]);
    return 1;
}



else if (argument[0] == "drop") // Arg1 = Drop value | Returns map of candy
{
    // Drop value is usually Enemy Luck + Player Luck + (CC Variable * clockTime()) = candyDrop Value
    var pnt = 0;
    var cou = 0;
    for (var iii = 0; iii < ds_list_size(global.candyList); iii += 1)
    {
        var map = global.candyData[| iii];
        cou = Candy("dropValue", map);
        if (argument[1] > cou) pnt += 1;
    }
    // Get 3 random
    //show_debug_message("Candy('drop') - PNT =" + string(pnt));
    var cndMap = ds_list_find_value(global.candyData, pnt + choose(-1, 0, +1));
    show_debug_message("Candy('drop') - Chose the candy >" + string(Candy("name", cndMap)) + "< to drop.");
    return cndMap;
}


// was scr_items_candy_getCurrent()
else if (argument[0] == "current") // Returns slot of global.item_db
{
    if (argument_count == 1) // GET
    {
        var count = scr_items_count(ITEMTYPE_CANDY);
        if (count == 0) 
        {
            Candy("current", NULL);
            return NULL;
        }
        else return scr_math_mod(scr_savedata_get("player.items.currentCandy"), count);
    }
    else // Argument1 = SET
    {
        var count = scr_items_count(ITEMTYPE_CANDY);
        if (count == 0) scr_savedata_put("player.items.currentCandy", NULL);
        else scr_savedata_put("player.items.currentCandy", scr_math_mod(argument[1], count));
        return 1;
    }
}
// was scr_items_candy_use()
else if (argument[0] == "use") // Arg1 = PocketSlot | Use from pocket
{
    if (instance_exists(o_hoopz) == 0) return 0;
    var candyPos = argument[1];
    var dsm = scr_items_get(ITEMTYPE_CANDY, candyPos);
    dsm = Candy("name to map", dsm[? "name"]);
    //show_debug_message("Candy('use') - Candy Name = " + dsm[? "name"]);
    scr_items_candy_use_fromMap(dsm); //scr_items_get(ITEMTYPE_CANDY, candyPos));
    scr_items_delete(ITEMTYPE_CANDY, candyPos);
    return 1;
}
else if (argument[0] == "next") // was scr_items_candy_next()
{
    Candy("current", Candy("current") + 1);
    return 1;
}





// was scr_schematics_candy_add()
else if (argument[0] == "recipe add") // Arg0 = CandyName | Add to recipe list
{
    var nam = argument[1];
    if (Candy("recipe has", nam) == 0) 
    {
        ds_list_add(Candy("recipe list"), nam);
        show_debug_message("Candy() - Added recipe >" + string(nam) + "<.");
        return 1;
    }
    else
    {
        show_debug_message("Candy() - You already have the recipe >" + string(nam) + "<.");
        return 0;
    }
}



// was scr_schematics_candy_add()
else if (argument[0] == "recipe delete") // Arg0 = CandyName | Delete recipe from list
{
    var nam = argument[1];
    if (Candy("recipe has", nam) == 1) 
    {
        ds_list_delete(Candy("recipe list"), ds_list_find_index(Candy("recipe list"), nam));
        show_debug_message("Candy('recipe delete') - Deleted recipe >" + string(nam) + "<.");
        return 1;
    }
    else
    {
        show_debug_message("Candy() - You can't delete the recipe >" + string(nam) + "< because you don't have it.");
        return 0;
    }
}



// was scr_schematics_candy_count()
else if (argument[0] == "recipe count") // Returns how many recipes you have
{
    return ds_list_size(Candy("recipe list"));
}



// was scr_schematics_candy_get()
else if (argument[0] == "recipe get") // Returns the recipe in index Argument0
{
    var lis = Candy("recipe list");
    return lis[| argument[1]];
}



// was scr_schematics_candy_getList()
else if (argument[0] == "recipe list") // Returns ds_list of recipes the player has
{
    return scr_savedata_get('player.schematics.candy');
}



// scr_schematics_candy_has()
else if (argument[0] == "recipe has") // Arg0 = CandyName | Returns if you have the recipe
{
    var nam = argument[1];
    var lst = Candy("recipe list");
    for (var iii = 0; iii < ds_list_size(lst); iii += 1) 
    {
        if (lst[| iii] == nam) return true;
    }
    return false;
}



else if (argument[0] == "init")
{
    //recipe have
    global.items_db = ds_map_create(); // was it's own script
    global.candyList = ds_list_create(); // Has the name of the candies
    global.candyData = ds_list_create(); // Has the map of the candy
    Candy("db");
    return 1;
}
else if (argument[0] == "reset") // Call on NEW ADVENTURE
{
    scr_savedata_put_list("player.schematics.candy", ds_list_create());
    return 1;
}
else if (argument[0] == "define") // 1 name, 2 sub, 3 drop, 4 smelt, 5 marquee, 6 utility, 7 description
{
    var map = ds_map_create();
    map[? "type"] = ITEMTYPE_CANDY;
    map[? "name"] = argument[1];
    map[? "sub"] = argument[2];
    map[? "dropValue"] = argument[3];
    map[? "smelt"] = argument[4];
    map[? "marquee"] = argument[5];
    map[? "utility"] = argument[6];
    map[? "description"] = argument[7];
    map[? "effects"] = ds_list_create();
    ds_list_add(global.candyList, map[? "name"]);
    ds_list_add(global.candyData, map);
    
    // Need to add to global list AFTER because I do effects
    
    return 1;
}

else if (argument[0] == "effect") // Candy("effect", "Butterscotch", map0, map1, map2, etc)
{
    var cdyMap = Candy("name to map", argument[1]);
    var effLis = cdyMap[? "effects"];
    var newMap = ds_map_create();
    newMap[? "effect"] = argument[2];
    if (argument_count > 3) newMap[? "arg0"] = argument[3];
    if (argument_count > 4) newMap[? "arg1"] = argument[4];
    if (argument_count > 5) newMap[? "arg2"] = argument[5];
    ds_list_add(effLis, newMap);
    return 1;
}

show_debug_message("Candy() - Unknown function >" + string(argument[0]) + "< from object >" + object_get_name(object_index) + ".");
