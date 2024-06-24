/// Treasure(name)
// NOTE: All of these become underscore versions at the end of script
// IE. gilberts money = quest var > treasure_gilberts_money

// MONEY //
if (argument[0] == "gilberts money")
{
script_treasure = "
NOTIFY | Discovered @money_gilbert@ Neuro-Shekels!
QUEST  | money += @money_gilbert@
";
}

// JERKIN //
if (argument[0] == "gilberts jerkin")
{
script_treasure = "
NOTIFY | Discovered the Legendary Jerkin Gilbert's Pique!
Jerkin | gain | Gilbert's Pique
";
}

// SCAM //
if (argument[0] == "gilberts scam")
{
script_treasure = "
NOTIFY | Discovered Nothing!
";
}

// RECIPE //
if (argument[0] == "gilberts recipe")
{
script_treasure = "
NOTIFY | Discovered Ecto Poppers recipe!
Candy  | recipe add | Ecto Poppers
";
}

// LOCKPICKS //
if (argument[0] == "gilberts lockpick")
{
script_treasure = "
NOTIFY | Discovered 20 Lock Picks!
ITEM   | Lock Pick | +20
";
}

// LURE //
if (argument[0] == "gilberts lure")
{
script_treasure = "
NOTIFY | Discovered the Fishing Lure called Tiger Tom!
ITEM   | F-Lure Tiger Tom | +1
";
}

// VIDCON //
if (argument[0] == "gilberts vidcon")
{
script_treasure = "
NOTIFY | Discovered the vidcon#" + Vidcon("name", 13) + "!
Vidcon | give | 13
";
}

// GUN //
if (argument[0] == "gilberts gun")
{
script_treasure = "
scr_gun_db | gilbertGun
NOTIFY | Discovered a Mysteriouse Gun's!
";
}

// QUEST ITEM //
if (argument[0] == "gilberts quest")
{
script_treasure = "
NOTIFY | Discovered QUEST ITEM!
";
}

// ICELAND LURE //
if (argument[0] == "iceland lure")
{
script_treasure = "
NOTIFY | Discovered the Fishing Lure called Devil's Drifter!
ITEM   | F-Lure Devil's Drifter | +1
";
}

// ICELAND POLE //
if (argument[0] == "iceland pole")
{
script_treasure = "
NOTIFY | Discovered a Fishing Pole!
ITEM   | Fishing Pole | +1
";
}

// ICELAND MONEY //
if (argument[0] == "iceland money")
{
script_treasure = "
NOTIFY | Discovered @money_iceland@ Neuro-Shekels!
QUEST  | money += @money_iceland@
";
}

// Link up
event_user(0);
name = "treasure_" + string_replace_all(argument[0], " ", "_");
